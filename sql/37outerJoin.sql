# 37outerJoin.sql

USE mydb2;

SELECT *
FROM athletes;
SELECT *
FROM broadcaster;

SELECT *
FROM athletes a
         LEFT JOIN broadcaster b
                   ON a.name = b.name
WHERE channel IS NOT NULL;

USE w3schools;

SELECT *
FROM Customers;

SELECT c.CustomerName
FROM Orders o
         RIGHT JOIN Customers c
                    ON o.CustomerID = c.CustomerID
WHERE o.OrderID IS NULL;

SELECT DISTINCT CustomerName
FROM Customers c
         JOIN Orders o
              ON c.CustomerID = o.CustomerID
WHERE OrderDate LIKE '1996%'
ORDER BY CustomerName;

SELECT DISTINCT CustomerName
FROM Orders o
         JOIN Customers c
              ON c.CustomerID = o.CustomerID
WHERE OrderDate NOT LIKE '1996%';

INSERT INTO Employees
    (LastName, FirstName)
VALUES ('손', '흥민'),
       ('이', '강인'),
       ('김', '민재');

SELECT LastName, FirstName
FROM Employees e
         LEFT JOIN Orders o
                   ON e.EmployeeID = o.EmployeeID
WHERE o.OrderID IS NULL
ORDER BY e.LastName;