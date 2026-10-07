# JOIN USE CASES
# ==============

# -------------------------------------------------------------------------
# EXAMPLE No. 1
SELECT DISTINCT(product_name), 
        unit_price, 
        sale_price, 
        units_in_stock,
        sale_price - unit_price AS profit,
        units_in_stock * (sale_price - unit_price) AS potential_profit
FROM ordered_items oi
    INNER JOIN products p
    ON oi.product_id = p.product_id
ORDER BY potential_profit DESC;
# -------------------------------------------------------------------------


# -------------------------------------------------------------------------
# EXAMPLE No. 2
# Base tables
SELECT *
FROM supplier_delivery_status;
SELECT *
FROM ordered_items;
SELECT *
FROM suppliers;

# Let's get started!!!
SELECT order_id, sds.name, status, shipped_date, s.name
FROM ordered_items oi
    INNER JOIN supplier_delivery_status sds
    ON oi.status = sds.order_status_id
    INNER JOIN suppliers s
    ON oi.shipper_id = s.supplier_id
WHERE sds.name <> 'Delivered'
AND YEAR(shipped_date) < YEAR(NOW())
ORDER BY shipped_date;