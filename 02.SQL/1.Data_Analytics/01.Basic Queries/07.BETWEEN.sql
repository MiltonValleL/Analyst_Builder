# BETWEEN OPERATOR
# ================

SELECT *
FROM customers
WHERE total_money_spent BETWEEN 534 AND 1009;
# It's the same!!!
SELECT *
FROM customers
WHERE total_money_spent >= 534 AND total_money_spent <= 1009;
# NOTE: It's important to select "numbers" from lower to higher, otherwise won't work.


SELECT *
FROM customers
WHERE birth_date BETWEEN '1990-01-01' AND '2020-01-01';
# NOTE: It's important to select "dates" from lower to higher, otherwise won't work.
