-- RFM Analysis
WITH customer_metrics AS (
    SELECT
        customer_id,
        MAX(order_date) as last_order_date,
        COUNT(*) as frequency,
        SUM(total_amount) as monetary,
        CURRENT_DATE - MAX(order_date)::date as recency_days
    FROM orders
    WHERE status = 'completed'
    GROUP BY customer_id
),
rfm_scores AS (
    SELECT *,
        NTILE(5) OVER (ORDER BY recency_days DESC) as R_score,
        NTILE(5) OVER (ORDER BY frequency) as F_score,
        NTILE(5) OVER (ORDER BY monetary) as M_score
    FROM customer_metrics
),
customer_segments AS (
    SELECT *,
        CASE
            WHEN R_score >= 4 AND F_score >= 4 AND M_score >= 4 THEN 'Champions'
            WHEN R_score >= 4 AND F_score >= 3 THEN 'Loyal Customers'
            WHEN R_score >= 3 AND F_score <= 2 AND M_score >= 3 THEN 'Potential Loyalists'
            WHEN R_score >= 3 AND F_score <= 2 AND M_score <= 2 THEN 'New Customers'
            WHEN R_score <= 2 AND F_score >= 3 AND M_score >= 3 THEN 'At Risk'
            WHEN R_score <= 2 AND F_score >= 2 AND M_score <= 2 THEN 'Cannot Lose Them'
            WHEN R_score <= 2 AND F_score <= 2 AND M_score >= 3 THEN 'Hibernating'
            ELSE 'Lost'
        END as segment
    FROM rfm_scores
)
SELECT
    segment,
    COUNT(*) as customer_count,
    ROUND(AVG(monetary)::numeric, 2) as avg_monetary_value,
    ROUND(AVG(frequency)::numeric, 1) as avg_frequency,
    ROUND(AVG(recency_days)::numeric, 1) as avg_recency_days,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) as percentage
FROM customer_segments
GROUP BY segment
ORDER BY customer_count DESC;

