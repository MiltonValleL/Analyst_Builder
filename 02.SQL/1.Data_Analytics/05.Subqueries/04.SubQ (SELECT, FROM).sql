# SUBQUERIES IN 'SELECT' AND 'FROM'
# =================================
# ----------------------------------------------------------------------------------------------------------------
#  - A subquery can be used in the SELECT clause to "calculate a value for each row" returned by the outer query.
#
#  - A subquery can be used in the FROM clause to create a "temporary table" that can be used within the scope 
#    of the outer query.
# ----------------------------------------------------------------------------------------------------------------
# Base code idea
SELECT AVG(quantity)  # Result = 48.78
FROM ordered_items;


# --------------------------------------------------------------------
# Example No. 1 - Subqueries on SELECT clause (Average total Value)
SELECT product_id, quantity, (
    SELECT AVG(quantity)
    FROM ordered_items) AS average_quantity
FROM ordered_items;
# --------------------------------------------------------------------


# --------------------------------------------------------------------
# Example No. 2 - Subqueries on SELECT clause
# (Total Value, Percentage of Total Value)
SELECT product_id, quantity, 
    (SELECT SUM(quantity)
    FROM ordered_items) AS sum_quantity,
    ROUND(100*quantity/(
    SELECT SUM(quantity)
    FROM ordered_items),2) AS total_percentage
FROM ordered_items;
# --------------------------------------------------------------------


# --------------------------------------------------------------------
# Example No. 3 - Subquery on FROM clause
SELECT product_id, new_table.avg_quantity
FROM (
    SELECT product_id, quantity, 
            (SELECT AVG(quantity)
            FROM ordered_items) AS avg_quantity
    FROM ordered_items) AS new_table;
# --------------------------------------------------------------------