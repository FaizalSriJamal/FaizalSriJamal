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
