create table IF NOT EXISTS day1 (
                      theOrder INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                      depth MEDIUMINT UNSIGNED NOT NULL
);

# workings
select d1.theOrder, d1.depth, d2.theOrder, d2.depth, IF(d1.depth<d2.depth, 1, 0) from day1 d1 JOIN day1 d2 ON d1.theOrder=d2.theOrder-1 limit 10;

# answer
select SUM(IF(d1.depth<d2.depth, 1, 0)) as increaseCount from day1 d1 JOIN day1 d2 ON d1.theOrder=d2.theOrder-1;

# 1665, correct