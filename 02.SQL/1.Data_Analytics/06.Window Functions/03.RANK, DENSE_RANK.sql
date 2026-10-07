# RANK & DENSE_RANK FUNCTIONS
# ===========================
# -----------------------------------------------------------------------------------------------------------------------------------
# RANK() function assigns a unique rank to each distinct row within a partition but leaves gaps in the ranking for tied rows. 
# If two (or more) rows tie for a rank, each tied rows receives the same rank, and then the next rank in the sequence is skipped. 
# For example, if two rows tie for rank 1, RANK() gives both rows a rank of 1, but the next row receives a rank of 3.

# DENSE_RANK() function also assigns a unique rank to each distinct row within a partition, but unlike RANK(), it does not skip 
# any ranks. If two (or more) rows tie for a rank, each tied rows receives the same rank, and the next row receives the next rank 
# in the sequence. For example, if two rows tie for rank 1, DENSE_RANK() gives both rows a rank of 1, and the next row receives 
# a rank of 2.
# -----------------------------------------------------------------------------------------------------------------------------------
# Base code
SELECT *
FROM employees;
# 
# -----------------------------------------------------------------------------------------------------------------------------------
# Example No. 1 - Simple RANK
SELECT *,
    RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS rank_column
FROM employees;

# -----------------------------------------------------------------------------------------------------------------------------------
# Example No. 2 - Rank Filter with only the best 2 amount salaries per department
SELECT *
FROM 
    (SELECT *,
    RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS rank_row
    FROM employees) AS ranked
WHERE rank_row < 3;


# -----------------------------------------------------------------------------------------------------------------------------------
# Example No. 3 - Simple example of - DENSE_RANK (No Skipping rows)
SELECT *,
    RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS my_rank,
    DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS my_dense_rank
FROM employees;