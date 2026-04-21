CREATE DATABASE movie;

CREATE TABLE actor(
    Act_id INT PRIMARY KEY,
    Act_name VARCHAR(20),
    Act_gender VARCHAR(1)
);

CREATE TABLE director(
    Dir_id INT PRIMARY KEY,
    Dir_name VARCHAR(20),
    Dir_phone INT
);

CREATE TABLE movies(
    Mov_id INT PRIMARY KEY,
    Mov_name VARCHAR(30),
    Mov_year INT,
    Mov_lang VARCHAR(20),
    Dir_id INT,
    FOREIGN KEY(Dir_id) REFERENCES director(Dir_id) ON DELETE SET NULL
);

CREATE TABLE movie_cast(
    Act_id INT,
    Mov_id INT,
    Role INT,
    FOREIGN KEY(Act_id) REFERENCES actor(Act_id) ON DELETE SET NULL,
    FOREIGN KEY(Mov_id) REFERENCES movies(Mov_id) ON DELETE SET NULL
);

CREATE TABLE rating(
    Mov_id INT,
    Rev_stars INT,
    FOREIGN KEY(Mov_id) REFERENCES movies(Mov_id) ON DELETE SET NULL
);

INSERT INTO movies VALUES(101, 'Avengers 0', 2026, 'English', NULL);

INSERT INTO director VALUES(1001, 'Hitchcock', 123456789);

UPDATE movies
SET Dir_id = 1001 WHERE Mov_id = 101;


-- Find movies directid by 'Hirchcock'
SELECT Mov_name FROM movies
JOIN director ON movies.Dir_id = director.Dir_id
WHERE director.Dir_name = 'Hitchcock';

-- Find movie names where one or more actors acted in two or more movies
-- Adding Actors
INSERT INTO actor VALUES (1, 'Robert Downey Jr.', 'M');
INSERT INTO actor VALUES (2, 'Scarlett Johansson', 'F');
INSERT INTO actor VALUES (3, 'Chris Evans', 'M');

-- Adding more Movies
INSERT INTO movies VALUES (102, 'Iron Man', 2008, 'English', 1001);
INSERT INTO movies VALUES (103, 'Captain America', 2011, 'English', 1001);

-- Adding Cast (RDJ is in Avengers 0 and Iron Man)
INSERT INTO movie_cast VALUES (1, 101, 1); -- RDJ in Avengers 0
INSERT INTO movie_cast VALUES (1, 102, 1); -- RDJ in Iron Man
INSERT INTO movie_cast VALUES (2, 101, 1); -- Scarlett in Avengers 0
INSERT INTO movie_cast VALUES (3, 103, 1); -- Chris in Captain America