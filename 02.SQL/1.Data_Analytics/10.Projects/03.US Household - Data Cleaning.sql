# US HOUSEHOLD INCOME DATA CLEANING
# =================================
# -------------------------------------------------------------------------------------------
# 1. Change the Wrong Column Names on the Statistics table
ALTER TABLE us_household_income_statistics RENAME COLUMN `ï»¿id` TO `id`;
# -------------------------------------------------------------------------------------------


# -------------------------------------------------------------------------------------------
# 2. Checking for Duplicates
# First filtering the data on INCOME
SELECT *
FROM (
SELECT row_id, id, 
    ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) AS row_num
FROM us_household_income) AS income_duplicate
WHERE row_num > 1;
# There are 6 duplicate rows --------------------------------------------------
# Now it's time to delete duplicates on INCOME --------------------------------
DELETE FROM us_household_income
WHERE row_id IN ( 
            SELECT row_id
            FROM (
                SELECT row_id, id, 
                    ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) AS row_num
                FROM us_household_income) AS income_duplicate
            WHERE row_num > 1);
# -------------------------------------------------------------------------------------------
# Now let's see if there are duplicates on STATISTICS
SELECT *
FROM (
SELECT id, 
    ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) AS row_num
FROM us_household_income_statistics) AS stats_duplicate
WHERE row_num > 1;
# There are no duplicates on STATISTICS, so we can go on ------------------------------------
# -------------------------------------------------------------------------------------------


# -------------------------------------------------------------------------------------------
# 3. Let's see if everything is OK on the 'State_Name' column
SELECT DISTINCT State_Name
FROM us_household_income
ORDER BY State_Name; # There is a row with the name 'georia' and 'alabama', so let's correct it
#
UPDATE us_household_income
SET State_Name = 'Alabama'
WHERE State_Name = 'alabama';
# 
UPDATE us_household_income
SET State_Name = 'Georgia'
WHERE State_Name = 'geogia';
# -------------------------------------------------------------------------------------------


# -------------------------------------------------------------------------------------------
# 4. Let's see if there are missing values on each column of the main table
SELECT *
FROM us_household_income
WHERE '' IN (row_id, id, State_Code, State_Name, State_ab, County, City, Place, 
            `Type`, `Primary`, Zip_Code, Area_Code, Lat, Lon); 
# 'ALand' and 'AWater' has cells with ZEROS which can't be filtered with blank spaces
# -------------------------------------------------------------------------------------------
# Looking on the table I found that IF City=Vinemont, then Place=Autaugaville
UPDATE us_household_income
SET Place = 'Autaugaville'
WHERE City = 'Vinemont' AND County = 'Autauga County';
# -------------------------------------------------------------------------------------------


# -------------------------------------------------------------------------------------------
# 5. Let's inspect the column 'Type
SELECT Type, COUNT(Type)
FROM us_household_income
GROUP BY Type
ORDER BY Type ASC;
# 'CPD' is wrong, 'CDP' is correct. 'Boroughs' is wrong 'Borough' is Correct
# Let's correct the 'CPD' wrong data with 'CDP' ---------------------------------------------
UPDATE us_household_income
SET Type = 'CDP'
WHERE Type = 'CPD';
# Let's correct the 'Boroughs' wrong data with 'Borough' ---------------------------------------------
UPDATE us_household_income
SET Type = 'Borough'
WHERE Type = 'Boroughs';
# -------------------------------------------------------------------------------------------


# -------------------------------------------------------------------------------------------
# 6. Finally let's inspect the columns 'ALand' and 'AWater'
SELECT ALand, AWater
FROM us_household_income
WHERE AWater = 0 OR AWater = '' OR AWater IS NULL;

SELECT ALand, AWater
FROM us_household_income
WHERE ALand = 0 OR ALand = '' OR ALand IS NULL;
# There are no ZEROS on 'ALand' and 'AWater' Simultaneously. So there is no need fot updates
# -------------------------------------------------------------------------------------------


# -------------------------------------------------------------------------------------------
SELECT *
FROM us_household_income;
#
SELECT *
FROM us_household_income_statistics;
# ------------------------------------------------------------------------------------------- 