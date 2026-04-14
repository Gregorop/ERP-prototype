SELECT 
    c.name AS customer_name,
    COALESCE(SUM(oi.quantity * p.price), 0) AS total_amount
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
LEFT JOIN order_items oi ON o.id = oi.order_id
LEFT JOIN products p ON oi.product_id = p.id
GROUP BY c.id
ORDER BY total_amount DESC;