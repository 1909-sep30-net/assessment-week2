CREATE SCHEMA Assessment
GO
-- Create Tables Based on Database Design
CREATE TABLE Assessment.Products(
	ProductId INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Name NVARCHAR(30) NOT NULL,
	Price NVARCHAR(30) NOT NULL
)
CREATE TABLE Assessment.Customers(
	CustomerId INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	FirstName NVARCHAR(30) NOT NULL,
	LastName NVARCHAR(30) NOT NULL,
	CardNumber INT
)
CREATE TABLE Assessment.Orders(
	OrderId INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	ProductId INT FOREIGN KEY REFERENCES Assessment.Products(ProductId),
	CustomerId INT FOREIGN KEY REFERENCES Assessment.Customers(CustomerId),

)

-- add 3 records in each table
INSERT INTO Assessment.Products VALUES ('Ipad', 500)
INSERT INTO Assessment.Products VALUES ('MacBook', 800)
INSERT INTO Assessment.Products VALUES ('Ipod', 150)

INSERT INTO Assessment.Customers VALUES ('John','Smith',2)
INSERT INTO Assessment.Customers VALUES ('Alan','Doe',1)
INSERT INTO Assessment.Customers VALUES ('Peter','Ian',3)

INSERT INTO Assessment.Orders VALUES (1,1)
INSERT INTO Assessment.Orders VALUES (2,3)
INSERT INTO Assessment.Orders VALUES (3,1)
SELECT * FROM Assessment.Orders

-- Insert Iphone Into Products
INSERT INTO Assessment.Products VALUES ('Iphone', 200)
--Insert Customer Into Customers
INSERT INTO Assessment.Customers VALUES ('Tina','Smith',1)
--Tina Bought Iphone
INSERT INTO Assessment.Orders 
VALUES (1,1)
--Tina's Orders
SELECT * FROM Assessment.Orders As Ord Join Assessment.Customers AS cust On ord.CustomerId = cust.CustomerId
WHERE cust.FirstName = 'Tina' AND cust.LastName = 'Smith';

--Revanue of Iphone
SELECT SUM(Price) AS [Total Revenue] FROM Assessment.Products AS prod JOIN Assessment.Orders AS ord
ON prod.ProductId = ord.ProductId
WHERE prod.Name = 'Iphone'
-- INCREASE Iphone Price
UPDATE Assessment.Products
SET Price = 250
WHERE Name = 'Iphone'

