DROP TABLE Orders;
DROP TABLE Products;
DROP TABLE Customers;

GO

CREATE TABLE Products (
	Id INT PRIMARY KEY NOT NULL IDENTITY,
	Name NVARCHAR(50),
	Price INT
);

CREATE TABLE Customers (
	Id INT PRIMARY KEY NOT NULL IDENTITY,
	FirstName NVARCHAR(25),
	LastName NVARCHAR(25),
	CardNumber BIGINT
);

CREATE TABLE Orders (
	Id INT PRIMARY KEY NOT NULL IDENTITY,
	ProductId INT FOREIGN KEY REFERENCES Products(Id),
	CustomerId INT FOREIGN KEY REFERENCES Customers(Id)
);

GO

INSERT INTO Products (Name, Price) VALUES
('iPhone', 200),
('iPad', 400),
('iMac', 1000);

INSERT INTO Customers (FirstName, LastName, CardNumber) VALUES
('Tina', 'Smith', 7483029374839202),
('Arthur', 'Morgan', 2342947493620172),
('John', 'Marston', 8473028372930273);

GO

-- DISPLAY ALL TABLES
SELECT * FROM Products;
SELECT * FROM Customers;
SELECT * FROM Orders;

GO

-- CREATING TINA'S IPHONE ORDER
INSERT INTO Orders (ProductId, CustomerId) VALUES
((SELECT Id FROM Customers WHERE FirstName = 'Tina' AND LastName = 'Smith'), (SELECT Id FROM Products WHERE Name = 'iPhone'));

GO

--ALL ORDERS
SELECT o.Id AS OrderID, c.FirstName + ' ' + c.LastName AS CustomerName, p.Name AS ProductName, p.Price FROM Orders AS o, Customers AS c, Products AS p
WHERE o.CustomerId = c.Id AND o.ProductId = p.Id;

--ALL ORDERS BY TINA SMITH
SELECT o.Id AS OrderID, c.FirstName + ' ' + c.LastName AS CustomerName, p.Name AS ProductName, p.Price FROM Orders AS o, Customers AS c, Products AS p
WHERE o.CustomerId = c.Id AND o.ProductId = p.Id AND (c.FirstName Like 'Tina' AND c.LastName Like 'Smith');

--INCREASE PRICE OF iPHONE TO 250
UPDATE Products
SET Price = 250
WHERE Name = 'iPhone';

SELECT * FROM PRODUCTS;