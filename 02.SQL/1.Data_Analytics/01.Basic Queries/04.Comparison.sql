# COMPARISON OPERATORS  (=, <, >, >=, <=, <> or !=)
# ====================

SELECT *
FROM bakery.customer_orders
WHERE tip < 1;


SELECT *
FROM customer_orders
WHERE tip <> 1;
# is equal to
SELECT *
FROM customer_orders
WHERE tip != 1;


SELECT *
FROM customer_orders
WHERE tip > 5;


SELECT *
FROM customer_orders
WHERE tip >= 5;


SELECT *
FROM customer_orders
WHERE tip <= 5;
