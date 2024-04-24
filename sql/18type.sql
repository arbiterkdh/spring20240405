# 18type.sql

USE w3schools;
# 문자열
# VARCHAR(길이)
CREATE TABLE my_table3
(
    name  VARCHAR(3),
    title VARCHAR(5),
    notes VARCHAR(1000)
);
DESC my_table3;
INSERT INTO my_table3
    (name, title, notes)
VALUES ('이강인', '축구선수', '파리생제르망');

INSERT INTO my_table3
    (name, title, notes)
VALUES ('네이마르', '야구선수', '사우디아라비아');

# todo : my_table4
#  책 제목, 책 내용, 저자

CREATE TABLE my_table4
(
    title  varchar(50),
    story  varchar(10000),
    writer varchar(30)
);

DESC my_table4;

INSERT INTO my_table4
    (title, story, writer)
VALUES ('이것이 자바다', 'aewlfuknawelfugbalweikudnmawoir;lgnfaw,lekubfgk,erfnw.aefingrlaieukfni.skj', '신용균, 김자바');

SELECT *
FROM my_table4;

# 수
# 정수 INT
# 실수 DECIMAL, DEC(총 길이, 소수점 이하 길이)
CREATE TABLE my_table5
(
    age    INT,
    height DEC(5, 2)
);
DESC my_table5;
INSERT INTO my_table5
    (age, height)
VALUES (10, 170.25);
SELECT *
FROM my_table5;
INSERT INTO my_table5
    (age, height)
VALUES (11, 180.339);
SELECT *
FROM my_table5;
# todo : 새 테이블 my_table6
#  한 개의 정수 타입 컬럼, 한 개의 실수 타입 컬럼
#  DESC 테이블, 레코드 추가, 조회

CREATE TABLE my_table6
(
    age    INT,
    weight DEC(6, 2)
);

DESC my_table6;

INSERT INTO my_table6
    (age, weight)
VALUES (33, 73.05);

SELECT *
FROM my_table6;

# 날짜(시간)
# DATE : 날짜 (YYYY-MM-DD)
# DATETIME : 날짜시간 (YYYY-MM-DD HH:MM:SS)

CREATE TABLE my_table7
(
    col1 DATE,
    col2 DATETIME
);
DESC my_table7;
INSERT INTO my_table7
    (col1, col2)
VALUES ('2002-08-10', '1999-09-09 22:10:10');
SELECT *
FROM my_table7;

# todo : my_table8 에 두 컬럼(DATE, DATETIME) 정의하고
#  레코드 넣고, 조회


CREATE TABLE my_table8
(
    date      DATE,
    date_time DATETIME
);
DESC my_table8;

INSERT INTO my_table8
    (date, date_time)
VALUES ('2024-04-24', '2024-04-24 11:35:00');

SELECT *
FROM my_table8;

CREATE TABLE my_table9
(
    string_col    VARCHAR(30),
    int_col       INT,
    dec_col       DEC(10, 2),
    date_col      DATE,
    date_time_col DATETIME
);

DESC my_table9;

INSERT INTO my_table9
    (string_col, int_col, dec_col, date_col, date_time_col)
VALUES ('ㅂㄷㅈㅁㄴㅇㅋㅌㅊ', 123, 123.23, '1234-12-12', '2345-12-12 12:12:12');

SELECT *
FROM my_table9;

CREATE TABLE my_table10
(
    title     VARCHAR(30),
    name      VARCHAR(30),
    age       INT,
    price     DEC(10, 3),
    published DATE,
    inserted  DATETIME
);

INSERT INTO my_table10
    (title, name, age, price, published, inserted)
VALUES ('이것이 자바다', '신용권', 40, 23432.223, '1912-12-12', '1923-12-12 12:12:23'),
       ('스프링부트', '홍길동', 50, 2342.123, '2024-01-01', '2024-04-04 12:23:34');

SELECT *
FROM my_table10;