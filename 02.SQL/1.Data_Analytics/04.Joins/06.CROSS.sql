# CROSS JOINS
# ===========
SELECT *
FROM customers;
SELECT *
FROM customer_orders;


# -------------------------------------------------------------------------------------
SELECT c.customer_id, c.first_name, c.last_name, co.customer_id, co.product_id, co.tip
FROM customers c
    CROSS JOIN customer_orders co
ORDER BY c.customer_id;
# -------------------------------------------------------------------------------------
