CREATE SCHEMA a2wk2
GO

CREATE TABLE a2wk2.Customers
(
	CustomerID INT				NOT NULL		IDENTITY		PRIMARY KEY,
	FirstName NVARCHAR( 50 ),
	LastName NVARCHAR(50),
	CardNumber INT

)

CREATE TABLE a2wk2.Products
(
	ProductID INT				 NOT  NULL		IDENTITY		PRIMARY KEY,
	ProductName NVARCHAR( 50 ),
	Price MONEY
)

CREATE TABLE a2wk2.Orders
(
	OrderID INT					NOT NULL		IDENTITY		PRIMARY KEY,
	ProductID INT FOREIGN KEY  REFERENCES a2wk2.Products (ProductID),
	CustomerID INT FOREIGN KEY  REFERENCES a2wk2.Customers (CustomerID)

)

INSERT INTO a2wk2.Customers (FirstName, LastName, CardNumber) 
VALUES	('Gilbert', 'Grape',	4321432143214321),
		('John', 'Mith',		1234123412341234),
		('Sally', 'Sam',		1111222233334444)

INSERT INTO a2wk2.Products (ProductName, Price)
VALUES	( 'Rustbucket-5000', 80.00 ),
		( 'Phone-Geni', 30.00 ),
		( 'Mr Shiney', 800.00 )


INSERT INTO a2wk2.Orders (ProductID, CustomerID)
VALUES	( 
			( SELECT ProductID FROM a2wk2.Products WHERE ProductName = 'Rustbucket-5000'),
			( SELECT CustomerID FROM a2wk2.Customers WHERE CardNumber = 4321432143214321)
		),
		( 
			( SELECT ProductID FROM a2wk2.Products WHERE ProductName = 'Phone-Geni'),
			( SELECT CustomerID FROM a2wk2.Customers WHERE CardNumber = 1234123412341234)
		),
		( 
			( SELECT ProductID FROM a2wk2.Products WHERE ProductName = 'Mr Shiney'),
			( SELECT CustomerID FROM a2wk2.Customers WHERE CardNumber = 4321432143214321)
		)
		



