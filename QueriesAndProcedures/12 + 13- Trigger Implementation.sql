CREATE TABLE AuditLog (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    BookID INT,
    StatusChange NVARCHAR(100),
    ChangeDate DATETIME DEFAULT GETDATE()
);

CREATE TRIGGER trg_BookStatusChange
ON Books
AFTER UPDATE
AS
BEGIN
    INSERT INTO AuditLog (BookID, StatusChange)
    SELECT 
        i.BookID,
        CONCAT('Status changed from ', d.CurrentStatus, ' to ', i.CurrentStatus)
    FROM 
        inserted i
    JOIN 
        deleted d ON i.BookID = d.BookID
    WHERE 
        i.CurrentStatus <> d.CurrentStatus;
END;

UPDATE Books
SET CurrentStatus = 'Available'
WHERE BookID = 1003;

SELECT * FROM AuditLog;