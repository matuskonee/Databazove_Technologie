CREATE OR REPLACE PROCEDURE apply_regional_discount(
    region_name TEXT,
    discount_rate NUMERIC
)
LANGUAGE plpgsql
AS $$
BEGIN
    IF discount_rate < 0 OR discount_rate > 1 THEN
        RAISE EXCEPTION 'discount_rate must be between 0 and 1';
    END IF;

    UPDATE orders AS o
    SET sales = o.sales * (1 - discount_rate)
    WHERE o.region = region_name;

    RAISE NOTICE 'Applied a % percent discount to region %',
        discount_rate * 100,
        region_name;
END;
$$;

CALL apply_regional_discount('West', 0.10);
CALL apply_regional_discount('West', 0.10);

SELECT o.order_id, o.customer_id, o.region, o.sales
FROM orders AS o
WHERE o.region = 'West'
ORDER BY o.order_id;