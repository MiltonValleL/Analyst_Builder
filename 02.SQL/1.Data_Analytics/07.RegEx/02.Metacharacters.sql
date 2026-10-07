# REGULAR EXPRESSION METACHARACTERS
# =================================

# -----------------------------------------------------------------------------------------
SELECT *
FROM customers
WHERE first_name REGEXP '[a-e]' # contains letters from a to e
;
# 
SELECT *
FROM customers
WHERE total_money_spent REGEXP '[0-4]';
# 
SELECT *
FROM customers
WHERE phone REGEXP '6..-';
# 
SELECT *
FROM customers
WHERE first_name REGEXP '^k';
# 
SELECT *
FROM customers
WHERE first_name REGEXP 'n$';
# 
SELECT *
FROM customers
WHERE first_name REGEXP 'Obi.*'; # Zero or more
# 
SELECT *
FROM customers
WHERE first_name REGEXP 'Obi.+'; # One or more
# 
SELECT *
FROM customers
WHERE first_name REGEXP 'Obi.?'; # Zero or One
# 
SELECT *
FROM customers
WHERE first_name REGEXP 'k.{3}.';
# 
SELECT *
FROM customers
WHERE first_name REGEXP 'kev|fro';
# -----------------------------------------------------------------------------------------