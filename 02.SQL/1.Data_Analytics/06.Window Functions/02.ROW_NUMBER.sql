# ROW_NUMBER FUNCTION
# ===================
 ---------------------------------------------------------------------------------------
# Base code
SELECT c.customer_id, first_name, order_total,
    # It inputs a sequential numbers that starts as 1 and goes on, until the end.
    ROW_NUMBER() OVER() AS row_num 
FROM customers c
    JOIN customer_orders co
    ON c.customer_id = co.customer_id
;
# ---------------------------------------------------------------------------------------
#
# ---------------------------------------------------------------------------------------
# Base code No. 2
SELECT c.customer_id, first_name, order_total,
    ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_total DESC) AS row_number_col
FROM customers c
    JOIN customer_orders co
    ON c.customer_id = co.customer_id
;
# ---------------------------------------------------------------------------------------


# ---------------------------------------------------------------------------------------
# Example No. 1 - Filtering a pre-configured table
SELECT *
FROM (
SELECT c.customer_id, first_name, order_total,
    ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_total DESC) AS top_two_orders
FROM customers c
    JOIN customer_orders co
    ON c.customer_id = co.customer_id) AS row_table
WHERE top_two_orders < 3;
# ---------------------------------------------------------------------------------------
