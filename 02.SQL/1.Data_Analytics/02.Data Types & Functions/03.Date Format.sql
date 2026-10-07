# DATE AND DATE FORMAT FUNCTIONS
# ==============================
# YEAR(), MONTH(), DAY(),   -   NOW(), CURDATE(), CURTIME(), DAYNAME(), MONTHNAME(), DATE_FORMAT()

SELECT NOW(), CURDATE(), CURTIME(), 
       YEAR(NOW()), MONTH(NOW()), DAY(NOW());


SELECT *
FROM customers
WHERE YEAR(birth_date) = 1999;
# Another woy to work with NOW() is...
SELECT *
FROM customer_orders
WHERE YEAR(order_date) = YEAR(NOW()) - 3;


# Making changes on the date data...
SELECT DAYNAME(NOW());
# 
SELECT order_date, 
        DAYNAME(order_date) AS day_name, 
        MONTHNAME(order_date) AS month_name
FROM customer_orders;


# --------------------------------------------------------------
# GREAT EXAMPLE OF USE!!!
SELECT birth_date, 
        DATE_FORMAT(birth_date, '%M-%D-%Y') AS date_format1,
        DATE_FORMAT(birth_date, '%m/%d/%Y') AS date_format2
FROM customers;
