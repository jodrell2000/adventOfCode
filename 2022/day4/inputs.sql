DROP TABLE IF EXISTS puzzleDay4;
CREATE TABLE puzzleDay4 (id INT NOT NULL AUTO_INCREMENT Primary KEY, elf1 char(10), elf2 char(10));
INSERT INTO puzzleDay4 (elf1, elf2) VALUES
("0-0","0-0"), ("0-0","0-0")....

ALTER TABLE puzzleDay4
    ADD COLUMN elf1Start INT,
    ADD COLUMN elf1End INT,
    ADD COLUMN elf2Start INT,
    ADD COLUMN elf2End INT;

UPDATE puzzleDay4 SET
                      elf1Start = CAST(LEFT(elf1, LOCATE('-', elf1) - 1) AS DECIMAL),
                      elf2Start = CAST(LEFT(elf2, LOCATE('-', elf2) - 1) AS DECIMAL),
                      elf1End = CAST(RIGHT(elf1, (LENGTH(elf1)-LOCATE('-', elf1))) AS DECIMAL),
                      elf2End = CAST(RIGHT(elf2, (LENGTH(elf2)-LOCATE('-', elf2))) AS DECIMAL);

#part1
DROP TABLE IF EXISTS envelopes;
CREATE TEMPORARY TABLE envelopes
SELECT id, IF( ( (elf1Start <= elf2Start) AND (elf1End >= elf2End) ) OR ( (elf1Start >= elf2Start) AND (elf1End <= elf2End) ), 1, 0) AS envelopes
FROM puzzleDay4;
select count(*) from envelopes where envelopes =1;

#part2
DROP TABLE IF EXISTS overlaps;
CREATE TEMPORARY TABLE overlaps
SELECT id, IF(
    ST_AsText(
        ST_Intersection(ST_GeomFromText( CONCAT('LineString(', elf1Start, ' 0, ', elf1End, ' 0)') ),
        ST_GeomFromText( CONCAT('LineString(', elf2Start, ' 0, ', elf2End, ' 0)') )
    )) = "GEOMETRYCOLLECTION EMPTY", 0, 1 ) AS "overlaps"
FROM puzzleDay4;
select count(*) from overlaps where overlaps=1;

