# EXISTS OPERATOR
# ===============
# --------------------------------------------------------------------------------------------
# IMPORTAN NOTE: 'Exists' Operator is very helpful to accelerate the calculation time process.
# So this operator is very relevant when working with Huge dataset, but not in order to 
# filter, but in order to accelerate the time process of the calculation.
# --------------------------------------------------------------------------------------------
# Base Model for Example
SELECT *
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM customer_orders);
# -----------------------------------------------


# -----------------------------------------------
# Example No. 1
SELECT *
FROM customers c
WHERE EXISTS(
    SELECT customer_id
    FROM customer_orders
    WHERE customer_id = c.customer_id);
# -----------------------------------------------