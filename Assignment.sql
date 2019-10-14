--creation
CREATE TABLE Products
(
	ProductId INT PRIMARY KEY IDENTITY(1,1),
	Name NVARCHAR(64) NOT NULL,
	Price MONEY NOT NULL
)

CREATE TABLE Customers
(
	CustomerId INT PRIMARY KEY IDENTITY(1,1),
	FirstName NVARCHAR(64) NOT NULL,
	LastName NVARCHAR(64) NOT NULL,
	CardNumber NVARCHAR(32) NOT NULL
)

CREATE TABLE Orders
(
	OrderId INT PRIMARY KEY IDENTITY(1,1),
	ProductId INT FOREIGN KEY REFERENCES Products (ProductId),
	CustomerId INT FOREIGN KEY REFERENCES Customers (CustomerId)
)

--Manipulation
INSERT INTO Products VALUES
	('Coke',1.99),
	('Pepsi',1.89),
	('Water',1.49)
INSERT INTO Customers VALUES
	('Greg','Favrot','1234'),
	('Tracy','Yoes','2345'),
	('Richard','Favrot', '2345')
INSERT INTO Orders VALUES
	(1,1), --greg coke
	(2,3), --tracy water
	(3,1)	--richard coke

INSERT INTO Products VALUES ('iPhone', 200.00)

INSERT INTO Customers VALUES ('Tina', 'Smith', '3456')

INSERT INTO Orders VALUES (4,4) --tina, iphone

SELECT c.FirstName AS [First Name], c.LastName AS [Last Name], o.OrderId AS [OrderId]
FROM Customers AS c INNER JOIN Orders AS o ON c.CustomerId = o.CustomerId
Where c.CustomerId = 4;

SELECT SUM(p.Price) AS [Revenue of iPhone]
FROM Orders AS o INNER JOIN Products as p ON o.ProductId = p.ProductId
WHERE p.ProductId = 4

UPDATE Products 
SET Price = 250.00
WHERE ProductId = 4

SELECT * FROM Products










