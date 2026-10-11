WITH customer_type_sales AS (
    SELECT
        customer_type,
        SUM(total_amount) AS revenue
    FROM flourmills_sales
    GROUP BY customer_type
),
revenue_shares AS (
    SELECT
        customer_type,
        revenue,
        SUM(revenue) OVER () AS total_revenue,
        ROUND(
            revenue * 100.0 / NULLIF(SUM(revenue) OVER (), 0),
            2
        ) AS revenue_percentage
    FROM customer_type_sales
)
SELECT
    customer_type,
    revenue,
    total_revenue,
    revenue_percentage
FROM revenue_shares
ORDER BY revenue DESC;