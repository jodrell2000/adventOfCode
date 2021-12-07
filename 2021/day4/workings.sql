DROP TABLE IF EXISTS boardNumbers;
CREATE table boardNumbers
(
    number bigint not null,
    boardNumber bigint not null,
    rowNumber bigint not null,
    columnNumber bigint not null,
    called tinyint(1) unsigned default 0
);

insert into boardNumbers (number, boardNumber, rowNumber, columnNumber) SELECT number1, boardNumber, rowNumber, 1 FROM boards;
insert into boardNumbers (number, boardNumber, rowNumber, columnNumber) SELECT number2, boardNumber, rowNumber, 2 FROM boards;
insert into boardNumbers (number, boardNumber, rowNumber, columnNumber) SELECT number3, boardNumber, rowNumber, 3 FROM boards;
insert into boardNumbers (number, boardNumber, rowNumber, columnNumber) SELECT number4, boardNumber, rowNumber, 4 FROM boards;
insert into boardNumbers (number, boardNumber, rowNumber, columnNumber) SELECT number5, boardNumber, rowNumber, 5 FROM boards;

select @numberCalled;

select numberCalled into @numberCalled from calledNumbers where theOrder = (select min(theOrder) from calledNumbers where called = 0);
update boardNumbers set called = called + 1 where number = @numberCalled;
update calledNumbers set called = 1 where numberCalled = @numberCalled;
select @numberCalled, b.boardNumber, count(b.called) from boardNumbers b where b.called = 1 group by b.boardNumber, b.rowNumber having count(b.called) = 5
union
select @numberCalled, b.boardNumber, count(b.called) from boardNumbers b where b.called = 1 group by b.boardNumber, b.columnNumber having count(b.called) = 5;

select sum(number)
from boardNumbers
where boardNumber=86 and
      called=0;

# part 1
# last number = 14
# board number = 86
# uncalled sum 841
# answer = 841 * 14

DROP TABLE IF EXISTS allBoards;
CREATE TABLE allBoards (
    boardNumber bigint not null default 0
);
INSERT INTO allBoards select distinct boardNumber from boardNumbers;
update boardNumbers set called = 0;
update calledNumbers set called = 0;

select coalesce(@numberCalled, 0) into @previousNumber;
select numberCalled into @numberCalled from calledNumbers where theOrder = (select min(theOrder) from calledNumbers where called = 0);
update boardNumbers set called = called + 1 where number = @numberCalled;
update calledNumbers set called = 1 where numberCalled = @numberCalled;
delete from allBoards where boardNumber IN
                            (
                                select b.boardNumber from boardNumbers b where b.called = 1 group by b.boardNumber, b.rowNumber having count(b.called) = 5
                                union
                                select b.boardNumber from boardNumbers b where b.called = 1 group by b.boardNumber, b.columnNumber having count(b.called) = 5
                            );
select count(*) as LosingBoards, @numberCalled, @previousNumber as "Last winning Number" from allBoards; # 83

select * from allBoards; # 45

select sum(number)
from boardNumbers
where boardNumber=45 and
        called=0; # 6 * 219

# wrong 438, 18177, 1314, 870??
# right 4495
