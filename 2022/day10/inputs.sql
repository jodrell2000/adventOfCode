DROP TABLE IF EXISTS puzzleDay10;
CREATE TABLE puzzleDay10 (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, theCycle INT NOT NULL, theChange INT DEFAULT 0);

DROP TABLE IF EXISTS strengths;
CREATE TEMPORARY TABLE strengths
SELECT p1.id, p1.theCycle,
       SUM(p2.theCycle) AS rollingCycle,
       p1.theChange,
       SUM(p2.theChange) AS rollingChange,
       SUM(p2.theChange)*(SUM(p2.theCycle)+1) AS rollingSignal
FROM puzzleDay10 p1
JOIN puzzleDay10 p2 ON p2.id<p1.id
GROUP BY p1.id
ORDER BY p1.id;

set @cycle20=19; set @cycle60=59; set @cycle100=99; set @cycle140=139; set @cycle180=179; set @cycle220=219;
SELECT SUM(rollingSignal) from strengths WHERE rollingCycle IN (@cycle20, @cycle60, @cycle100, @cycle140, @cycle180, @cycle220);
