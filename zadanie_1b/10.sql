SELECT outer_sale.*
FROM flourmills_sales AS outer_sale
WHERE EXISTS (
	SELECT 1
	FROM flourmills_sales AS inner_sale
	WHERE inner_sale.product_name = outer_sale.product_name
	GROUP BY inner_sale.product_name
	HAVING COUNT(DISTINCT EXTRACT(MONTH FROM inner_sale.sale_date)) > 1
);
