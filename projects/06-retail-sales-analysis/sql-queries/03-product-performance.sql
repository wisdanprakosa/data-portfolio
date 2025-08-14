-- Top Performing Products
SELECT
    p.name as product_name,
    p.brand,
    c.name as category,
    p.price,
    COALESCE(SUM(oi.quantity), 0) as units_sold,
    COALESCE(SUM(oi.total_price), 0) as total_revenue,
    COALESCE(COUNT(DISTINCT o.id), 0) as orders_count,
    ROUND(
        COALESCE(SUM(oi.total_price), 0) / NULLIF(SUM(oi.quantity), 0), 2
    ) as avg_selling_price,
    ROUND(
        (p.price - p.cost) / p.price * 100, 2
    ) as profit_margin_percentage
FROM products p
LEFT JOIN categories c ON p.category_id = c.id
LEFT JOIN order_items oi ON p.id = oi.product_id
LEFT JOIN orders o ON oi.order_id = o.id AND o.status = 'completed'
WHERE p.is_active = true
GROUP BY p.id, p.name, p.brand, c.name, p.price, p.cost
HAVING COALESCE(SUM(oi.quantity), 0) > 0
ORDER BY total_revenue DESC
LIMIT 20;

-- Category Performance
SELECT
    c.name as category,
    COUNT(DISTINCT p.id) as products_count,
    COALESCE(SUM(oi.quantity), 0) as units_sold,
    COALESCE(ROUND(SUM(oi.total_price)::numeric, 2), 0) as total_revenue,
    COALESCE(ROUND(AVG(oi.unit_price)::numeric, 2), 0) as avg_price,
    ROUND(
        COALESCE(SUM(oi.total_price), 0) * 100.0 /
        SUM(SUM(oi.total_price)) OVER (), 2
    ) as revenue_percentage
FROM categories c
LEFT JOIN products p ON c.id = p.category_id
LEFT JOIN order_items oi ON p.id = oi.product_id
LEFT JOIN orders o ON oi.order_id = o.id AND o.status = 'completed'
GROUP BY c.id, c.name
ORDER BY total_revenue DESC;

