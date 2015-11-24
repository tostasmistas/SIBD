#test Updates Wears -> All should FAIL
insert into Period values('2015-08-15 00:00:00','2015-08-30 00:00:00');
insert into Period values('2015-08-15 00:00:00','2015-08-19 00:00:00');
insert into Period values('2015-08-15 00:00:00','2015-09-01 00:00:00');
insert into Period values('2015-01-12 00:00:00','2015-09-01 00:00:00');
insert into Period values('2015-06-22 00:00:00','2015-08-20 00:00:00');
insert into Period values('2015-06-22 00:00:00','2015-08-22 00:00:00');
insert into Period values('2015-06-22 00:00:00','2015-08-21 00:00:00');
insert into Period values('2015-07-31 00:00:00','2015-08-21 00:00:00');
update Wears SET start='2015-08-15 00:00:00',pan='pan01.healthunit.org' WHERE patient='678912345' and pan='pan01.healthunit.org' and end='2015-08-30 00:00:00';
update Wears SET start='2015-08-15 00:00:00',end='2015-08-19 00:00:00',pan='pan01.healthunit.org' WHERE patient='678912345' and pan='pan01.healthunit.org' and end='2015-08-30 00:00:00';
update Wears SET start='2015-08-15 00:00:00',end='2015-09-01 00:00:00',pan='pan01.healthunit.org' WHERE patient='678912345' and pan='pan01.healthunit.org' and end='2015-08-30 00:00:00';
update Wears SET start='2015-01-12 00:00:00',end='2015-09-01 00:00:00',pan='pan01.healthunit.org' WHERE patient='234567891' and pan='pan01.healthunit.org' and end='2015-06-21 00:00:00';
update Wears SET start='2015-06-22 00:00:00',end='2015-08-20 00:00:00',pan='pan01.healthunit.org' WHERE patient='567891234' and pan='pan01.healthunit.org' and end='2015-08-20 00:00:00';
update Wears SET start='2015-06-22 00:00:00',end='2015-08-21 00:00:00',pan='pan01.healthunit.org' WHERE patient='567891234' and pan='pan01.healthunit.org' and end='2015-08-20 00:00:00';
update Wears SET start='2015-06-22 00:00:00',end='2015-08-22 00:00:00',pan='pan01.healthunit.org' WHERE patient='567891234' and pan='pan01.healthunit.org' and end='2015-08-20 00:00:00';
update Wears SET start='2015-07-31 00:00:00',end='2015-08-21 00:00:00',pan='pan01.healthunit.org' WHERE patient='567891234' and pan='pan01.healthunit.org' and end='2015-08-20 00:00:00';

#First Test should Fail, the rest CORRECT
insert into Period values('2015-08-22 00:00:00','2015-08-30 00:00:00');
insert into Period values('2015-08-22 00:00:00','2015-09-01 00:00:00');
insert into Period values('2015-01-01 00:00:00','2015-06-21 00:00:00');
insert into Period values('2015-06-22 00:00:00','2015-07-01 00:00:00');
insert into Period values('2015-01-01 00:00:00','2015-06-20 00:00:00');
insert into Period values('2015-06-21 00:00:00','2015-07-01 00:00:00');
update Wears SET start='2015-07-31 00:00:00',end='2015-08-21 00:00:00',pan='pan01.healthunit.org' WHERE patient='567891234' and pan='pan01.healthunit.org' and end='2015-08-20 00:00:00';
update Wears SET start='2015-08-22 00:00:00',pan='pan01.healthunit.org' WHERE patient='678912345' and pan='pan01.healthunit.org' and end='2015-08-30 00:00:00';
update Wears SET start='2015-07-31 00:00:00',end='2015-08-21 00:00:00',pan='pan01.healthunit.org' WHERE patient='567891234' and pan='pan01.healthunit.org' and end='2015-08-20 00:00:00';
update Wears SET start='2015-08-22 00:00:00',end='2015-09-01 00:00:00',pan='pan01.healthunit.org' WHERE patient='678912345' and pan='pan01.healthunit.org' and end='2015-08-30 00:00:00';
update Wears SET start='2015-01-01 00:00:00',end='2015-06-21 00:00:00',pan='pan01.healthunit.org' WHERE patient='234567891' and pan='pan01.healthunit.org' and end='2015-06-21 00:00:00';
update Wears SET start='2015-06-22 00:00:00',end='2015-07-01 00:00:00',pan='pan03.healthunit.org' WHERE patient='234567891' and pan='pan03.healthunit.org' and end='2015-06-30 00:00:00';
update Wears SET start='2015-01-01 00:00:00',end='2015-06-20 00:00:00',pan='pan01.healthunit.org' WHERE patient='234567891' and pan='pan01.healthunit.org' and end='2015-06-21 00:00:00';
update Wears SET start='2015-06-21 00:00:00',end='2015-07-01 00:00:00',pan='pan03.healthunit.org' WHERE patient='234567891' and pan='pan03.healthunit.org' and end='2015-07-01 00:00:00';
update Wears SET start='2015-08-22 00:00:00',end='2015-09-01 00:00:00',pan='pan03.healthunit.org' WHERE patient='678912345' and pan='pan01.healthunit.org' and end='2015-09-01 00:00:00';
