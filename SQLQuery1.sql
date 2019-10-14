CREATE DATABASE PhoneStore

CREATE TABLE Orders
(ID INT PRIMARY KEY,
 ProductID INT, 
 CustomerID INT) 


 CREATE TABLE Customers
 (ID INT PRIMARY KEY ,
 FirstName VARCHAR(50) NOT NULL,
 LastName VARCHAR(50) NOT NULL,
 CardNumber INT not null)

 CREATE TABLE Products
 (ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Price decimal(18,0))

  INSERT INTO Orders
  VALUES(1000,1234,0001)
  VALUES(2000,1235,0002)
  VALUES(3000,1236,0003)

  INSERT INTO Products
  VALUES(1000,Iphone,800)
  INSERT INTO Products
  VALUES(1001,Samsung,700)
  INSERT INTO Products
  VALUES(,Nokia,500)

  INSERT INTO Customers
  VALUES(1010,'Amina', 'Ndoye', 0001)
  INSERT INTO Customers
  VALUES( 1011,'Mouhamed', 'Ndiaye', 0002)
  INSERT INTO Customers
  VALUES(3000,'Abdou', 'Ndiaye', 0003)

  INSERT INTO Customers
  VALUES(1012,'Tina', 'Smith',0009)
