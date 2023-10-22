-- Generate a list of customer information.
-- Show their first name, last name, and email address.
-- Sort the list of results by last name.

SELECT FirstName, LastName, Email
FROM Customers
ORDER BY LastName;

-- Create a table in the database to store customer
-- responses to our anniversary invitation.
-- Associate a customer's ID number with the number of people
-- they plan to bring in their party.

CREATE TABLE AnniversaryAttendees (
    CustomerID INTEGER,
    PartySize INTEGER
);

-- Create reports that will be used to make three menus.
-- Create a report with all the items sorted by price (lowest to highest).
SELECT Name, Price,Description
FROM Dishes
ORDER BY Price;
-- Create a report showing appetizers and beverages.

SELECT  
FROM Dishes
WHERE Type = 'Appetizer' 
OR Type = 'Beverage'
ORDER BY Type;


-- Create a report with all items except beverages.
SELECT Type,Name, Price,Description
FROM Dishes
WHERE Type != 'Beverage'
ORDER BY Type;

-- Add a customer to the restaurant's loyalty program.

-- Use the following information to create a record:
-- Anna Smith (asmith@samoca.org)
-- 479 Lapis Dr., Memphis, TN
-- Phone: (555) 555-1212; Birthday: July 21, 1973

INSERT INTO Customers (FirstName, LastName, Email, Address, City, State, Phone, Birthday)
VALUES ('Anna', 'Smith', 'asmith@samoca.org', '479 Lapis Drive','Memphis', 'TN', 
'555-555-1212','1973-07-21');

--check the record above has been inserted
SELECT * FROM Customers
ORDER BY CustomerID DESC

-- Update a customer's contact information.

-- Taylor Jenkins, of 27170 6th Ave., Washington, DC,
-- has moved to 74 Pine St., New York, NY.

--Find Customer ID
SELECT CustomerID, Firstname, LastName, Address
FROM Customers
WHERE firstName='Taylor' AND LastName='Jenkins'
;

-- Update details
UPDATE Customers
SET Address = '74 Pine St', City='New York',State='NY'
WHERE CustomerID = 26;

--check update
SELECT CustomerID, Firstname, LastName, Address,City,State
FROM Customers
WHERE CustomerID = 26
;
