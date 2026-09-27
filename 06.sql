SELECT
c.customer_name as meno,
o.order_id as identifikator_objednavky,
o.sales as hodnota_predaja
from customers c 
full join orders o on c.customer_id = o.customer_id