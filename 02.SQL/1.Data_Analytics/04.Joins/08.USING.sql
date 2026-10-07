# USING KEYWORD IN JOINS
# ======================
# Regular way to do it...
SELECT c.customer_id, first_name, co.order_id
FROM customers c
    LEFT JOIN customer_orders co
    ON c.customer_id = co.customer_id
ORDER BY c.customer_id, co.order_id;
#
# ----------------------------------------------------------
# Now working with USING Keyword, while working with JOINS
SELECT customer_id, first_name, order_id
FROM customers c
    LEFT JOIN customer_orders co
    USING (customer_id)  # Here is the USING Keyword. It's shorter, but not necessarily better.
ORDER BY customer_id, order_id;
# ----------------------------------------------------------
