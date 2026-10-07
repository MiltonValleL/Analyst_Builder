# ALL and ANY Statements
# ======================
# ----------------------------------------------------------------------------------------------
# Base calculation of the subquery -> Result = 227.04
SELECT MAX(quantity * unit_price) AS total_order_price
FROM ordered_items
WHERE shipper_id = 1;
#
# Example No. 1
SELECT shipper_id, order_id, quantity, unit_price, (quantity * unit_price) AS total_order_price
FROM ordered_items
WHERE (quantity * unit_price) > (
        SELECT MAX(quantity * unit_price)
        FROM ordered_items
        WHERE shipper_id = 1);
# ----------------------------------------------------------------------------------------------


# ----------------------------------------------------------------------------------------------
# Example No. 2
SELECT shipper_id, order_id, quantity, unit_price, (quantity * unit_price) AS total_order_price
FROM ordered_items
WHERE (quantity * unit_price) > ALL (
        SELECT quantity * unit_price
        FROM ordered_items
        WHERE shipper_id = 1);
        
        
# ----------------------------------------------------------------------------------------------
# Example No. 3
SELECT shipper_id, order_id, quantity, unit_price, (quantity * unit_price) AS total_order_price
FROM ordered_items
WHERE (quantity * unit_price) > ANY (
        SELECT quantity * unit_price
        FROM ordered_items
        WHERE shipper_id = 1)
ORDER BY total_order_price;
# ----------------------------------------------------------------------------------------------