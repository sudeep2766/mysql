CREATE DATABASE sailors;

CREATE TABLE sailor(
    salID INT PRIMARY KEY,
    salName VARCHAR(20),
    rating INT,
    age INT
);

CREATE TABLE reserves(
    salID INT,
    boatID INT,
    rDate DATE,
    FOREIGN KEY(salID) REFERENCES sailor(salID) ON DELETE SET NULL
    -- boatID is a foreign key now
);

CREATE TABLE boats(
    boatID INT PRIMARY KEY,
    boatName VARCHAR(20),
    color VARCHAR(10)
);

ALTER TABLE reserves
ADD FOREIGN KEY(boatID) REFERENCES boats(boatID) ON DELETE SET NULL;

-- Inserting values
INSERT INTO sailor VALUES(1, 'John', 5, 25);
INSERT INTO sailor VALUES(2, 'Rahul', 4, 19);
INSERT INTO sailor VALUES(3, 'Anita', 5, 30);
INSERT INTO sailor VALUES(4, 'Priya', 3, 17);
INSERT INTO sailor VALUES(5, 'Arjun', 4, 22);
INSERT INTO sailor VALUES(6, 'Neha', 3, 21);


INSERT INTO boats VALUES(101, 'Sea Queen', 'RED');
INSERT INTO boats VALUES(102, 'Q Costus', 'BLUE');
INSERT INTO boats VALUES(103, 'Wave Ricles', 'RED';
INSERT INTO boats VALUES(104, 'River King', 'GREEN');


INSERT INTO reserves VALUES(1, 101, '2026-02-01');
INSERT INTO reserves VALUES(2, 102, '2026-02-01');
INSERT INTO reserves VALUES(3, 103, '2026-02-01');
INSERT INTO reserves VALUES(4, 104, '2026-02-01');
INSERT INTO reserves VALUES(5, 103, '2026-02-01');
INSERT INTO reserves VALUES(6, 104, '2026-02-01');


-- Questions
-- Sailors who reserved boat 101
SELECT sailor.salName, reserves.boatID FROM sailor
JOIN reserves ON sailor.salID = reserves.salID
WHERE reserves.boatID = 101;

-- Sailors who reserved RED boat
SELECT sailor.salName FROM sailor
JOIN reserves ON sailor.salID = reserves.salID
JOIN boats ON boats.boatID = reserves.boatID
WHERE boats.color = 'RED';

-- List of unique colors
SELECT DISTINCT boats.color FROM sailor
JOIN reserves ON sailor.salID = reserves.salID
join boats ON reserves.boatID = boats.boatID;

-- 2d (wrong question)
SELECT rating, AVG(age) AS AvgAge FROM sailor
GROUP BY rating
HAVING COUNT(*) > 2; -- empty set

-- 2e
SELECT rating, MIN(age) AS YoungestAge FROM sailor
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;