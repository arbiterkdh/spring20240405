# 39union.sql

# (INNER) JOIN
# LEFT (OUTER) JOIN
# RIGHT (OUTER) JOIN
# FULL (OUTER) JOIN -> mariadb 에는 없다

# UNION
USE mydb2;

CREATE TABLE table10
(
    col1 INT
);

CREATE TABLE table11
(
    col_a INT
);

INSERT INTO table10
VALUES (3),
       (4),
       (4),
       (5);
INSERT INTO table11
VALUES (3),
       (4),
       (7);
SELECT *
FROM table10
UNION
SELECT *
FROM table11;

SELECT *
FROM table10
         LEFT JOIN table11 ON col1 = col_a
UNION
SELECT *
FROM table10
         RIGHT JOIN table11 ON col1 = col_a;

SELECT a.name, speciality, age, channel, broadcast
FROM athletes a
         LEFT JOIN broadcaster b ON a.name = b.name
UNION
SELECT b.name, speciality, age, channel, broadcast
FROM broadcaster b
         LEFT JOIN athletes a ON b.name = a.name;