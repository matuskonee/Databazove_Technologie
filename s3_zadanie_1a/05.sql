CREATE INDEX idx_orders_order_date ON orders(order_date);

SELECT
    DATE_TRUNC('month', order_date)::date AS month,
    ROUND(SUM(sales)::numeric, 2) AS sum
FROM orders
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY month ASC;