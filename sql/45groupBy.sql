# 45groupBy.sql

USE w3schools;

# 국가별, 상품별 판매 개수 조회 (국가(오름차순), 상품판매수(내림차순) 순 정렬)

SELECT c.Country,
       p.ProductName,
       SUM(Quantity) 판매수
FROM Products p
         JOIN Customers c
         JOIN OrderDetails od
         JOIN Orders o
              ON p.ProductID = od.ProductID
                  AND od.OrderID = o.OrderID
                  AND o.CustomerID = c.CustomerID
GROUP BY c.Country, p.ProductID
ORDER BY c.Country, 판매수 DESC;