#13insert.sql

USE w3schools;

# INSERT INTO 테이블명 (컬럼명...)
# VALUES (데이터들..)

SELECT *
FROM Employees
ORDER BY EmployeeID DESC;

DESC Employees;

INSERT INTO Employees(LastName)
VALUES ('ironman');

INSERT INTO Employees (FirstName)
VALUES ('tony');

INSERT INTO Employees
    (LastName, FirstName, BirthDate, Photo, Notes)
VALUES ('captain', 'steve', '1990-01-01', 'pic1', 'america');

INSERT INTO Employees (FirstName, LastName)
VALUES ('natasha', 'widow');

# todo : 새 고객을 2개 입력하세요.


DESC Customers;

SELECT *
FROM Customers
ORDER BY CustomerID DESC;

INSERT INTO Customers(CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('백예린', 'Baek', '내마음속', 'Seoul', '123-123', '천국');

INSERT INTO Customers(CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('강동현', '킹갓왕동현', '미아동', '서울', '안알랴줌', '한국');
# null : 값이 없음

CREATE DATABASE prac0516;

USE prac0516;

CREATE TABLE kdh
(
    id     INT PRIMARY KEY AUTO_INCREMENT,
    singer VARCHAR(50)  NOT NULL,
    song   VARCHAR(100) NOT NULL
);

SELECT *
FROM kdh;