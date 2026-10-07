# GROUP BY BASICS
# ===============

SELECT *
FROM customer_orders;
# Execute both together
SELECT customer_id, 
    SUM(tip) AS sum_customer_tips
FROM customer_orders
GROUP BY customer_id;


# ----------------------------------------------------
# Another Example that is VERY INTERESTING...
SELECT product_id, 
    SUM(order_total) AS total_paid, 
    COUNT(order_total) AS count_items,
    ROUND(AVG(order_total), 2) AS Average_paid,
    SUM(tip) AS total_tip,
    ROUND(AVG(tip), 2) AS Average_tip
FROM customer_orders
GROUP BY product_id
ORDER BY total_paid DESC;
# ----------------------------------------------------