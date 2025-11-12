USE MovieDB_Local
GO

-- Genre
INSERT INTO Genres
    (GenreName)
VALUES
    ('Action'),
    ('Comedy'),
    ('Drama')


-- Movie
INSERT INTO Movies
    (Title, ReleaseYear, GenreID, Budget, Revenue)
VALUES
    ('Edge of Tomorrow', 2014, 1, 178000000, 370000000),
    ('The Grand Budapest Hotel', 2014, 2, 25000000, 175000000),
    ('Parasite', 2019, 3, 11400000, 258000000);

-- Actors
INSERT INTO Actors
    (FullName,BirthDate,Nationality)
VALUES
    ('Tom Cruise', '1962-07-03', 'USA'),
    ('Ralph Fiennes', '1962-12-22', 'UK'),
    ('Song Kang-ho', '1967-01-17', 'South Korea');

-- MovieActors
INSERT INTO MovieActors
    (MovieID, ActorID)
VALUES
    (1, 1),
    (2, 2),
    (3, 3);

-- Ratings
INSERT INTO Ratings
    (MovieID, Source, Score)
VALUES
    (1, 'IMDb', 7.9),
    (2, 'RottenTomatoes', 8.1),
    (3, 'IMDb', 8.6);