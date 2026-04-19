USE Company;

-- Find all clients
SELECT * FROM client;

-- Find all employees ordered by salary from highest to lowest
SELECT * FROM employee
ORDER BY salary DESC;

-- Find all employees ordered by sex and their name
SELECT * FROM employee
ORDER BY sex, first_name;

-- Find the first 5 employees from the table
SELECT * FROM employee
LIMIT 5;

-- Find the first and last names of the employees
SELECT first_name, last_name FROM employee;

-- Find the forename and surnames of the employees
SELECT first_name AS forename, last_name AS surname FROM employee;