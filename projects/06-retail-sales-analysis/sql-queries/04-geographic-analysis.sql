-- Revenue by State
SELECT
    c.state,
    COUNT(DISTINCT c.id) as customers_count,
    COUNT(DISTINCT o.id) as orders_count,
    ROUND(SUM(o.total_amount)::numeric, 2) as total_revenue,
    ROUND(AVG(o.total_amount)::numeric, 2) as avg_order_value,
    ROUND(
        SUM(o.total_amount) / COUNT(DISTINCT c.id), 2
    ) as revenue_per_customer
FROM customers c
JOIN orders o ON c.id = o.customer_id
WHERE o.status = 'completed'
GROUP BY c.state
HAVING COUNT(DISTINCT o.id) >= 10
ORDER BY total_revenue DESC;

-- City Performance (Top 20)
SELECT
    c.city,
    c.state,
    COUNT(DISTINCT c.id) as customers,
    COUNT(DISTINCT o.id) as orders,
    ROUND(SUM(o.total_amount)::numeric, 2) as revenue
FROM customers c
JOIN orders o ON c.id = o.customer_id
WHERE o.status = 'completed'
GROUP BY c.city, c.state
HAVING COUNT(DISTINCT o.id) >= 5
ORDER BY revenue DESC
LIMIT 20;

