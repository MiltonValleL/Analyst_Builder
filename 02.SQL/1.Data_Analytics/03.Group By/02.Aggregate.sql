# AGGREGATE FUNCTIONS
# ===================
# SUM(), COUNT(), MAX(), MIN(), AVG()

SELECT customer_id, 
    SUM(tip) AS total_tips,
    COUNT(tip) AS count_tips,
    AVG(tip) AS avg_tip,
    MAX(tip) AS max_tip,
    MIN(tip) AS min_tip
FROM customer_orders
GROUP BY customer_id
ORDER BY avg_tip DESC;


# DISTINCT, counts unique values if duplicated
SELECT product_id, 
        COUNT(tip) AS just_count, 
        COUNT(DISTINCT(tip)) AS distinct_count
FROM customer_orders
GROUP BY product_id
ORDER BY product_id;
# Execute both pieces of code.
SELECT*
FROM customer_orders;
