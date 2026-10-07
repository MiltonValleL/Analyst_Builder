# IF FUNCTIONS
# ============
# -------------------------------------------
# IF(Condition, TRUE do this, FALSE do this)
# -------------------------------------------

SELECT tip,
    IF(tip> 1, 'Amazing', 'Cheap...')
FROM customer_orders;


# Great Example
SELECT order_total, tip, 
        IF(tip > 2, order_total*0.75, order_total*1.25) AS new_total
FROM customer_orders;