
create database s2;
use s2;

-- Create Director Table
CREATE TABLE Director (
    DirectorID INT PRIMARY KEY,
    Name VARCHAR(100),
    ExperienceYears INT
);

-- Create Producer Table
CREATE TABLE Producer (
    ProducerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Company VARCHAR(100)
);

-- Create Cameraman Table
CREATE TABLE Cameraman (
    CameramanID INT PRIMARY KEY,
    Name VARCHAR(100),
    Specialization VARCHAR(50)
);

-- Create Actor Table
CREATE TABLE Actor1 (
    ActorID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Nationality VARCHAR(50)
);

-- Create Film Table (AFTER Director, Producer, Cameraman)
CREATE TABLE Film (
    FilmID INT PRIMARY KEY,
    Title VARCHAR(100),
    ReleaseYear INT,
    DirectorID INT,
    ProducerID INT,
    CameramanID INT,
    FOREIGN KEY (DirectorID) REFERENCES Director(DirectorID),
    FOREIGN KEY (ProducerID) REFERENCES Producer(ProducerID),
    FOREIGN KEY (CameramanID) REFERENCES Cameraman(CameramanID)
);

-- Create Actor-Film Relationship Table
CREATE TABLE ActorFilm (
    ActorID INT,
    FilmID INT,
    FOREIGN KEY (ActorID) REFERENCES Actor1(ActorID),
    FOREIGN KEY (FilmID) REFERENCES Film(FilmID),
    PRIMARY KEY (ActorID, FilmID)
);

-- Insert into Actor1
INSERT INTO Actor1 VALUES
(1, 'Leonardo DiCaprio', 49, 'American'),
(2, 'Tom Cruise', 61, 'American'),
(3, 'Robert Downey Jr.', 58, 'American'),
(4, 'Chris Hemsworth', 40, 'Australian'),
(5, 'Scarlett Johansson', 39, 'American');

-- Insert into Director
INSERT INTO Director VALUES
(1, 'Christopher Nolan', 30),
(2, 'Steven Spielberg', 45),
(3, 'James Cameron', 40);

-- Insert into Producer
INSERT INTO Producer VALUES
(1, 'Emma Thomas', 'Syncopy'),
(2, 'Kevin Feige', 'Marvel Studios'),
(3, 'Jerry Bruckheimer', 'Disney');

-- Insert into Cameraman
INSERT INTO Cameraman VALUES
(1, 'Hoyte van Hoytema', 'IMAX'),
(2, 'Roger Deakins', 'Cinematography'),
(3, 'Emmanuel Lubezki', 'Visual Effects');

-- Insert into Film
INSERT INTO Film VALUES
(1, 'Inception', 2010, 1, 1, 1),
(2, 'Avengers: Endgame', 2019, 2, 2, 2),
(3, 'Titanic', 1997, 3, 3, 3),
(4, 'Top Gun: Maverick', 2022, 2, 3, 2),
(5, 'Interstellar', 2014, 1, 1, 1);

-- Insert into ActorFilm (Relationships)
INSERT INTO ActorFilm VALUES
(1, 1), -- Leonardo DiCaprio in Inception
(1, 5), -- Leonardo DiCaprio in Interstellar
(2, 4), -- Tom Cruise in Top Gun: Maverick
(3, 2), -- Robert Downey Jr. in Avengers: Endgame
(4, 2), -- Chris Hemsworth in Avengers: Endgame
(5, 2); -- Scarlett Johansson in Avengers: Endgame


select * from Producer;

select * from director;

select * from film;

select * from actorfilm;

select * from actor1;

select * from  cameraman;

-- compeny of producer
select name,company from producer;

select f.title,p.name 
from film as f
join Producer as p on p.ProducerID =f.ProducerID ;

-- Find all actors and the films they acted in
select a.name,f.title from film as f
join actorfilm as af on af.filmid = f.filmid
join actor1 as a on a.actorid = af.actorid;

--  Count the number of films directed by each director

select d.name ,count(f.title) 
from director as d
join film as f on d.directorid=f.directorid
group by d.name;

-- old an new film
select title,releaseyear from film
order by releaseyear limit 1;

select title,releaseyear from film
order by releaseyear desc limit 1;

-- Count the number of actors in each film
select f.title,count(a.name) from film as f
join actorfilm as af on af.filmid = f.filmid
join actor1 as a on a.actorid = af.actorid
group by f.title;

-- Find films with more than 2 actors
SELECT f.Title AS Film, COUNT(af.ActorID) AS ActorCount
FROM ActorFilm af
JOIN Film f ON af.FilmID = f.FilmID
GROUP BY f.Title
HAVING COUNT(af.ActorID) > 2;

-- List all producers and the films they produced
 
 SELECT p.Name AS Producer, f.Title AS Film
FROM Film f
JOIN Producer p ON f.ProducerID = p.ProducerID;

-- Find the cameramen who worked on films
SELECT c.Name AS Cameraman, f.Title AS Film
FROM Film f
JOIN Cameraman c ON f.CameramanID = c.CameramanID;

 
-- Find all films produced by ‘Marvel Studios’

SELECT f.Title AS Film
FROM Film f
JOIN Producer p ON f.ProducerID = p.ProducerID
WHERE p.Company = 'Marvel Studios';

