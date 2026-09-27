SELECT
    c.customer_name AS meno,
    SUM(o.sales) AS celkovy_predaj,
    AVG(o.discount) AS priemerna_zlava,
    COUNT(o.order_id) AS pocet_objednavok,
    CASE 
        WHEN SUM(o.sales) > 2500 THEN 'VIP'
        ELSE 'REGULAR'
    END AS typ_zakaznika
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY celkovy_predaj DESC;