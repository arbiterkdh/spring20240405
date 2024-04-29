# 34join.sql

USE mydb2;

CREATE TABLE table5
(
    col1 INT,
    col2 VARCHAR(3)
);
CREATE TABLE table6
(
    col_a INT,
    col_b VARCHAR(3),
    col_c VARCHAR(3)
);

CREATE TABLE product
(
    id          INT PRIMARY KEY AUTO_INCREMENT,
    name        VARCHAR(10) NOT NULL,
    price       INT         NOT NULL DEFAULT 0,
    category_id INT REFERENCES category (id)
);
CREATE TABLE category
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(10) NOT NULL
);

USE w3schools;

SELECT *
FROM Orders;
SELECT *
FROM OrderDetails;
SELECT *
FROM Employees;
SELECT *
FROM Shippers;

SELECT FirstName, LastName
FROM Orders o
         JOIN Employees e ON o.EmployeeID = e.EmployeeID
WHERE o.OrderID = 10249;

SELECT ShipperName
FROM Orders o
         JOIN Shippers s ON o.ShipperID = s.ShipperID
WHERE OrderID = 10249;

SELECT CustomerName, OrderDate
FROM Customers c
         JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE c.CustomerID = 90
ORDER BY OrderDate;

SELECT *
FROM OrderDetails;

SELECT FirstName, LastName, OrderDate
FROM Employees e
         JOIN Orders o ON e.EmployeeID = o.EmployeeID
WHERE e.EmployeeID = 3
ORDER BY o.OrderDate;