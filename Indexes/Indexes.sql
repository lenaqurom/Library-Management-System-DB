CREATE UNIQUE INDEX IX_Books_ISBN ON Books(ISBN);

CREATE INDEX IX_Books_Genre ON Books(Genre);

CREATE INDEX IX_Books_CurrentStatus ON Books(CurrentStatus);

CREATE UNIQUE INDEX IX_Borrowers_Email ON Borrowers (Email);

CREATE INDEX IX_Borrowers_MembershipDate ON Borrowers (MembershipDate);

CREATE INDEX IX_Loans_BookID ON Loans (BookID);

CREATE INDEX IX_Loans_BorrowerID ON Loans (BorrowerID);

CREATE INDEX IX_Loans_DueDate ON Loans (DueDate);

CREATE INDEX IX_Loans_DateReturned ON Loans (DateReturned);

