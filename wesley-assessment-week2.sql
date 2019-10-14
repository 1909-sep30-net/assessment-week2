-- Assessment week 2


--drop table Products
create table Products(
	ID				int					not null	identity		primary key,
	Name			nvarchar(50)		not null,
	Price			money				not null
);

go

create table Orders(
	ID				int					not null	identity		primary key,
	ProductID		int					not null					foreign key		references Products(ID),
	CustomerID		int					not null					foreign key		references Customers(ID)
);

go

create table Customers(
	ID				int					not null	identity		primary key,
	FirstName		nvarchar(50)		not null,
	LastName		nvarchar(50)		not null,
	CardNumber		int					not null
);
go

--create 3 records in each table
insert into Products (Name, Price) values ('Triangle', 10);
insert into Products (Name, Price) values ('Square', 15);
insert into Products (Name, Price) values ('Circle', 5);

insert into Orders (ProductID, CustomerID) values (1, 1);
insert into Orders (ProductID, CustomerID) values (2, 2);
insert into Orders (ProductID, CustomerID) values (3, 3);

insert into Customers(FirstName, LastName, CardNumber) values ('John', 'Smith', 2345678987654321);
insert into Customers(FirstName, LastName, CardNumber) values ('Jane', 'Smith', 1234567898765432);
insert into Customers(FirstName, LastName, CardNumber) values ('Jack', 'Smith', 1234567898754321);


--add product iPhone at $200
insert into Products (Name, Price) values ('iPhone', 200);
--add Customer Tina Smith
insert into Customers(FirstName, LastName, CardNumber) values ('Tina', 'Smith', 9876543212345678);

--add order Tina Smith for iPhone
declare @ProdID int, @CustID int;
select @ProdID = id from Products where name = 'iPhone';
select @CustID = id from Customers where FirstName = 'Tina' and LastName = 'Smith';
insert into Orders(ProductID, CustomerID) values (@ProdID, @CustID);

--all orders from Tina Smith
declare @tina int;
select @tina = id from Customers where FirstName = 'Tina' and LastName = 'Smith';
select * from Orders where id in (select id from Customers where id = @tina);
--select a.* from Orders as a, Customers as b where a.CustomerID = b.ID;

--all revenue for iPhone orders
declare @iphone int;
select @iphone = id from Products where name = 'iPhone';
select sum(price) from Products where id in (select * from Orders where ProductID = @iphone);
--select sum(a.Price) from Products as a where a.ID in (select * from Orders where ProductID = 4);

update Products set Price += 250 where Name  = 'iPhone';