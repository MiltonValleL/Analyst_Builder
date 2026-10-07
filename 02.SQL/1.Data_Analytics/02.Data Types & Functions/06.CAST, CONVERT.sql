# CAST AND CONVERT FUNCTIONS
# ==========================

SELECT CAST('2022-01-01' AS DATETIME);

SELECT birth_date,
    CAST(birth_date AS DATETIME) AS cast_datetime,
    CONVERT(birth_date, DATETIME) AS convert_datetime,
    CONVERT(birth_date, DATE) AS just_date,
    CONVERT(birth_date, YEAR) AS just_year,
    CONVERT(2023, YEAR) - CONVERT(birth_date, YEAR) AS diff_year
FROM customers;
