# ROLLUP 
# ======
SELECT customer_id, SUM(tip) AS total_tip
FROM customer_orders
GROUP BY customer_id WITH ROLLUP;


# Another GREAT EXAMPLE with a lot of aggregations...
SELECT customer_id,
        SUM(tip) AS total_tip,
        COUNT(tip) AS tip_counter, 
        MAX(tip) AS max_tip,
        AVG(tip) AS average_tip,
        MIN(tip) AS min_tip
FROM customer_orders
GROUP BY customer_id WITH ROLLUP;
