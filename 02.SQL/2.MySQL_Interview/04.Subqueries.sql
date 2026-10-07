# ========================
# SUBQUERIES ON WHERE
# -----------------------------------------------------------------------------------------
# Practice Questions: Write a query to identify the people from the 'customers' table that
# has spend more than the average 'total_money_spent'. And show all the columns of this table
# --------------------------------------------
SELECT *
FROM customers
WHERE total_money_spent > (
        SELECT AVG(total_money_spent)
        FROM customers);
# -----------------------------------------------------------------------------------------
# ========================
# SUBQUERIES ON WHERE
# -----------------------------------------------------------------------------------------
# Practice Questions: Using 'customers', 'customers_orders', and 'products' tables, write a
# subquery to return the 'first_name' and 'last_name' of customers who ordered something 
# with chocolate in it
# --------------------------------------------
# SOLUTION NO.1
SELECT first_name, last_name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM customer_orders co
        INNER JOIN products p
        ON co.product_id = p.product_id
    WHERE product_name LIKE '%Chocolate%'); 
# --------------------------------------------
# SOLUTION NO.2
SELECT first_name, last_name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM customer_orders
    WHERE product_id IN (
        SELECT product_id
        FROM products
        WHERE product_name LIKE '%Chocolate%')
        );
# -----------------------------------------------------------------------------------------
# ========================
# SUBQUERIES ON WHERE
# -----------------------------------------------------------------------------------------
# Practice Questions: Using the employees table, use a subquery to select the 2nd highest
# paid employee
# --------------------------------------------
# SOLUTION NO.1
SELECT *
FROM employees
WHERE salary NOT IN(
    SELECT MAX(salary)
    FROM employees
    )
ORDER BY salary DESC
LIMIT 1;
# --------------------------------------------
# SOLUTION NO.2
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 1,1;
# -----------------------------------------------------------------------------------------


# =================================
# SUBQUERIES USING 'ANY' and 'ALL'
# -----------------------------------------------------------------------------------------
# Practice Example No.1 (Working with ALL):
SELECT *, (quantity * unit_price) AS total_order_price
FROM ordered_items
WHERE (quantity * unit_price) > ALL (
                                    SELECT (quantity*unit_price) AS total_order_price
                                    FROM ordered_items
                                    WHERE shipper_id = 1);
# It just returns 2 values, because it looks all values that are higher than MAX.

# --------------------------------------------
# Practice Example No.2 (Working with ANY):
SELECT *, (quantity * unit_price) AS total_order_price
FROM ordered_items
WHERE (quantity * unit_price) > ANY (
                                    SELECT (quantity*unit_price) AS total_order_price
                                    FROM ordered_items
                                    WHERE shipper_id = 1);
# It shows 16 results, because it looks all values that are higher than the MIN.
# -----------------------------------------------------------------------------------------


# ==================================
# SUBQUERIES IN 'SELECT' STATEMENTS
# -----------------------------------------------------------------------------------------
# Practice Questions: Take a look at the different answers obtained in each solution
SELECT product_id, quantity, AVG(quantity)
FROM ordered_items
GROUP BY product_id, quantity;
#
SELECT product_id, quantity, (SELECT AVG(quantity) FROM ordered_items)
FROM ordered_items;
# 
SELECT product_id, quantity, 
    (SELECT AVG(quantity) FROM ordered_items WHERE product_id IN (1001,1002, 1003, 1004))
FROM ordered_items
WHERE product_id IN (1001,1002, 1003, 1004);
# -----------------------------------------------------------------------------------------
# ==================================
# SUBQUERIES IN 'SELECT' STATEMENTS
# -----------------------------------------------------------------------------------------
# Practice Questions: Calculate percentage of each row, considering the whole table
SELECT product_id, quantity,
    (SELECT SUM(quantity) FROM ordered_items) AS Total_Sum,
    (quantity/(SELECT SUM(quantity) FROM ordered_items) * 100) AS Percentage_from_Table
FROM ordered_items;
# -----------------------------------------------------------------------------------------


# =============================================
# SUBQUERIES PRACTICE
# -------------------------------------------------------------------------------------------------
# Practice Questions: Given the 'customer_orders' table, Use a subquery to determine the customers
# who have made a purchase that was higher than the average total purchase of all the orders.
# Have the 'customer_id', 'order_total' and the 'average of order totals' in your output.
# -------------------------------------------------------------------------------------------------
SELECT customer_id, order_total, 
    (SELECT AVG(order_total) 
    FROM customer_orders) AS total_avg
FROM customer_orders
WHERE order_total > (
                    SELECT AVG(order_total) 
                    FROM customer_orders);
# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------