# CASE STATEMENTS
# ===============

SELECT product_name, units_in_stock,
    CASE
        WHEN units_in_stock < 30 THEN 'MAKE A NEW ORDER, NOW!!!'
        WHEN units_in_stock BETWEEN 31 and 60 THEN 'Check in 3 days.'
        WHEN units_in_stock BETWEEN 61 AND 99 THEN 'Enough in Stock'
        ELSE 'You have to control your STOCK SHOPPING LIST'
    END AS Order_Status
FROM products;


# ANOTHER USE EXAMPLE!!!
SELECT order_id, order_date,
    CASE
        WHEN YEAR(order_date) = 2022 THEN 'ACTIVE'
        WHEN YEAR(order_date) >= 2020 THEN 'INACTIVE'
        ELSE 'Archived'
    END AS 'Evaluation'
FROM customer_orders;