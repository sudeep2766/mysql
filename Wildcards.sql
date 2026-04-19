-- % = any # characters
-- _ = one character

-- Find any clients who are an LLC
SELECT * FROM client
WHERE client_name LIKE '%LLC'; -- anything can come before that but ends with 

-- Find any branch suppliers who are in the labels business
SELECT * FROM branch_supplier
WHERE branch_name LIKE '%label%';

-- Find any employee born in October
SELECT * FROM employee
WHERE birth_date LIKE '____-10%'; -- ____ (4 uc's)-> year (followed by) - (followed by) 10

--Find any clients who are schools
SELECT * FROM client
WHERE client_name LIKE '%school%';