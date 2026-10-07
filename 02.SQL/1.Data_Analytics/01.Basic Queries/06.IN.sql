# IN OPERATOR
# ===========

SELECT *
FROM customers
WHERE state = 'PA' OR state = 'TX' OR state = 'IL';

# It's the same as the following, but shorter...
SELECT *
FROM customers
WHERE state IN ('PA', 'TX', 'IL'); # Select multiple values in the same column


SELECT *
FROM customers
WHERE first_name IN ('Kevin', 'Kelly', 'Frodo');
#  (IN) VS. (NOT IN)
SELECT *
FROM customers
WHERE first_name NOT IN ('Kevin', 'Kelly', 'Frodo');
