
-- Sailors who reserved boat 101
SELECT sailor.salName, reserves.boatID FROM sailor
JOIN reserves ON sailor.salID = reserves.salID
WHERE reserves.boatID = 101;

-- Sailors who reserved RED boat
SELECT sailor.salName FROM sailor
JOIN reserves ON sailor.salID = reserves.salID
JOIN boats ON boats.boatID = reserves.boatID
WHERE boats.color = 'RED';

-- List of unique colors
SELECT DISTINCT boats.color FROM sailor
JOIN reserves ON sailor.salID = reserves.salID
join boats ON reserves.boatID = boats.boatID;

-- 2d (wrong question)
SELECT rating, AVG(age) AS AvgAge FROM sailor
GROUP BY rating
HAVING COUNT(*) > 2; -- empty set

-- 2e
SELECT rating, MIN(age) AS YoungestAge FROM sailor
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;





-- WORLD
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







-- using left join, on what is the capital of spain

-- using left join, on list all the langs spoken in the southeast asia region


-- AGGREGATE FUNCTIONS
-- Using COUNT get no of cities from usa
SELECT COUNT(*) FROM city, country
WHERE country.code = city.CountryCode
AND country.Name = 'United States';

-- Get country-code where countrys > 100
SELECT COUNT(CountryCode), CountryCode FROM city
GROUP BY CountryCode
HAVING COUNT(CountryCode) > 100;

-- Find total districts in each country
SELECT CountryCode, COUNT(*) AS District FROM city
GROUP BY CountryCode;



-- 
--sakila
-- Find actors with most films from the sakila database
SELECT first_name, last_name, COUNT(*) films FROM actor
JOIN film_actor USING (actor_id)
GROUP BY actor_id, first_name, last_name
ORDER BY films DESC
LIMIT 1;

-- Cumulative revenue of all stores
SELECT payment_date, amount, SUM(amount) OVER (ORDER BY payment_date)
FROM (SELECT CAST(payment_date AS DATE) AS payment_date, SUM(amount)
AS amount FROM payment
GROUP BY CAST(payment_date AS DATE)) p
ORDER BY payment_date;



-- alter with most films ignoring ties) from database

-- cumulative revenue of all stores

