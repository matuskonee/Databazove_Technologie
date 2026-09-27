SELECT
    p.category AS kategoria,
    AVG(o.discount) AS priemerna_zlava
FROM products p
JOIN orders o ON p.product_id = o.product_id
GROUP BY p.category;