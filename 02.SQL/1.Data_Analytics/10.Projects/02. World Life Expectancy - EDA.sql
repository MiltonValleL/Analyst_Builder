# WORLD LIFE EXPECTANCY - EXPLORATORY DATA ANALYSIS
# =================================================

# ------------------------------------------------------------------------------------------------------
# INSPECT THE MAIN TABLE DATA
# 1. Look how has chaged the Life Expectance from each country, within the las 15 years
SELECT Country, MIN(`Life expectancy`), MAX(`Life expectancy`),
    ROUND(MAX(`Life expectancy`) - MIN(`Life expectancy`), 1) AS life_increase
FROM world_life_expectancy
GROUP BY Country
ORDER BY life_increase DESC;
# ------------------------------------------------------------------------------------------------------


# ------------------------------------------------------------------------------------------------------
# 2. Take a look at the Global Life Expectancy in the last 15 years.
SELECT Year, ROUND(AVG(`Life expectancy`),2)
FROM world_life_expectancy
GROUP BY Year
ORDER BY Year;
# ------------------------------------------------------------------------------------------------------


# ------------------------------------------------------------------------------------------------------
# 3. Let's take a look if GDP has some influence on Life Expenctancy
SELECT Country, MIN(`Life expectancy`) AS min_LE, MAX(`Life expectancy`) AS max_LE,
        ROUND(AVG(`Life expectancy`),2) AS avg_LE,
        ROUND((MAX(`Life expectancy`)/ MIN(`Life expectancy`))*100,2) AS LE_grow_percent, 
        ROUND(AVG(GDP),2) AS avg_GDP,
        ROUND((MAX(GDP)/MIN(GDP)),2) AS GDP_grow_percent
FROM world_life_expectancy
GROUP BY Country
HAVING avg_LE > 0 AND avg_GDP > 0 
ORDER BY avg_GDP DESC;
# ------------------------------------------------------------------------------------------------------


# ------------------------------------------------------------------------------------------------------
# 4. Explore the Life Expectancy base on MEDIUM GDP, divided in 2 groups (Lower GDP and Higher GDP)
# Looking for the MEDIUM VALUE (Pre-calculation) -------------------------------
SELECT Row_ID, Country, GDP,
    ROW_NUMBER() OVER()
FROM world_life_expectancy
ORDER BY GDP ASC; # 	Row_ID=1785, Country=Myanmar, GDP=1172	Row_Number=1469

# Now let's see the obtained results -------------------------------------------
SELECT
    SUM(CASE WHEN GDP >= 1172 THEN 1 ELSE 0 END) AS High_GDP_Count,
    ROUND(AVG(CASE WHEN GDP >= 1172 THEN `Life expectancy` ELSE NULL END),2) AS High_GDP_Life_Expectancy,
    SUM(CASE WHEN GDP <= 1172 THEN 1 ELSE 0 END) AS Low_GDP_Count,
    ROUND(AVG(CASE WHEN GDP <= 1172 THEN `Life expectancy` ELSE NULL END),2) AS Low_GDP_Life_Expectancy
FROM world_life_expectancy;
# ------------------------------------------------------------------------------------------------------


# ------------------------------------------------------------------------------------------------------
# 5. Inspect the relationship between Life Expectancy and Status
SELECT Status, ROUND(AVG(`Life expectancy`), 1) AS avg_LE,
    COUNT(DISTINCT Country) AS Country_Count
FROM world_life_expectancy
GROUP BY Status;
# ------------------------------------------------------------------------------------------------------


# ------------------------------------------------------------------------------------------------------
# 6. Take a look at the average Life Expectancy and the BMI, and see if they are correlated
SELECT Country, ROUND(AVG(`Life expectancy`), 1) AS avg_LE,
    ROUND(AVG(BMI),1) AS avg_BMI
FROM world_life_expectancy
GROUP BY Country
HAVING avg_LE <> 0 AND avg_BMI <> 0
ORDER BY avg_BMI DESC;
# ------------------------------------------------------------------------------------------------------


# ------------------------------------------------------------------------------------------------------
# 7. Use a Rolling Total Method with 
SELECT Country,
    Year,
    `Life expectancy`,
    `Adult Mortality`,
    SUM(`Adult Mortality`) OVER(PARTITION BY Country ORDER BY Year) AS Rolling_Total
FROM world_life_expectancy
#WHERE Country LIKE '%United%'
;
# ------------------------------------------------------------------------------------------------------


# ------------------------------------------------------------------------------------------------------
SELECT *
FROM world_life_expectancy;
# ------------------------------------------------------------------------------------------------------
