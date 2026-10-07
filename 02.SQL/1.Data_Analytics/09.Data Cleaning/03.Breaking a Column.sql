# BREAKING A COLUMN INTO A MULTIPLE COLUMNS
# =========================================

SELECT address 
FROM customer_sweepstakes;

# ------------------------------------------------------------------------------------
# 1.1. Split first the Street from 'address'
SELECT address, SUBSTRING_INDEX(address, ',', 1) AS street
FROM customer_sweepstakes;
# ------------------------------------------------------------------------------------
# 1.2. Split the City and State from 'address'
SELECT address, 
    SUBSTRING_INDEX(address, ',', 1) AS street,
    SUBSTRING_INDEX(SUBSTRING_INDEX(address, ',', -2), ',',1) AS city,
    SUBSTRING_INDEX(address, ',', -1) AS state
FROM customer_sweepstakes;

# ------------------------------------------------------------------------------------
# 1.3. Create the EMPTY columns 'street', 'city' and 'state' on the main table
ALTER TABLE customer_sweepstakes
ADD COLUMN street VARCHAR(50) AFTER address,
ADD COLUMN city VARCHAR(50) AFTER street,
ADD COLUMN state VARCHAR(50) AFTER city;

# ------------------------------------------------------------------------------------
# 1.4. Writing the data on the empty columns, just created
UPDATE customer_sweepstakes
SET street = SUBSTRING_INDEX(address, ',', 1);

UPDATE customer_sweepstakes
SET city = SUBSTRING_INDEX(SUBSTRING_INDEX(address, ',', -2), ',',1);

UPDATE customer_sweepstakes
SET state = SUBSTRING_INDEX(address, ',', -1);

# ------------------------------------------------------------------------------------
# 1.5. Making the 'state' column upper case
UPDATE customer_sweepstakes
SET state = UPPER(state);

# ------------------------------------------------------------------------------------
# 1.6 Eliminate the whitespaces from the column 'city' and 'state'
UPDATE customer_sweepstakes
SET city = TRIM(city);

UPDATE customer_sweepstakes
SET state = TRIM(state);

# ------------------------------------------------------------------------------------
# The final table is...
SELECT *
FROM customer_sweepstakes;
