# Aliasing
# ========

SELECT *
FROM products;


SELECT product_id, product_name AS 'Product', units_in_stock AS 'Stock'
FROM products;


# It is more useful when naming calculated columns...
SELECT product_name, 
       units_in_stock, 
       sale_price, 
       units_in_stock*sale_price AS Potential_Revenue
FROM products;
