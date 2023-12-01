CREATE DATABASE adventOfCode2023;

CREATE TABLE adventOfCode2023.inputs1 (
    inputString varchar(128),
    firstDigit INT,
    lastdigit INT,
    combinedNumber INT
);

SELECT  inputString,
        REVERSE(inputString),
        CAST( SUBSTRING( inputString, REGEXP_INSTR(inputString, '[0-9]' ), 1) AS SIGNED) AS firstDigit,
        CAST( SUBSTRING( REVERSE(inputString), REGEXP_INSTR( REVERSE(inputString), '[0-9]' ), 1) AS SIGNED) AS lastDigit
FROM adventOfCode2023.inputs1
LIMIT 10;

UPDATE adventOfCode2023.inputs1 SET
    firstDigit = CAST( SUBSTRING( inputString, REGEXP_INSTR(inputString, '[0-9]' ), 1) AS SIGNED),
    lastDigit = CAST( SUBSTRING( REVERSE(inputString), REGEXP_INSTR( REVERSE(inputString), '[0-9]' ), 1) AS SIGNED);

UPDATE adventOfCode2023.inputs1 SET combinedNumber = CAST( CONCAT(firstDigit, lastDigit) AS SIGNED);

SELECT SUM(combinedNumber)
FROM adventOfCode2023.inputs1;
