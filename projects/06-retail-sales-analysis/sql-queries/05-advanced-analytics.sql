-- Cohort Retention Analysis
WITH first_orders AS (
    SELECT
        customer_id,
        DATE_TRUNC('month', MIN(order_date)) as cohort_month
    FROM orders
    WHERE status = 'completed'
    GROUP BY customer_id
),
customer_activities AS (
    SELECT
        fo.customer_id,
        fo.cohort_month,
        DATE_TRUNC('month', o.order_date) as activity_month
    FROM first_orders fo
    JOIN orders o ON fo.customer_id = o.customer_id
    WHERE o.status = 'completed'
),
cohort_data AS (
    SELECT
        cohort_month,
        activity_month,
        EXTRACT(YEAR FROM AGE(activity_month, cohort_month)) * 12 +
        EXTRACT(MONTH FROM AGE(activity_month, cohort_month)) as period_number,
        COUNT(DISTINCT customer_id) as customers
    FROM customer_activities
    GROUP BY cohort_month, activity_month
    ORDER BY cohort_month, period_number
)
SELECT
    cohort_month,
    SUM(CASE WHEN period_number = 0 THEN customers END) as m0,
    SUM(CASE WHEN period_number = 1 THEN customers END) as m1,
    SUM(CASE WHEN period_number = 2 THEN customers END) as m2,
    SUM(CASE WHEN period_number = 3 THEN customers END) as m3,
    SUM(CASE WHEN period_number = 6 THEN customers END) as m6,
    ROUND(
        SUM(CASE WHEN period_number = 1 THEN customers END) * 100.0 /
        NULLIF(SUM(CASE WHEN period_number = 0 THEN customers END), 0), 2
    ) as retention_m1,
    ROUND(
        SUM(CASE WHEN period_number = 3 THEN customers END) * 100.0 /
        NULLIF(SUM(CASE WHEN period_number = 0 THEN customers END), 0), 2
    ) as retention_m3
FROM cohort_data
WHERE cohort_month >= CURRENT_DATE - INTERVAL '18 months'
GROUP BY cohort_month
ORDER BY cohort_month;

-- Seasonal Analysis
SELECT
    EXTRACT(MONTH FROM order_date) as month,
    TO_CHAR(DATE_TRUNC('month', order_date), 'Month') as month_name,
    COUNT(*) as orders_count,
    ROUND(SUM(total_amount)::numeric, 2) as revenue,
    ROUND(AVG(total_amount)::numeric, 2) as avg_order_value
FROM orders
WHERE status = 'completed'
    AND order_date >= CURRENT_DATE - INTERVAL '24 months'
GROUP BY 1, 2
ORDER BY 1;

