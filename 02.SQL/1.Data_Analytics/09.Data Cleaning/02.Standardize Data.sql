# STANDARDIZE DATA
# ================

# ------------------------------------------------------------------------------------------
# 1.1. looking for the REGEX filtering
SELECT phone, 
    REGEXP_REPLACE(phone, '[()-/+]', '') AS replaced
FROM customer_sweepstakes;

# 1.2. Now making changes...
UPDATE customer_sweepstakes
SET phone = REGEXP_REPLACE(phone, '[()-/+]', '');

# ------------------------------------------------------------------------------------------
# 2.1. Formating phone numbers
SELECT phone,
    CONCAT(SUBSTRING(phone,1,3), '-', SUBSTRING(phone,4,3), '-', SUBSTRING(phone,7,4))
FROM customer_sweepstakes
WHERE phone <> '';

# 2.2. Updating phone numbers
UPDATE customer_sweepstakes
SET phone = CONCAT(SUBSTRING(phone,1,3), '-', SUBSTRING(phone,4,3), '-', SUBSTRING(phone,7,4))
WHERE phone <> '';

# ------------------------------------------------------------------------------------------
# 3.1. Standardizing 'birth_date'
SELECT birth_date, 
    STR_TO_DATE(birth_date, '%m/%d/%Y'),
    STR_TO_DATE(birth_date, '%Y/%d/%m') AS string_to_date
FROM customer_sweepstakes;

# 3.2. Making 'birth_date' changes in only one column
SELECT birth_date, 
    IF(STR_TO_DATE(birth_date, '%m/%d/%Y') IS NOT NULL, 
    STR_TO_DATE(birth_date, '%m/%d/%Y'), 
    STR_TO_DATE(birth_date, '%Y/%d/%m'))
FROM customer_sweepstakes;

# 3.3. Updating 'birth_date' column - 1st STEP
# XXX When the IF statement can't work, try CASE statements
UPDATE customer_sweepstakes
SET birth_date = IF(STR_TO_DATE(birth_date, '%m/%d/%Y') IS NOT NULL, STR_TO_DATE(birth_date, '%m/%d/%Y'), STR_TO_DATE(birth_date, '%Y/%d/%m')); # WRONG WAY
# XXX If CASE statement can't work either...
UPDATE customer_sweepstakes
SET birth_date = CASE WHEN STR_TO_DATE(birth_date, '%m/%d/%Y') IS NOT NULL THEN STR_TO_DATE(birth_date, '%m/%d/%Y') ELSE STR_TO_DATE(birth_date, '%Y/%d/%m') END; # WRONG Way

# 3.4. Use SUBSTRING to modify the incoherence of data - CORRECT WAY (STEP 1)
UPDATE customer_sweepstakes
SET birth_date = CONCAT(SUBSTRING(birth_date,9,2),'/',SUBSTRING(birth_date,6,2),'/',SUBSTRING(birth_date,1,4))
WHERE sweepstake_id IN (9, 11);
# 3.5. Now comvert 'birth_date' into date format - CORRECT WAY (STEP 2)
UPDATE customer_sweepstakes
SET birth_date = STR_TO_DATE(birth_date, '%m/%d/%Y');

# ------------------------------------------------------------------------------------------
# 4.1. Working with the `Are you over 18?` column, first let's see how to work on this column
SELECT *,
    CASE 
        WHEN `Are you over 18?` = 'Yes' THEN 'Y'
        WHEN `Are you over 18?` = 'No' THEN 'N'
        ELSE `Are you over 18?`
        END
FROM customer_sweepstakes;

# 4.2. Making changes on the original table
UPDATE customer_sweepstakes
SET `Are you over 18?` = CASE 
        WHEN `Are you over 18?` = 'Yes' THEN 'Y'
        WHEN `Are you over 18?` = 'No' THEN 'N'
        ELSE `Are you over 18?`
        END;

# ------------------------------------------------------------------------------------------
# Now checking the changes
SELECT *
FROM customer_sweepstakes;
