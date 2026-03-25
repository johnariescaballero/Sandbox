-- 1. Import CSV then cancel to get the columns then create the table to use for mysql scripts
-- 2. Don't forget to change INFILE path to your local drive
USE bpo_reporting;

SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE "C:/Users/jarie/OneDrive/Documents/Data Analyst/Projects/Project 1/Data/Clean Data/final_productivity.csv"
INTO TABLE productivity
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE "C:/Users/jarie/OneDrive/Documents/Data Analyst/Projects/Project 1/Data/Clean Data/final_contacts.csv"
INTO TABLE contacts
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE "C:/Users/jarie/OneDrive/Documents/Data Analyst/Projects/Project 1/Data/Clean Data/final_roster.csv"
INTO TABLE roster
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;



