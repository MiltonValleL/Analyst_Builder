# UNION
# =====
# UNION, UNION DISTINCT, UNION ALL

# UNION is how you can conbine rows together, not columns like we have been doing before
SELECT *
FROM customers;
SELECT *
FROM products;
# ----------------------------------------------------------------------------
# Eventhough the tables 'customers' and 'products' don't have common columns, 
# they will union wrongly. One after the second.
SELECT first_name, last_name
FROM customers
UNION
SELECT product_id, product_name
FROM products;
# ----------------------------------------------------------------------------


# ----------------------------------------------------------------------------
# Now one successful example
# PART I
SELECT first_name, last_name, 'Old' AS label
FROM customers
WHERE YEAR(birth_date) < 1950
UNION # ---------------------------------
SELECT first_name, last_name, 'Good Tipper'
FROM customers c
    JOIN customer_orders co
    ON c.customer_id = co.customer_id
WHERE tip > 3
UNION # ---------------------------------
SELECT first_name, last_name, 'Big Spender'
FROM customers
WHERE total_money_spent > 1000
ORDER BY first_name;
# ----------------------------------------------------------------------------


# ----------------------------------------------------------------------------
# Now a second successful example
# PART II
SELECT first_name, last_name, 'Old' AS label
FROM customers
WHERE YEAR(birth_date) < 1950
UNION DISTINCT # ---------------------------------
SELECT first_name, last_name, 'Good Tipper'
FROM customers c
    JOIN customer_orders co
    ON c.customer_id = co.customer_id
WHERE tip > 3
UNION DISTINCT # ---------------------------------
SELECT first_name, last_name, 'Big Spender'
FROM customers
WHERE total_money_spent > 1000
ORDER BY first_name;
# ----------------------------------------------------------------------------


# ----------------------------------------------------------------------------
# Now one successful example
# PART III
SELECT first_name, last_name, 'Old' AS label
FROM customers
WHERE YEAR(birth_date) < 1950
UNION ALL # ---------------------------------
SELECT first_name, last_name, 'Good Tipper'
FROM customers c
    JOIN customer_orders co
    ON c.customer_id = co.customer_id
WHERE tip > 3
UNION ALL # ---------------------------------
SELECT first_name, last_name, 'Big Spender'
FROM customers
WHERE total_money_spent > 1000
ORDER BY first_name;
# ----------------------------------------------------------------------------