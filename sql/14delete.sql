#14delete.sql

USE w3schools;

SELECT *
FROM Employees
ORDER BY EmployeeID DESC;

# 지우기 전에 꼭!!!! 같은 WHERE 로 SELECT 해보기
DELETE
FROM Employees
WHERE EmployeeID = 1019;

DELETE
FROM Employees
WHERE EmployeeID = 1018;

SELECT *
FROM Employees
ORDER BY EmployeeID DESC;

SELECT *
FROM Employees
WHERE FirstName = 'ㅁㄴㅇ';

# 모든 레코드 지우기 : WHERE 안쓰면 됨
# 매우 주의!!!
SELECT *
FROM Employees;
DELETE
FROM Employees;