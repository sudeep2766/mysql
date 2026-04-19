-- Find names of all employees who have
-- sold over 30000 to a single client
SELECT employee.first_name, employee.last_name FROM employee
WHERE employee.emp_id IN (
    SELECT works_with.emp_id FROM works_with
    WHERE works_with.total_sales > 30000
);

-- SELECT works_with.emp_id FROM works_with
-- WHERE works_with.total_sales > 30000;    -- this goes up there



-- Find all clients who are handled by the branch
-- that Michael Scott managed
-- assuming you know Michaels ID  -- 102

SELECT client.client_name FROM client
WHERE client.branch_id = (
    SELECT branch.branch_id FROM branch
    WHERE branch.mgr_id = 102
    LIMIT 1
);

-- SELECT branch.branch_id FROM branch
-- WHERE branch.mgr_id = 102;