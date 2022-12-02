DROP TABLE puzzle1Inputs;
create table puzzle1Inputs (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, value INT);

INSERT INTO puzzle1Inputs (value) VALUES ('xxxx'),('xxxx');
CREATE TABLE puzzle1Sums
select
    id, value,
    (select sum(value) as theSum from puzzle1Inputs as running where running.id <= puzzle1Inputs.id) as sum
from puzzle1Inputs
order by id;

DROP TABLE puzzle1Elves;
CREATE TABLE puzzle1Elves (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, rollingSum INT, finalSum INT);

INSERT INTO puzzle1Elves (rollingSum)
SELECT sum FROM puzzle1Sums where value=0 ORDER BY id;

UPDATE puzzle1Elves p1, puzzle1Elves p2
SET p2.finalSum=p2.rollingSum-p1.rollingSum
WHERE p2.id=p1.id+1;

UPDATE puzzle1Elves set finalSum=rollingSum where id=1;

SELECT id, finalSum
FROM puzzle1Elves
WHERE finalSum = (
    SELECT max(finalSum) from puzzle1Elves
    );

CREATE TABLE puzzle1Top3
SELECT id, finalSum
FROM puzzle1Elves
ORDER BY finalSum DESC LIMIT 3;

SELECT SUM(finalSum) from puzzle1Top3;
