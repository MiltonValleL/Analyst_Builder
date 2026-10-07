# OUTER JOINS
# ===========
# ----------------------------------------------------------------------------------------------------
# Two tables using "LEFT JOIN"
SELECT c.customer_id, first_name, last_name, phone, co.order_id, co.product_id, co.order_total, co.tip
FROM customers c
    LEFT JOIN customer_orders co # it's the same as "LEFT OUTER JOIN"
    ON c.customer_id = co.customer_id
ORDER BY c.customer_id, co.order_id;
# ----------------------------------------------------------------------------------------------------


# ----------------------------------------------------------------------------------------------------
# Two tables using "RIGHT JOIN"
# The same two tables, and same columns but NOW using "RIGHT JOIN"
SELECT c.customer_id, first_name, last_name, phone, co.order_id, co.product_id, co.order_total, co.tip
FROM customers c
    RIGHT JOIN customer_orders co # it's the same as "RIGHT OUTER JOIN"
    ON c.customer_id = co.customer_id
ORDER BY c.customer_id, co.order_id; # Now the RESULT is different (Watch out)
# ----------------------------------------------------------------------------------------------------


# ----------------------------------------------------------------------------------------------------
# There is not present in this MySQL version the "OUTER JOIN" or "FULL OUTER JOIN"
# Nevertheless there are version where you can work with this two types of JOIN.
