DECLARE @BorrowerID int = 20;
SELECT 
    B.Title,
    B.Author,
    Br.FirstName AS [Borrower First Name],
    Br.LastName AS [Borrower Last Name],
    L.DateBorrowed,
    L.DueDate,
    L.DateReturned
FROM 
    Books B
INNER JOIN 
    Loans L ON L.BookID = B.BookID
INNER JOIN 
    Borrowers Br ON L.BorrowerID = Br.BorrowerID
WHERE 
    L.BorrowerID = @BorrowerID;