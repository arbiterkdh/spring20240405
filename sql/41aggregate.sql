# 41aggregate.sql
USE w3schools;
# aggregate function : 집계함수
# 평균, 합계, 개수, 최댓값, 최솟값

# COUNT : 개수
SELECT COUNT(Notes)
FROM Employees;
SELECT COUNT(DISTINCT Country)
FROM Customers;

# MIN : 최솟값
# MAX : 최댓값

# todo: 멕시코 고객들이 1997년에 소비한 금액은?

SELECT SUM(p.Price * od.Quantity)
FROM Customers c
         JOIN Orders o ON c.CustomerID = o.CustomerID
         JOIN OrderDetails od ON o.OrderID = od.OrderID
         JOIN Products p ON od.ProductID = p.ProductID
WHERE c.Country = 'Mexico'
  AND o.OrderDate LIKE '1997%';