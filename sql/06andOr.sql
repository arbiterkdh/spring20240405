#06andOr.sql
USE w3schools;

# and 여러 조건 만족
# or 하나의 조건만 만족

SELECT *
FROM Products
WHERE ProductName LIKE 'a%'
   OR ProductName LIKE 'c%';

SELECT *
FROM Products
WHERE CategoryID = 1
   OR CategoryID = 3
   OR CategoryID = 5;

SELECT *
FROM Products
WHERE SupplierID = 2
  AND CategoryID = 2
  AND Price > 20;

# WHERE 의 조건을 () 사용해서 우선순위 결정
SELECT *
FROM Products
WHERE SupplierID = 2
  AND (CategoryID = 2
    OR Price > 20);

# todo : 국가가 UK 나 USA 에 있는 고객들 조회
SELECT *
FROM Customers
WHERE Country = 'UK'
   OR Country = 'USA';
# todo : 도시가 Madrid 나 London 에 있는 고객들 조회
SELECT *
FROM Customers
WHERE City = 'Madrid'
   OR City = 'London';
# todo : 1997 년 5 월에 주문한 주문 (Order) 들
SELECT *
FROM Orders
WHERE OrderDate LIKE '1997-05-%';

# 키워드가 customerName, contactName 에 있는 고객들 조회
SELECT *
FROM Customers
WHERE CustomerName LIKE '%be%'
   OR ContactName LIKE '%be%';

SELECT *
FROM Employees;