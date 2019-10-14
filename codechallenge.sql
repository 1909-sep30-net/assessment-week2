Insert Into Products (Name, Price) Values ('Book', $10), ('Magazine', $5), ('DVD', $15)
Insert Into Customers (Firstname, Lastname, CardNumber) Values 
	('Sam', 'Smith', '1111-1111-1111-1111'),
	('Robert', 'Jackson', '1111-1112-1111-1111'),
	('Sarah', 'Moore', '1111-1113-1111-1111')
Insert Into Orders (ProductID, CustomerID) Values (1,2),(2,1),(3,3)

Insert Into Products (Name, Price) Values ('IPhone', $200)

Insert Into Customers (Firstname, Lastname, CardNumber) Values 
	('Tina', 'Smith', '1111-1114-1111-1111')

Insert Into Orders (ProductID, CustomerID) Values (4,4)

Select * From Orders as o 
	Inner Join Customers as c On o.CustomerID = c.CustomerID
	Inner Join Products as p ON o.ProductID = p.ProductID
	Where c.Firstname = 'Tina' AND c.Lastname = 'Smith'

Select Sum(Price) From Products as p 
	Inner Join Orders as o ON p.ProductID = o.ProductID
Where p.Name = 'IPhone'
Group By p.ProductID

Update Products Set Price = $250
	Where Name = 'IPhone'

Create Table Customers (
	CustomerID INT NOT NULL Identity Primary Key,
	Firstname NVARCHAR(30) NOT NULL,
	Lastname NVARCHAR(30) NOT NULL,
	CardNumber NVARCHAR(50) NOT NULL
)

Create Table Products (
	ProductID INT NOT NULL Identity Primary Key,
	Name NVARCHAR(20) NOT NULL,
	Price Money NOT NULL
)

Create Table Orders (
	ID INT NOT NULL Identity Primary Key,
	ProductID INT NOT NULL Foreign Key References Products(ProductID),
	CustomerID INT NOT NULL Foreign Key References Customers(CustomerID)
)




