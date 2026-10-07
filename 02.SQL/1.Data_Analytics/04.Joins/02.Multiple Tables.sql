# JOINING MULTIPLE TABLES
# =======================

SELECT p.product_id, product_name, c.customer_id,first_name, order_total, tip, total_money_spent
FROM products p
    INNER JOIN customer_orders co
    ON p.product_id = co.product_id
    INNER JOIN customers c
    ON co.customer_id = c.customer_id
ORDER BY c.customer_id;
