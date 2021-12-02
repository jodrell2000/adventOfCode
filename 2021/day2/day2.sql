create table day2Instructions (
    theOrder mediumint unsigned auto_increment primary key,
    direction CHAR(7) not null,
    distance tinyint unsigned not null
);

alter table day2Instructions
add column relativeDistance tinyint not null;

UPDATE day2Instructions d, day2Instructions a
set d.relativeDistance = (if(a.direction="up", (a.distance * -1), a.distance))
where a.theOrder=d.theOrder;

alter table day2Instructions
modify column distance bigint;

SELECT sum(if(direction='forward', relativeDistance, 0)) as horizontal,
       sum(if(direction!='forward', relativeDistance, 0)) as vertical
from day2Instructions;

alter table day2Instructions
add column aimChange int;


# part 2
DROP TABLE if exists day2Part2;
create table day2Part2 (
    theOrder bigint auto_increment primary key,
    direction CHAR(7) not null,
    value bigint not null,
    aimChange bigint default 0,
    horizontalChange bigint default 0,
    runningAim bigint default 0,
    runningHorizontal bigint default 0,
    depthChange bigint default 0,
    runningDepth bigint default 0
);

INSERT INTO day2Part2 (theOrder, direction, value)
select theOrder, direction, distance
from day2Instructions
order by theOrder;

# set aim change
update day2Part2 d1, day2Part2 d2
set d1.aimChange = if(d1.direction = 'up', d1.value * -1, if(d1.direction='down', d1.value, 0))
where d1.theOrder=d2.theOrder-1;

# set runningAim
DROP TABLE IF EXISTS aimChange;
CREATE TABLE aimChange
SELECT d1.theOrder,
       (    select SUM(aimChange)
            from day2Part2
            where theOrder <= d1.theOrder) as runningAim
from day2Part2 d1;

UPDATE day2Part2 d1, aimChange ac
SET d1.runningAim=ac.runningAim
WHERE d1.theOrder=ac.theOrder;

# set horizontal change
UPDATE day2Part2 set horizontalChange = value where direction = 'forward';

DROP TABLE IF EXISTS horizontalChange;
CREATE TABLE horizontalChange
SELECT d1.theOrder,
       (    select SUM(horizontalChange)
            from day2Part2
            where theOrder <= d1.theOrder) as runningHorizontal
from day2Part2 d1;

UPDATE day2Part2 d1, horizontalChange hc
SET d1.runningHorizontal=hc.runningHorizontal
WHERE d1.theOrder=hc.theOrder;

# set depth change
UPDATE day2Part2 set depthChange = if( direction = 'forward', value * runningAim, 0);


DROP TABLE IF EXISTS depthChange;
CREATE TABLE depthChange
SELECT d1.theOrder,
       (    select SUM(depthChange)
            from day2Part2
            where theOrder <= d1.theOrder) as runningDepth
from day2Part2 d1;

UPDATE day2Part2 d1, depthChange dc
SET d1.runningDepth=dc.runningDepth
WHERE d1.theOrder=dc.theOrder;

select runningHorizontal * runningDepth from day2Part2 where theOrder=1000;