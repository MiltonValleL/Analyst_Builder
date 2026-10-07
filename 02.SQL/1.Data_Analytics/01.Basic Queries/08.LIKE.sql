# LIKE OPERATOR
# =============

# -----------------------------------------
# "%"   ->   Zero, One or Multiple Characters.
# "_"   ->   Single Character
# -----------------------------------------

SELECT * 
FROM customers
WHERE first_name LIKE 'K%'; # starts with 'K'  (Kevin, Kelly)


SELECT *
FROM customers
WHERE first_name LIKE '%n'; # Ends with 'n' (Kevin, Don, Anakin)


SELECT *
FROM customers
WHERE first_name LIKE '%n%'; # could be second letter or any to the last letter (Kevin, Finley, Don)

# --------------------------------------------------------------------------------------------------
SELECT *
FROM customers
WHERE first_name LIKE '__n'; # Use 1 '_' for each letter
# Or it also could be...
SELECT *
FROM customers
WHERE first_name LIKE '_o_';
