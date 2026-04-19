-- Combine results of multiple select statements into one
/*
SELECT first_name FROM employee;
SELECT branch_name FROM branch;

combine these two into a single statement
and get a list with both in one
*/

-- RULE -> have same number of columns in both the tables/lists AND similar datatypes


SELECT first_name FROM employee
UNION
SELECT branch_name FROM branch;


-- Find a list of all clients and branch suppliers names
SELECT client_name FROM client
UNION
SELECT supplier_name from branch_supplier;