USE Students;

CREATE TABLE student(
    student_id INT ,
    name VARCHAR(20) NOT NULL UNIQUE,
    major VARCHAR(20) DEFAULT 'Undecided',
    PRIMARY KEY(student_id)
);

INSERT INTO student VALUES(1, 'Jack', 'Biology');
INSERT INTO student VALUES(2, 'Kate', 'Biology'); -- throws an error as 2 students have bio





CREATE TABLE student(
    student_id INT AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL UNIQUE,
    major VARCHAR(20) DEFAULT 'Undecided',
    PRIMARY KEY(student_id)
);

INSERT INTO student(name, major) VALUES('Jack', 'Biology');
INSERT INTO student(name, major) VALUES('Kate', 'Biology'); -- works fine as student_id is auto generated
INSERT INTO student(name) VALUES('Claire'); -- works fine as major is default and student_id is auto generated