# LOGICAL OPERATORS (AND, OR, NOT)
# =================

# ------------------------------------------------------------------------
SELECT *
FROM customers
WHERE state = 'PA' AND total_money_spent > 1000;


SELECT *
FROM customers
WHERE state = "PA" OR total_money_spent > 1000;


# ------------------------------------------------------------------------
SELECT *
FROM customers
WHERE (state = 'PA' OR city = 'Dallas') AND (total_money_spent > 30 OR birth_date > '1980-01-01');


# ------------------------------------------------------------------------
# Use of NOT
SELECT *
FROM customers
WHERE NOT state = 'PA';


SELECT *
FROM customers
WHERE NOT total_money_spent > 1000;


SELECT *
FROM customers
WHERE NOT total_money_spent > 1000 AND state = 'TX';
# Which is not the same as...
SELECT*
FROM customers
WHERE NOT (total_money_spent > 1000 AND state = 'TX');