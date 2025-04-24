CREATE PROCEDURE sp_OverdueBorrowersAndBooks
AS
BEGIN
    CREATE TABLE #OverdueBorrowers (
        BorrowerID INT
    );

    INSERT INTO #OverdueBorrowers
    SELECT DISTINCT BorrowerID
    FROM Loans
    WHERE DateReturned IS NULL
      AND DATEDIFF(DAY, DueDate, GETDATE()) > 0;

    SELECT 
        Br.FirstName,
        Br.LastName,
        B.Title,
        L.DateBorrowed,
        L.DueDate
    FROM 
        #OverdueBorrowers ob
    JOIN 
        Loans L ON ob.BorrowerID = L.BorrowerID
    JOIN 
        Books B ON L.BookID = B.BookID
    JOIN 
        Borrowers Br ON L.BorrowerID = Br.BorrowerID
    WHERE 
        L.DateReturned IS NULL
      AND DATEDIFF(DAY, L.DueDate, GETDATE()) > 0;

    DROP TABLE #OverdueBorrowers;
END;

EXEC sp_OverdueBooks