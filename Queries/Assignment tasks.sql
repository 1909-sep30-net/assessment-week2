--Add 3 values to the tables

INSERT INTO app.Customer
VALUES
    ('Kevin', 'McCallister', '1234567891234567'),
    ('John', 'Johnston', '1111111111222222'),
    ('Man', 'Manston', '3333333333444444');
INSERT INTO app.Products
VALUES
    ('Burgers', 2),
    ('Fries', 1),
    ('Soda', 0.50);
INSERT INTO app.Orders
VALUES
    (1,1),
    (1,3),
    (2,1),
    (2,2);

SELECT * FROM app.Customer;
SELECT * FROM app.Orders;
SELECT * FROM app.Products;

--Insert new customer, product, and order

INSERT INTO app.Products
VALUES
    ('iPhone', 200);
INSERT INTO app.Customer
VALUES
    ('Tina', 'Smith', '1010101010101010');
INSERT INTO app.Orders
VALUES
    (4,4);


SELECT * FROM app.Customer;
SELECT * FROM app.Orders;
SELECT * FROM app.Products;

-- Report all orders by Tina Smith
SELECT c.CustomerID, o.ID, c.FirstName, c.Lastname, FROM app.Customer AS c
LEFT JOIN app.Orders as o ON c.CustomerID = o.CustomerID
WHERE c.CustomerID = 4;

-- report all revenue made by iphones

SELECT p.Price, p.ID, p.Name, o.ID FROM app.Products AS p
LEFT JOIN app.Orders as o ON p.ID = o.ProductID
WHERE o.ProductID = 4;

--Change iphone price to 250

UPDATE app.Products
SET Price = 250
WHERE ID = 4;

