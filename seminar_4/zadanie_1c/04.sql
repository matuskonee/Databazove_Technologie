WITH orders AS (
    SELECT DISTINCT
        customer_id,
        invoice_no,
        invoice_date::date AS invoice_date
    FROM retail_sales
    WHERE customer_id IS NOT NULL
),
next_orders AS (
    SELECT
        customer_id,
        invoice_no,
        invoice_date,
        LEAD(invoice_date) OVER (
            PARTITION BY customer_id
            ORDER BY invoice_date, invoice_no
        ) AS next_invoice_date
    FROM orders
)
SELECT
    customer_id,
    invoice_no,
    invoice_date,
    next_invoice_date,
    next_invoice_date - invoice_date AS days_to_next_invoice
FROM next_orders
WHERE next_invoice_date IS NOT NULL
ORDER BY days_to_next_invoice DESC;