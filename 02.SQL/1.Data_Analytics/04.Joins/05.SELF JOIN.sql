# SELF JOINS
# ==========

SELECT c.customer_id AS employee_id, 
        c.first_name AS employee_name, 
        c.last_name AS employee_LN, 
        ss.customer_id AS boss_id, 
        ss.first_name AS boss_name, 
        ss.last_name AS boss_LN
FROM customers c
    INNER JOIN customers ss
    ON c.customer_id = ss.customer_id + 1;
    