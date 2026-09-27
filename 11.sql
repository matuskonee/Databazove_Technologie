SELECT
    c.region AS region,
    SUM(o.sales) AS celkova_hodnota_predaja,
    AVG(o.discount) AS priemerna_zlava,
    COUNT(o.order_id) AS pocet_objednavok
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.region;