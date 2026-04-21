USE world;

-- Using cOCUNT get no of cities from usa
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