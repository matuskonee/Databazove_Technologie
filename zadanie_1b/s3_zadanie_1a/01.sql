-- Active: 1790534484644@@127.0.0.1@5432@superstore
CREATE OR REPLACE VIEW high_value_customers AS
SELECT
    c.customer_id,
    c.customer_name,
    ROUND(SUM(o.sales)::numeric, 2) AS total_sales
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(o.sales) > 2000;

SELECT * FROM high_value_customers;