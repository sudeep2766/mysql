-- Gab data from multiple tables with matching columns or similar whatever

INSERT INTO branch VALUES(4, 'Buffalo', NULL, NULL); -- For checking


-- Find all the branches and the names of their managers
SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
JOIN branch
ON employee.emp_id = branch.mgr_id; -- only elements meeting this conditions


-- LEFT JOIN -> include all rows from left table but not from right table
SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
LEFT JOIN branch
ON employee.emp_id = branch.mgr_id;


-- RIGHT JOIN -> include all rows from the right table
SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
RIGHT JOIN branch
ON employee.emp_id = branch.mgr_id;


-- Full outer join --> all ele from left and right tables both included
-- not possible in mysql he says