CREATE INDEX idx_orders_region_category
ON orders(customer_id, order_date);

SELECT
    o.*,
    c.customer_name,
    c.region
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
WHERE c.region = 'West'
  AND o.order_date >= '2024-01-01';