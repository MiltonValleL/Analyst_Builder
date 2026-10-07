# SUBQUERY BASICS
# ===============
# --------------------------------------------
# Use of Subqueries Example No. 1
SELECT *
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM customer_orders
    WHERE tip > 1)
;
# --------------------------------------------


# --------------------------------------------
# Example No. 2
SELECT *
FROM customers
WHERE total_money_spent > (
    SELECT AVG(total_money_spent)
    FROM customers)
;