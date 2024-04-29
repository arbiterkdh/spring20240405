# 26normalization.sql

# Normalization : 정규화(정규형)

# First Normal Form (1NF, 제1정규화,1차정규화)
# 1) 각 행을 유일하게 구분하는 컬럼이 존재한다.
# -> Primary Key(PK) 가 있다.
# 2) 모든 데이터는 원자적으로 저장된다.
# --> 같은 형식의 데이터를 저장하는 여러 컬럼이 있지 않다.
# --> 한 컬럼에 여러 값이 저장되지 않는다.
CREATE DATABASE mydb2;
DROP DATABASE mydb2;
USE mydb1;
CREATE TABLE customer
(
    id         INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(10),
    last_name  VARCHAR(10)
);
INSERT INTO customer
    (first_name, last_name)
VALUES ('heungmin', 'son'),
       ('kangin', 'lee'),
       ('minjae', 'kim');
DROP TABLE customer;
CREATE TABLE phone_number
(
    id           INT AUTO_INCREMENT PRIMARY KEY,
    customer_id  INT,
    phone_number VARCHAR(15),
    FOREIGN KEY (customer_id) REFERENCES customer (id)
);
DROP TABLE phone_number;
DESC phone_number;
INSERT INTO phone_number
    (customer_id, phone_number)
VALUES (1, '1234'),
       (1, '4321'),
       (2, '4321');
SELECT *
FROM phone_number;
SELECT *
FROM customer;
# Second Normal Form (2NF, 제2정규화)

# Third Noraml Form (3NF, 제3정규화)