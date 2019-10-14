CREATE TABLE Products (
	ID INT IDENTITY(1,1),
	Name NVARCHAR(255) NOT NULL,
	Price MONEY NOT NULL,
	CONSTRAINT PK_Product PRIMARY KEY (ID),
);

CREATE TABLE Customers (
	ID INT IDENTITY(1,1),
	FirstName NVARCHAR(255) NOT NULL,
	LastName NVARCHAR (255) NOT NULL,
	CardNumber INT NOT NULL
	CONSTRAINT PK_Customers PRIMARY KEY (ID)
);


CREATE TABLE Orders (
	ID INT IDENTITY(1,1),
	CONSTRAINT PK_Location PRIMARY KEY (ID),
	CONSTRAINT FK_Orders_Products_ID FOREIGN KEY (ProductsID) REFERENCES Products(ID),
	CONSTRAINT FK_Orders_Customers_ID FOREIGN KEY (CustomersID) REFERENCES Customers(ID)
);

INSERT INTO Products (Name, Price) VALUES
	('Football',$50),
	('Magazine',$10),
	('Baseball',$3.99);

INSERT INTO Customers (FirstName, LastName, CardNumber) VALUES
	('Colton', 'Clary', 1234),
	('Marcus', 'Gardner',5678),
	('Yolanda', 'Garza',9101);
INSERT INTO Orders (ProductsID, CustomersID) VALUES
	(1,1),
	(2,2),
	(3,2);
INSERT INTO Products (Name, Price) VALUES
	('IPhone', $200);

INSERT INTO Customers (FirstName,LastName) VALUES
	('Tina', 'Smith');
INSERT INTO Orders (ProductsID, CustomersID) VALUES
	(4, 4);
SELECT ProductsID FROM Orders WHERE CustomerID = 4;


SELECT (SELECT Count(ProductsID) FROM Orders WHERE ProductsID =4)* (SELECT Price FROM Products WHERE ProductsID=4);

UPDATE Products
SET Price = $250
WHERE ProductsID = 4;