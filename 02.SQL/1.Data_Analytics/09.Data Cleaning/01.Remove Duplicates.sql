# REMOVING DUPLICATES
# ===================
# ALTER TABLE customer_sweepstakes RENAME COLUMN `ï»¿sweepstake_id` TO `sweepstake_id`;

SELECT *
FROM customer_sweepstakes;

# Evaluating the duplicates - OPTION 1
SELECT customer_id, COUNT(customer_id)
FROM customer_sweepstakes
GROUP BY customer_id
HAVING COUNT(customer_id) > 1;

# Evaluating the duplicates - OPTION 2
SELECT *
FROM (
    SELECT sweepstake_id,
        ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY customer_id) AS row_duplicates
    FROM customer_sweepstakes) AS table_duplicate
WHERE row_duplicates > 1;

# Deleting the duplicates
DELETE FROM customer_sweepstakes
WHERE sweepstake_id IN(
        SELECT sweepstake_id
        FROM (
            SELECT sweepstake_id,
                ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY customer_id) AS row_duplicate
            FROM customer_sweepstakes) AS table_duplicate
        WHERE row_duplicate > 1
        );