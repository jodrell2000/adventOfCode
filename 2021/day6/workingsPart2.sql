WITH RECURSIVE
    cte AS
        (
            SELECT startNumber as timer
            FROM day6Inputs
        ),
    spawn1 AS (
        SELECT 256 as daysRemaining,
               timer
        FROM cte
        UNION ALL
        SELECT daysRemaining - 1,
               d.newValue
        FROM spawn1
                 join day6Reset d ON timer = d.currentValue
        WHERE daysRemaining > 192
    ),
    slice2 AS (
        SELECT daysRemaining, timer, COUNT(*) as theCount
        FROM spawn1
        GROUP BY daysRemaining, timer
    ),
    spawn2 AS (
        SELECT * FROM slice2
        UNION ALL
        SELECT daysRemaining - 1,
               d.newValue,
               theCount
        FROM spawn2
                 join day6Reset d ON timer = d.currentValue
        WHERE daysRemaining > 128 AND daysRemaining <= 192
    ),
    slice3 AS (
        SELECT daysRemaining, timer, sum(theCount) as theCount
        FROM spawn2
        GROUP BY daysRemaining, timer
    ),
    spawn3 AS (
        SELECT * FROM slice3
        UNION ALL
        SELECT daysRemaining - 1,
               d.newValue,
               theCount
        FROM spawn3
                 join day6Reset d ON timer = d.currentValue
        WHERE daysRemaining > 64 AND daysRemaining <= 128
    ),
    slice4 AS (
        SELECT daysRemaining, timer, sum(theCount) as theCount
        FROM spawn3
        GROUP BY daysRemaining, timer
    ),
    spawn4 AS (
        SELECT * FROM slice4
        UNION ALL
        SELECT daysRemaining - 1,
               d.newValue,
               theCount
        FROM spawn4
                 join day6Reset d ON timer = d.currentValue
        WHERE daysRemaining > 0 AND daysRemaining <= 64
    )
SELECT sum(theCount)
FROM spawn4
WHERE daysRemaining = 0;
