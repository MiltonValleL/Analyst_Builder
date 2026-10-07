# DELETING COLUMNS
# ================

# -----------------------------------------------------------------------------
# 1. There is no need to maintain the 'address' and 'favorite_color' columns
ALTER TABLE customer_sweepstakes
DROP COLUMN address;

ALTER TABLE customer_sweepstakes
DROP COLUMN favorite_color;


# -----------------------------------------------------------------------------
SELECT *
FROM customer_sweepstakes;