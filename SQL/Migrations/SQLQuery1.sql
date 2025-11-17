
INSERT INTO Movies
	(Title,GenreID,ReleaseYear)
VALUES
	(N'Unkown Indie', NULL, 2024);



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


SELECT
	M.MovieID,
	M.Title,
	G.GenreID,
	G.GenreName
FROM Movies AS M
	FULL OUTER JOIN Genres AS G
	ON M.GenreID = G.GenreID
ORDER BY M.Title


SELECT
	M.MovieID,
	M.Title,
	G.GenreID,
	G.GenreName
FROM Movies AS M
	FULL OUTER JOIN Genres AS G
	ON M.GenreID = G.GenreID
WHERE M.GenreID IS NULL OR G.GenreID IS NULL
ORDER BY COALESCE(G.GenreName, N'-'),COALESCE(M.Title, N'—');


SELECT M.Title,
	A.FullName AS Actor
FROM MovieActors AS MA
	INNER JOIN Movies AS M
	ON MA.MovieID = M.MovieID
	INNER JOIN Actors AS A
	ON MA.ActorID = A.ActorID
ORDER BY M.Title, A.FullName;

SELECT
	M.Title,
	COUNT(*) AS ActorCount
FROM MovieActors AS MA
	INNER JOIN Movies AS M
	ON MA.MovieID = M.MovieID
GROUP BY M.Title
ORDER BY ActorCount DESC, M.Title;


SELECT M.Title,
	G.GenreName,
	ROUND(AVG(R.Score), 1) AS AvgScore
FROM Movies AS M
	INNER JOIN Genres AS G
	ON M.GenreID = G.GenreID
	LEFT JOIN Ratings AS R
	ON R.MovieID = M.MovieID
GROUP BY M.Title, G.GenreName
ORDER BY AvgScore DESC

SELECT A.FullName, M.Title
FROM Actors AS A
CROSS JOIN Movies AS M

SELECT
	M1.Title AS Movie,
	M2.Title AS OtherMovieSameYear,
	M1.ReleaseYear
FROM Movies AS M1
	INNER JOIN Movies AS M2
	ON M1.ReleaseYear = M2.ReleaseYear
		AND M1.MovieID <> M2.MovieID
ORDER BY M1.ReleaseYear, M1.Title;
