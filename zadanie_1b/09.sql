SELECT
	outer_sale.product_name,
	outer_sale.region,
	outer_sale.total_amount,
	(
		SELECT MIN(inner_sale.total_amount)
		FROM flourmills_sales AS inner_sale
		WHERE inner_sale.region = outer_sale.region
	) AS region_min_amount
FROM flourmills_sales AS outer_sale;
