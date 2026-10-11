WITH RECURSIVE monthly_revenue AS (
    SELECT
        DATE_TRUNC('month', sale_date)::date AS month,
        SUM(total_amount) AS revenue
    FROM flourmills_sales
    GROUP BY DATE_TRUNC('month', sale_date)::date
),
ordered_months AS (
    SELECT
        ROW_NUMBER() OVER (ORDER BY month) AS rn,
        month,
        revenue
    FROM monthly_revenue
),
cumulative_target AS (
    SELECT
        rn,
        month,
        revenue,
        revenue AS cumulative_revenue
    FROM ordered_months
    WHERE rn = 1

    UNION ALL

    SELECT
        current_month.rn,
        current_month.month,
        current_month.revenue,
        previous_month.cumulative_revenue + current_month.revenue
    FROM cumulative_target AS previous_month
    JOIN ordered_months AS current_month
        ON current_month.rn = previous_month.rn + 1
    WHERE previous_month.cumulative_revenue < 500000000
)
SELECT
    month,
    revenue,
    cumulative_revenue
FROM cumulative_target
WHERE cumulative_revenue >= 500000000
ORDER BY rn;