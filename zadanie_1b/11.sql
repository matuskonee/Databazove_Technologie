SELECT
	sale.product_category,
	sale.product_name,
	sale.total_amount
FROM flourmills_sales AS sale
WHERE EXISTS (
		SELECT 1
		FROM flourmills_sales AS category_sale
		WHERE category_sale.product_category = sale.product_category
			AND category_sale.total_amount > 200000
);
