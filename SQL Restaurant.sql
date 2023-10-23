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

-- Remove incorrect information from the database.
-- A customer named Norby has notified us he won't 
-- be able to keep his Friday reservation. 
-- Today is July 24, 2022.

-- Find CustomerID and name of customer
SELECT * 
FROM Reservations
JOIN Customers ON Reservations.CustomerID = Customers.CustomerID 
WHERE Customers.FirstName = 'Norby' 
AND Reservations.Date > '2022-07-24'
;

--remove reservation
DELETE FROM Reservations 
WHERE ReservationID=2000
;

--Register a customer for our Anniversary event.
-- The customer 'atapley2j@kinetecoinc.com' will be in
-- attendance, and will bring 3 friends.

INSERT INTO
AnniversaryAttendees 
(CustomerID,PartySize)
VALUES (
 (SELECT CustomerID
  FROM Customers
  WHERE Email = 'atapley2j@kinetecoinc.com'),
  4)
;

-- Find the reservation information for a customer whose
-- name we aren't quite sure how to spell.
-- Variations of the name include:
-- Stevensen, Stephensen, Stevenson, Stephenson, Stuyvesant
-- There are four people in the party. Today is June 14th.

SELECT Customers.FirstName, Customers.LastName, Reservations.ReservationID,
Reservations.Date, Reservations.PartySize
FROM Reservations
JOIN Customers ON Reservations.CustomerID = Customers.CustomerID
WHERE Customers.LastName LIKE 'St%'
AND Reservations.PartySize = 4
ORDER BY Date DESC
; 

--Reservation name is under is Paco Stephenson

-- Create a reservation for a customer who may or may not
-- already be listed in our Customers table.

-- Use the following information:
-- Sam McAdams (smac@kinetecoinc.com), for 5 people
-- on August 12, 2022 at 6PM (18:00)

--Check Customer information
SELECT *
FROM Customers
WHERE Email = 'smac@kinetecoinc.com';
--no such customer

--insert new customer information

INSERT INTO Customers (FirstName, LastName, Email)
VALUES ('Sam', 'McAdams', 'smac@kinetecoinc.com');

INSERT INTO Reservations(CustomerID, Date, PartySize)
VALUES ('102', '2022-08-12 18:00:00', '5');

--check reservation details 
SELECT Customers.FirstName, Customers.LastName, 
Customers.Email, Reservations.ReservationID, 
Reservations.Date,
Reservations.PartySize
FROM Customers
JOIN Reservations ON Customers.CustomerID = Reservations.CustomerID
WHERE Email = 'smac@kinetecoinc.com'
;


-- Enter a customer's delivery order into our database, 
-- and provide the total cost of the items ordered.

-- Use this order information:
-- Customer: Loretta Hundey, at 6939 Elka Place
-- Items: 1 House Salad, 1 Mini Cheeseburgers, and
-- 1 Tropical Blue Smoothie
-- Delivery date and time: September 20, 2022 @ 2PM (14:00)
-- There are no taxes or other fees.

--Find Customer ID and details
SELECT CustomerID, FirstName, LastName, Address
FROM Customers
WHERE FirstName = 'Loretta'
AND LastName = 'Hundey'
;

--create new order
INSERT INTO Orders (CustomerID, OrderDate)
VALUES (70, '2022-09-20 14:00:00');

SELECT *
FROM Orders
ORDER BY OrderDate DESC;
--orderID created 1001

--Insert OrderID and DishIDs

INSERT INTO OrdersDishes (OrderID, DishID)
VALUES (1001,(SELECT DishID
FROM Dishes
WHERE Name ='House Salad')),
(1001,(SELECT DishID
FROM Dishes
WHERE Name ='Mini Cheeseburgers')),
(1001,(SELECT DishID
FROM Dishes
WHERE Name ='Tropical Blue Smoothie'))
;

SELECT OrderID, DishID
FROM OrdersDishes
WHERE OrderID = 1001;

--check orders using Order ID
SELECT *
FROM Dishes
JOIN OrdersDishes ON Dishes.DishID = OrdersDishes.DishID
WHERE OrderID = 1001
;

--check total price
SELECT SUM(Price)
FROM Dishes
JOIN OrdersDishes ON Dishes.DishID = OrdersDishes.DishID
WHERE OrderID = 1001
;

--Total Price is $21.00






