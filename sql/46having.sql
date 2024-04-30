# 46having.sql

USE w3schools;


# HAVING : 집계함수의 조건절

# 상품수가 10개 이상인 카테고리
SELECT *
FROM (SELECT CategoryID, COUNT(ProductID) 상품수
      FROM Products
      GROUP BY CategoryID) c
WHERE c.상품수 >= 10;

SELECT CategoryID, COUNT(ProductID) 상품수
FROM Products
GROUP BY CategoryID
HAVING 상품수 >= 10;

# 고객이 5명 이상있는 국가들 조회
SELECT c.Country, COUNT(c.Country) 국가별고객수
FROM Customers c
GROUP BY c.Country
HAVING 국가별고객수 >= 5;

# 97년 7월 매출액(SUM(상품가격 * 개수))이 10000달러 이상인 직원들 조회

SELECT e.FirstName,
       e.LastName,
       SUM(p.Price * od.Quantity) 매출액
FROM Employees e
         JOIN Orders o
         JOIN OrderDetails od
         JOIN Products p
              ON e.EmployeeID = o.EmployeeID
                  AND o.OrderID = od.OrderID
                  AND od.ProductID = p.ProductID
WHERE OrderDate
          LIKE '1997-07%'
GROUP BY e.EmployeeID
HAVING 매출액 >= 10000;


SELECT c.CustomerName, SUM(p.Price * od.Quantity) purchase
FROM Products p
         JOIN OrderDetails od
         JOIN Orders o
         JOIN Customers c
              ON p.ProductID = od.ProductID
                  AND od.OrderID = o.OrderID
                  AND o.CustomerID = c.CustomerID
WHERE o.OrderDate LIKE '1997-07-%'
GROUP BY c.CustomerName
ORDER BY purchase DESC;
