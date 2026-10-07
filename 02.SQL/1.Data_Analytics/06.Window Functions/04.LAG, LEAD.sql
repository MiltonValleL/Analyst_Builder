# LAG AND LEAD FUNCTIONS
# ======================
# ------------------------------------------------------------------------------------------
# LAG() function fetches the value from a row that is a certain number of rows before the 
# current row within the same result set. It's useful when you want to compare a value in 
# a row with a value in a preceding row.

# LEAD() function fetches the value from a row that is a certain number of rows after 
# the current row within the same result set.
# ------------------------------------------------------------------------------------------
# Use Example No. 1 (Easy)
SELECT *,
    LAG(salary) OVER() AS lag_one,
    LAG(salary, 2) OVER() AS lag_two,
    LAG(salary, 5) OVER() AS lag_five,
    LEAD(salary) OVER() AS lead_one,
    LEAD(salary, 2) OVER() AS lead_two,
    LEAD(salary, 5) OVER() AS lead_five
FROM employees;
# ------------------------------------------------------------------------------------------


# ------------------------------------------------------------------------------------------
# Use Example No. 2 (Moderate)
SELECT *, 
    LAG(salary) OVER(PARTITION BY department ORDER BY employee_id) AS lag_column,
    LEAD(salary) OVER(PARTITION BY department ORDER BY employee_id) AS lead_column
FROM employees;
# ------------------------------------------------------------------------------------------


# ------------------------------------------------------------------------------------------
# Use Example No. 3 (Moderate)
SELECT *,
    salary - lag_column AS lag_dicrepancy,
    salary - lead_column AS lead_discrepancy
FROM 
    (SELECT *,
        LAG(salary) OVER(PARTITION BY department ORDER BY salary DESC) AS lag_column,
        LEAD(salary) OVER(PARTITION BY department ORDER BY salary DESC) AS lead_column
    FROM employees) AS lag_lead_table;
# ------------------------------------------------------------------------------------------


# ------------------------------------------------------------------------------------------
# Use Example No. 4 (Moderate)
SELECT *,
    IF(salary > lag_column, 'More Paid', 'Less Paid') AS salary_evaluation
FROM 
    (SELECT *, 
        LAG(salary) OVER(PARTITION BY department ORDER BY employee_id DESC) AS lag_column
    FROM employees) AS lag_lead_table;
# ------------------------------------------------------------------------------------------
