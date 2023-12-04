CREATE DATABASE IF NOT EXISTS adventOfCode2023;

CREATE TABLE IF NOT EXISTS adventOfCode2023.inputs2Pulls (
    gameNum INT,
    pullNum INT,
    greenCount INT DEFAULT 0,
    blueCount INT DEFAULT 0,
    redCount INT DEFAULT 0
);


Game 1: 
4 green, 2 blue; 
1 red, 1 blue, 4 green; 
3 green, 4 blue, 1 red; 
7 green, 2 blue, 4 red; 
3 red, 7 green; 
3 red, 3 green

Game 2: 
1 blue, 11 red, 1 green; 
3 blue, 2 red, 4 green; 
11 red, 2 green, 2 blue; 
13 green, 5 red, 1 blue; 
4 green, 8 red, 3 blue


1, 1, 4, 3, 0
1, 2, 4, 1, 1
1, 3, 3, 4, 1
1, 4, 7, 2, 4
1, 5, 7, 0, 3
1, 6, 3, 0, 3
2, 1, 1, 1, 11
2, 1, 4, 3, 2
2, 1, 2, 2, 11
2, 1, 13, 1, 5
2, 1, 4, 3, 8

CREATE TABLE rawData (
    game VARCHAR(128),
    data VARCHAR(1000)
);

LOAD DATA INFILE '/usr/local/mysql/inputs.txt'
INTO TABLE rawData
FIELDS TERMINATED BY ':'
LINES TERMINATED BY '\n'
(@game, @data)
SET game = TRIM(@game), data = TRIM(@data);

DELIMITER //

CREATE PROCEDURE insertDataFromFile()
BEGIN
    DECLARE gameVar VARCHAR(255);
    DECLARE dataVar VARCHAR(255);
    DECLARE gameNum INT;
    DECLARE pullNum INT;
    DECLARE colorCounts VARCHAR(255);
    DECLARE greenCount INT;
    DECLARE blueCount INT;
    DECLARE redCount INT;

    DECLARE done INT DEFAULT FALSE;
    DECLARE cur CURSOR FOR SELECT game, data FROM rawData;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO gameVar, dataVar;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Extract game and pull numbers
        SET gameVar = TRIM(BOTH ' ' FROM gameVar);
        SET gameNum = CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(gameVar, ' ', -1), ':', -1) AS UNSIGNED);
        SET pullNum = CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(gameVar, ' ', 2), ':', -1) AS UNSIGNED);

        -- Extract color counts using regular expression
        SET colorCounts = TRIM(BOTH ';' FROM dataVar);
        SET greenCount = CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(colorCounts, 'green', 1), ',', -1) AS SIGNED);
        SET blueCount = CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(colorCounts, 'blue', 1), ',', -1) AS SIGNED);
        SET redCount = CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(colorCounts, 'red', 1), ',', -1) AS SIGNED);

        -- Insert into the table
        INSERT INTO inputs2Pulls (gameNum, pullNum, greenCount, blueCount, redCount) VALUES (gameNum, pullNum, greenCount, blueCount, redCount);
    END LOOP;

    CLOSE cur;
END //

DELIMITER ;

CALL insertDataFromFile();
