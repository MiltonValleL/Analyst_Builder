# HAVING vs WHERE CLAUSE
# ======================

# This code throws an error because the SELECT line executes after WHERE line. That's why 'total_tips' is unknown.
SELECT customer_id, SUM(tip) AS total_tips
FROM customer_orders
WHERE total_tips > 5
GROUP BY customer_id;
#
# THe correct way in this case is this...
SELECT customer_id, SUM(tip) AS total_tips
FROM customer_orders
GROUP BY customer_id
HAVING total_tips > 5;


# Another example.
SELECT customer_id, 
        SUM(order_total) AS total
FROM customer_orders
GROUP BY customer_id
HAVING total > 40
ORDER BY total;
