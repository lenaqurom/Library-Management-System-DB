CREATE PROCEDURE sp_BorrowedBooksReport
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    SELECT 
        B.Title,
        Br.FirstName,
        Br.LastName,
        L.DateBorrowed
    FROM 
        Loans L
    JOIN 
        Books B ON L.BookID = B.BookID
    JOIN 
        Borrowers Br ON L.BorrowerID = Br.BorrowerID
    WHERE 
        L.DateBorrowed BETWEEN @StartDate AND @EndDate
    ORDER BY 
        L.DateBorrowed;
END;