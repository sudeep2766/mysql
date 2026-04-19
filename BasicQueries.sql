USE Students;

-- Grab everything
SELECT * FROM student; -- *

-- Grab only specific things
SELECT student.name, student.major -- student -> table name (where its specifically coming from). Used when dealing with multiple tables
FROM student;

-- ORDER BY
SELECT name, major
FROM student
ORDER BY name /* DESC */; -- Orders names alphabetically   Default: ASCENDING

-- ORDER BY with multiple columns
SELECT * 
FROM student
ORDER BY major /* DESC */, student_id /* DESC */; -- Sorts by major first, if any duplicates then by id

-- Set limit
SELECT * 
FROM student
ORDER BY major , student_id DESC;
LIMIT 2;


-- Not equal to <>
SELECT name, major
FROM student
WHERE major <> 'Chemistry';

-- IN use case
SELECT * 
FROM student
WHERE name IN ('Claire', 'Kate', 'Mike');

SELECT * 
FROM student
WHERE name IN ('Claire', 'Kate', 'Mike') AND student_id > 2;