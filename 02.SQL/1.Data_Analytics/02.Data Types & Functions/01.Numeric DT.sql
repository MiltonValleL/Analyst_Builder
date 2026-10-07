# Numeric Data Types
# ==================

SELECT ROUND(123.456789) AS int_number; # It rounds with no decimal numbers (INT)

SELECT ROUND(123.456789, 2) AS decimal_number; # It rounds with 2 decimals


SELECT *
FROM products;


SELECT sale_price, ROUND(sale_price, 1) AS rounded
FROM products;


# ----------------------------------------------
# Use of CEILING and FLOOR
SELECT 5.789 AS origin_number, 
        CEILING(5.789) AS ceiling_number, 
        FLOOR(5.789) AS floor_number;
# ----------------------------------------------

SELECT sale_price, 
        CEILING(sale_price) AS ceil_number, 
        FLOOR(sale_price) AS floor_number
FROM products;


# ----------------------------------------------
# Use of ABSOLUTE Value
SELECT 4.65 AS positive_number, 
    -12.963 AS negative_number,     
    ABS(-12.963) AS absolute_negative;