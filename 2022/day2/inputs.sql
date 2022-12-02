DROP TABLE puzzle2Inputs;
CREATE TABLE puzzle2Inputs (elf char(1) NOT NULL, you char(1) NOT NULL);
INSERT INTO puzzle2Inputs (elf, you) VALUES ("x", "x"), ("x", "x");

ALTER TABLE puzzle2Inputs
    ADD COLUMN result char(4) DEFAULT '',
    ADD COLUMN score INT DEFAULT 0;

a=rock
b=paper
c=scissors

x=rock
y=paper
z=scissors

UPDATE puzzle2Inputs SET result='draw' WHERE (elf='a' AND you='x') OR (elf='b' AND you='y') OR (elf='c' AND you='z');
UPDATE puzzle2Inputs SET result='win' WHERE (elf='a' AND you='y') OR (elf='b' AND you='z') OR (elf='c' AND you='x');
UPDATE puzzle2Inputs SET result='lose' WHERE result='';

UPDATE puzzle2Inputs SET score=(if (you='x', 1, (if (you='y', 2, 3)))) + (if (result='draw', 3, (if (result='win', 6, 0))));

SELECT SUM(score) from puzzle2Inputs;

DROP TABLE puzzle2bInputs;
CREATE TABLE puzzle2bInputs (elf char(1) NOT NULL, objective char(1) NOT NULL);
INSERT INTO puzzle2bInputs (elf, objective) VALUES ("A", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("B", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("A", "X"), ("C", "Y"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Y"), ("C", "Z"), ("C", "Z"), ("C", "Y"), ("A", "Z"), ("C", "X"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("B", "Y"), ("C", "Z"), ("C", "Y"), ("C", "X"), ("C", "Z"), ("C", "Z"), ("B", "Y"), ("A", "Z"), ("C", "Z"), ("C", "Y"), ("B", "Y"), ("C", "Z"), ("A", "Y"), ("B", "Y"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("A", "X"), ("A", "Z"), ("B", "Z"), ("A", "Z"), ("A", "X"), ("A", "Y"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Y"), ("A", "Z"), ("C", "Z"), ("B", "Y"), ("C", "Z"), ("C", "Y"), ("B", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("B", "Z"), ("A", "X"), ("C", "Z"), ("A", "Z"), ("C", "Y"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Y"), ("A", "Z"), ("C", "Z"), ("C", "Y"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("A", "X"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Y"), ("A", "Z"), ("A", "Z"), ("C", "Y"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Y"), ("B", "Y"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Y"), ("A", "Z"), ("A", "Z"), ("C", "Y"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Y"), ("A", "Z"), ("B", "Z"), ("C", "Y"), ("C", "Z"), ("B", "Y"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("B", "X"), ("B", "Y"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Y"), ("B", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Y"), ("A", "Z"), ("A", "Z"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Y"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("B", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Y"), ("B", "X"), ("A", "X"), ("A", "Y"), ("A", "X"), ("C", "Z"), ("A", "X"), ("B", "X"), ("A", "X"), ("B", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("B", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Z"), ("B", "Y"), ("C", "Z"), ("A", "X"), ("A", "Z"), ("A", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Y"), ("A", "Z"), ("B", "Y"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("B", "Z"), ("A", "Z"), ("C", "Y"), ("A", "Y"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("B", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Z"), ("B", "X"), ("C", "Z"), ("C", "Y"), ("A", "Z"), ("A", "Y"), ("C", "Z"), ("C", "Y"), ("B", "Y"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("B", "Y"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("B", "Z"), ("B", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("A", "X"), ("B", "Y"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Y"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("C", "Y"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "X"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Y"), ("C", "Y"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Y"), ("A", "Y"), ("C", "Z"), ("C", "Z"), ("B", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Y"), ("A", "Z"), ("B", "Y"), ("A", "Z"), ("C", "Y"), ("A", "Z"), ("C", "Y"), ("A", "Z"), ("A", "Z"), ("A", "X"), ("B", "Z"), ("C", "Y"), ("A", "Z"), ("C", "Z"), ("A", "Y"), ("C", "Z"), ("C", "Y"), ("B", "Y"), ("A", "Z"), ("B", "Z"), ("B", "Z"), ("C", "Z"), ("A", "X"), ("B", "Y"), ("C", "Z"), ("A", "Y"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("B", "Z"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Y"), ("A", "Z"), ("A", "X"), ("A", "Z"), ("A", "Y"), ("C", "Z"), ("A", "Z"), ("C", "Y"), ("A", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("B", "X"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Y"), ("C", "Z"), ("B", "Z"), ("B", "Z"), ("C", "Z"), ("B", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("B", "Y"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Y"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Y"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("B", "Y"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Y"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Y"), ("C", "Y"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("B", "Y"), ("A", "X"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("B", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("B", "Z"), ("B", "X"), ("C", "Z"), ("B", "X"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("B", "X"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("B", "Y"), ("C", "Z"), ("C", "Z"), ("B", "X"), ("C", "Y"), ("A", "Z"), ("A", "Z"), ("B", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("B", "Y"), ("A", "Z"), ("C", "Z"), ("B", "Y"), ("C", "Y"), ("C", "Z"), ("C", "X"), ("C", "Z"), ("C", "Z"), ("A", "X"), ("C", "Z"), ("A", "Y"), ("C", "Z"), ("A", "X"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("B", "Y"), ("C", "Y"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Z"), ("B", "Y"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("B", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("B", "Z"), ("A", "Z"), ("B", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("B", "Y"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Y"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("B", "X"), ("A", "Z"), ("A", "Z"), ("C", "Y"), ("B", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Y"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("B", "Y"), ("A", "Z"), ("B", "Z"), ("C", "Y"), ("B", "Y"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Y"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("B", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("A", "X"), ("B", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Y"), ("A", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("B", "Y"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Y"), ("B", "Y"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Z"), ("C", "Y"), ("A", "Z"), ("B", "Y"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("B", "Z"), ("B", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("B", "Y"), ("B", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("A", "Y"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("B", "Y"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("C", "Y"), ("B", "Y"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("A", "X"), ("B", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Y"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("B", "Z"), ("B", "Y"), ("A", "X"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Y"), ("A", "Z"), ("A", "Z"), ("C", "Y"), ("C", "X"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "X"), ("C", "Z"), ("A", "Z"), ("B", "Y"), ("B", "Y"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("A", "X"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Y"), ("A", "Z"), ("C", "Z"), ("B", "Y"), ("B", "Y"), ("C", "Z"), ("B", "Y"), ("A", "Z"), ("B", "Y"), ("C", "Z"), ("B", "Z"), ("B", "Y"), ("C", "Y"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("B", "Z"), ("C", "Z"), ("A", "Z"), ("B", "Y"), ("B", "Z"), ("C", "Z"), ("B", "Y"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Y"), ("C", "Z"), ("B", "Y"), ("A", "Z"), ("B", "X"), ("C", "Y"), ("C", "X"), ("C", "Y"), ("A", "Z"), ("B", "Z"), ("A", "Z"), ("A", "Y"), ("B", "Y"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("B", "Y"), ("A", "Z"), ("A", "Z"), ("B", "Y"), ("C", "Y"), ("A", "Y"), ("C", "Y"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Y"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("B", "Y"), ("B", "Y"), ("C", "Z"), ("B", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("B", "Y"), ("C", "Y"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("B", "Y"), ("C", "Y"), ("B", "Y"), ("C", "Z"), ("A", "Z"), ("B", "Y"), ("A", "Z"), ("A", "Z"), ("A", "X"), ("C", "Z"), ("C", "Z"), ("C", "Y"), ("A", "Z"), ("C", "Y"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("A", "X"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Y"), ("A", "Z"), ("A", "X"), ("C", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Y"), ("A", "Z"), ("C", "Z"), ("B", "Z"), ("B", "X"), ("A", "Z"), ("C", "Z"), ("B", "Y"), ("C", "Y"), ("A", "Z"), ("A", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Y"), ("C", "Y"), ("B", "Y"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("B", "Y"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("B", "Y"), ("C", "Z"), ("C", "Y"), ("A", "X"), ("A", "Z"), ("C", "Y"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Y"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Y"), ("B", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("B", "Y"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("C", "X"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Y"), ("B", "Z"), ("A", "Z"), ("C", "Y"), ("A", "Z"), ("C", "Y"), ("B", "Z"), ("C", "Z"), ("B", "X"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("B", "Y"), ("C", "Z"), ("C", "Z"), ("B", "Z"), ("A", "Z"), ("B", "Y"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("B", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("B", "Z"), ("A", "X"), ("C", "Y"), ("A", "X"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Z"), ("B", "Y"), ("B", "Y"), ("C", "Z"), ("B", "X"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("B", "X"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("B", "Y"), ("C", "Z"), ("C", "Y"), ("A", "Z"), ("B", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Y"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("B", "Y"), ("B", "X"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Y"), ("C", "Y"), ("B", "Y"), ("A", "X"), ("C", "Z"), ("B", "Y"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("B", "Y"), ("B", "Y"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("B", "Y"), ("C", "Z"), ("B", "Y"), ("B", "Y"), ("A", "Z"), ("C", "Z"), ("B", "Y"), ("A", "Z"), ("A", "X"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("B", "Y"), ("A", "Z"), ("B", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Y"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("B", "Z"), ("C", "Z"), ("A", "X"), ("A", "Y"), ("B", "Y"), ("B", "Z"), ("A", "Z"), ("C", "Y"), ("A", "Z"), ("B", "X"), ("A", "Z"), ("C", "Z"), ("B", "Z"), ("B", "Y"), ("C", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("A", "X"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("B", "Z"), ("C", "Z"), ("C", "Z"), ("A", "X"), ("C", "Y"), ("A", "Z"), ("C", "Z"), ("C", "Y"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("C", "X"), ("C", "Y"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("B", "Y"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("B", "Z"), ("A", "Y"), ("B", "Y"), ("C", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Y"), ("B", "Y"), ("A", "Z"), ("A", "Z"), ("B", "Y"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Y"), ("A", "X"), ("A", "X"), ("C", "Z"), ("A", "Z"), ("A", "X"), ("A", "Y"), ("A", "Z"), ("C", "Y"), ("A", "Z"), ("C", "Y"), ("A", "Z"), ("C", "Y"), ("B", "Z"), ("B", "Y"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Y"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("B", "Y"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Y"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Y"), ("A", "Y"), ("C", "X"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("B", "Y"), ("B", "Y"), ("C", "Z"), ("C", "Z"), ("C", "Y"), ("A", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Y"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Y"), ("A", "Z"), ("C", "Y"), ("A", "Z"), ("C", "Z"), ("C", "Y"), ("B", "Y"), ("C", "Y"), ("C", "Y"), ("A", "Z"), ("A", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Y"), ("B", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("B", "Y"), ("C", "Y"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("B", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Y"), ("B", "Y"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Y"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("B", "Y"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Y"), ("B", "Y"), ("C", "Z"), ("A", "Z"), ("B", "Z"), ("A", "Z"), ("A", "X"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("B", "Y"), ("A", "Z"), ("A", "X"), ("C", "Y"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("B", "Y"), ("C", "Z"), ("B", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("B", "Z"), ("B", "X"), ("C", "Z"), ("A", "Z"), ("C", "Y"), ("A", "X"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Z"), ("B", "X"), ("C", "Z"), ("C", "Y"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("B", "Z"), ("A", "Z"), ("C", "Z"), ("B", "Y"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("B", "Y"), ("A", "Z"), ("C", "Y"), ("B", "Y"), ("B", "X"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Y"), ("B", "Y"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("A", "X"), ("C", "Z"), ("C", "Z"), ("B", "Y"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("B", "X"), ("C", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "X"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Y"), ("B", "Z"), ("A", "Y"), ("C", "Z"), ("C", "Y"), ("B", "Y"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Z"), ("A", "Y"), ("C", "Z"), ("C", "Y"), ("A", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Y"), ("C", "Y"), ("B", "X"), ("A", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Y"), ("A", "Z"), ("A", "X"), ("C", "Z"), ("A", "Z"), ("C", "X"), ("B", "Y"), ("A", "X"), ("B", "Z"), ("C", "Z"), ("B", "Y"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("A", "X"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Y"), ("A", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("B", "Y"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("C", "Y"), ("C", "Y"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("B", "Y"), ("A", "X"), ("A", "X"), ("A", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Y"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("B", "Y"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Y"), ("A", "Z"), ("C", "Z"), ("B", "X"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("B", "Y"), ("A", "Z"), ("C", "Y"), ("A", "Y"), ("C", "Z"), ("C", "Z"), ("B", "Z"), ("C", "Z"), ("C", "Z"), ("B", "Y"), ("C", "Z"), ("A", "Z"), ("C", "Y"), ("C", "Z"), ("B", "Y"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("B", "Y"), ("C", "Y"), ("A", "Z"), ("C", "X"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("B", "Y"), ("A", "X"), ("C", "Y"), ("B", "Y"), ("A", "Z"), ("B", "Y"), ("A", "X"), ("B", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("A", "X"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("A", "X"), ("B", "Y"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("B", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Y"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("B", "X"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("B", "Y"), ("A", "Z"), ("C", "Z"), ("A", "X"), ("B", "Z"), ("B", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Y"), ("A", "X"), ("A", "Z"), ("B", "Y"), ("C", "Z"), ("B", "Y"), ("C", "Z"), ("B", "Y"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("C", "Y"), ("C", "Y"), ("A", "Z"), ("C", "X"), ("B", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Y"), ("A", "Z"), ("A", "Z"), ("B", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Y"), ("C", "Y"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Y"), ("A", "Z"), ("B", "Y"), ("A", "Z"), ("B", "Z"), ("A", "Z"), ("A", "Z"), ("B", "X"), ("B", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "X"), ("C", "Z"), ("C", "X"), ("C", "Z"), ("B", "Z"), ("C", "Y"), ("A", "X"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("A", "X"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("B", "Y"), ("A", "Z"), ("C", "Z"), ("B", "X"), ("B", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("B", "Z"), ("C", "Y"), ("A", "X"), ("C", "Z"), ("B", "Y"), ("B", "Y"), ("C", "Y"), ("A", "Z"), ("A", "Z"), ("A", "X"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Y"), ("B", "Y"), ("A", "Z"), ("B", "X"), ("A", "Z"), ("A", "X"), ("A", "X"), ("A", "X"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("A", "X"), ("B", "X"), ("B", "Z"), ("B", "X"), ("A", "Z"), ("B", "Y"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Y"), ("C", "Z"), ("B", "Z"), ("C", "Y"), ("C", "Y"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("B", "Y"), ("C", "Z"), ("A", "Z"), ("A", "X"), ("B", "Z"), ("A", "Y"), ("B", "Z"), ("C", "Y"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Y"), ("C", "Z"), ("A", "Z"), ("B", "Y"), ("C", "Z"), ("B", "X"), ("A", "Z"), ("C", "Z"), ("C", "Y"), ("B", "Y"), ("A", "Z"), ("B", "Y"), ("B", "Z"), ("A", "Z"), ("A", "Z"), ("B", "Y"), ("C", "Z"), ("A", "Z"), ("C", "X"), ("C", "Z"), ("C", "Z"), ("B", "Z"), ("B", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Y"), ("C", "Z"), ("A", "X"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Y"), ("A", "X"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("B", "Z"), ("C", "Z"), ("B", "Z"), ("B", "Y"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("B", "Y"), ("C", "Y"), ("A", "X"), ("A", "Z"), ("A", "X"), ("C", "Z"), ("B", "X"), ("C", "Z"), ("A", "Z"), ("B", "Y"), ("C", "X"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Y"), ("A", "Y"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Y"), ("C", "Z"), ("B", "Z"), ("C", "X"), ("C", "Z"), ("C", "Y"), ("A", "Y"), ("B", "Y"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("A", "X"), ("B", "Y"), ("C", "Y"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Y"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "X"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Y"), ("B", "Y"), ("C", "Z"), ("A", "X"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("C", "X"), ("A", "Z"), ("C", "Z"), ("C", "Y"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("A", "X"), ("C", "X"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Y"), ("C", "Z"), ("C", "Z"), ("B", "X"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Y"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("B", "Y"), ("C", "Y"), ("A", "Z"), ("B", "Z"), ("A", "Z"), ("B", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("B", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("B", "Y"), ("A", "Z"), ("B", "Y"), ("C", "Y"), ("C", "X"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Y"), ("A", "Z"), ("C", "Y"), ("A", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Y"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("B", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("B", "Z"), ("B", "Z"), ("B", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("B", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Y"), ("A", "Y"), ("C", "Y"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Z"), ("C", "Y"), ("A", "Z"), ("C", "Z"), ("B", "Y"), ("C", "Y"), ("B", "Y"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("A", "X"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("C", "X"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Y"), ("A", "Y"), ("B", "Y"), ("B", "X"), ("B", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("B", "Y"), ("C", "Z"), ("A", "Z"), ("B", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Y"), ("C", "Y"), ("B", "Y"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Y"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("A", "X"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Y"), ("B", "Y"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("A", "X"), ("B", "Z"), ("A", "Z"), ("C", "Y"), ("B", "Y"), ("A", "Z"), ("A", "Y"), ("B", "Z"), ("A", "Z"), ("B", "Y"), ("C", "Z"), ("B", "Y"), ("A", "Z"), ("B", "Y"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Y"), ("B", "Y"), ("B", "X"), ("A", "Z"), ("C", "Z"), ("A", "X"), ("B", "Z"), ("A", "X"), ("A", "Y"), ("C", "Z"), ("B", "X"), ("B", "Y"), ("A", "Z"), ("A", "Z"), ("B", "X"), ("C", "Z"), ("C", "Y"), ("C", "Y"), ("C", "Y"), ("C", "X"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("B", "Y"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("B", "Z"), ("B", "Y"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("A", "X"), ("A", "Y"), ("B", "Y"), ("A", "Z"), ("A", "Z"), ("B", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Y"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("B", "Y"), ("A", "Z"), ("A", "X"), ("C", "Y"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Y"), ("A", "X"), ("C", "Z"), ("B", "Y"), ("A", "Z"), ("B", "Z"), ("C", "Z"), ("B", "Z"), ("A", "Z"), ("C", "Y"), ("C", "Z"), ("B", "Y"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Y"), ("A", "Z"), ("B", "Z"), ("A", "X"), ("C", "Y"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("B", "Y"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("B", "Y"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("B", "Y"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Y"), ("A", "Y"), ("B", "Y"), ("B", "Z"), ("C", "Z"), ("C", "Y"), ("A", "Z"), ("C", "Y"), ("C", "Z"), ("B", "Y"), ("C", "Y"), ("C", "Z"), ("B", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Y"), ("B", "X"), ("C", "Z"), ("C", "Y"), ("A", "Z"), ("A", "X"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("B", "Y"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("B", "Y"), ("C", "Y"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Y"), ("A", "Z"), ("C", "Y"), ("B", "Y"), ("A", "Y"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Y"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Y"), ("C", "Y"), ("A", "Z"), ("C", "Y"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Y"), ("B", "Z"), ("C", "Z"), ("C", "Y"), ("A", "Z"), ("B", "X"), ("C", "Y"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("B", "Y"), ("A", "Z"), ("A", "X"), ("B", "Y"), ("A", "Z"), ("A", "Z"), ("B", "Y"), ("B", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("A", "X"), ("C", "Z"), ("C", "Z"), ("B", "Z"), ("C", "Z"), ("C", "Y"), ("B", "Y"), ("A", "Z"), ("B", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Y"), ("A", "X"), ("C", "Y"), ("A", "Z"), ("B", "Z"), ("A", "Z"), ("B", "Z"), ("C", "Z"), ("A", "Y"), ("C", "Z"), ("C", "Y"), ("A", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Y"), ("B", "Y"), ("B", "Y"), ("C", "Z"), ("A", "X"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Y"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("B", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Y"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("B", "Y"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("B", "Y"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("B", "Z"), ("A", "Z"), ("C", "Y"), ("A", "Z"), ("C", "Z"), ("B", "Z"), ("C", "Z"), ("B", "Y"), ("C", "Y"), ("A", "X"), ("C", "Z"), ("A", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Z"), ("C", "Y"), ("A", "Z"), ("C", "Z"), ("B", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("A", "X"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("B", "X"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("A", "X"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("B", "Y"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("B", "Z"), ("C", "Y"), ("B", "X"), ("C", "Y"), ("C", "Z"), ("C", "Z"), ("A", "X"), ("A", "Z"), ("C", "Z"), ("B", "Y"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("B", "Y"), ("C", "Z"), ("C", "Y"), ("B", "Z"), ("A", "Z"), ("C", "Z"), ("B", "Z"), ("A", "Z"), ("B", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("B", "Y"), ("C", "Y"), ("C", "Y"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Y"), ("B", "Y"), ("C", "X"), ("A", "X"), ("C", "Z"), ("C", "Y"), ("B", "Y"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("B", "Y"), ("B", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("B", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Y"), ("A", "X"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("B", "Z"), ("B", "Y"), ("C", "X"), ("C", "Z"), ("A", "X"), ("A", "X"), ("C", "Y"), ("B", "Y"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Y"), ("A", "Z"), ("C", "Y"), ("C", "Z"), ("B", "Y"), ("A", "Z"), ("C", "Y"), ("A", "Z"), ("A", "Z"), ("B", "Z"), ("C", "X"), ("B", "Y"), ("C", "Z"), ("A", "Z"), ("C", "Y"), ("C", "Z"), ("B", "Y"), ("A", "Z"), ("C", "Y"), ("C", "Z"), ("B", "Y"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("A", "X"), ("C", "Z"), ("C", "Y"), ("B", "Z"), ("A", "Z"), ("A", "Z"), ("B", "Y"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("B", "Y"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("B", "Y"), ("B", "Y"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("B", "Z"), ("B", "Y"), ("C", "Z"), ("B", "Y"), ("A", "Z"), ("A", "Z"), ("C", "Y"), ("A", "Z"), ("A", "X"), ("B", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Z"), ("C", "Z"), ("C", "Y"), ("A", "X"), ("B", "X"), ("B", "X"), ("C", "Z"), ("C", "Y"), ("A", "Z"), ("B", "Y"), ("C", "Y"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Y"), ("A", "Z"), ("B", "Z"), ("C", "Z"), ("C", "Y"), ("C", "Y"), ("C", "Z"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("B", "Z"), ("B", "Z"), ("C", "Y"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("A", "Z"), ("A", "Z"), ("B", "Y"), ("B", "Z"), ("B", "Y"), ("C", "Y"), ("A", "Z"), ("C", "Z"), ("C", "Y"), ("A", "Z"), ("C", "Z"), ("A", "Z"), ("A", "X"), ("B", "Z"), ("A", "Z"), ("C", "Z"), ("C", "Z"), ("C", "Z"), ("A", "Z"), ("C", "Y"), ("B", "Y"), ("C", "Y"), ("A", "Z"), ("C", "Y"), ("B", "Z"), ("B", "Y"), ("B", "Y"), ("C", "Z"), ("C", "Z"), ("A", "Z");

ALTER TABLE puzzle2bInputs
    ADD COLUMN you char(1) DEFAULT '',
    ADD COLUMN score INT DEFAULT 0;

DROP TABLE IF EXISTS puzzle2You;
CREATE TABLE puzzle2You (
    elf char(1),
    result char(4),
    you char(1)
);
INSERT INTO puzzle2You (elf, result, you) VALUES
                                              ( 'a', 'z', 'y'),
                                              ( 'a', 'x', 'z'),
                                              ( 'a', 'y', 'x'),
                                              ( 'b', 'z', 'z'),
                                              ( 'b', 'x', 'x'),
                                              ( 'b', 'y', 'y'),
                                              ( 'c', 'z', 'x'),
                                              ( 'c', 'x', 'y'),
                                              ( 'c', 'y', 'z');

a=rock
b=paper
c=scissors

x=lose
y=draw
z=win

x=rock
y=paper
z=scissors


UPDATE puzzle2bInputs pi, puzzle2You py
SET pi.you = py.you
WHERE pi.elf=py.elf AND pi.objective=py.result;

UPDATE puzzle2bInputs SET score=(if (you='x', 1, (if (you='y', 2, 3)))) + (if (objective='y', 3, (if (objective='z', 6, 0))));

SELECT SUM(score) from puzzle2bInputs;
