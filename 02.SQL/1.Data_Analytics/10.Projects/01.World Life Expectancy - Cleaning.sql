# World Life Expectancy Project (Data Cleaning)
# =============================================

# ---------------------------------------------------------------------------------------------------------------
# 1. DELETING DUPLICATES
# 1.1. Identifying Duplicates
SELECT Country, Year, CONCAT(Country, Year), COUNT(CONCAT(Country, Year)) AS check_duplis
FROM world_life_expectancy
GROUP BY Country, Year, CONCAT(Country, Year)
HAVING COUNT(CONCAT(Country, Year)) > 1; # There is no way to introduce the "Row_ID". PROBLEM


# 1.2. Second alternative filter duplicates and include 'Row_ID'
SELECT Row_ID
FROM (
    SELECT Row_ID, 
        CONCAT(Country, Year),
        ROW_NUMBER() OVER(PARTITION BY CONCAT(Country, Year) ORDER BY CONCAT(Country, Year)) AS row_num
    FROM world_life_expectancy) AS table_row
WHERE row_num > 1;


# 1.3. Now it's time to delete the duplicates
DELETE FROM world_life_expectancy
WHERE Row_ID IN (SELECT Row_ID
                FROM (
                    SELECT Row_ID, 
                        CONCAT(Country, Year),
                        ROW_NUMBER() OVER(PARTITION BY CONCAT(Country, Year) ORDER BY CONCAT(Country, Year)) AS row_num
                    FROM world_life_expectancy) AS table_row
                WHERE row_num > 1); # WELL DONE BOY!!!
                
                
# ---------------------------------------------------------------------------------------------------------------
# 2. NAN VALUES IN 'STATUS' COLUMN
# 2.1. How many different values has the 'Status' column
SELECT DISTINCT(Status)
FROM world_life_expectancy; 
# There are only 2, 'Developing' and 'Developed' status besides blank cells.


# 2.2. Identifying the total amount of NAN values and their respective Countries
SELECT DISTINCT Country
FROM world_life_expectancy
WHERE Status = '';
# There are 8 Null Values on 'Status


# 2.3. Checking the Status values on those 8 Countries
SELECT *
FROM world_life_expectancy
WHERE Country IN (
                    SELECT Country
                    FROM world_life_expectancy
                    WHERE Status = '');

# 2.4. Filling NAN Values
UPDATE world_life_expectancy
SET Status = 'Developing'
WHERE Country IN ('Afghanistan', 'Albania', 'Georgia', 'Vanuatu', 'Zambia');

UPDATE world_life_expectancy
SET Status = 'Developed'
WHERE Country IN ('United States of America');


# ---------------------------------------------------------------------------------------------------------------
# 3. NAN VALUES IN 'Life expectancy' COLUMN
# 3.1. Verifying how many NAN values this column has
SELECT *
FROM world_life_expectancy
WHERE `Life expectancy` = '';
# 'Afghanistan' and 'Albania' each have one NAN value 


# 3.2. Checking the 'Life expectancy' values on those two countries
SELECT Country, Year, `Life expectancy`, Row_ID
FROM world_life_expectancy
WHERE Country in ('Afghanistan', 'Albania');
# The NAN values are in 'Row_ID' 5 and 21


# 3.3. Filtering Data for each country
SELECT ROUND(AVG(`Life expectancy`), 1)
FROM world_life_expectancy
WHERE Row_ID IN (4, 6); # This is for Afghanistan

SELECT ROUND(AVG(`Life expectancy`), 1)
FROM world_life_expectancy
WHERE Row_ID IN (20, 22); # This is for Albania

# 3.4. Filling the NAN Values on the main table
UPDATE world_life_expectancy
SET `Life expectancy` = 59.2
WHERE Country = 'Afghanistan' AND `Life expectancy` = '';

UPDATE world_life_expectancy
SET `Life expectancy` = 76.6
WHERE Country = 'Albania' AND `Life expectancy` = '';
# ----------------------------------------------------------------------------------
# Alternative Code (Alex Solution) -------------------------------------------------
SELECT t1.Country, t1.Year, t1.`Life expectancy`,
        t2.Country, t2.Year, t2.`Life expectancy`,
        t3.Country, t3.Year, t3.`Life expectancy`,
        ROUND((t2.`Life expectancy` + t3.`Life expectancy`)/2, 1)
FROM world_life_expectancy t1
    INNER JOIN world_life_expectancy t2
        ON t1.Country = t2.Country
        AND t1.Year = t2.Year - 1
    INNER JOIN world_life_expectancy t3
        ON t1.Country = t3.Country
        AND t1.Year = t3.Year + 1
WHERE t1.`Life expectancy` = '';
# ----------------------------------------------------------------------------------
# Alternative UPDATE Code (Alex Solution) ------------------------------------------
# ----------------------------------------------------------------------------------
UPDATE world_life_expectancy t1
       INNER JOIN world_life_expectancy t2
           ON t1.Country = t2.Country
           AND t1.Year = t2.Year - 1
       INNER JOIN world_life_expectancy t3
           ON t1.Country = t3.Country
           AND t1.Year = t3.Year + 1
SET t1.`Life expectancy` = ROUND((t2.`Life expectancy` + t3.`Life expectancy`)/2, 1)
WHERE t1.`Life expectancy` = '';
# END OF THE ALTERNATIVE SOLUTION (Alex Solution) ----------------------------------
# ----------------------------------------------------------------------------------


# ---------------------------------------------------------------------------------------------------------------
SELECT *
FROM world_life_expectancy; # Take a final look at the refined table!!!
# ---------------------------------------------------------------------------------------------------------------

