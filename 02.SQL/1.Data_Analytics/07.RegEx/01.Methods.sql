# REGULAR EXPRESSION METHODS
# ==========================
# -------------------------------------------------------------------------------------------------------------------------
# - REGEXP (or RLIKE): This is a pattern match operator, which is used to match a column value against a pattern using a 
#   regular expression. If the value matches the pattern, the REGEXP operator returns 1, otherwise it returns 0.

# - NOT REGEXP (or NOT RLIKE): This is the negation of REGEXP. It returns 1 if the column value does not match the pattern, 
#   and 0 if it does.

# - REGEXP_LIKE(string, pattern, [match_type]): This function is similar to REGEXP, but it allows you to specify a match type. 
#   The match type can include 'c' for case-sensitive matching, 'i' for case-insensitive matching, 'm' for multi-line mode, 
#   'n' for Unix newline mode, and 'u' for Unicode mode.

# - REGEXP_INSTR(string, pattern, [position, occurrence, match_type, return_end]): This function returns the starting 
#   index of the first occurrence of the pattern in the string. If the pattern is not found, it returns 0.

# - REGEXP_SUBSTR(string, pattern, [position, occurrence, match_type]): This function returns the substring of the string 
#   that matches the pattern. If no match is found, it returns NULL.

# - REGEXP_REPLACE(string, pattern, replacement, [position, occurrence, match_type]): This function replaces occurrences 
#   of the pattern in the string with a replacement string and returns the resulting string.
# -------------------------------------------------------------------------------------------------------------------------
SELECT *
FROM customers
WHERE first_name LIKE '%k%';
#
SELECT *
FROM customers
WHERE first_name REGEXP 'k';
#
SELECT first_name, 
    REGEXP_REPLACE(first_name, 'a','BBB') AS regex_replace,
    REGEXP_LIKE(first_name, 'a') AS regex_like,
    NOT REGEXP_LIKE(first_name, 'a') AS not_regex_like,
    REGEXP_INSTR(first_name, 'a') AS regex_instr,
    REGEXP_SUBSTR(first_name, 'a') AS regex_substr
FROM customers;
#
