ALTER TABLE adventOfCode2023.inputs1
add column newFirstDigit INT,
add column newLastDigit INT,
add column newCombinedNumber INT;

ALTER TABLE adventOfCode2023.inputs1
    ADD COLUMN firstPosition INT DEFAULT NULL,
    ADD COLUMN lastPosition INT DEFAULT NULL;

ALTER TABLE adventOfCode2023.inputs1
    ADD COLUMN one INT DEFAULT NULL,
    ADD COLUMN two INT DEFAULT NULL,
    ADD COLUMN three INT DEFAULT NULL,
    ADD COLUMN four INT DEFAULT NULL,
    ADD COLUMN five INT DEFAULT NULL,
    ADD COLUMN six INT DEFAULT NULL,
    ADD COLUMN seven INT DEFAULT NULL,
    ADD COLUMN eight INT DEFAULT NULL,
    ADD COLUMN nine INT DEFAULT NULL;

# example data
INSERT INTO  adventOfCode2023.inputs1 (inputString) VALUES ("two1nine"),("eightwothree"),("abcone2threexyz"),("xtwone3four"),("4nineeightseven2"),("zoneight234"),("7pqrstsixteen");

UPDATE adventOfCode2023.inputs1 SET one = LEAST(IF(REGEXP_INSTR(inputString, "one" )=0, 1000, REGEXP_INSTR(inputString, "one" )), IF(REGEXP_INSTR(inputString, "1" )=0, 1000, REGEXP_INSTR(inputString, "1" )));
UPDATE adventOfCode2023.inputs1 SET two = LEAST(IF(REGEXP_INSTR(inputString, "two" )=0, 1000, REGEXP_INSTR(inputString, "two" )), IF(REGEXP_INSTR(inputString, "2" )=0, 1000, REGEXP_INSTR(inputString, "2" )));
UPDATE adventOfCode2023.inputs1 SET three = LEAST(IF(REGEXP_INSTR(inputString, "three" )=0, 1000, REGEXP_INSTR(inputString, "three" )), IF(REGEXP_INSTR(inputString, "3" )=0, 1000, REGEXP_INSTR(inputString, "3" )));
UPDATE adventOfCode2023.inputs1 SET four = LEAST(IF(REGEXP_INSTR(inputString, "four" )=0, 1000, REGEXP_INSTR(inputString, "four" )), IF(REGEXP_INSTR(inputString, "4" )=0, 1000, REGEXP_INSTR(inputString, "4" )));
UPDATE adventOfCode2023.inputs1 SET five = LEAST(IF(REGEXP_INSTR(inputString, "five" )=0, 1000, REGEXP_INSTR(inputString, "five" )), IF(REGEXP_INSTR(inputString, "5" )=0, 1000, REGEXP_INSTR(inputString, "5" )));
UPDATE adventOfCode2023.inputs1 SET six = LEAST(IF(REGEXP_INSTR(inputString, "six" )=0, 1000, REGEXP_INSTR(inputString, "six" )), IF(REGEXP_INSTR(inputString, "6" )=0, 1000, REGEXP_INSTR(inputString, "6" )));
UPDATE adventOfCode2023.inputs1 SET seven = LEAST(IF(REGEXP_INSTR(inputString, "seven" )=0, 1000, REGEXP_INSTR(inputString, "seven" )), IF(REGEXP_INSTR(inputString, "7" )=0, 1000, REGEXP_INSTR(inputString, "7" )));
UPDATE adventOfCode2023.inputs1 SET eight = LEAST(IF(REGEXP_INSTR(inputString, "eight" )=0, 1000, REGEXP_INSTR(inputString, "eight" )), IF(REGEXP_INSTR(inputString, "8" )=0, 1000, REGEXP_INSTR(inputString, "8" )));
UPDATE adventOfCode2023.inputs1 SET nine = LEAST(IF(REGEXP_INSTR(inputString, "nine" )=0, 1000, REGEXP_INSTR(inputString, "nine" )), IF(REGEXP_INSTR(inputString, "9" )=0, 1000, REGEXP_INSTR(inputString, "9" )));

UPDATE adventOfCode2023.inputs1 SET inputs1.firstPosition = LEAST(one, two, three, four, five, six, seven, eight, nine);

UPDATE adventOfCode2023.inputs1
SET newFirstDigit = CASE
                        WHEN firstPosition=one THEN 1
                        WHEN firstPosition=two THEN 2
                        WHEN firstPosition=three THEN 3
                        WHEN firstPosition=four THEN 4
                        WHEN firstPosition=five THEN 5
                        WHEN firstPosition=six THEN 6
                        WHEN firstPosition=seven THEN 7
                        WHEN firstPosition=eight THEN 8
                        WHEN firstPosition=nine THEN 9
    END;


UPDATE adventOfCode2023.inputs1 SET one = LEAST(IF(REGEXP_INSTR(REVERSE(inputString), "eno" )=0, 1000, REGEXP_INSTR(REVERSE(inputString), "eno" )), IF(REGEXP_INSTR(REVERSE(inputString), "1" )=0, 1000, REGEXP_INSTR(REVERSE(inputString), "1" )));
UPDATE adventOfCode2023.inputs1 SET two = LEAST(IF(REGEXP_INSTR(REVERSE(inputString), "owt" )=0, 1000, REGEXP_INSTR(REVERSE(inputString), "owt" )), IF(REGEXP_INSTR(REVERSE(inputString), "2" )=0, 1000, REGEXP_INSTR(REVERSE(inputString), "2" )));
UPDATE adventOfCode2023.inputs1 SET three = LEAST(IF(REGEXP_INSTR(REVERSE(inputString), "eerht" )=0, 1000, REGEXP_INSTR(REVERSE(inputString), "eerht" )), IF(REGEXP_INSTR(REVERSE(inputString), "3" )=0, 1000, REGEXP_INSTR(REVERSE(inputString), "3" )));
UPDATE adventOfCode2023.inputs1 SET four = LEAST(IF(REGEXP_INSTR(REVERSE(inputString), "ruof" )=0, 1000, REGEXP_INSTR(REVERSE(inputString), "ruof" )), IF(REGEXP_INSTR(REVERSE(inputString), "4" )=0, 1000, REGEXP_INSTR(REVERSE(inputString), "4" )));
UPDATE adventOfCode2023.inputs1 SET five = LEAST(IF(REGEXP_INSTR(REVERSE(inputString), "evif" )=0, 1000, REGEXP_INSTR(REVERSE(inputString), "evif" )), IF(REGEXP_INSTR(REVERSE(inputString), "5" )=0, 1000, REGEXP_INSTR(REVERSE(inputString), "5" )));
UPDATE adventOfCode2023.inputs1 SET six = LEAST(IF(REGEXP_INSTR(REVERSE(inputString), "xis" )=0, 1000, REGEXP_INSTR(REVERSE(inputString), "xis" )), IF(REGEXP_INSTR(REVERSE(inputString), "6" )=0, 1000, REGEXP_INSTR(REVERSE(inputString), "6" )));
UPDATE adventOfCode2023.inputs1 SET seven = LEAST(IF(REGEXP_INSTR(REVERSE(inputString), "neves" )=0, 1000, REGEXP_INSTR(REVERSE(inputString), "neves" )), IF(REGEXP_INSTR(REVERSE(inputString), "7" )=0, 1000, REGEXP_INSTR(REVERSE(inputString), "7" )));
UPDATE adventOfCode2023.inputs1 SET eight = LEAST(IF(REGEXP_INSTR(REVERSE(inputString), "thgie" )=0, 1000, REGEXP_INSTR(REVERSE(inputString), "thgie" )), IF(REGEXP_INSTR(REVERSE(inputString), "8" )=0, 1000, REGEXP_INSTR(REVERSE(inputString), "8" )));
UPDATE adventOfCode2023.inputs1 SET nine = LEAST(IF(REGEXP_INSTR(REVERSE(inputString), "enin" )=0, 1000, REGEXP_INSTR(REVERSE(inputString), "enin" )), IF(REGEXP_INSTR(REVERSE(inputString), "9" )=0, 1000, REGEXP_INSTR(REVERSE(inputString), "9" )));


UPDATE adventOfCode2023.inputs1 SET inputs1.lastPosition = LEAST(one, two, three, four, five, six, seven, eight, nine);

UPDATE adventOfCode2023.inputs1
SET newLastDigit = CASE
                        WHEN lastPosition=one THEN 1
                        WHEN lastPosition=two THEN 2
                        WHEN lastPosition=three THEN 3
                        WHEN lastPosition=four THEN 4
                        WHEN lastPosition=five THEN 5
                        WHEN lastPosition=six THEN 6
                        WHEN lastPosition=seven THEN 7
                        WHEN lastPosition=eight THEN 8
                        WHEN lastPosition=nine THEN 9
    END;

UPDATE adventOfCode2023.inputs1 SET newCombinedNumber = CAST( CONCAT(newFirstDigit, newLastDigit) AS SIGNED);

SELECT SUM(newCombinedNumber) FROM adventOfCode2023.inputs1;
