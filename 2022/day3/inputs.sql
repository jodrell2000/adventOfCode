DROP TABLE IF EXISTS puzzle3Inputs;
CREATE TABLE puzzle3Inputs (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, fullString char(100), leftString char(50), rightString char(50));

INSERT INTO puzzle3Inputs (fullString) VALUES ("xxxxx"),(...);
UPDATE puzzle3Inputs SET
                         leftString=LEFT(fullString, LENGTH(fullString)/2),
                         rightString=RIGHT(fullString, LENGTH(fullString)/2);

# part 1
SELECT SUM(if(ascii(letter)>=97, ascii(letter)-96, ascii(letter)-38)) AS part1 FROM (
                                                           WITH RECURSIVE cte (id, n, letter) AS (
                                                               SELECT id, 1, SUBSTRING(leftString, 1, 1)
                                                               FROM puzzle3Inputs

                                                               UNION ALL

                                                               SELECT id, n + 1, SUBSTRING(leftString, n+1, 1)
                                                               FROM puzzle3Inputs JOIN cte USING (id)
                                                               WHERE n < LENGTH(leftString)
                                                           )
                                                           SELECT DISTINCT id, letter
                                                           FROM puzzle3Inputs JOIN cte USING (id)
                                                           WHERE LOCATE(letter, CAST(rightString as binary))
                                                           ORDER BY id
                                                       ) dt;

# part 2
DROP TABLE IF EXISTS theGroups;
CREATE TABLE theGroups (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, pack1 char(100), pack2 char(100), pack3 char(100), 12common char(50), 123common char(1));


SELECT p.id, ceil(p.id/3), fullString
FROM puzzle3Inputs p
ORDER BY ceil(p.id/3);


INSERT INTO theGroups (id, pack1)
SELECT ceil(p.id/3), fullString
FROM puzzle3Inputs p
WHERE RIGHT(CAST(floor((p.id/3)*10) AS CHAR), 1)=3;

UPDATE theGroups tg, puzzle3Inputs p
SET tg.pack2 = p.fullString
WHERE RIGHT(CAST(floor((p.id / 3) * 10) AS CHAR), 1) = 6
  AND tg.id=ceil(p.id/3);

UPDATE theGroups tg, puzzle3Inputs p
SET tg.pack3 = p.fullString
WHERE RIGHT(CAST(floor((p.id / 3) * 10) AS CHAR), 1) = 0
  AND tg.id=ceil(p.id/3);

DROP TABLE IF EXISTS 12common;
CREATE TEMPORARY TABLE 12common
SELECT id, GROUP_CONCAT(letter SEPARATOR '') AS part1
FROM (WITH RECURSIVE cte (id, n, letter) AS (SELECT id, 1, SUBSTRING(pack1, 1, 1)
                                             FROM theGroups

                                             UNION ALL

                                             SELECT id, n + 1, SUBSTRING(pack1, n + 1, 1)
                                             FROM theGroups
                                                      JOIN cte USING (id)
                                             WHERE n < LENGTH(pack1))
      SELECT DISTINCT id, CAST(letter as BINARY) AS letter
      FROM theGroups
               JOIN cte USING (id)
      WHERE LOCATE(letter, CAST(pack2 as binary))
      ORDER BY id) dt
GROUP BY id;

UPDATE theGroups tg, 12common c
SET tg.12common=c.part1
WHERE tg.id=c.id;

DROP TABLE IF EXISTS 123common;
CREATE TEMPORARY TABLE 123common
SELECT id, GROUP_CONCAT(letter SEPARATOR '') AS part1
FROM (WITH RECURSIVE cte (id, n, letter) AS (SELECT id, 1, SUBSTRING(12common, 1, 1)
                                             FROM theGroups

                                             UNION ALL

                                             SELECT id, n + 1, SUBSTRING(12common, n + 1, 1)
                                             FROM theGroups
                                                      JOIN cte USING (id)
                                             WHERE n < LENGTH(12common))
      SELECT DISTINCT id, CAST(letter as BINARY) AS letter
      FROM theGroups
               JOIN cte USING (id)
      WHERE LOCATE(letter, CAST(pack3 as binary))
      ORDER BY id) dt
GROUP BY id;

UPDATE theGroups tg, 123common c
SET tg.123common=c.part1
WHERE tg.id=c.id;

SELECT SUM(if(ascii(123common)>=97, ascii(123common)-96, ascii(123common)-38))
FROM theGroups;
