--Assessment 2 Tri
Create Table Products(
	ID Int				NOT NULL, 
	Name nvarchar(30)	NOT NULL, 
	Price Int,
	Primary key(ID)
);

Create Table Customers(
	ID Int					NOT NULL,
	Firstname nvarchar(30)	NOT NULL, 
	Lastname nvarchar(40)	NOT NULL,
	CardNumber Int			NOT NUll, 
	Primary key(ID)
);

Create Table Orders(
	ID Int					NOT NULL,
	ProductID Int,
	CustomerID Int,
	Foreign key (ProductID) References Products(ID),
	Foreign key (CustomerID) References Customers(ID)
);

Select* From Customers;
Select* From Products;
Select* From Orders;

Insert Into Customers(ID, Firstname, Lastname, CardNumber) Values(1, 'Ulric', 'Stormcloak', 100);
Insert Into Customers(ID, Firstname, Lastname, CardNumber) Values(2, 'Rotty', 'Tops', 101);
Insert Into Customers(ID, Firstname, Lastname, CardNumber) Values(3, 'Cloud', 'Strife', 102);
Insert Into Customers(ID, Firstname, Lastname, CardNumber) Values(4, 'Tina', 'Smith', 103);


Insert Into Products(ID, Name, Price) Values(1, 'Sweet Roll', 5);
Insert Into Products(ID, Name, Price) Values(2, 'Sword', 10);
Insert Into Products(ID, Name, Price) Values(3, 'Shield', 15);
Insert Into Products(ID, Name, Price) Values(4, 'iPhone', 200);

Insert Into Orders(ID, ProductID, CustomerID) Values(1, 1, 1);
Insert Into Orders(ID, ProductID, CustomerID) Values(2, 2, 2);
Insert Into Orders(ID, ProductID, CustomerID) Values(3, 3, 3);
Insert Into Orders(ID, ProductID, CustomerID) Values(4, 4, 4);

Update Products
Set Price = Price + 250
Where ID = 4;

Select ID, Firstname, Lastname, Products.ID, Products.Name
From Customers, Products
Where ProductID = CustomerID AND ProductID = Order.ID
