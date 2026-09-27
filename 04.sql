SELECT
c.region,
CASE WHEN SUM(o.sales) IS NULL THEN 0 ELSE SUM(o.sales) END AS total_sales
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.region
ORDER BY c.region;