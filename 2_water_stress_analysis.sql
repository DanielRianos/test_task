-- Table 1: historical_gdp

-- Step 1: Data inspection:

-- A. Make sure that the data uploaded correctly: 

SELECT *
FROM historical_gdp
ORDER BY random()
limit 5;

-- B. Extract country country code  ('code' column) from country_code table:

SELECT *
FROM country_code
LIMIT 5;

-- Rank the column length (descending) to identify the proper length of the 'code' column

SELECT country, code, LENGTH(code) as code_lengh,
ROW_NUMBER() 
OVER (ORDER BY LENGTH(code) DESC) AS rank
FROM country_code;

-- Create temporaty table: 

-- Apprach 1:

CREATE TEMPORARY TABLE temp_historical_gdp AS
SELECT * FROM historical_gdp;

ALTER TABLE temp_historical_gdp
ADD COLUMN code VARCHAR(3);

UPDATE temp_historical_gdp
SET code = country_code.code
FROM country_code 
WHERE temp_historical_gdp.country = country_code.country;

SELECT *
FROM temp_historical_gdp;

-- INNER JOIN APPROACH: 

--Approach 2:

CREATE TEMPORARY TABLE new_temp_historical_gdp AS
SELECT historical_gdp.*, country_code.code
FROM historical_gdp
INNER JOIN country_code 
USING(country);

SELECT *
FROM new_temp_historical_gdp;

-- Double check if there are Null or duplicates values in the column 'code' 

SELECT DISTINCT(code) as no_code_entities
FROM temp_historical_gdp
WHERE code IS NULL;

SELECT code, COUNT(*) AS duplicate_count
FROM temp_historical_gdp
GROUP BY code
HAVING COUNT(*) > 1;

-- Table for visualization: 
-- Rearrange columns from temp_historical_gdp table

CREATE TABLE historical_gdp_viz AS
SELECT country, code, 
       "2000","2001","2002","2003","2004","2005","2006","2007","2008","2009",
	   "2010","2011","2012","2013","2014","2015","2016","2017","2018","2019",
	   "2020","2021"
FROM temp_historical_gdp;

SELECT *
FROM historical_gdp_viz;

-- Set primary keys

ALTER TABLE temp_historical_gdp
ADD PRIMARY KEY (code);

ALTER TABLE historical_gdp_viz
ADD PRIMARY KEY (code);


-- Table 2: historical_gdp_per_capita

-- Step 1: Data inspection:

-- A. Make sure that the data uploaded correctly: 

SELECT *
FROM historical_gdp_per_capita
ORDER BY random()
limit 5;

-- B. Extract country country code ('code' column) from country_code table:

SELECT *
FROM country_code
LIMIT 5;

-- Create temporaty table: 

CREATE TEMPORARY TABLE temp_historical_gdp_per_capita AS
SELECT * FROM historical_gdp_per_capita;

-- Add the 'code' column to later assign it as the Primary Key

ALTER TABLE temp_historical_gdp_per_capita
ADD COLUMN code VARCHAR(3);

UPDATE temp_historical_gdp_per_capita
SET code = country_code.code
FROM country_code 
WHERE temp_historical_gdp_per_capita.country = country_code.country;

SELECT *
FROM temp_historical_gdp_per_capita;

-- Double check if there are Null or duplicates values in the column 'code' 

SELECT DISTINCT(code) as no_code_entities
FROM temp_historical_gdp_per_capita
WHERE code IS NULL;

SELECT code, COUNT(*) AS duplicate_count
FROM temp_historical_gdp_per_capita
GROUP BY code
HAVING COUNT(*) > 1;

-- Table for visualization: 
-- Rearrange columns from temp_historical_gdp_per_capita table

CREATE TABLE historical_gdp_per_capita_viz AS
SELECT country, code, 
       "2000","2001","2002","2003","2004","2005","2006","2007","2008","2009",
	   "2010","2011","2012","2013","2014","2015","2016","2017","2018","2019",
	   "2020","2021"
FROM temp_historical_gdp_per_capita;

SELECT *
FROM historical_gdp_per_capita_viz;

-- Set primary keys

ALTER TABLE temp_historical_gdp_per_capita
ADD PRIMARY KEY (code);

ALTER TABLE historical_gdp_per_capita_viz
ADD PRIMARY KEY (code);

-- Table 3: world_population

-- Step 1: Data inspection:

-- A. Make sure that the data uploaded correctly: 

SELECT *
FROM world_population
ORDER BY random()
limit 5;

-- B. Extract country country code ('code' column) from country_code table:

SELECT *
FROM country_code
LIMIT 5;

-- Create temporaty table: 

CREATE TEMPORARY TABLE temp_world_population AS
SELECT * FROM world_population;

-- Add the 'code' column to later assign it as the Primary Key

ALTER TABLE temp_world_population
ADD COLUMN code VARCHAR(3);

UPDATE temp_world_population
SET code = country_code.code
FROM country_code 
WHERE temp_world_population.country = country_code.country;

SELECT *
FROM temp_world_population;

-- Double check if there are Null or duplicates values in the column 'code' 

SELECT DISTINCT(code) as no_code_entities
FROM temp_world_population
WHERE code IS NULL;

SELECT code, COUNT(*) AS duplicate_count
FROM temp_world_population
GROUP BY code
HAVING COUNT(*) > 1;

-- Table for visualization: 
-- Rearrange columns from temp_world_population table

CREATE TABLE world_population_viz AS
SELECT country, code, 
       "2000","2001","2002","2003","2004","2005","2006","2007","2008","2009",
	   "2010","2011","2012","2013","2014","2015","2016","2017","2018","2019",
	   "2020","2021"
FROM temp_world_population;

SELECT *
FROM world_population_viz;

-- Set primary keys

ALTER TABLE temp_world_population
ADD PRIMARY KEY (code);

ALTER TABLE world_population_viz
ADD PRIMARY KEY (code);

-- Table 4: water_stress

-- Step 1: Data inspection:

-- A. Make sure that the data uploaded correctly: 

SELECT *
FROM water_stress
ORDER BY random()
limit 5;

-- Create temporaty table: 

CREATE TEMPORARY TABLE temp_water_stress AS
SELECT * FROM water_stress;

-- Add the 'code' column to later assign it as the Primary Key

-- B. Extract country country code ('code' column) from country_code table:

SELECT *
FROM country_code
LIMIT 5;

ALTER TABLE temp_water_stress
ADD COLUMN code VARCHAR(3);

UPDATE temp_water_stress
SET code = country_code.code
FROM country_code 
WHERE temp_water_stress.country = country_code.country;

SELECT *
FROM temp_water_stress;

-- Double check if there are Null or duplicates values in the column 'code' 

SELECT DISTINCT(code) as no_code_entities
FROM temp_water_stress
WHERE code IS NULL;

SELECT code, COUNT(*) AS duplicate_count
FROM temp_water_stress
GROUP BY code
HAVING COUNT(*) > 1;

-- Table for visualization: 
-- Rearrange columns from temp_water_stress table

CREATE TABLE water_stress_viz AS
SELECT country, code, 
       "2000","2001","2002","2003","2004","2005","2006","2007","2008","2009",
	   "2010","2011","2012","2013","2014","2015","2016","2017","2018","2019",
	   "2020"
FROM temp_water_stress;

SELECT *
FROM water_stress_viz;

-- Set primary keys

ALTER TABLE temp_water_stress
ADD PRIMARY KEY (code);

ALTER TABLE water_stress_viz
ADD PRIMARY KEY (code);

-- Table 5: water_domestic

-- Step 1: Data inspection:

-- A. Make sure that the data uploaded correctly: 

SELECT *
FROM water_domestic
ORDER BY random()
limit 5;

-- B. Extract country country code ('code' column) from country_code table:

SELECT *
FROM country_code
LIMIT 5;

-- Create temporaty table: 

CREATE TEMPORARY TABLE temp_water_domestic AS
SELECT * FROM water_domestic;

-- Add the 'code' column to later assign it as the Primary Key

-- B. Extract country country code ('code' column) from country_code table:

ALTER TABLE temp_water_domestic
ADD COLUMN code VARCHAR(3);

UPDATE temp_water_domestic
SET code = country_code.code
FROM country_code 
WHERE temp_water_domestic.country = country_code.country;

SELECT *
FROM temp_water_domestic;

-- Double check if there are Null or duplicates values in the column 'code' 

SELECT DISTINCT(code) as no_code_entities
FROM temp_water_domestic
WHERE code IS NULL;

SELECT code, COUNT(*) AS duplicate_count
FROM temp_water_domestic
GROUP BY code
HAVING COUNT(*) > 1;

-- Table for visualization: 
-- Rearrange columns from temp_water_domestic table

CREATE TABLE water_domestic_viz AS
SELECT country, code, 
       "2000","2001","2002","2003","2004","2005","2006","2007","2008","2009",
	   "2010","2011","2012","2013","2014","2015","2016","2017","2018","2019",
	   "2020"
FROM temp_water_domestic;

SELECT *
FROM water_domestic_viz;

-- Set primary keys

ALTER TABLE temp_water_domestic
ADD PRIMARY KEY (code);

ALTER TABLE water_domestic_viz
ADD PRIMARY KEY (code);

-- Table 6: water_industry

-- Step 1: Data inspection:

-- A. Make sure that the data uploaded correctly: 

SELECT *
FROM water_industry
ORDER BY random()
limit 5;

-- B. Extract country country code ('code' column) from country_code table:

SELECT *
FROM country_code
LIMIT 5;

-- Create temporaty table: 

CREATE TEMPORARY TABLE temp_water_industry AS
SELECT * FROM water_industry;

-- Add the 'code' column to later assign it as the Primary Key

-- B. Extract country country code ('code' column) from country_code table:

ALTER TABLE temp_water_industry
ADD COLUMN code VARCHAR(3);

UPDATE temp_water_industry
SET code = country_code.code
FROM country_code 
WHERE temp_water_industry.country = country_code.country;

SELECT *
FROM temp_water_industry;

-- Double check if there are Null or duplicates values in the column 'code' 

SELECT DISTINCT(code) as no_code_entities
FROM temp_water_industry
WHERE code IS NULL;

SELECT code, COUNT(*) AS duplicate_count
FROM temp_water_industry
GROUP BY code
HAVING COUNT(*) > 1;

-- Table for visualization: 
-- Rearrange columns from temp_water_industry table

CREATE TABLE water_industry_viz AS
SELECT country, code, 
       "2000","2001","2002","2003","2004","2005","2006","2007","2008","2009",
	   "2010","2011","2012","2013","2014","2015","2016","2017","2018","2019",
	   "2020"
FROM temp_water_industry;

SELECT *
FROM water_industry_viz;

-- Set primary keys

ALTER TABLE temp_water_industry
ADD PRIMARY KEY (code);

ALTER TABLE water_industry_viz
ADD PRIMARY KEY (code);
