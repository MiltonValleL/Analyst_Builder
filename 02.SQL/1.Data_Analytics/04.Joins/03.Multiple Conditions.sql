# JOINING ON MULTIPLE CONDITIONS
# ==============================

# -----------------------------------------
# This are our tables to work on
SELECT *
FROM customer_orders;
SELECT *
FROM customer_orders_review;
# NOW...Let's get started!!!
SELECT *
FROM customer_orders co
    INNER JOIN customer_orders_review cor
    ON co.order_id = cor.order_id
    AND co.customer_id = cor.customer_id
    AND co.order_date = cor.order_date
;
# -----------------------------------------