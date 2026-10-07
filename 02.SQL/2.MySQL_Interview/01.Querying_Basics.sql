# =================
# SELECT STATEMENT
# -------------------------------------------------------------------------------------------------------
# Practice Questions:
# Using the customers table, write a query to show the phone numbers of all customers who live in Texas.
SELECT first_name, last_name, state, phone
FROM customers
WHERE state = 'TX';
# -------------------------------------------------------------------------------------------------------


# ================
# WHERE STATEMENT
# -------------------------------------------------------------------------------------------------------
# Practice Questions:
# Using the employees table, write a query to show the 'employee ID', 'first_name' and 'last_name' and
# salary of employees that makes more that 45k in the bakery department
SELECT employee_id, first_name, last_name, department, salary
FROM employees
WHERE salary > 45000 AND department = 'bakery';
# -------------------------------------------------------------------------------------------------------


# =================
# BETWEEN OPERATOR
# -------------------------------------------------------------------------------------------------------
# Practice Questions:
# Using the products table, select the name of the product where the sale price is between 1.25 and 3 USD
SELECT product_name, sale_price
FROM products
WHERE sale_price BETWEEN 1.25 AND 3;


# =============
# LIMIT CLAUSE
# -------------------------------------------------------------------------------------------------------
# Practice Questions:
# Using the customers table, write a query to show the top 2 custemers by 'total_money_spent'
SELECT *
FROM customers
ORDER BY total_money_spent DESC
LIMIT 2;


# ===============
# CASE STATEMENT
# -------------------------------------------------------------------------------------------------------
# Practice Questions:
# Using the table 'customer_orders', if a customer tipped 2 USD or more give them a 10% discount.
# Make this a new column called 'discounted_total' to compare to the original order amount.
SELECT *,
    CASE
        WHEN tip >= 2 THEN order_total * 0.9
        ELSE order_total
    END AS discounted_total
FROM customer_orders;
# -------------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------------
# DATE Aritmetic
SELECT first_name, last_name, birth_date,
    DATE_ADD(birth_date, INTERVAL 3 DAY) AS add_date,
    DATE_SUB(birth_date, INTERVAL 5 DAY) As sub_date,
    DATEDIFF(CURRENT_DATE, birth_date) AS diff_date,
    FROM_DAYS(DATEDIFF(CURRENT_DATE, birth_date)) AS from_days
FROM customers;

