DROP TABLE IF EXISTS puzzleDay6;
CREATE TABLE puzzleDay6 (inputString TEXT);
INSERT INTO puzzleDay6 (inputString) VALUES ("xxxxxxx");

WITH RECURSIVE cte (id, theMarker, distinctCount) AS
                   (
                       SELECT 0, 'xxxx', 0
                       UNION ALL
                       SELECT  id + 1, SUBSTRING(inputString, id + 1, 4), (
                           SELECT COUNT(DISTINCT(theLetter)) FROM (SELECT SUBSTRING(inputString, id + 1, 1) AS theLetter
                                                                   UNION ALL
                                                                   SELECT SUBSTRING(inputString, id + 2, 1) AS theLetter
                                                                   UNION ALL
                                                                   SELECT SUBSTRING(inputString, id + 3, 1) AS theLetter
                                                                   UNION ALL
                                                                   SELECT SUBSTRING(inputString, id + 4, 1) AS theLetter) theLeters
                           ) FROM puzzleDay6, cte WHERE id + 1 < LENGTH(inputString)
                   )
SELECT min(id)+3 from cte where distinctCount=4;

WITH RECURSIVE cte (id, theMarker, distinctCount) AS
                   (
                       SELECT 0, 'xxxxxxxxxxxxxx', 0
                       UNION ALL
                       SELECT  id + 1, SUBSTRING(inputString, id + 1, 14), (
                           SELECT COUNT(DISTINCT(theLetter)) FROM (SELECT SUBSTRING(inputString, id + 1, 1) AS theLetter
                                                                   UNION ALL
                                                                   SELECT SUBSTRING(inputString, id + 2, 1) AS theLetter
                                                                   UNION ALL
                                                                   SELECT SUBSTRING(inputString, id + 3, 1) AS theLetter
                                                                   UNION ALL
                                                                   SELECT SUBSTRING(inputString, id + 4, 1) AS theLetter
                                                                   UNION ALL
                                                                   SELECT SUBSTRING(inputString, id + 5, 1) AS theLetter
                                                                   UNION ALL
                                                                   SELECT SUBSTRING(inputString, id + 6, 1) AS theLetter
                                                                   UNION ALL
                                                                   SELECT SUBSTRING(inputString, id + 7, 1) AS theLetter
                                                                   UNION ALL
                                                                   SELECT SUBSTRING(inputString, id + 8, 1) AS theLetter
                                                                   UNION ALL
                                                                   SELECT SUBSTRING(inputString, id + 9, 1) AS theLetter
                                                                   UNION ALL
                                                                   SELECT SUBSTRING(inputString, id + 10, 1) AS theLetter
                                                                   UNION ALL
                                                                   SELECT SUBSTRING(inputString, id + 11, 1) AS theLetter
                                                                   UNION ALL
                                                                   SELECT SUBSTRING(inputString, id + 12, 1) AS theLetter
                                                                   UNION ALL
                                                                   SELECT SUBSTRING(inputString, id + 13, 1) AS theLetter
                                                                   UNION ALL
                                                                   SELECT SUBSTRING(inputString, id + 14, 1) AS theLetter) theLeters
                       ) FROM puzzleDay6, cte WHERE id + 1 < LENGTH(inputString)
                   )
SELECT min(id)+13 from cte where distinctCount=14;
