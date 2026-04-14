SELECT 
    c.name AS category_name,
    COUNT(child.id) AS children_count
FROM categories c
LEFT JOIN categories child ON child.parent_id = c.id
WHERE child.id is NOT NULL
GROUP BY c.id
ORDER BY c.id