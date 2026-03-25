-- 1. Import CSV then cancel to get the columns then import the rest of the data
SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE '../Data/Clean Data/final_productivity.csv'
INTO TABLE final_productivity
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '../Data/Clean Data/final_contacts.csv'
INTO TABLE final_contacts
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '../Data/Clean Data/final_roster.csv'
INTO TABLE final_roster
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;



