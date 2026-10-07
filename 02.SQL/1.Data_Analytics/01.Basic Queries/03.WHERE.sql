# WHERE Clause
# ============

SELECT *
FROM customers
WHERE total_money_spent > 3000;


SELECT *
FROM customers
WHERE city = 'Scranton';


SELECT *
FROM customers
WHERE birth_date > '1999-01-01';


SELECT *
FROM products
WHERE units_in_stock < 30;
