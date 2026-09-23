SELECT o.order_id
        c.customer_name
        p.category
        o.sales
FROM orders o 
JOIN customers c ON o.customer_ID = c.customer_ID  