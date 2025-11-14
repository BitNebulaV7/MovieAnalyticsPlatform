
INSERT INTO Movies(Title,GenreID,ReleaseYear)
VALUES (N'Unkown Indie', NULL, 2024);



SELECT Movies.Title, Genres.GenreName
FROM Movies
INNER JOIN Genres
	ON Movies.GenreID = Genres.GenreID



SELECT M.Title, G.GenreName
FROM Movies AS M 
LEFT JOIN Genres AS G
	ON M.GenreID = G.GenreID
ORDER BY M.Title




SELECT M.Title, G.GenreName
FROM Movies AS M
RIGHT JOIN Genres AS G
	ON M.GenreID = G.GenreID
ORDER BY M.Title