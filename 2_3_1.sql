CREATE OR REPLACE VIEW top_5_products_last_month AS
WITH RECURSIVE category_tree AS (
    -- Базовый уровень: корневые категории
    SELECT 
        id,
        name,
        id AS root_id,
        name AS root_name
    FROM categories
    WHERE parent_id IS NULL
    
    UNION ALL
    
    -- Рекурсивно спускаемся
    SELECT 
        c.id,
        c.name,
        ct.root_id,
        ct.root_name
    FROM categories c
    JOIN category_tree ct ON c.parent_id = ct.id
)
SELECT 
    p.name AS product_name,
    ct.root_name AS category_level_1,
    SUM(oi.quantity) AS total_quantity_sold
FROM order_items oi
JOIN products p ON p.id = oi.product_id
JOIN category_tree ct ON ct.id = p.category_id
JOIN orders o ON o.id = oi.order_id
WHERE o.order_date >= '2026-03-01'
  AND o.order_date < '2026-04-01'
GROUP BY p.name, ct.root_name
ORDER BY total_quantity_sold DESC
LIMIT 5;