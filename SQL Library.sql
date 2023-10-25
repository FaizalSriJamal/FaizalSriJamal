-- Determine how many copies of the book 'Dracula'
-- are available for library patrons to borrow.



SELECT COUNT(Books.Title)
FROM Books
WHERE Books.Title='Dracula'
;

SELECT COUNT(Books.Title) 
FROM Loans
JOIN Books ON Loans.BookID = Books.BookID
WHERE Books.Title ='Dracula'
AND Loans.ReturnedDate IS NULL
;

SELECT
(SELECT COUNT(Books.Title)
FROM Books
WHERE Books.Title='Dracula'
) -
(SELECT COUNT(Books.Title) 
FROM Loans
JOIN Books ON Loans.BookID = Books.BookID
WHERE Books.Title ='Dracula'
AND Loans.ReturnedDate IS NULL
)
AS Available_to_loan


-- Add books to the library database.

-- Title: Dracula
-- Author: Bram Stoker
-- Published: 1897
-- ID Number: 4819277482

-- Title: Gulliver’s Travels into Several Remote Nations of the World
-- Author: Jonathan Swift
-- Published: 1729
-- ID Number: 4899254401

INSERT INTO Books (Title, Author, Published, Barcode)
VALUES ('Dracula','Bram Stoker',1897, 4819277482),
('Gulliver''s Travels into Several Remote Nations of the World',
'Jonathan Swift', 1729, 4899254401)

SELECT * 
FROM Books
ORDER By BookID DESC
LIMIT 5 
;

-- Check out two books for Jack Vaan (jvaan@wisdompets.com).
-- Book 1: The Picture of Dorian Gray, 2855934983
-- Book 2: Great Expectations, 4043822646
-- The checkout date is August 25, 2022 and the 
-- due date is September 8, 2022.

SELECT PatronID
FROM Patrons
WHERE Email = 'jvaan@wisdompets.com'
;

SELECT BookID
FROM Books
WHERE Barcode='2855934983' 
;

SELECT BookID
FROM Books
WHERE  Barcode='4043822646'
;

INSERT INTO Loans (BookID, PatronID, LoanDate, DueDate)
VALUES ((SELECT BookID
FROM Books
WHERE Barcode='2855934983'),(SELECT PatronID
FROM Patrons
WHERE Email = 'jvaan@wisdompets.com'),'2022-08-25','2022-09-08'),
((SELECT BookID
FROM Books
WHERE Barcode='4043822646'),(SELECT PatronID
FROM Patrons
WHERE Email = 'jvaan@wisdompets.com'),'2022-08-25','2022-09-08')
;

SELECT *
FROM Loans
ORDER BY LoanID DESC
LIMIT 5;

-- Prepare a report of books due to be returned
-- to the library on July 13, 2022.
-- Provide the due date, the book title, and
-- the borrower's first name and email address.

SELECT Loans.DueDate, 
Books.Title,
Patrons.FirstName,
Patrons.LastName,
Patrons.Email
FROM Loans
JOIN Books ON Loans.BookID=Books.BookID
JOIN Patrons ON Loans.PatronID = Patrons.PatronID
WHERE Loans.DueDate= '2022-07-13'
AND Loans.ReturnedDate IS NULL
;

-- Return three books to the library using
-- their bar codes.
-- Return date: July 5, 2022
-- Book 1: 6435968624
-- Book 2: 5677520613
-- Book 3: 8730298424


UPDATE Loans
SET ReturnedDate = '2022-07-05'
WHERE BookID=
(SELECT BookID
FROM Books
WHERE Barcode='6435968624')
AND ReturnedDate IS NULL
;


UPDATE Loans
SET ReturnedDate = '2022-07-05'
WHERE BookID=
(SELECT BookID
FROM Books
WHERE Barcode='5677520613')
AND ReturnedDate IS NULL
;

UPDATE Loans
SET ReturnedDate = '2022-07-05'
WHERE BookID=
(SELECT BookID
FROM Books
WHERE Barcode='8730298424')
AND ReturnedDate IS NULL
;

SELECT * 
FROM Loans
WHERE ReturnedDate='2022-07-05'
;

-- Return three books to the library using
-- their bar codes.
-- Return date: July 5, 2022
-- Book 1: 6435968624
-- Book 2: 5677520613
-- Book 3: 8730298424


UPDATE Loans
SET ReturnedDate = '2022-07-05'
WHERE BookID=
(SELECT BookID
FROM Books
WHERE Barcode='6435968624')
AND ReturnedDate IS NULL
;


UPDATE Loans
SET ReturnedDate = '2022-07-05'
WHERE BookID=
(SELECT BookID
FROM Books
WHERE Barcode='5677520613')
AND ReturnedDate IS NULL
;

UPDATE Loans
SET ReturnedDate = '2022-07-05'
WHERE BookID=
(SELECT BookID
FROM Books
WHERE Barcode='8730298424')
AND ReturnedDate IS NULL
;

SELECT * 
FROM Loans
WHERE ReturnedDate='2022-07-05'
;






