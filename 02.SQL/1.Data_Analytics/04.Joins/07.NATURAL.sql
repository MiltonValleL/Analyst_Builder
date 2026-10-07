# NATURAL JOINS
# =============
# ---------------------------------------------------------------------------------------------------------------------
# IMPORTANT NOTE: Since NATURAL JOINS works automaticaly, when there are several repeated columns on different tables.
# It could make a huge mess and we might not get the desired results. 
# ***SO AVOID TO WORK WITH "NATURAL JOINS"***
# ---------------------------------------------------------------------------------------------------------------------

# Original Tables to work with
SELECT *
FROM products;
SELECT *
FROM customer_orders;
#
# -------------------------------------------
# Example of how to work with NATURAL JOINS
SELECT *
FROM products p
    NATURAL JOIN customer_orders co 
    # NATURAL JOINS don't duplicate the columns name that are JOINED.
    # It avoids duplicity of columns. (Watch out)
ORDER BY p.product_id;
# -------------------------------------------
