SELECT 
    CASE 
        WHEN Age BETWEEN 0 AND 10 THEN '0-10'
        WHEN Age BETWEEN 11 AND 20 THEN '11-20'
        WHEN Age BETWEEN 21 AND 30 THEN '21-30'
        WHEN Age BETWEEN 31 AND 40 THEN '31-40'
        WHEN Age BETWEEN 41 AND 50 THEN '41-50'
        ELSE '51+'
    END AS AgeGroup,
    B.Genre,
    COUNT(*) AS BorrowCount
FROM (
    SELECT 
        BorrowerID,
        DATEDIFF(YEAR, DateOfBirth, GETDATE()) AS Age
    FROM 
        Borrowers
) AS Br
JOIN 
    Loans L ON Br.BorrowerID = L.BorrowerID
JOIN 
    Books B ON L.BookID = B.BookID
GROUP BY 
    CASE 
        WHEN Age BETWEEN 0 AND 10 THEN '0-10'
        WHEN Age BETWEEN 11 AND 20 THEN '11-20'
        WHEN Age BETWEEN 21 AND 30 THEN '21-30'
        WHEN Age BETWEEN 31 AND 40 THEN '31-40'
        WHEN Age BETWEEN 41 AND 50 THEN '41-50'
        ELSE '51+'
    END,
    B.Genre
HAVING 
    COUNT(*) > 0
ORDER BY 
    AgeGroup, BorrowCount DESC;