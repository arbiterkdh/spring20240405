# 44subQuery.sql

USE w3schools;

# 1행 1열 결과 (scalar)

# todo : 1번 카테고리 상품의 평균가격보다 높은 2번 카테고리 상품명 조회
SELECT Products.ProductName
FROM Products
WHERE CategoryID = 2
  AND Price > (SELECT AVG(Price)
               FROM Products
               WHERE CategoryID = 1);

# 여러행 1열 결과

# todo : 1번 카테고리 상품들이 주문된 날짜들 조회
SELECT Orders.OrderDate
FROM Orders
WHERE OrderID IN (SELECT OrderID
                  FROM OrderDetails
                  WHERE ProductID IN (SELECT ProductID
                                      FROM Products
                                      WHERE CategoryID = 1));

SELECT o.OrderDate
FROM Orders o
         JOIN OrderDetails od ON o.OrderID = od.OrderID
         JOIN Products p ON od.ProductID = p.ProductID
WHERE CategoryID = 1;


# 여러행 여러열 결과


# 상관서브쿼리 (속도가 느림, JOIN 으로 해결 가능한지 고민)
# 외부쿼리의 값이 내부 쿼리에 사용될 때

# 각 고객의 주문 횟수
SELECT CustomerName,
       Country,
       (SELECT COUNT(OrderID)
        FROM Orders o
        WHERE c.CustomerID = o.CustomerID) AS OrderCount
FROM Customers c;

SELECT c.CustomerName, c.Country, COUNT(o.OrderID) AS OrderCount
FROM Customers c
         LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID;

# todo : 상품별 총 매출금액

SELECT p.ProductName, SUM(Quantity) * Price
FROM Products p
         JOIN OrderDetails od
         JOIN Orders o
              ON p.ProductID = od.ProductID
                  AND od.OrderID = o.OrderID
GROUP BY p.ProductID;

# todo : 직원별 매출액

SELECT e.LastName, e.FirstName, SUM(od.Quantity * p.Price)
FROM Employees e
         JOIN OrderDetails od
         JOIN Products p
         JOIN Orders o
              ON e.EmployeeID = o.EmployeeID
                  AND o.OrderID = od.OrderID
                  AND od.ProductID = p.ProductID
GROUP BY e.LastName, e.FirstName;

# todo : 1997년 7월 기준 고객별 소비금액을 금액이 높은 순서로 조회

SELECT c.CustomerName, SUM(od.Quantity * p.Price) 소비금액
FROM Customers c
         JOIN Products p
         JOIN OrderDetails od
         JOIN Orders o
              ON p.ProductID = od.ProductID
                  AND od.OrderID = o.OrderID
                  AND c.CustomerID = o.CustomerID
WHERE OrderDate LIKE '1997-07%'
GROUP BY CustomerName
ORDER BY 소비금액 DESC;

