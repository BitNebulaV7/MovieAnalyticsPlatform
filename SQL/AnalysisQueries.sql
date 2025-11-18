


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