CREATE DATABASE Students;

-- Create a table
CREATE TABLE student(
	student_id INT PRIMARY KEY,
	name VARCHAR(20),
	major VARCHAR(20)
);

-- Making a pk separately
CREATE TABLE student(
	student_id INT,
	name VARCHAR(20),
	major VARCHAR(20),
	PRIMARY KEY(student_id)
);

-- Deleting a table 
DROP TABLE student;

-- Adding a column
ALTER TABLE student ADD gpa DECIMAL(3, 2);

-- Deleting a column
ALTER TABLE student DROP COLUMN gpa;

-- Description of a table
DESCRIBE student;


/*
student_id,
name,
major,
gpa
*/

-- Insert values
INSERT INTO student VALUES(1, 'Jack', 'Biology', NULL);
INSERT INTO student VALUES(2, 'Kate', 'Sociology', NULL);

-- Inserting null values by default
INSERT INTO student(student_id, name) VALUES(3, 'Claire');
INSERT INTO student(student_id, name, major) VALUES(4, 'Jane', 'Biology');




