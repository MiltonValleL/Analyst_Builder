# =============================================
# WINDOW FUNCTIONS - (OVER + PARTITION BY)
# -----------------------------------------------------------------------------------------
# Practice Questions: Given the 'customers_orders' table, provide a ROLLING SUM of purchases
# each customer has made, from smallest to largest purchase. Give the 'customer_ID', 
# 'order_total', and rolling order total called 'Rolling_Total'
# 
SELECT customer_id, order_total,
    SUM(order_total) OVER(PARTITION BY customer_id ORDER BY order_total DESC) AS Rolling_Total
FROM customer_orders;
# -----------------------------------------------------------------------------------------


# =============================================
# WINDOW FUNCTIONS - (ROW NUMBER)
# -----------------------------------------------------------------------------------------
# Example No. 1
SELECT c.customer_id, first_name, order_total,
    ROW_NUMBER() OVER()
FROM customers c
    INNER JOIN customer_orders co
    ON c.customer_id = co.customer_id;
# -----------------------------------------------------------------------------------------
# Example No. 2
SELECT c.customer_id, first_name, order_total,
    ROW_NUMBER() OVER(PARTITION BY first_name ORDER BY order_total DESC) AS row_num
FROM customers c
    INNER JOIN customer_orders co
    ON c.customer_id = co.customer_id;
    # -----------------------------------------------------------------------------------------
# Example No. 3 - Show only the highest payments for each customer
SELECT *
FROM (
    SELECT c.customer_id, first_name, order_total,
        ROW_NUMBER() OVER(PARTITION BY first_name ORDER BY order_total DESC) AS row_num
    FROM customers c
        INNER JOIN customer_orders co
        ON c.customer_id = co.customer_id) AS row_table
WHERE row_num = 1;
# -----------------------------------------------------------------------------------------


# =============================================
# WINDOW FUNCTIONS - (RANK and DENSE RANK)
# -----------------------------------------------------------------------------------------
# Example No. 1
SELECT *,
RANK() OVER() AS just_rank,
DENSE_RANK() OVER() AS just_dense_rank,
ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary) AS row_number_col,
RANK() OVER(PARTITION BY department ORDER BY salary) AS rank_example,
DENSE_RANK() OVER(PARTITION BY department ORDER BY salary) AS dense_rank_example
FROM employees;
# -----------------------------------------------------------------------------------------


# =============================================
# WINDOW FUNCTIONS - (LAG and LEAD)
# ------------------------------------------------------------------------------------------
SELECT *,
    LAG(salary) OVER(PARTITION BY department ORDER BY salary) AS lag_column,
    # the row 1 goes to row 2 of the selected column or PARTITION BY
    LEAD(salary) OVER(PARTITION BY department ORDER BY salary) AS lead_column
    # The row 2 goes to the row 1 of the selected column or PARTITION BY
FROM employees;
# ------------------------------------------------------------------------------------------
# Practice Questions: Create a table using 'employees' table where you can eval if an employee
# is less, more o equally paid as the following, when ordered by 'employee_id'
SELECT *,
    CASE
        WHEN salary < lag_column THEN 'Less Paid'
        WHEN salary = lag_column THEN 'Equally Paid'
        ELSE 'More Paid' END AS Eval_Label
FROM (
    SELECT *, 
        LAG(salary) OVER(PARTITION BY department ORDER BY employee_id) AS lag_column
    FROM employees) AS lag_table;
# ------------------------------------------------------------------------------------------
# ------------------------------------------------------------------------------------------