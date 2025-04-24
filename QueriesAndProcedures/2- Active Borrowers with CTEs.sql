WITH BorrowersWithLoans AS (
    SELECT 
        BorrowerID,
        COUNT(*) AS BorrowedCount,
        SUM(CASE WHEN DateReturned IS NULL THEN 1 ELSE 0 END) AS UnreturnedCount
    FROM 
        Loans
    GROUP BY 
        BorrowerID
)
SELECT 
    BorrowerID
FROM 
    BorrowersWithLoans
WHERE 
    BorrowedCount >= 2 AND UnreturnedCount = BorrowedCount;
