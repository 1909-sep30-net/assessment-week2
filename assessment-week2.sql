CREATE SCHEMA Assessment2
GO

CREATE TABLE Assessment2.Products (
	ID nvarchar(255) PRIMARY KEY
	, Name nvarchar(255)
	, Price money
)
GO

CREATE TABLE Assessment2.Customers (
	ID nvarchar(255) PRIMARY KEY
	, Firstname nvarchar(255)
	, Lastname nvarchar(255)
	, CardNumber nvarchar(255)
)
GO

CREATE TABLE Assessment2.Orders (
	ID nvarchar(255)
	, ProductID nvarchar(255) REFERENCES Assessment2.Products(ID)
	, CustomerID nvarchar(255) REFERENCES Assessment2.Customers(ID)
)
GO

-- Three entries each
INSERT INTO Assessment2.Products (ID, Name, Price) VALUES 
('1', 'Plastic Tub', 44.99)
, ('2', 'Trash Can', 59.99)
, ('3', 'Water Trough', 89.99);
GO

INSERT INTO Assessment2.Customers (ID, Firstname, Lastname, CardNumber) VALUES
('1', 'Louie', 'Roberts', '123')
, ('2', 'Bobbi', 'Bobberts', '456')
, ('3', 'Clobberinthyme', 'Cloberts', '789');
GO

INSERT INTO Assessment2.Orders (ID, ProductID, CustomerID) VALUES
('1', '1', '1')
, ('2', '2', '2')
, ('3', '3', '4')
GO

-- Creating Tina Smith
INSERT INTO Assessment2.Products (ID, Name, Price) VALUES
('4', 'iPhone', 200.00);
GO

INSERT INTO Assessment2.Customers (ID, Firstname, Lastname, CardNumber) VALUES
('4', 'Tina', 'Smith', '999');
GO

INSERT INTO Assessment2.Orders (ID, CustomerID, ProductID) VALUES
('4', '4', '4');
GO */

-- Report Tina's order(s)
SELECT C.Firstname, C.Lastname, P.Name, P.Price
FROM Assessment2.Customers AS C
LEFT JOIN Assessment2.Orders AS O ON C.ID = O.CustomerID
LEFT JOIN Assessment2.Products AS P ON O.ProductID = P.ID
WHERE C.Firstname = 'Tina' AND C.Lastname = 'Smith';
GO

-- iPhone sales
SELECT P.Name, SUM(P.Price)
FROM Assessment2.Orders AS O
LEFT JOIN Assessment2.Products AS P ON O.ProductID = P.ID
WHERE P.Name = 'iPhone'
GROUP BY P.Name;
GO

-- Increase the price of the iPhone to 250
UPDATE Assessment2.Products 
SET Price = 250.00
WHERE Name = 'iPhone';