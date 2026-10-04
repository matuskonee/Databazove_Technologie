SELECT DISTINCT outer_sale.region
FROM flourmills_sales AS outer_sale
WHERE NOT EXISTS (
		SELECT 1
		FROM flourmills_sales AS flour_sale
		WHERE flour_sale.region = outer_sale.region
			AND flour_sale.product_category = 'Flour'
);
