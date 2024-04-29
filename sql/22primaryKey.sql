# 22primaryKey.sql

USE w3schools;

# PRIMARY KEY : NOT NULL UNIQUE
CREATE TABLE my_table17
(
    col1 INT,
    col2 INT PRIMARY KEY -- NOT NULL UNIQUE

);
INSERT INTO my_table17
VALUES (1, 1);
INSERT INTO my_table17
VALUES (3, 2);
CREATE TABLE test_table2
(
    col1 INT PRIMARY KEY AUTO_INCREMENT,
    col2 INT
);
INSERT INTO test_table2
    (col2)
VALUES (1);
SELECT *
FROM test_table2;

# 여러 컬럼 조합으로 PRIMARY KEY 제약사항을 줄 수 있음
CREATE TABLE my_table21
(
    col1 INT,
    col2 INT,
    col3 INT,
    PRIMARY KEY (col1, col2)
);

DESC my_table21;

# my_table22 만들기
# PRIMARY KEY
# NOT NULL UNIQUE
# 제약사항 없이

CREATE TABLE my_table22
(
    prime     INT PRIMARY KEY,
    sub_prime INT NOT NULL UNIQUE,
    price     INT NOT NULL
);

DESC Customers;
SELECT *
FROM Customers;
INSERT INTO Customers
    (CustomerID)
VALUES (DEFAULT);