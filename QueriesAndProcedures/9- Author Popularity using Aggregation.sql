SELECT 
    B.Author,
    COUNT(L.LoanID) AS BorrowCount
FROM 
    Loans L
JOIN 
    Books B ON L.BookID = B.BookID
GROUP BY 
    B.Author
ORDER BY 
    BorrowCount DESC;