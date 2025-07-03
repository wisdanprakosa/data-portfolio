-- Monthly Revenue Trends
SELECT
    DATE_TRUNC('month', order_date) as month,
    COUNT(DISTINCT id) as total_orders,
    COUNT(DISTINCT customer_id) as unique_customers,
    ROUND(SUM(total_amount)::numeric, 2) as total_revenue,
    ROUND(AVG(total_amount)::numeric, 2) as avg_order_value,
    ROUND(SUM(total_amount) / COUNT(DISTINCT customer_id), 2) as revenue_per_customer
FROM orders
WHERE status = 'completed'
    AND order_date >= CURRENT_DATE - INTERVAL '12 months'
GROUP BY 1
ORDER BY 1;
