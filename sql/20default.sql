# 20default.sql

USE w3schools;

# DEFAULT : 값을 주지 않을 때의 기본값을 정의
CREATE TABLE my_table13
(
    col1 VARCHAR(10),
    col2 VARCHAR(10) DEFAULT 'abc'
);
INSERT INTO my_table13
    (col1, col2)
VALUES ('qwe', 'zxc');

SELECT *
FROM my_table13;

INSERT INTO my_table13
    (col1)
VALUES ('poi');

DESC my_table13;
INSERT INTO my_table13
    (col2)
VALUES (null);

CREATE TABLE my_table14
(
    col1 INT,
    col2 INT NOT NULL,
    col3 INT          DEFAULT (10),
    col4 INT NOT NULL DEFAULT (10)
);

INSERT INTO my_table14
VALUES (NULL, 1, NULL, DEFAULT);
DESC my_table14;
SELECT *
FROM my_table14;
INSERT INTO my_table14
VALUES (null, 2, DEFAULT, DEFAULT);