SELECT name
FROM sys.databases


SELECT G.GenreName, COUNT(*) AS MovieCount
FROM Movies AS M
    INNER JOIN Genres AS G ON M.GenreID = G.GenreID
GROUP BY G.GenreName
ORDER BY MovieCount DESC