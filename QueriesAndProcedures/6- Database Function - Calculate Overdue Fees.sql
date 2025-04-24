CREATE FUNCTION fn_CalculateOverdueFees(@LoanID INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @DueDate DATE, @DateReturned DATE, @OverdueDays INT, @Fee DECIMAL(10,2);

    SELECT 
        @DueDate = DueDate,
        @DateReturned = ISNULL(DateReturned, GETDATE())
    FROM 
        Loans
    WHERE 
        LoanID = @LoanID;

    SET @OverdueDays = DATEDIFF(DAY, @DueDate, @DateReturned);

    IF @OverdueDays <= 0
        SET @Fee = 0;
    ELSE IF @OverdueDays <= 30
        SET @Fee = @OverdueDays * 1;
    ELSE
        SET @Fee = (30 * 1) + ((@OverdueDays - 30) * 2);

    RETURN @Fee;
END;