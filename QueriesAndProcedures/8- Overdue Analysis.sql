SELECT 
    B.Title,
    Br.FirstName,
    Br.LastName,
    L.DateBorrowed,
    L.DueDate
FROM 
    Loans L
JOIN 
    Books B ON L.BookID = B.BookID
JOIN 
    Borrowers Br ON L.BorrowerID = Br.BorrowerID
WHERE 
    DateReturned IS NULL 
    AND DATEDIFF(DAY, L.DueDate, GETDATE()) > 30;