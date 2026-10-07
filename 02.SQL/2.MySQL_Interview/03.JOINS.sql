# ========================
# JOINING MULTIPLE TABLES
# -----------------------------------------------------------------------------------------
# Practice Questions:
# Given 3 tables (supliers, ordered_items, customer_orders), write a query to return the
# 'name of the supplier' and the 'sum of the total order amount' for each supplier
# --------------------------------------------
SELECT *
FROM suppliers;
SELECT *
FROM ordered_items;
SELECT *
FROM customer_orders;
# --------------------------------------------
SELECT name, SUM(order_total) AS total_amount
FROM suppliers s 
INNER JOIN ordered_items oi
    ON s.supplier_id = oi.shipper_id
INNER JOIN customer_orders co
    ON oi.order_id = co.order_id
GROUP BY name;
# --------------------------------------------


# ============
# SELF JOINS
# -----------------------------------------------------------------------------------------
# Practice Questions:
# In the customer table, the person with the next highest 'customer_ID' is that person's boss.
# Write a query to return the 'first_name' and 'last_name' of both the employee and their boss
# --------------------------------------------
SELECT c.customer_id AS employee_id,
    c.first_name AS employee_name, 
    c.last_name AS employee_last_name, 
    cs.customer_id AS boss_id,
    cs.first_name AS boss_name,
    cs.last_name AS boss_last_name
FROM customers c
    INNER JOIN customers cs
    ON c.customer_id = cs.customer_id - 1;
# --------------------------------------------


# ============
# CROSS JOINS
# -----------------------------------------------------------------------------------------
# Practice Questions:
# Construct a new table from the tables 'customers' and 'customer_orders' using CROSS join
# --------------------------------------------
SELECT c.customer_id, first_name, order_id, co.customer_id
FROM customers c
    CROSS JOIN customer_orders co
ORDER BY c.customer_id, co.customer_id;
# Same results can be reach with the following code...
SELECT c.customer_id, first_name, order_id, co.customer_id
FROM customers c, customer_orders co
ORDER BY c.customer_id, co.customer_id;
# --------------------------------------------


# =======
# UNIONS
# -----------------------------------------------------------------------------------------
# Practice Example: Join 3 different tables and show the 'customer_id', 'first_name' and 
# any characteristic text based on any column.
# ------------------------------------------------------
SELECT customer_id, first_name, 'OLD' AS Label
FROM customers
WHERE birth_date < '1950-01-01'
UNION # ------------------------------------------------
SELECT customer_id, first_name, 'MATURE'
FROM customers
WHERE birth_date BETWEEN '1950-01-01' AND '1980-01-01'
UNION # ------------------------------------------------
SELECT c.customer_id, first_name, 'Good Tipper'
FROM customers c
    INNER JOIN customer_orders co
    ON c.customer_id = co.customer_id
WHERE tip > 4;
#
# ------------------------------------------------------
# KEY NOTE: UNION works by default with DISTINCT, 
# so you will never see duplicated data by default
# ------------------------------------------------------
SELECT customer_id, first_name, 'OLD' AS Label
FROM customers
WHERE birth_date < '1950-01-01'
UNION # ---------------------------------------
SELECT customer_id, first_name, 'OLD' AS Label
FROM customers
WHERE birth_date < '1950-01-01';
#
# ------------------------------------------------------
# KEY NOTE: UNION ALL will accept duplicates
# ------------------------------------------------------
SELECT customer_id, first_name, 'OLD' AS Label
FROM customers
WHERE birth_date < '1950-01-01'
UNION ALL # -----------------------------------
SELECT customer_id, first_name, 'OLD' AS Label
FROM customers
WHERE birth_date < '1950-01-01';
# -----------------------------------------------------------------------------------------
# -----------------------------------------------------------------------------------------
