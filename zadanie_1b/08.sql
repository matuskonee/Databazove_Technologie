SELECT
	outer_sale.product_name,
	outer_sale.product_category,
	outer_sale.total_amount
FROM flourmills_sales AS outer_sale
WHERE outer_sale.total_amount > (
	SELECT AVG(inner_sale.total_amount)
	FROM flourmills_sales AS inner_sale
	WHERE inner_sale.product_category = outer_sale.product_category
);
