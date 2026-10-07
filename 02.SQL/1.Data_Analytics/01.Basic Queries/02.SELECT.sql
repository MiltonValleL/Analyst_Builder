# SELECT Statement
# ================

# ---------------------------------------------------------------------------
SELECT last_name, first_name, birth_date, city, state
FROM customers;


SELECT last_name,
        first_name,
        birth_date,
        city,
        state,
        total_money_spent,
        total_money_spent + 100 * 10,
        (total_money_spent + 100) * 10 # PEMDAS order of calculations
FROM customers;

# ---------------------------------------------------------------------------
# SELECT DISTINCT - How does it work
SELECT state
FROM customers;
# VS.
SELECT DISTINCT state # exclude duplicates
FROM customers;
# VS.
SELECT DISTINCT city, state # exclude duplicates on 'city'
FROM customers;
