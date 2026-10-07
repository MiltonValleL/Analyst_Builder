# INNER JOINS
# ===========

# ---------------------------------------------------------------
# First take a look at both tables
SELECT *
FROM customers;
SELECT *
FROM customer_orders;
#
# Now lets make an INNER JOIN with this tables...
SELECT *
FROM customers c
    INNER JOIN customer_orders co
    ON c.customer_id = co.customer_id
ORDER BY c.customer_id;


# --------------------------------------------------------
# Another practical example!!!
SELECT *
FROM products;
SELECT *
FROM customer_orders;
#-------
SELECT p.product_id, product_name, 
        SUM(co.order_total) AS total,
        COUNT(p.product_id) AS number_items
FROM products p
    INNER JOIN customer_orders co
    ON p.product_id = co.product_id
GROUP BY p.product_id
ORDER BY total DESC;
# --------------------------------------------------------


# --------------------------------------------------------
# Example NO.2
# DB to work with
SELECT *
FROM suppliers;
SELECT *
FROM ordered_items;
#
#--------
SELECT *
FROM ordered_items oi
    INNER JOIN suppliers s
    ON oi.shipper_id = s.supplier_id;
# --------------------------------------------------------
