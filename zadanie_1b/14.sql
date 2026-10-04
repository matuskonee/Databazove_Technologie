SELECT DISTINCT s1.product_category
FROM flourmills_sales s1
WHERE NOT EXISTS (
    SELECT 1
    FROM flourmills_sales s2
    WHERE s2.product_category = s1.product_category
      AND s2.total_amount > 500000
);
