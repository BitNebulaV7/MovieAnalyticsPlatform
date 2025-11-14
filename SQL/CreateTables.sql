USE MovieDB_Local;
GO

CREATE TABLE IMDB_Movies
(
    MovieID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(200),
    IMDbRating DECIMAL(3,1),
    Year INT,
    Certificate NVARCHAR(20),
    Genre NVARCHAR(50),
    Director NVARCHAR(100),
    StarCast NVARCHAR(MAX),
    MetaScore INT,
    DurationMinutes INT
);

CREATE TABLE Genres
(
    GenreID INT PRIMARY KEY IDENTITY(1,1),
    GenreName NVARCHAR(50) NOT NULL
)

CREATE TABLE Movies
(
    MovieID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(100) NOT NULL,
    ReleaseYear INT,
    GenreID INT FOREIGN KEY REFERENCES Genres(GenreID),
    Budget BIGINT,
    Revenue BIGINT
)

CREATE TABLE Actors
(
    ActorID INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(100),
    BirthDate DATE,
    Nationality NVARCHAR(50)
)

CREATE TABLE MovieActors
(
    MovieID INT FOREIGN KEY REFERENCES Movies(MovieID),
    ActorID INT FOREIGN KEY REFERENCES Actors(ActorID),
    PRIMARY KEY(MovieID, ActorID)
)

CREATE TABLE Ratings
(
    RatingID INT PRIMARY KEY IDENTITY(1,1),
    MovieID INT FOREIGN KEY REFERENCES Movies(MovieID),
    Source NVARCHAR(50),
    Score DECIMAL(3,1)
);