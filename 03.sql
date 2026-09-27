SELECT
o.order_id,
c.customer_name,
p.category AS product_category,
o.sales
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN products p ON o.product_id = p.product_id
ORDER BY o.order_id;