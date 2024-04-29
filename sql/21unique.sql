# 21unique.sql

USE w3schools;

# UNIQUE : 다른 레코드의 컬럼 값이 중복되지 않음
CREATE TABLE my_table15
(
    col1 VARCHAR(3),
    col2 VARCHAR(3) UNIQUE
);
INSERT INTO my_table15
VALUES ('asd', 'asd');
INSERT INTO my_table15
VALUES ('asd', NULL);
INSERT INTO my_table15
VALUES (null, null);
SELECT *
FROM my_table15;
CREATE TABLE test_table
(
    col1 VARCHAR(3) DEFAULT 'qwe'
);
INSERT INTO test_table
VALUES (DEFAULT);
INSERT INTO test_table
VALUES (DEFAULT);
SELECT *
FROM test_table;
CREATE TABLE test_table1
(
    col1 VARCHAR(3) DEFAULT 'asd' UNIQUE
);
INSERT INTO test_table1
VALUES (DEFAULT);
DESC test_table1;
SELECT *
FROM test_table1;
INSERT INTO test_table1
VALUES (NULL);

CREATE TABLE my_table16
(
    col1 INT,
    col2 VARCHAR(3) UNIQUE,
    col3 VARCHAR(3) NOT NULL UNIQUE
);

INSERT INTO my_table16
VALUES (3, 'asd', 'asd');
SELECT *
FROM my_table16;
INSERT INTO my_table16
VALUES (4, '', 'qwe');
DESC my_table16;