CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Amount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


INSERT INTO Customers (CustomerID, FirstName, LastName) VALUES
(1, 'Alice', 'Brown'),
(2, 'Bob', 'Green'),
(3, 'Charlie', 'White'),
(4, 'Mano', 'Sundar'),
(5, 'Muthu', 'Kumar'),
(6, 'Gowtham', 'Raj'),
(7, 'Kavin', 'Mohan');


SELECT Customers.FirstName, Customers.LastName, Orders.OrderID, Orders.OrderDate, Orders.Amount
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;


SELECT Customers.FirstName, Customers.LastName, Orders.OrderID, Orders.OrderDate, Orders.Amount
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

