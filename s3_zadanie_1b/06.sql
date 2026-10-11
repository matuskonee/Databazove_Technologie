WITH RECURSIVE date_bounds AS (
    SELECT
        MIN(sale_date) AS first_date,
        MAX(sale_date) AS last_date
    FROM flourmills_sales
),
sales_calendar(sale_date, last_date) AS (
    SELECT first_date, last_date
    FROM date_bounds
    WHERE first_date IS NOT NULL

    UNION ALL

    SELECT sale_date + 1, last_date
    FROM sales_calendar
    WHERE sale_date < last_date
)
SELECT sale_date
FROM sales_calendar
ORDER BY sale_date ASC;