# Read external DB - Way 1
# This way the SCHEMA changes to the USE declared "DataBase"
USE bakery;
SELECT *
FROM customer_orders;


# Read an external DB - Way 2
# This way the Schema remains in the original place
SELECT *
FROM bakery.customer_orders
WHERE product_id = 1001;


# Loading some columns of a DB
SELECT customer_id, first_name, last_name
FROM bakery.customers;

