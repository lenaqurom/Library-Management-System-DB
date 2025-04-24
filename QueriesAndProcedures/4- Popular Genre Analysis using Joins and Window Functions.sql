SELECT TOP 1
    B.Genre,
    COUNT(*) AS BorrowedCount
FROM 
    Loans L
JOIN 
    Books B ON L.BookID = B.BookID
WHERE 
    MONTH(L.DateBorrowed) = 3 AND YEAR(L.DateBorrowed) = 2025
GROUP BY 
    B.Genre
ORDER BY 
    BorrowedCount DESC;