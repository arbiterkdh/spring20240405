# 38join.sql
USE mydb2;
CREATE TABLE table7
(
    col1 INT,
    col2 VARCHAR(3)
);

CREATE TABLE table8
(
    cola INT,
    colb VARCHAR(3)
);

CREATE TABLE table9
(
    col3 INT,
    colc INT,
    info VARCHAR(3)
);

INSERT INTO table7
VALUES (1, 'abc'),
       (2, 'def');

INSERT INTO table8
VALUES (1, 'ghi'),
       (2, 'jkl'),
       (3, 'mno');
INSERT INTO table9
VALUES (1, 2, 'pqr'),
       (1, 3, 'stu'),
       (2, 1, 'vwx'),
       (2, 2, 'yza');


USe w3schools;

SELECT DISTINCT ProductName
FROM Products p
         JOIN OrderDetails od
         JOIN Orders o
              ON p.ProductID = od.ProductID AND od.OrderID = o.OrderID
WHERE OrderDate = '1996-07-08'
ORDER BY p.ProductName;

SELECT *
FROM Products
WHERE ProductID = 71;

SELECT DISTINCT CustomerName, Address, OrderDate
FROM Customers c
         JOIN Orders o
         JOIN OrderDetails od
         JOIN Products p
              ON c.CustomerID = o.CustomerID
                  AND o.OrderID = od.OrderID
                  AND od.ProductID = p.ProductID
WHERE ProductName = 'Fløtemysost'
ORDER BY CustomerName, OrderDate;