SELECT DISTINCT outer_sale.product_category
FROM flourmills_sales AS outer_sale
WHERE EXISTS (
	SELECT 1
	FROM flourmills_sales AS inner_sale
	WHERE inner_sale.product_category = outer_sale.product_category
	GROUP BY inner_sale.product_category
	HAVING COUNT(DISTINCT inner_sale.region) > 3
);
