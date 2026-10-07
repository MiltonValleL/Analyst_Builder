# String Functions
# (LENGHT, UPPER, LOWER, TRIM, LTRIM, RTRIM, LEFT, RIGHT, SUBSTRING, REPLACE, LOCATE, CONCAT)
# ================

SELECT LENGTH('sky');


# Counts the length of the string
SELECT first_name, LENGTH(first_name) as len_first
FROM customers
ORDER BY len_first;


# Makes the selected colummn "UPPER CASE" and "lower case"
SELECT first_name, UPPER(first_name) AS UPPER, LOWER(first_name) AS lower
FROM customers;


# Removing white spaces from the left, right or both sides
SELECT '     Milton     ', 
        TRIM('     Milton     ') AS all_trim,
        LTRIM('     Milton     ') AS left_trim,
        RTRIM('     Milton     ') AS right_trim;


# Select an specific number of letter from the LEFT and from the RIGHT
SELECT first_name, 
        LEFT(first_name, 3) as short_left,
        RIGHT(first_name, 3) as short_right,
        # Select a character from a N position and take M letters - SUBSTRING(character, N,M)
        SUBSTRING(first_name, 3,4) as middle_cut
FROM customers;


# GREAT EXAMPLE OF USE!!!!
# Selecting specific parts of a phone number
SELECT phone, LEFT(phone, 3) AS code_area, 
              SUBSTRING(phone, 5, 3) AS region_area,
              RIGHT(phone,4) AS phone_number
FROM customers;


# Replacing a character from a column
SELECT first_name, 
       REPLACE(first_name, 'a', 'zzz') AS new_name
FROM customers;
#
# Another USE EXAMPLE of REPLACE
SELECT phone, 
        REPLACE(phone, '-', '') AS all_numbers
FROM customers;


# Return the position of a looking character
SELECT 'Milton' AS model_string,
        LOCATE('l', 'Milton') AS looking_char1,
        LOCATE('M', 'Milton') AS looking_char2,
        LOCATE('O', 'Milton') AS looking_char3; # NOT Case Sensitive
# 
# Another great EXAMPLE!!!
SELECT last_name, LOCATE('n', last_name) AS looking_N
FROM customers;
        

# Use of CONCAT
SELECT CONCAT('Milton', ' ', 'Valle') AS Me;
#
# !!! GREAT EXAMPLE of USE !!!
SELECT first_name, last_name, LOWER(CONCAT(LEFT(first_name,3), LEFT(last_name, 3))) AS user_alias
FROM customers;
