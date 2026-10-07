# WORKING WITH NULL VALUES
# ========================

# -------------------------------------------------------------------------------
# 1. Since the 'phone' column has 2 BLANK cells, we need to convert it to NULL
UPDATE customer_sweepstakes
SET phone = NULL
WHERE phone = '';

# -------------------------------------------------------------------------------
# 2. We have the same problem on the 'income' column, so let's fix this issue
UPDATE customer_sweepstakes
SET income = NULL
WHERE income = '';

# -------------------------------------------------------------------------------
# 3. Evaluating if a customner is `Are you over 18?`
SELECT birth_date, `Are you over 18?`
FROM customer_sweepstakes
WHERE YEAR(NOW()) - 20 > YEAR(birth_date); # They are over 18
# -------------------------------------------------------------------------------
# 3.1. Updating the younger than 18 first
UPDATE customer_sweepstakes
SET `Are you over 18?` = 'N'
WHERE YEAR(NOW()) - 20 < YEAR(birth_date);
# -------------------------------------------------------------------------------
# 3.2. Updating the older than 18 first
UPDATE customer_sweepstakes
SET `Are you over 18?` = 'Y'
WHERE YEAR(NOW()) - 20 > YEAR(birth_date);


# -------------------------------------------------------------------------------
# 4 Working on 'income' column
SELECT AVG(income), 
    AVG(COALESCE(income,0)),
FROM customer_sweepstakes
;



SELECT *
FROM customer_sweepstakes;


