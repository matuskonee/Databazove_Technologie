SELECT outer_sale.*
FROM flourmills_sales AS outer_sale
WHERE EXISTS (
		SELECT 1
		FROM flourmills_sales AS sale_2024
		WHERE sale_2024.region = outer_sale.region
			AND EXTRACT(YEAR FROM sale_2024.sale_date) = 2024
);
