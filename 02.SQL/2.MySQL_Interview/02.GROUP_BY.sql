# =========
# GROUP BY
# -----------------------------------------------------------------------------------------
# Practice Questions:
# Using the employees table, write a query to show the average salary for each department
SELECT department, ROUND(AVG(salary),2) AS avg_salary
FROM employees
GROUP BY department
ORDER BY avg_salary;


# ====================
# AGGREGATE FUNCTIONS
# -----------------------------------------------------------------------------------------
# Practice Questions:
# Using the employee table, write a query to show the average salary and the max salary
# in each department
SELECT department, AVG(salary) AS avg_salary, MAX(salary) AS max_salary
FROM employees
GROUP BY department;


# =======================
# HAVING vs WHERE CLAUSE
# -----------------------------------------------------------------------------------------
# Practice Questions:
# Using the 'customer_orders' table, write a query to show the products that had 2 or more orders
SELECT product_id, count(product_id) AS count_products
FROM customer_orders
GROUP BY product_id
HAVING count_products >= 2;
# -----------------------------------------------------------------------------------------
# -----------------------------------------------------------------------------------------