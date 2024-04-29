# 25database.sql

# 사용할 데이터베이스(스키마) 선택하기
USE w3schools;

SHOW tables;

# 새 데이터베이스 만들기

CREATE DATABASE mydb1;
USE mydb1;
SHOW tables;
CREATE TABLE my_table1
(
    name VARCHAR(3),
    age  INT
);

CREATE DATABASE my_db2;
USE my_db2;

CREATE TABLE my_table1
(
    col1 INT
);
SHOW tables;

