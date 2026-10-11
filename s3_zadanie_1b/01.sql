-- Active: 1790534484644@@127.0.0.1@5432@datacraftinglab_db
WITH daily_sales AS (
    SELECT
        sale_date,
        SUM(total_amount) AS daily_sales
    FROM flourmills_sales
    GROUP BY sale_date
)
SELECT
    sale_date,
    daily_sales
FROM daily_sales
WHERE daily_sales > 3000000
ORDER BY daily_sales DESC;
