
CREATE TABLE Products(
	[Name] nvarchar(160) NOT NULL,
	[ProductId] int PRIMARY KEY NOT NULL IDENTITY(1000, 1),
	[Price] money NOT NULL
)

CREATE TABLE Orders (
	[OrderId] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
	[ProductId] int NOT NULL,
	[CustomerId] int NOT NULL
)

CREATE TABLE Customers (
	[CustomerId] int PRIMARY KEY NOT NULL IDENTITY(100, 1),
	[FirstName] nvarchar(160) NOT NULL,
	[LastName] nvarchar(160) NOT NULL,
	[CardNumber] bigint NOT NULL UNIQUE, 

)

ALTER TABLE [Orders] ADD FOREIGN KEY ([ProductId]) REFERENCES [Products] ([ProductId])
GO
ALTER TABLE [Orders] ADD FOREIGN KEY ([CustomerId]) REFERENCES [Customers] ([CustomerId])
GO

INSERT INTO Products(Name, Price)
values ('iPhone', 200), ('Galaxy', 150), ('Nokia', 1)

SELECT * FROM Products

INSERT INTO Customers(FirstName, LastName, CardNumber)
Values ('Tina', 'Smith', 1234567887654321), ('Joe', 'Smith', 1111222233334444),
		('Victoria', 'de la Guardia', 9999999999999999)

SELECT * FROM Customers


INSERT INTO Orders(ProductId, CustomerId)
Values ((ProductId where name like '%iPhone%' ),
		(CustomerId  FirstName like '%Tina%')))
	