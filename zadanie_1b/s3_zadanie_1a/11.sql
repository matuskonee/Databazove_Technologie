CREATE OR REPLACE PROCEDURE get_sales_between(
    start_date DATE,
    end_date DATE
)
LANGUAGE plpgsql
AS $$
DECLARE
    period_sales NUMERIC(12, 2);
BEGIN
    IF start_date > end_date THEN
        RAISE EXCEPTION 'start_date must be on or before end_date';
    END IF;

    SELECT COALESCE(SUM(sales), 0)
    INTO period_sales
    FROM orders
    WHERE order_date BETWEEN start_date AND end_date;

    RAISE NOTICE 'Total sales from % to %: %',
        start_date,
        end_date,
        period_sales;
END;
$$;

CALL get_sales_between('2024-01-01', '2024-03-31');