#12page.sql
USE w3schools;

INSERT INTO Employees
    (LastName, FirstName, BirthDate, Photo, Notes)
SELECT LastName, FirstName, BirthDate, Photo, Notes
FROM Employees;

SELECT COUNT(*)
FROM Employees;

SELECT *
FROM Employees;