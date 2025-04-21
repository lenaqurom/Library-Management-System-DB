CREATE TABLE Books (
    BookID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(255) NOT NULL,
    Author NVARCHAR(255) NOT NULL,
    ISBN NVARCHAR(20) NOT NULL UNIQUE,
    PublishedDate DATE,
    Genre NVARCHAR(100),
    ShelfLocation NVARCHAR(50),
    CurrentStatus NVARCHAR(20) CHECK (CurrentStatus IN ('Available', 'Borrowed')) NOT NULL
);

CREATE TABLE Borrowers (
    BorrowerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(100) NOT NULL,
    LastName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(255) NOT NULL UNIQUE,
    DateOfBirth DATE,
    MembershipDate DATE
);

CREATE TABLE Loans (
    LoanID INT PRIMARY KEY IDENTITY(1,1),
    BookID INT FOREIGN KEY REFERENCES Books(BookID),
    BorrowerID INT FOREIGN KEY REFERENCES Borrowers(BorrowerID),
    DateBorrowed DATE NOT NULL,
    DueDate DATE NOT NULL,
    DateReturned DATE NULL
);
