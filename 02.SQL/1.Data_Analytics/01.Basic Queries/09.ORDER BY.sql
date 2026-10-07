# ORDER BY Clause
# ===============

SELECT *
FROM customers
ORDER BY first_name; # Ascending Order


SELECT *
FROM customers
ORDER BY first_name DESC; # Descending Order


SELECT *
FROM customers
ORDER BY state ASC, total_money_spent DESC; # 1st is Ascending, 2nd id Descending


SELECT *
FROM customers
ORDER BY 3 DESC; # Order by COLUMN INDEX NUMBER (starts from 1) - 'last_name' = 3


SELECT *
FROM customers
ORDER BY 8 ASC, 9 DESC; # (3 = 'state'), (9 = 'total_money_spent')
