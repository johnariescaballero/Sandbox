-- 1. Import CSV then cancel to get the columns then import the rest of the data
USE bpo_reporting;

RENAME TABLE final_contacts TO contacts;

RENAME TABLE final_productivity TO productivity;

RENAME TABLE final_roster TO roster;

CREATE TABLE dim_date (
    date_key DATE PRIMARY KEY,
    day_num INT,
    day_name VARCHAR(10),
    week_num INT,
    month_num INT,
    month_name VARCHAR(15),
    quarter INT,
    year_num INT,
    is_weekend BOOLEAN
);

SELECT *
FROM contacts;

SELECT *
FROM productivity;

SELECT *
FROM roster;

# Delete data to ensure inserting a complete copy of data.
DELETE
FROM productivity;