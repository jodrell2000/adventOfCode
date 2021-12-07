drop table if exists day6Inputs;
create table day6Inputs
(
    startNumber tinyint unsigned not null default 0,
    startCycle bigint unsigned not null default 0
);
truncate day6Inputs;
insert into day6Inputs (startNumber) values (0);
insert into day6Inputs (startNumber) values (3),(4),(3),(1),(2);
insert into day6Inputs (startNumber) values (4),(3),(4),(5),(2),(1),(1),(5),(5),(3),(3),(1),(5),(1),(4),(2),(2),(3),(1),(5),(1),(4),(1),(2),(3),(4),(1),(4),(1),(5),(2),(1),(1),(3),(3),(5),(1),(1),(1),(1),(4),(5),(1),(2),(1),(2),(1),(1),(1),(5),(3),(3),(1),(1),(1),(1),(2),(4),(2),(1),(2),(3),(2),(5),(3),(5),(3),(1),(5),(4),(5),(4),(4),(4),(1),(1),(2),(1),(3),(1),(1),(4),(2),(1),(2),(1),(2),(5),(4),(2),(4),(2),(2),(4),(2),(2),(5),(1),(2),(1),(2),(1),(4),(4),(4),(3),(2),(1),(2),(4),(3),(5),(1),(1),(3),(4),(2),(3),(3),(5),(3),(1),(4),(1),(1),(1),(1),(2),(3),(2),(1),(1),(5),(5),(1),(5),(2),(1),(4),(4),(4),(3),(2),(2),(1),(2),(1),(5),(1),(4),(4),(1),(1),(4),(1),(4),(2),(4),(3),(1),(4),(1),(4),(2),(1),(5),(1),(1),(1),(3),(2),(4),(1),(1),(4),(1),(4),(3),(1),(5),(3),(3),(3),(4),(1),(1),(3),(1),(3),(4),(1),(4),(5),(1),(4),(1),(2),(2),(1),(3),(3),(5),(3),(2),(5),(1),(1),(5),(1),(5),(1),(4),(4),(3),(1),(5),(5),(2),(2),(4),(1),(1),(2),(1),(2),(1),(4),(3),(5),(5),(2),(3),(4),(1),(4),(2),(4),(4),(1),(4),(1),(1),(4),(2),(4),(1),(2),(1),(1),(1),(1),(1),(1),(3),(1),(3),(3),(1),(1),(1),(1),(3),(2),(3),(5),(4),(2),(4),(3),(1),(5),(3),(1),(1),(1),(2),(1),(4),(4),(5),(1),(5),(1),(1),(1),(2),(2),(4),(1),(4),(5),(2),(4),(5),(2),(2),(2),(5),(4),(4);

DROP TABLE IF EXISTS day6Reset;
create table day6Reset ( currentValue tinyint unsigned not null, newValue tinyint unsigned not null);
insert into day6Reset (currentValue, newValue) values (0,6),(0,8),(1,0),(2,1),(3,2),(4,3),(5,4),(6,5),(7,6),(8,7);

WITH RECURSIVE cte AS
(
  SELECT startNumber as timer FROM day6Inputs
),
spawn AS (
  SELECT 80 as daysRemaining,
         timer
  FROM   cte
  UNION ALL
  SELECT daysRemaining - 1,
         d.newValue
  FROM   spawn
         join day6Reset d ON timer=d.currentValue
  WHERE  daysRemaining > 0
)
SELECT count(*) FROM spawn
WHERE    daysRemaining = 0;
