
-- Sailors who reserved boat 101
CREATE TABLE sailor(
    salID INT PRIMARY KEY,
    salName VARCHAR(20),
    rating INT,
    age INT
);

CREATE TABLE reserves(
    salID INT,
    boatID INT,
    rDate DATE,
    FOREIGN KEY(salID) REFERENCES sailor(salID) ON DELETE SET NULL
    -- boatID is a foreign key now
);

CREATE TABLE boats(
    boatID INT PRIMARY KEY,
    boatName VARCHAR(20),
    color VARCHAR(10)
);

ALTER TABLE reserves
ADD FOREIGN KEY(boatID) REFERENCES boats(boatID) ON DELETE SET NULL;

-- Inserting values
INSERT INTO sailor VALUES(1, 'John', 5, 25);
INSERT INTO sailor VALUES(2, 'Rahul', 4, 19);
INSERT INTO sailor VALUES(3, 'Anita', 5, 30);
INSERT INTO sailor VALUES(4, 'Priya', 3, 17);
INSERT INTO sailor VALUES(5, 'Arjun', 4, 22);
INSERT INTO sailor VALUES(6, 'Neha', 3, 21);


INSERT INTO boats VALUES(101, 'Sea Queen', 'RED');
INSERT INTO boats VALUES(102, 'Q Costus', 'BLUE');
INSERT INTO boats VALUES(103, 'Wave Ricles', 'RED';
INSERT INTO boats VALUES(104, 'River King', 'GREEN');


INSERT INTO reserves VALUES(1, 101, '2026-02-01');
INSERT INTO reserves VALUES(2, 102, '2026-02-01');
INSERT INTO reserves VALUES(3, 103, '2026-02-01');
INSERT INTO reserves VALUES(4, 104, '2026-02-01');
INSERT INTO reserves VALUES(5, 103, '2026-02-01');
INSERT INTO reserves VALUES(6, 104, '2026-02-01');



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



-- ORDER BY and LIKE functions
--Select 25 cities that start with letter 'f'
SELECT name FROM city
WHERE name LIKE 'F%' ORDER BY name ASC LIMIT 25;

-- Show conuntries that have a name united in them
SELECT name FROM country
WHERE name LIKE '%United%';

-- Select countries that have population more than 3 times that of their neighbors
SELECT name, continent FROM country x
WHERE population > ALL(SELECT population*3 FROM country y
WHERE y.continent = x.continent
AND y.name != x.name);


-- Give name& surface area from country where area is b/w 2000000 and 25000000
SELECT name, SurfaceArea FROM country
WHERE SurfaceArea BETWEEN 200000 AND 250000;


-- Show name but substitute Australasia for Oceania for countries beginning with N
SELECT name, CASE WHEN continent = 'Oceania'
THEN 'Australasia' ELSE continent END
FROM country
WHERE name LIKE 'N%';


-- Find largest country in each continent. show continent name and area
SELECT continent, name, SurfaceArea FROM country x
WHERE SurfaceArea >= ALL (SELECT SurfaceArea FROM country y
WHERE y.continent = x.continent
AND SurfaceArea > 0);

-- List each continent and name of country that comes first alphabetically
SELECT continent, name FROM country x
WHERE x.name <= ALL(
SELECT name FROM country y
WHERE x.continent = y.continent);


-- Find continents  where all countries have a population <= 25000000, then find names of countries
SELECT name, continent, population FROM country x
WHERE 25000000 >= ALL(SELECT population FROM country y
WHERE x.continent = y.continent
AND population > 0);


-- Some countries have pop more than 3 times than that of their neighbors. find them
SELECT name, continent FROM country x
WHERE population > ALL(SELECT population*3 FROM country y
WHERE y.continent = x.continent
AND y.name != x.name);




-- Use of JOIN
-- using left join, on what is the capital of spain
SELECT city.name FROM country
LEFT JOIN city ON country.capital = city.ID
AND country.code = city.CountryCode where country.code = 'ESP';


-- using left join, on list all the langs spoken in the southeast asia region
SELECT language, region FROM countrylanguage
LEFT JOIN country ON countrylanguage.CountryCode = country.code
WHERE country.region = 'Southeast Asia';




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
