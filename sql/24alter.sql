# 24alter.sql

USE w3schools;

# ALTER TABLE : 테이블 구조 변경

# 컬럼 추가
CREATE TABLE my_table23
(
    name VARCHAR(3),
    age  INT
);
INSERT INTO my_table23
VALUES ('son', 31),
       ('lee', 23);
ALTER TABLE my_table23
    ADD COLUMN address VARCHAR(100);
ALTER TABLE my_table23
    ADD COLUMN price DEC(10, 3) NOT NULL;
ALTER TABLE my_table23
    ADD COLUMN birth DATETIME NOT NULL;
DESC my_table23;
SELECT *
FROM my_table23;

# 컬럼 삭제 (주의!!)
ALTER TABLE my_table23
    DROP COLUMN birth;
ALTER TABLE my_table23
    DROP city;

# 컬럼 변경
#    이름변경
ALTER TABLE my_table23
    RENAME COLUMN address TO town;

# 자료형 변경
ALTER TABLE my_table23
    MODIFY COLUMN price DEC(20, 2);
ALTER TABLE my_table23
    MODIFY COLUMN name VARCHAR(30);
DESC my_table23;

# 타입변경시 주의할 점 : 데이터를 잃어버리지 않도록 해야함
INSERT INTO my_table23
    (name)
VALUES ('awerwerffawewgwe');
ALTER TABLE my_table23
    MODIFY COLUMN name VARCHAR(3);

# 제약사항 변경
DESC my_table23;

ALTER TABLE my_table23
    MODIFY COLUMN name VARCHAR(20) NOT NULL UNIQUE;
ALTER TABLE my_table23
    MODIFY COLUMN age INT(11) NOT NULL UNIQUE;

# UNIQUE 제약사항 삭제하기
SHOW index FROM my_table23;
ALTER TABLE my_table23
    DROP INDEX name_2;

# NOT NULL 추가
SELECT *
FROM my_table23;
ALTER TABLE my_table23
    MODIFY COLUMN town VARCHAR(100) NOT NULL;
DESC my_table23;

# DEFAULT 제약사항 추가/삭제
ALTER TABLE my_table23
    MODIFY COLUMN name VARCHAR(20) DEFAULT 'nobody';
INSERT INTO my_table23
    (age, town, price)
VALUES (300, '조선', 999999.99);

ALTER TABLE my_table23
    MODIFY COLUMN age INT DEFAULT 1;

ALTER TABLE my_table23
    MODIFY COLUMN town VARCHAR(100) DEFAULT 'unknown place';

# PRIMARY KEY 제약 사항 추가 / 삭제
DESC my_table23;
ALTER TABLE my_table23
    MODIFY name VARCHAR(20) DEFAULT 'nobody';
ALTER TABLE my_table23
    ADD PRIMARY KEY (name);
ALTER TABLE my_table23
    DROP PRIMARY KEY;