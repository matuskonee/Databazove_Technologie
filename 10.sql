SELECT
    c.customer_name AS meno,
    SUM(o.sales) AS celkova_hodnota_nakupov
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(o.sales) > 2000;