


SELECT G.GenreName, COUNT(*) AS MovieCount
FROM Movies AS M
    INNER JOIN Genres AS G ON M.GenreID = G.GenreID
GROUP BY G.GenreName
ORDER BY MovieCount DESC



-- Analysis: List all movies by genre (even non-genre films)
-- Objective: Fully display movies and check those that don't have genre
-- Logic: LEFT JOIN makes all movies displayed, even if their genre is NULL

SELECT G.GenreName, M.Title
FROM Movies AS M
    LEFT JOIN Genres AS G ON M.GenreID = G.GenreID
ORDER BY M.Title


-- Analysis: Finding genres that don't have any films

SELECT G.GenreName
FROM Genres AS G
    LEFT JOIN Movies AS M ON G.GenreID = M.GenreID


SELECT G.GenreName
FROM Genres AS G
    LEFT JOIN Movies AS M ON G.GenreID = M.GenreID
WHERE M.MovieID IS NULL


SELECT M.Title, A.FullName
FROM Movies AS M
    INNER JOIN MovieActors AS MA ON MA.MovieID = M.MovieID
    INNER JOIN Actors AS A ON MA.ActorID = A.ActorID
ORDER BY M.Title,A.FullName


SELECT M.Title,
    COALESCE(M.Revenue,0) - COALESCE(M.Budget,0) AS Profit,
    CAST(ROUND(AVG(R.Score),1) AS DECIMAL(4,1)) AS AVGRating
FROM Movies AS M
    LEFT JOIN Ratings AS R ON M.MovieID = R.MovieID
GROUP BY M.Title,M.Revenue,M.Budget
ORDER BY Profit DESC, AVGRating DESC


SELECT M.Title,
    COUNT(R.Source) AS RatingCount,
    CAST(AVG(R.Score) AS decimal(4,1)) AS AvgRating
FROM Movies AS M
    LEFT JOIN Ratings AS R ON M.MovieID = R.MovieID
GROUP BY M.Title