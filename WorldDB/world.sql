USE world;

-- Display id, name, population from city table with limit 10
SELECT ID, name, population FROM city
LIMIT 10;

-- Show id, name, population from city & limit req to first 31 - 40 rows only
SELECT ID, name, population FROM city
LIMIT 30, 10;

-- Find cities whose population is more than 2M
SELECT name, population FROM city
WHERE population > 2000000;

-- List districts with population above average of all districts
SELECT District, population FROM city
WHERE population > (SELECT AVG(population) FROM city);

-- What is the country code for Kabul
SELECT name, CountryCode FROM city
WHERE name = 'Kabul';

-- What is the pop & avg life expectancy of people in argentina
SELECT Name, population, LifeExpectancy from country
WHERE Name = 'Argentina';