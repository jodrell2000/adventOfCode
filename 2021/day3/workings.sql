DROP TABLE IF EXISTS day3;
CREATE TABLE day3
(
    theOrder bigint auto_increment primary key,
    input    char(12) NOT NULL
);

SELECT CONV( CONCAT(
               IF( SUM(IF(SUBSTRING(input FROM 1 FOR 1) = 1, 1, 0)) > SUM(IF(SUBSTRING(input FROM 1 FOR 1) = 0, 1, 0)), 1, 0),
               IF( SUM(IF(SUBSTRING(input FROM 2 FOR 1) = 1, 1, 0)) > SUM(IF(SUBSTRING(input FROM 2 FOR 1) = 0, 1, 0)), 1, 0),
               IF( SUM(IF(SUBSTRING(input FROM 3 FOR 1) = 1, 1, 0)) > SUM(IF(SUBSTRING(input FROM 3 FOR 1) = 0, 1, 0)), 1, 0),
               IF( SUM(IF(SUBSTRING(input FROM 4 FOR 1) = 1, 1, 0)) > SUM(IF(SUBSTRING(input FROM 4 FOR 1) = 0, 1, 0)), 1, 0),
               IF( SUM(IF(SUBSTRING(input FROM 5 FOR 1) = 1, 1, 0)) > SUM(IF(SUBSTRING(input FROM 5 FOR 1) = 0, 1, 0)), 1, 0),
               IF( SUM(IF(SUBSTRING(input FROM 6 FOR 1) = 1, 1, 0)) > SUM(IF(SUBSTRING(input FROM 6 FOR 1) = 0, 1, 0)), 1, 0),
               IF( SUM(IF(SUBSTRING(input FROM 7 FOR 1) = 1, 1, 0)) > SUM(IF(SUBSTRING(input FROM 7 FOR 1) = 0, 1, 0)), 1, 0),
               IF( SUM(IF(SUBSTRING(input FROM 8 FOR 1) = 1, 1, 0)) > SUM(IF(SUBSTRING(input FROM 8 FOR 1) = 0, 1, 0)), 1, 0),
               IF( SUM(IF(SUBSTRING(input FROM 9 FOR 1) = 1, 1, 0)) > SUM(IF(SUBSTRING(input FROM 9 FOR 1) = 0, 1, 0)), 1, 0),
               IF( SUM(IF(SUBSTRING(input FROM 10 FOR 1) = 1, 1, 0)) > SUM(IF(SUBSTRING(input FROM 10 FOR 1) = 0, 1, 0)), 1, 0),
               IF( SUM(IF(SUBSTRING(input FROM 11 FOR 1) = 1, 1, 0)) > SUM(IF(SUBSTRING(input FROM 11 FOR 1) = 0, 1, 0)), 1, 0),
               IF( SUM(IF(SUBSTRING(input FROM 12 FOR 1) = 1, 1, 0)) > SUM(IF(SUBSTRING(input FROM 12 FOR 1) = 0, 1, 0)), 1, 0)
           ), 2, 10) *
       CONV( CONCAT(
               IF( SUM(IF(SUBSTRING(input FROM 1 FOR 1) = 1, 1, 0)) < SUM(IF(SUBSTRING(input FROM 1 FOR 1) = 0, 1, 0)), 1, 0),
               IF( SUM(IF(SUBSTRING(input FROM 2 FOR 1) = 1, 1, 0)) < SUM(IF(SUBSTRING(input FROM 2 FOR 1) = 0, 1, 0)), 1, 0),
               IF( SUM(IF(SUBSTRING(input FROM 3 FOR 1) = 1, 1, 0)) < SUM(IF(SUBSTRING(input FROM 3 FOR 1) = 0, 1, 0)), 1, 0),
               IF( SUM(IF(SUBSTRING(input FROM 4 FOR 1) = 1, 1, 0)) < SUM(IF(SUBSTRING(input FROM 4 FOR 1) = 0, 1, 0)), 1, 0),
               IF( SUM(IF(SUBSTRING(input FROM 5 FOR 1) = 1, 1, 0)) < SUM(IF(SUBSTRING(input FROM 5 FOR 1) = 0, 1, 0)), 1, 0),
               IF( SUM(IF(SUBSTRING(input FROM 6 FOR 1) = 1, 1, 0)) < SUM(IF(SUBSTRING(input FROM 6 FOR 1) = 0, 1, 0)), 1, 0),
               IF( SUM(IF(SUBSTRING(input FROM 7 FOR 1) = 1, 1, 0)) < SUM(IF(SUBSTRING(input FROM 7 FOR 1) = 0, 1, 0)), 1, 0),
               IF( SUM(IF(SUBSTRING(input FROM 8 FOR 1) = 1, 1, 0)) < SUM(IF(SUBSTRING(input FROM 8 FOR 1) = 0, 1, 0)), 1, 0),
               IF( SUM(IF(SUBSTRING(input FROM 9 FOR 1) = 1, 1, 0)) < SUM(IF(SUBSTRING(input FROM 9 FOR 1) = 0, 1, 0)), 1, 0),
               IF( SUM(IF(SUBSTRING(input FROM 10 FOR 1) = 1, 1, 0)) < SUM(IF(SUBSTRING(input FROM 10 FOR 1) = 0, 1, 0)), 1, 0),
               IF( SUM(IF(SUBSTRING(input FROM 11 FOR 1) = 1, 1, 0)) < SUM(IF(SUBSTRING(input FROM 11 FOR 1) = 0, 1, 0)), 1, 0),
               IF( SUM(IF(SUBSTRING(input FROM 12 FOR 1) = 1, 1, 0)) < SUM(IF(SUBSTRING(input FROM 12 FOR 1) = 0, 1, 0)), 1, 0)
           ), 2, 10) AS Answer
FROM day3;

DROP TABLE IF EXISTS day3Oxygen;
CREATE TABLE day3Oxygen
(
    theOrder bigint auto_increment primary key,
    input    char(12) NOT NULL
);

SELECT IF( SUM(IF(SUBSTRING(input FROM 1 FOR 1) = 1, 1, 0)) >= SUM(IF(SUBSTRING(input FROM 1 FOR 1) = 0, 1, 0)), 'delete zero', 'delete one')
from day3Oxygen;
DELETE FROM day3Oxygen WHERE SUBSTRING(input FROM 1 FOR 1) = 1;

SELECT IF( SUM(IF(SUBSTRING(input FROM 2 FOR 1) = 1, 1, 0)) >= SUM(IF(SUBSTRING(input FROM 2 FOR 1) = 0, 1, 0)), 'delete zero', 'delete one')
from day3Oxygen;
DELETE FROM day3Oxygen WHERE SUBSTRING(input FROM 2 FOR 1) = 0;

SELECT IF( SUM(IF(SUBSTRING(input FROM 3 FOR 1) = 1, 1, 0)) >= SUM(IF(SUBSTRING(input FROM 3 FOR 1) = 0, 1, 0)), 'delete zero', 'delete one')
from day3Oxygen;
DELETE FROM day3Oxygen WHERE SUBSTRING(input FROM 3 FOR 1) = 1;

SELECT IF( SUM(IF(SUBSTRING(input FROM 4 FOR 1) = 1, 1, 0)) >= SUM(IF(SUBSTRING(input FROM 4 FOR 1) = 0, 1, 0)), 'delete zero', 'delete one')
from day3Oxygen;
DELETE FROM day3Oxygen WHERE SUBSTRING(input FROM 4 FOR 1) = 1;

SELECT IF( SUM(IF(SUBSTRING(input FROM 5 FOR 1) = 1, 1, 0)) >= SUM(IF(SUBSTRING(input FROM 5 FOR 1) = 0, 1, 0)), 'delete zero', 'delete one')
from day3Oxygen;
DELETE FROM day3Oxygen WHERE SUBSTRING(input FROM 5 FOR 1) = 1;

SELECT IF( SUM(IF(SUBSTRING(input FROM 6 FOR 1) = 1, 1, 0)) >= SUM(IF(SUBSTRING(input FROM 6 FOR 1) = 0, 1, 0)), 'delete zero', 'delete one')
from day3Oxygen;
DELETE FROM day3Oxygen WHERE SUBSTRING(input FROM 6 FOR 1) = 1;

SELECT IF( SUM(IF(SUBSTRING(input FROM 7 FOR 1) = 1, 1, 0)) >= SUM(IF(SUBSTRING(input FROM 7 FOR 1) = 0, 1, 0)), 'delete zero', 'delete one')
from day3Oxygen;
DELETE FROM day3Oxygen WHERE SUBSTRING(input FROM 7 FOR 1) = 0;

SELECT IF( SUM(IF(SUBSTRING(input FROM 8 FOR 1) = 1, 1, 0)) >= SUM(IF(SUBSTRING(input FROM 8 FOR 1) = 0, 1, 0)), 'delete zero', 'delete one')
from day3Oxygen;
DELETE FROM day3Oxygen WHERE SUBSTRING(input FROM 8 FOR 1) = 1;

SELECT IF( SUM(IF(SUBSTRING(input FROM 9 FOR 1) = 1, 1, 0)) >= SUM(IF(SUBSTRING(input FROM 9 FOR 1) = 0, 1, 0)), 'delete zero', 'delete one')
from day3Oxygen;
DELETE FROM day3Oxygen WHERE SUBSTRING(input FROM 9 FOR 1) = 0;

SELECT IF( SUM(IF(SUBSTRING(input FROM 10 FOR 1) = 1, 1, 0)) >= SUM(IF(SUBSTRING(input FROM 10 FOR 1) = 0, 1, 0)), 'delete zero', 'delete one')
from day3Oxygen;
DELETE FROM day3Oxygen WHERE SUBSTRING(input FROM 10 FOR 1) = 0;

SELECT IF( SUM(IF(SUBSTRING(input FROM 11 FOR 1) = 1, 1, 0)) >= SUM(IF(SUBSTRING(input FROM 11 FOR 1) = 0, 1, 0)), 'delete zero', 'delete one')
from day3Oxygen;
DELETE FROM day3Oxygen WHERE SUBSTRING(input FROM 11 FOR 1) = 0;

SELECT IF( SUM(IF(SUBSTRING(input FROM 12 FOR 1) = 1, 1, 0)) >= SUM(IF(SUBSTRING(input FROM 12 FOR 1) = 0, 1, 0)), 'delete zero', 'delete one')
from day3Oxygen;
DELETE FROM day3Oxygen WHERE SUBSTRING(input FROM 12 FOR 1) = 0;

select CONV( input, 2, 10) from day3Oxygen;


DROP TABLE IF EXISTS day3CO2;
CREATE TABLE day3CO2
(
    theOrder bigint auto_increment primary key,
    input    char(12) NOT NULL
);

SELECT IF( SUM(IF(SUBSTRING(input FROM 1 FOR 1) = 1, 1, 0)) >= SUM(IF(SUBSTRING(input FROM 1 FOR 1) = 0, 1, 0)), 'delete one', 'delete zero')
from day3CO2;
DELETE FROM day3CO2 WHERE SUBSTRING(input FROM 1 FOR 1) = 0;

SELECT IF( SUM(IF(SUBSTRING(input FROM 2 FOR 1) = 1, 1, 0)) >= SUM(IF(SUBSTRING(input FROM 2 FOR 1) = 0, 1, 0)), 'delete one', 'delete zero')
from day3CO2;
DELETE FROM day3CO2 WHERE SUBSTRING(input FROM 2 FOR 1) = 0;

SELECT IF( SUM(IF(SUBSTRING(input FROM 3 FOR 1) = 1, 1, 0)) >= SUM(IF(SUBSTRING(input FROM 3 FOR 1) = 0, 1, 0)), 'delete one', 'delete zero')
from day3CO2;
DELETE FROM day3CO2 WHERE SUBSTRING(input FROM 3 FOR 1) = 0;

SELECT IF( SUM(IF(SUBSTRING(input FROM 4 FOR 1) = 1, 1, 0)) >= SUM(IF(SUBSTRING(input FROM 4 FOR 1) = 0, 1, 0)), 'delete one', 'delete zero')
from day3CO2;
DELETE FROM day3CO2 WHERE SUBSTRING(input FROM 4 FOR 1) = 1;

SELECT IF( SUM(IF(SUBSTRING(input FROM 5 FOR 1) = 1, 1, 0)) >= SUM(IF(SUBSTRING(input FROM 5 FOR 1) = 0, 1, 0)), 'delete one', 'delete zero')
from day3CO2;
DELETE FROM day3CO2 WHERE SUBSTRING(input FROM 5 FOR 1) = 1;

SELECT IF( SUM(IF(SUBSTRING(input FROM 6 FOR 1) = 1, 1, 0)) >= SUM(IF(SUBSTRING(input FROM 6 FOR 1) = 0, 1, 0)), 'delete one', 'delete zero')
from day3CO2;
DELETE FROM day3CO2 WHERE SUBSTRING(input FROM 6 FOR 1) = 0;

SELECT IF( SUM(IF(SUBSTRING(input FROM 7 FOR 1) = 1, 1, 0)) >= SUM(IF(SUBSTRING(input FROM 7 FOR 1) = 0, 1, 0)), 'delete one', 'delete zero')
from day3CO2;
DELETE FROM day3CO2 WHERE SUBSTRING(input FROM 7 FOR 1) = 0;

SELECT IF( SUM(IF(SUBSTRING(input FROM 8 FOR 1) = 1, 1, 0)) >= SUM(IF(SUBSTRING(input FROM 8 FOR 1) = 0, 1, 0)), 'delete one', 'delete zero')
from day3CO2;
DELETE FROM day3CO2 WHERE SUBSTRING(input FROM 8 FOR 1) = 0;

select count(*) from day3CO2;

select CONV( o.input, 2, 10) * CONV( i.input, 2, 10)
from day3Oxygen o
join day3CO2 i;
