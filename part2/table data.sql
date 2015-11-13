
insert into Patient values('-3', 'Roberto', 'Da Street, n3, 1Esq, 1000-999 Lisboa'); -- should fail
insert into Patient values('98765432', 'Toni', 'Da Street, n2, 4Esq, 1300-200 Oeiras');
insert into Patient values('987654322', 'Toni', 'Da Street, n2, 4Esq, 1300-200 Oeiras');


insert into PAN values('pan99.healthunit.org', '914457220');
insert into PAN values('pan33.healthunit.org', '845 763 207');
insert into PAN values('pan99.healthunit.org', '+351 914457220'); -- should fail


insert into Device values('87650943', 'Philips', 'blood pressure');
insert into Device values('98765432', 'Philips', 'blood pressure');
insert into Device values('12345678', 'Philips', 'scale');
insert into Device values('12098765', 'Philips', 'scale');
insert into Device values('87650943', 'Philips', 'scale'); -- should fail
insert into Device values('35647828', 'Philips', 'rotating speed');


insert into Sensor values('87650943', 'Philips', 'mm Hg');
insert into Sensor values('98765432', 'Philips', 'mm Hg');
insert into Sensor values('12345678', 'Philips', 'kg');
insert into Sensor values('12098765', 'Philips', 'kg');


insert into Actuator values('35647828', 'Philips', 'rpm');


insert into Municipality values('12345', 'Lisboa');
insert into Municipality values('24351', 'Oeiras');
insert into Municipality values('35374','Porto');
insert into Municipality values('1234','Porto'); -- should fail


insert into Period values('2015-12-13 17:50:44','2999-12-31 23:59:59');
insert into Period values('2015-11-01 12:30:24','2999-12-31 23:59:59');
insert into Period values('2014-05-29 08:56:21','2999-12-31 23:59:59');


insert into Reading values('87650943', 'Philips', '2015-10-09 08:00:12', '60.3');
insert into Reading values('98765432', 'Philips', '2015-10-09 08:00:12', '60.3');
