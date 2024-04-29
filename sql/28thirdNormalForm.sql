# 28thirdNormalForm.sql

# ThirdNormalForm (3NF)

# 1) 2NF 이다.
# 2) 키가 아닌 컬럼들끼리 종속되면 안됨.

USE mydb1;

DROP TABLE customer;
DROP TABLE customer_benefit;
DROP TABLE phone_number;
CREATE TABLE customer
(
    id         INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(10),
    last_name  VARCHAR(10),
    level      INT,
    benefit    VARCHAR(100)
);
INSERT INTO customer
    (first_name, last_name, level)
VALUES ('heungmin', 'son', 1),
       ('kangin', 'lee', 1),
       ('hasung', 'kim', 2),
       ('jeonghoo', 'lee', 2),
       ('steve', 'rogers', 3);

CREATE TABLE customer
(
    id         INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(10),
    last_name  VARCHAR(10),
    level      INT,
    FOREIGN KEY (level) REFERENCES customer_benefit (level)
);
CREATE TABLE customer_benefit
(
    level   INT PRIMARY KEY,
    benefit VARCHAR(100)
);
INSERT INTO customer_benefit
    (level, benefit)
VALUES (1, '무료배송'),
       (2, '할인'),
       (3, '라운지');