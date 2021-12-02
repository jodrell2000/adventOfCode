create table IF NOT EXISTS day1 (
                      theOrder INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                      depth MEDIUMINT UNSIGNED NOT NULL
);

# part 1
# workings
select d1.theOrder, d1.depth, d2.theOrder, d2.depth, IF(d1.depth<d2.depth, 1, 0) from day1 d1 JOIN day1 d2 ON d1.theOrder=d2.theOrder-1 limit 10;

# answer
select SUM(IF(d1.depth<d2.depth, 1, 0)) as increaseCount from day1 d1 JOIN day1 d2 ON d1.theOrder=d2.theOrder-1;

# 1665, correct

# part 2
# workings
set global sql_mode = 'traditional';
alter table day1 add column theSum mediumint unsigned;

update day1,
    (select d1.theOrder AS sumOrder, d1.depth as d1d, d2.theOrder as d2o, d2.depth as d2d, d3.theOrder as d3o, d3.depth as d3d,
                        SUM(d1.depth+d2.depth+d3.depth) AS threeSum
                            from day1 d1
    JOIN day1 d2 ON d1.theOrder=d2.theOrder-1
    JOIN day1 d3 ON d2.theOrder=d3.theOrder-1
group by d1.theOrder having d1.theOrder=d2.theOrder-1 AND d1.theOrder=d3.theOrder-2
    ) AS theGroups
set day1.theSum = theGroups.threeSum
WHERE day1.theOrder = theGroups.sumOrder;

select SUM(IF(d1.theSum<d2.theSum, 1, 0)) as increaseCount from day1 d1 JOIN day1 d2 ON d1.theOrder=d2.theOrder-1;

# answer 1702 correct