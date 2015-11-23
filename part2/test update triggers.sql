update Wears set start='2015-01-01 08:00:00',end='2015-01-15 08:00:00' where start='2015-01-01 08:00:00' and patient=123456789 and pan='pan99.healthunit.org'
insert into Period values('2015-01-01 08:00:00','2015-02-02 08:00:00');
update Wears set start='2015-01-01 08:00:00',end='2015-02-02 08:00:00' where start='2015-01-01 08:00:00' and patient=123456789 and pan='pan99.healthunit.org'
insert into Period values('2014-12-31 08:00:00','2015-01-30 08:00:00');
update Wears set start='2014-12-31 08:00:00',end='2015-01-30 08:00:00' where start='2015-01-01 08:00:00' and patient=123456789 and pan='pan99.healthunit.org'
insert into Period values('2014-12-30 08:00:00','2014-12-31 08:00:00');
update Wears set start='2014-12-30 08:00:00',end='2014-12-31 08:00:00' where start='2014-12-31 08:00:00' and patient=123456789 and pan='pan99.healthunit.org'
update Wears set pan='pan33.healthunit.org' where start='2015-02-02 08:00:00' and end='2015-02-10 08:00:00' and patient=98765432;