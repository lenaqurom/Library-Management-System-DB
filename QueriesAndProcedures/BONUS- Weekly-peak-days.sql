SELECT 
    DATENAME(WEEKDAY, DateBorrowed) AS WeekDay,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Loans) AS LoanPercentage
FROM 
    Loans
GROUP BY 
    DATENAME(WEEKDAY, DateBorrowed)
ORDER BY 
    LoanPercentage DESC;