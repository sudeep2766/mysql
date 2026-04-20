USE Students;

CREATE TABLE student(
    student_id INT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    major VARCHAR(20) DEFAULT 'Undecided'
);


-- Set bio wherever biology is
UPDATE student
SET major = 'Bio'
WHERE major = 'Biology';

-- Set CS wherever major is undecided
UPDATE student
SET major = 'CS'
WHERE major = 'Undecided';

-- Set specific major for a spwcific student
UPDATE student
SET major = 'Chemistry'
WHERE student_id = 1;

-- OR logic
-- Merge Bio and Chemistry
UPDATE student
SET major = 'Biochemistry'
WHERE major = 'Bio' OR major = 'Chemistry';

-- Update multiple things
UPDATE student
SET major = 'Bio', name = 'Tom'
WHERE student_id = 6;


-- Delete things
-- AND logic
DELETE FROM student
WHERE name = 'Tom' AND major = 'Undecided'; -- Deletes the tuple