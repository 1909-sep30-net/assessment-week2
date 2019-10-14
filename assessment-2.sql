Create Table Customers(
	CustomerId uniqueidentifier NOT NULL Default newid() Primary Key,
	FirstName nvarchar(40) NOT NULL,
	LastName nvarchar(40) NOT NULL,
	CardNumber int NOT NULL)


Create Table Products(
	ProductId uniqueidentifier NOT NULL Default newid() Primary Key,
	ProductName nvarchar(80) NOT NULL,
	ProductPrice decimal(12,2) NOT NULL
	)


Create Table Orders(
	OrderId uniqueidentifier Not Null Default newid() Primary Key,
	ProductId uniqueidentifier Not Null,
	CustomerId uniqueidentifier Not Null,
	CONSTRAINT FK_ProductsProductId Foreign Key (ProductId) References Products(ProductId),
	CONSTRAINT FK_CustomersProductId Foreign Key (CustomerId) References Customers(CustomerId)
	)

INSERT INTO Customers
           (FirstName
           ,LastName
		   ,CardNumber)
     VALUES
           ('Jerry'
           ,'Singlehorn'
		   , 123456789)
		   ,('Tom'
           ,'Blackheart'
		   , 234567891)
		   ,('Frank'
           ,'Overton'
		   , 234567891)

INSERT INTO Products
           (ProductName
           ,ProductPrice)
     VALUES
           ('Chalk'
           , 5.21)
		   ,('Eraser'
		   , 9.99)
		   ,('Net'
		   , 8.22)

INSERT INTO Orders
           (ProductId
           ,CustomerId)
     VALUES
           ('0DF47152-A8DA-47AB-AC73-267EC1D7232C'
           , '9B60376E-7091-482A-9CF0-3E4D95F8B68C')
		   ,('FEF26329-A22B-41D6-A8F2-79F6F2BE4122'
		   , 'E8177D77-C731-467A-B0FA-B658F02450CD')
		   ,('EC0BF45D-F085-4219-99FF-94448B2DAE55'
		   , '86EE399A-11B9-4E05-A0C9-CBDA62DFCEBF')


INSERT INTO Products
           (ProductName
           ,ProductPrice)
     VALUES
           ('iPhone'
           , 200.00)


INSERT INTO Customers
           (FirstName
           ,LastName
		   ,CardNumber)
     VALUES
           ('Tina'
           ,'Smith'
		   , 123456789)


INSERT INTO Orders
           (ProductId
           ,CustomerId)
     VALUES
           ('069B11CC-5155-4CD7-AD0A-51CA5A78753F'
           , '7436F046-C9C9-494A-8B23-714AC11519A0')

Select *
From Orders
Where CustomerId = '7436F046-C9C9-494A-8B23-714AC11519A0'


Select *
from orders
Inner Join products on orders.productid = products.productid 
Where productid = '069B11CC-5155-4CD7-AD0A-51CA5A78753F'


update Products
set ProductPrice = 250
where productid = '069B11CC-5155-4CD7-AD0A-51CA5A78753F'

----------
Select * from Products

Select * from Customers

Select * from Orders