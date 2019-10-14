--Create Database assesstment2;  ---
--Create Schema assess2;
--go

Drop table if exists Orders;
Drop Table if exists Customers;
Drop table if exists Products;
Create Table Customers (
	ID int Identity Not Null,
	FirstName nvarchar(64) Not Null,
	LastName nvarchar(64) Not Null,
	CardNumber int Not Null,
	PRIMARY KEY (ID),

);
Insert Into Customers Values
	('T' ,'L', 3),
	('T1' ,'L1', 3),
	('T2' ,'L2', 3),
	('Tina' ,'Smith', 4)

	;


	
Create Table Products (
	ID int Identity Not Null,
	ProductName nvarchar(64) Not Null,
	Price Money Not Null,
	PRIMARY KEY (ID),

);
Insert Into Products Values
	('CellPhone' ,100),
	('Nick' ,0.01),
	('Car' ,34),
	('iphone' ,200)
	;

Create Table Orders (
	ID int Identity Not Null,
	CustomerID int Not Null,
	ProductID int Not Null,
	PRIMARY KEY (ID),
	FOREIGN KEY (ProductID) REFERENCES Products(ID) ,
	FOREIGN KEY (CustomerID) REFERENCES Customers(ID) ,

);

Insert Into Orders Values
	(1 ,2),
	(1 ,2),
	(2 ,3),
	(4 ,4),
	(1 ,4)

	;

	--all orders by tina
	Select o.id, c.FirstName from orders o inner join Customers c on o.CustomerID= c.id Where c.FirstName ='Tina';
	--all revenue by iphone
	Select sum(p.Price) From orders o inner join Products p on o.ProductID = p.id where p.ProductName = 'iphone';
	--update tables for iphone prices
	Update Products
	Set Price = 250
	Where ProductName = 'iphone';
