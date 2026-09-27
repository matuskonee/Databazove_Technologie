SELECT
    c.region AS region,
    COUNT(CASE WHEN o.sales > 1000 THEN o.order_id END) AS pocet_high_value,
    COUNT(CASE WHEN o.sales <= 1000 THEN o.order_id END) AS pocet_low_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.region;