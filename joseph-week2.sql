CREATE TABLE dbo.Products
(
	ID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Name NVARCHAR(25) NOT NULL,
	Price MONEY NOT NULL,
);
GO

CREATE TABLE dbo.Orders
(
	ID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	ProductID INT FOREIGN KEY REFERENCES Products(ID) NOT NULL,
	CustomerID INT FOREIGN KEY REFERENCES Customers(ID) NOT NULL,
);

CREATE TABLE dbo.Customers
(
	ID INT PRIMARY KEY NOT NULL,
	FirstName NVARCHAR(25) NOT NULL,
	LastName NVARCHAR(25) NOT NULL,
	CardNumber INT NOT NULL,
);

INSERT INTO dbo.Products VALUES ('Product1', 1);
INSERT INTO dbo.Products VALUES ('Product2', 2);
INSERT INTO dbo.Products VALUES ('Product3', 3);

INSERT INTO dbo.Customers VALUES ('FirstName1', 'LastName1', 1);
INSERT INTO dbo.Customers VALUES ('FirstName2', 'LastName2', 2);
INSERT INTO dbo.Customers VALUES ('FirstName3', 'LastName3', 3);

INSERT INTO dbo.Orders VALUES (1, 1);
INSERT INTO dbo.Orders VALUES (2, 2);
INSERT INTO dbo.Orders VALUES (3, 3);

INSERT INTO dbo.Products VALUES ('iPhone', 200);
INSERT INTO dbo.Customers VALUES ('Tina', 'Smith', 4);

INSERT INTO dbo.Orders VALUES
(
	(SELECT ID FROM Products WHERE Name = 'iPhone'),
	(SELECT ID FROM Customers where FirstName = 'Tina' AND LastName = 'Smith')
);

SELECT * FROM Orders AS o
join Customers AS c ON o.CustomerID = c.ID
where FirstName = 'Tina' AND LastName = 'Smith'

SELECT SUM(Price) FROM Orders AS o
left join Products AS p ON o.ProductID = p.ID
where p.Name = 'iPhone'

UPDATE 


