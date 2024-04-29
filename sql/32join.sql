# 32join.sql

CREATE DATABASE mydb2;
use mydb2;

CREATE TABLE table1
(
    col_a INT
);
CREATE TABLE table2
(
    col_b INT
);
INSERT INTO table1
    (col_a)
VALUES (1),
       (2),
       (3),
       (4);
SELECT *
FROM table1;
DROP TABLE table1;

INSERT INTO table2
    (col_b)
VALUES (2),
       (2),
       (3),
       (4),
       (5);
SELECT *
FROM table2;

# JOIN
SELECT *
FROM table1
         JOIN table2;

# INNER JOIN : 두 테이블에 모두 있는 값만.
SELECT *
FROM table1
         JOIN table2 ON col_a = col_b;

SELECT *
FROM table1
         JOIN table2
WHERE col_a = col_b;

SELECT col_a, col_b
FROM table1
         NATURAL JOIN table2;

CREATE TABLE table3
(
    col_a INT
);
INSERT INTO table3
    (col_a)
VALUES (1),
       (2),
       (3),
       (4);
CREATE TABLE table4
(
    col_a INT
);
INSERT INTO table4
    (col_a)
VALUES (1),
       (2),
       (3);
DESC table4;
DROP TABLE table4;
SELECT col_a
FROM table3
         NATURAL JOIN table4;
DROP TABLE athletes;
CREATE TABLE athletes
(
    name       VARCHAR(20),
    speciality VARCHAR(20),
    age        INT
);
CREATE TABLE broadcaster
(
    name      VARCHAR(20),
    channel   VARCHAR(20),
    broadcast VARCHAR(40)
);
INSERT INTO athletes
    (name, speciality, age)
VALUES ('강호동', '씨름', 53),
       ('이만기', '씨름', 60),
       ('김동현', '격투기', 42),
       ('추성훈', '격투기', 48);
INSERT INTO broadcaster
    (name, channel, broadcast)
VALUES ('강호동', 'JTBC', '아는 형님'),
       ('김동현', 'TVN', '놀라운 토요일'),
       ('추성훈', 'KBS', '슈퍼맨이 돌아왔다'),
       ('유재석', 'MBC', '놀면 뭐하니');

SELECT *
FROM athletes
         NATURAL JOIN broadcaster;
SELECT athletes.name, speciality, age, channel, broadcast
FROM athletes
         JOIN broadcaster
              ON athletes.name = broadcaster.name;

SELECT *
FROM athletes
         INNER JOIN broadcaster
                    ON athletes.name = broadcaster.name;

SELECT *
FROM athletes
         LEFT OUTER JOIN broadcaster
                         ON athletes.name = broadcaster.name;

SELECT *
FROM athletes
         RIGHT OUTER JOIN broadcaster
                          ON athletes.name = broadcaster.name;

