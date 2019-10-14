Drop table Orders
Drop table Products
Drop table Customers
Create table Products(
ID int not null primary key identity (1,1),
Name nvarchar not null,
Price int not null
);

create table Customers(
ID int not null primary key identity(1,1),
Firstname nvarchar not null,
Lastname nvarchar not null,
CardNumber int null
);
create table Orders(
ID int not null primary key identity(1,1),
ProductID int not null foreign key references Products(ID),
CustomerID int not null foreign key references Customers(ID)
);

insert into Products (Name, Price) values 
('Laptop', 500),
('Computer', 500),
('Printer', 500)

insert into Customers (Firstname, Lastname, CardNumber) values
('Marielle', 'Nolasco', 1234),
('Carmina', 'Tible', 1244),
('Carmina', 'Nolasco', 1334)

insert into Orders (ProductID, CustomerID) values 
(1,1),
(2,2),
(3,3)

insert into Products (Name, Price) values
('iPhone', 200)

insert into Customers(Firstname, Lastname) values
('Tina', 'Smith')

insert into Orders (ProductID, CustomerID) values
(4, 4)

Select * from Orders inner join Customers on Orders.CustomerID = Customers.ID where Customers.Firstname = 'Tina' and Customers.Lastname = 'Smith'
Select sum(price) from Orders inner join Products on Orders.ProductID = Products.ID where Products.Name = 'iPhone'
Update Products set Price = 250 where Name = 'iPhone'