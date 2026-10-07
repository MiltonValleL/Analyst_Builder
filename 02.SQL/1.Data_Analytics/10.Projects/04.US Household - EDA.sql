# US HOUSEHOLD INCOME - EXPLORATORY DATA ANALYSIS (EDA)
# =====================================================
# -------------------------------------------------------------------------------------------
# 1. LET'S SEE THE TOP 10 AREAS OF WATER AND LAND AS WELL AS PERCENTAGES
# -------------------------------------------------------------------------------------------
# Top 10 States with the greatest area of land
SELECT *, ROUND((total_land/(total_land + total_water)* 100),2) AS Land_Percent,
        ROUND((total_water/(total_land + total_water)* 100),2) AS Water_Percent
FROM (
        SELECT State_Name, 
            SUM(AWater) AS Total_Water, 
            SUM(ALand) AS Total_Land
        FROM us_household_income
        GROUP BY State_Name
        ORDER BY total_land DESC
        ) AS area_table
ORDER BY total_land DESC
LIMIT 10;
# -------------------------------------------------------------------------------------------
# Top 10 States with the greatest area of water
SELECT *, ROUND((total_land/(total_land + total_water)* 100),2) AS Land_Percent,
        ROUND((total_water/(total_land + total_water)* 100),2) AS Water_Percent
FROM (
        SELECT State_Name, 
            SUM(AWater) AS Total_Water, 
            SUM(ALand) AS Total_Land
        FROM us_household_income
        GROUP BY State_Name
        ORDER BY total_land DESC
        ) AS area_table
ORDER BY total_water DESC
LIMIT 10;
# -------------------------------------------------------------------------------------------
# Top 10 States with the greatest percent of water
SELECT *, ROUND((total_land/(total_land + total_water)* 100),2) AS Land_Percent,
        ROUND((total_water/(total_land + total_water)* 100),2) AS Water_Percent
FROM (
        SELECT State_Name, 
            SUM(AWater) AS Total_Water, 
            SUM(ALand) AS Total_Land
        FROM us_household_income
        GROUP BY State_Name
        ORDER BY total_land DESC
        ) AS area_table
ORDER BY Water_Percent DESC
LIMIT 10;
# -------------------------------------------------------------------------------------------
# Top 10 States with the greatest percent of land
SELECT *, ROUND((total_land/(total_land + total_water)* 100),2) AS Land_Percent,
        ROUND((total_water/(total_land + total_water)* 100),2) AS Water_Percent
FROM (
        SELECT State_Name, 
            SUM(AWater) AS Total_Water, 
            SUM(ALand) AS Total_Land
        FROM us_household_income
        GROUP BY State_Name
        ORDER BY total_land DESC
        ) AS area_table
ORDER BY Land_Percent DESC
LIMIT 10;
# -------------------------------------------------------------------------------------------
# 2. LET'S TIE BOTH DATA TABLES
# Let's filter on the RIGHT
SELECT COUNT(uss.id)
FROM us_household_income usi
    RIGHT JOIN us_household_income_statistics uss
    ON usi.id = uss.id
WHERE usi.id IS NULL; # There are 240 LEFT missing values on the JOINED table

# Let's filter on the LEFT
SELECT COUNT(uss.id)
FROM us_household_income usi
    LEFT JOIN us_household_income_statistics uss
    ON usi.id = uss.id
WHERE uss.id IS NULL; # There are NO RIGHT MISSING VALUES!!
# **********************************************************************************
# Let's ERASE the RIGHT missing values on the 'us_household_income_statistics' table
# **********************************************************************************
DELETE FROM us_household_income_statistics
WHERE id IN(
            SELECT *
            FROM (
                    SELECT uss.id
                    FROM us_household_income usi
                        RIGHT JOIN us_household_income_statistics uss
                        ON usi.id = uss.id
                    WHERE usi.id IS NULL) AS table_join);
# -------------------------------------------------------------------------------------------
# 3. LET'S EXPLORE THE JOINED TABLE 
# First I will explore with data of 'State_Name', 'Mean', and 'Median'-----------------------
SELECT usi.State_Name, 
    ROUND(AVG(uss.Mean),2) AS mean_avg, 
    ROUND(AVG(uss.Median),2) AS median_avg, 
    ROUND(AVG(uss.Stdev),2) AS stdev_avg
FROM us_household_income usi
    INNER JOIN us_household_income_statistics uss
    ON usi.id = uss.id
WHERE Mean <> 0
GROUP BY usi.State_Name
ORDER BY mean_avg DESC;

# Now I will explore with 'Primary', 'Type', 'Mean', 'Median'
SELECT Type, COUNT(Type) AS Total_Count,
    ROUND(AVG(uss.Mean),2) AS mean_avg, 
    ROUND(AVG(uss.Median),2) AS median_avg, 
    ROUND(AVG(uss.Stdev),2) AS stdev_avg
FROM us_household_income usi
    INNER JOIN us_household_income_statistics uss
    ON usi.id = uss.id
WHERE Mean <> 0
GROUP BY Type
ORDER BY mean_avg DESC;
# I could see that the richest Type communities are 'Municipality', 'Borough', 'Track' and 'CDP'
# On the other hand the poorest Type Communities are 'Community', 'Urban' and 'County' 

# -------------------------------------------------------------------------------------------
# Let's take a look at the POOREST COMMUNITIES
SELECT usi.State_Name, County, City, Type, uss.Mean, uss.Median
FROM us_household_income usi
    INNER JOIN us_household_income_statistics uss
    ON usi.id = uss.id
WHERE Mean <> 0 AND Type IN ('Community', 'Urban', 'County')
ORDER BY Mean;
# -------------------------------------------------------------------------------------------
# Now let's take a look at the richest Cities
SELECT usi.State_Name, usi.County, usi.City, Type, 
    ROUND(AVG(Mean), 2) AS avg_mean,
    ROUND(AVG(Median), 2) AS avg_median
FROM us_household_income usi
    INNER JOIN us_household_income_statistics uss
    ON usi.id = uss.id
GROUP BY usi.State_Name, usi.County, usi.City, Type
ORDER BY avg_mean DESC;
# -------------------------------------------------------------------------------------------


# -------------------------------------------------------------------------------------------
SELECT *
FROM us_household_income;
SELECT *
FROM us_household_income_statistics;
# -------------------------------------------------------------------------------------------