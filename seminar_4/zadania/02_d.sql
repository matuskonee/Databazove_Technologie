WITH customer_profit AS (
    SELECT
        c.region,
        c.customer_name,
        SUM(o.profit) AS total_profit
    FROM customers c
    JOIN orders o ON o.customer_id = c.customer_id
    GROUP BY c.region, c.customer_id, c.customer_name
)
SELECT
    region,
    customer_name,
    total_profit,
    RANK() OVER (
        PARTITION BY region
        ORDER BY total_profit DESC
    ) AS profit_rank,
    DENSE_RANK() OVER (
        PARTITION BY region
        ORDER BY total_profit DESC
    ) AS profit_dense_rank
FROM customer_profit
ORDER BY region, total_profit DESC;