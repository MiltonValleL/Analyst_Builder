# LIMIT Clause
# ============

SELECT *
FROM customers
ORDER BY total_money_spent DESC
LIMIT 10; # NOTE:  LIMIT has to be placed always at the end.


SELECT *
FROM customers
ORDER BY total_money_spent DESC
LIMIT 3, 5; # IMPORTANT:  It will take the value after the 3rd row. 
                        # And it will take the following 5 values.
