

insert into Patient values('123456789', 'Roberto', 'Da Street, n3, 1Esq, 1000-999 Lisboa');
insert into Patient values('987654321', 'Roberto', 'Da Street, n3, 1Esq, 1000-999 Lisboa');
insert into Patient values('98765432', 'Toni', 'Da Street, n2, 4Esq, 1300-200 Oeiras');
insert into Patient values('987654322', 'Toni', 'Da Street, n2, 4Esq, 1300-200 Oeiras');
insert into Patient values('123344444', NULL, 'Da Street, n2, 4Esq, 1300-200 Oeiras');
insert into Patient values('465748931', 'António Manu', 'Da Street, n2, 4Esq, 1300-200 Oeiras');
insert into Patient values('657658675', 'Zé Tó', 'Da Street, n2, 4Esq, 1300-200 Oeiras');
insert into Patient values('111111111', 'Mari', 'Da Street, n2, 4Esq, 1300-200 Oeiras');
insert into Patient values('234567891', 'João Lopes', 'Av. Rovisco Pais 1, 1000-900 Lisboa');
insert into Patient values('345678912', 'António Felizardo', 'Estação Oriente, 1000-800 Lisboa');
insert into Patient values('456789123', 'Miguel Prata', 'Rua da Prata, 1000-803 Lisboa');
insert into Patient values('567891234', 'Caldas', 'Alameda dos Oceanos, 1000-900 Lisboa');
insert into Patient values('678912345', 'Maria Joana', 'Rua dos Pastéis, 1000-500 Lisboa');


insert into PAN values('pan99.healthunit.org', '914457220');
insert into PAN values('pan33.healthunit.org', '845763207');
insert into PAN values('pan88.healthunit.org', '676498532');
insert into PAN values('pan77.healthunit.org', '456948923');
insert into PAN values('pan66.healthunit.org', '666566754');
insert into PAN values('pan22.healthunit.org', '775445324');
insert into PAN values('pan71.healthunit.org', '911121122');
insert into PAN values('pan69.healthunit.org', '919191919');
insert into PAN values('pan99.healthunit.org', '+351 914457220'); -- should fail
insert into PAN values('pan01.healthunit.org', '212121212');
insert into PAN values('pan02.healthunit.org', '222121212');
insert into PAN values('pan03.healthunit.org', '234121212');

insert into Device values('87650943', 'Philips', 'blood pressure');
insert into Device values('98765432', 'Philips', 'blood pressure');
insert into Device values('12345678', 'Philips', 'scale');
insert into Device values('12098765', 'Philips', 'scale');
insert into Device values('33333333', 'Xiaomi', 'scale');
insert into Device values('11111111', 'Xiaomi', 'scale');
insert into Device values('22222222', 'Xiaomi', 'scale');
insert into Device values('87650943', 'Philips', 'scale'); -- should fail
insert into Device values('35647828', 'Philips', 'rotating speed');
insert into Device values('67756535', 'Xiaomi', 'rotating speed');
insert into Device values('97754422', 'Xiaomi', 'rotating speed');
insert into Device values('55342299', 'Xiaomi', 'rotating speed');
insert into Device values('45545545', 'Samsung', 'rotating speed');
insert into Device values('12369901', 'Sony', 'rotating speed');
insert into Device values('12369902', 'Xiaomi', 'rotating speed');
insert into Device values('12369903', 'Philips', 'rotating speed');
insert into Device values('12369904', 'Philips', 'rotating speed');



insert into Sensor values('87650943', 'Philips', 'mm Hg');
insert into Sensor values('98765432', 'Philips', 'mm Hg');
insert into Sensor values('12345678', 'Philips', 'kg');
insert into Sensor values('12098765', 'Philips', 'kg');
insert into Sensor values('11111111', 'Xiaomi', 'kg');
insert into Sensor values('22222222', 'Xiaomi', 'kg');
insert into Sensor values('33333333', 'Xiaomi', 'kg');


insert into Actuator values('35647828', 'Philips', 'rpm');
insert into Actuator values('67756535', 'Xiaomi', 'rpm');
insert into Actuator values('97754422', 'Xiaomi', 'rpm');
insert into Actuator values('45545545', 'Samsung', 'rpm');
insert into Actuator values('55342299', 'Xiaomi', 'rpm');
insert into Actuator values('12369901', 'Sony', 'rpm');


insert into Municipality values('12345', 'Lisboa');
insert into Municipality values('24351', 'Oeiras');
insert into Municipality values('35374','Porto');
insert into Municipality values('1234','Porto'); -- should fail

insert into Period values('2015-09-18 08:05:52','2999-12-31 23:59:59');
insert into Period values('2015-09-15 08:05:52','2999-12-31 23:59:59');
insert into Period values('2015-12-13 17:50:44','2999-12-31 23:59:59');
insert into Period values('2015-11-01 12:30:24','2999-12-31 23:59:59');
insert into Period values('2014-05-29 08:56:21','2999-12-31 23:59:59');
insert into Period values('2015-01-01 08:00:00','2015-01-30 08:00:00');
insert into Period values('2015-01-03 08:00:00','2015-01-07 08:00:00');
insert into Period values('2015-01-03 08:00:00','2015-02-03 08:00:00');
insert into Period values('2014-12-04 08:00:00','2015-01-04 08:00:00');
insert into Period values('2015-01-01 08:00:00','2015-01-15 08:00:00');
insert into Period values('2015-01-01 08:00:00','2015-02-03 08:00:00');
insert into Period values('2014-12-04 08:00:00','2015-02-03 08:00:00');
insert into Period values('2015-01-02 08:00:00','2015-01-31 08:00:00');
insert into Period values('2015-01-01 08:00:00','2015-01-01 08:00:00');
insert into Period values('2015-02-01 08:00:00','2015-03-01 08:00:00');
insert into Period values('2014-01-01 08:00:00','2015-01-30 08:00:00');
insert into Period values('2012-03-02 08:00:00','2013-05-01 08:00:00');
insert into Period values('2015-05-02 08:00:00','2015-06-02 08:00:00');
insert into Period values('2015-03-20 08:00:00','2015-04-05 08:00:00');
insert into Period values('2015-06-03 08:00:00','2020-01-01 08:00:00');
insert into Period values('2015-02-02 08:00:00','2015-02-10 08:00:00');
insert into Period values('2015-01-02 08:00:00','2017-01-31 08:00:00');
insert into Period values('2015-06-02 08:00:00','2017-01-31 08:00:00');
insert into Period values('2015-07-02 08:00:00','2020-02-10 08:00:00');
insert into Period values('2015-07-02 08:00:00','2999-12-31 00:00:00');
insert into Period values('2000-07-02 08:00:00','2001-12-31 00:00:00');
insert into Period values('2013-07-02 08:00:00','2014-12-31 00:00:00');
insert into Period values('2013-07-02 08:00:00','2999-12-31 00:00:00');
insert into Period values('2015-07-02 08:00:00','2999-12-31 00:00:00');
insert into Period values('2015-01-12 00:00:00','2015-06-21 00:00:00');
insert into Period values('2015-03-13 00:00:00','2015-05-14 00:00:00');
insert into Period values('2015-06-14 00:00:00','2016-03-20 00:00:00');
insert into Period values('2015-06-15 00:00:00','2015-07-16 00:00:00');
insert into Period values('2015-06-20 00:00:00','2015-06-30 00:00:00');
insert into Period values('2015-06-22 00:00:00','2015-06-30 00:00:00');
insert into Period values('2015-07-31 00:00:00','2015-08-20 00:00:00');
insert into Period values('2015-08-10 00:00:00','2015-08-11 00:00:00');
insert into Period values('2015-08-12 00:00:00','2015-08-20 00:00:00');
insert into Period values('2015-08-21 00:00:00','2015-08-30 00:00:00');
insert into Period values('2013-07-02 08:00:00','2015-08-31 00:00:00');

insert into Period values('2015-01-12 00:00:00','2015-01-31 00:00:00');
insert into Period values('2015-01-12 00:00:00','2999-12-31 00:00:00');
insert into Period values('2015-04-13 00:00:00','2015-07-15 00:00:00');
insert into Period values('2015-07-14 00:00:00','2015-07-16 00:00:00');
insert into Period values('2015-02-01 00:00:00','2015-03-29 00:00:00');


insert into Period values('2015-09-15 00:00:00','2999-12-31 23:59:59');
insert into Period values('2015-08-25 00:00:00','2999-12-31 23:59:59');
insert into Period values('2015-08-26 00:00:00','2999-12-31 23:59:59');
insert into Period values('2015-09-17 00:00:00','2999-12-31 23:59:59');


insert into Reading values('87650943', 'Philips', '2015-10-09 08:00:12', '60.3');
insert into Reading values('98765432', 'Philips', '2015-10-09 08:00:15', '60.1');
insert into Reading values('98765432', 'Philips', '2015-10-09 08:00:15', '60.1');
insert into Reading values('87650943', 'Philips', '2015-01-05 08:00:00', '60.4');
insert into Reading values('87650943', 'Philips', '2015-01-05 08:00:00', '60.4');
insert into Reading values('87650943', 'Philips', '2015-02-05 08:00:00', '60.4');
insert into Reading values('87650943', 'Philips', '2015-02-10 08:00:00', '60.4');
insert into Reading values('87650943', 'Philips', '2015-03-20 08:00:00', '60.4');
insert into Reading values('12098765', 'Philips', '2015-01-30 08:00:15', '35');
insert into Reading values('33333333', 'Xiaomi', '2015-09-18 08:05:52', '80');

insert into Setting values('35647828', 'Philips', '2015-10-09 09:00:55', '50.45');
insert into Setting values('12369901', 'Sony', '2015-09-18 08:05:52', '30.40');
insert into Setting values('12369901', 'Sony', '2015-09-15 08:05:52', '30.43');


insert into Wears values('2015-01-01 08:00:00', '2015-01-30 08:00:00', '123456789', 'pan99.healthunit.org');
insert into Wears values('2015-01-01 08:00:00', '2015-01-30 08:00:00', '987654321', 'pan88.healthunit.org');
insert into Wears values('2015-01-03 08:00:00', '2015-01-07 08:00:00', '123456789', 'pan99.healthunit.org'); --fails
insert into Wears values('2015-01-03 08:00:00', '2015-02-03 08:00:00', '123456789', 'pan99.healthunit.org'); --fails
insert into Wears values('2014-12-04 08:00:00', '2015-01-04 08:00:00', '123456789', 'pan99.healthunit.org'); --fails
insert into Wears values('2015-01-01 08:00:00', '2015-01-15 08:00:00', '123456789', 'pan99.healthunit.org'); --fails
insert into Wears values('2015-01-01 08:00:00', '2015-02-03 08:00:00', '123456789', 'pan99.healthunit.org'); --fails
insert into Wears values('2014-12-04 08:00:00', '2015-02-03 08:00:00', '123456789', 'pan99.healthunit.org'); --fails
insert into Wears values('2015-01-01 08:00:00', '2015-01-01 08:00:00', '123456789', 'pan99.healthunit.org'); --fails
insert into Wears values('2015-02-01 08:00:00', '2015-03-01 08:00:00', '123456789', 'pan33.healthunit.org');
insert into Wears values('2015-02-02 08:00:00', '2015-02-10 08:00:00', '98765432', 'pan99.healthunit.org'); --fails
insert into Wears values('2014-03-02 08:00:00', '2015-05-01 08:00:00', '123456789', 'pan99.healthunit.org'); --fails
insert into Wears values('2015-05-02 08:00:00', '2015-06-02 08:00:00', '98765432', 'pan99.healthunit.org'); --fails
insert into Wears values('2015-06-03 08:00:00', '2020-01-01 08:00:00', '123456789', 'pan99.healthunit.org');
insert into Wears values('2015-06-03 08:00:00', '2020-01-01 08:00:00', '987654321', 'pan88.healthunit.org');
insert into Wears values('2015-07-02 08:00:00', '2020-02-10 08:00:00', '987654322', 'pan33.healthunit.org');
insert into Wears values('2015-07-02 08:00:00', '2999-12-31 00:00:00', '465748931', 'pan77.healthunit.org');
insert into Wears values('2000-07-02 08:00:00', '2001-12-31 00:00:00', '465748931', 'pan99.healthunit.org');
insert into Wears values('2013-07-02 08:00:00', '2014-12-31 00:00:00', '465748931', 'pan66.healthunit.org');
insert into Wears values('2015-06-03 08:00:00', '2020-01-01 08:00:00', '123456789', 'pan99.healthunit.org');
insert into Wears values('2015-07-02 08:00:00', '2999-12-31 00:00:00', '657658675', 'pan22.healthunit.org');
insert into Wears values('2015-07-02 08:00:00', '2999-12-31 00:00:00', '111111111', 'pan69.healthunit.org');
insert into Wears values('2000-07-02 08:00:00', '2001-12-31 00:00:00', '111111111', 'pan71.healthunit.org');

insert into Wears values('2015-01-12 00:00:00', '2015-06-21 00:00:00', '234567891', 'pan01.healthunit.org');
insert into Wears values('2015-03-13 00:00:00', '2015-05-14 00:00:00', '345678912', 'pan02.healthunit.org');
insert into Wears values('2015-06-14 00:00:00', '2016-03-20 00:00:00', '456789123', 'pan01.healthunit.org'); --fails
insert into Wears values('2015-06-15 00:00:00', '2015-07-16 00:00:00', '567891234', 'pan02.healthunit.org');
insert into Wears values('2015-06-20 00:00:00', '2015-06-30 00:00:00', '234567891', 'pan03.healthunit.org'); --fails
insert into Wears values('2015-06-22 00:00:00', '2015-06-30 00:00:00', '234567891', 'pan03.healthunit.org');
insert into Wears values('2015-07-31 00:00:00', '2015-08-20 00:00:00', '567891234', 'pan01.healthunit.org');
insert into Wears values('2015-08-10 00:00:00', '2015-08-11 00:00:00', '678912345', 'pan02.healthunit.org');
insert into Wears values('2015-08-12 00:00:00', '2015-08-20 00:00:00', '678912345', 'pan01.healthunit.org'); --fails
insert into Wears values('2015-08-21 00:00:00', '2015-08-30 00:00:00', '678912345', 'pan01.healthunit.org');
insert into Wears values('2015-09-15 00:00:00', '2999-12-31 23:59:59', '678912345', 'pan02.healthunit.org');



insert into Connects values('2015-01-01 08:00:00', '2015-01-30 08:00:00', '87650943', 'Philips','pan99.healthunit.org');
insert into Connects values('2014-01-01 08:00:00', '2015-01-30 08:00:00', '35647828', 'Philips','pan99.healthunit.org');
insert into Connects values('2015-01-03 08:00:00', '2015-01-07 08:00:00', '87650943', 'Philips','pan99.healthunit.org'); --fails
insert into Connects values('2015-01-03 08:00:00', '2015-02-03 08:00:00', '87650943', 'Philips','pan99.healthunit.org'); --fails
insert into Connects values('2014-12-04 08:00:00', '2015-01-04 08:00:00', '87650943', 'Philips','pan99.healthunit.org'); --fails
insert into Connects values('2015-01-01 08:00:00', '2015-01-15 08:00:00', '87650943', 'Philips','pan99.healthunit.org'); --fails
insert into Connects values('2015-01-01 08:00:00', '2015-02-03 08:00:00', '87650943', 'Philips','pan99.healthunit.org'); --fails
insert into Connects values('2014-12-04 08:00:00', '2015-02-03 08:00:00', '87650943', 'Philips','pan99.healthunit.org'); --fails
insert into Connects values('2015-01-01 08:00:00', '2015-01-01 08:00:00', '87650943', 'Philips','pan99.healthunit.org'); --fails
insert into Connects values('2015-01-01 08:00:00', '2015-01-30 08:00:00', '12098765', 'Philips','pan88.healthunit.org');
insert into Connects values('2015-01-02 08:00:00', '2017-01-31 08:00:00', '12345678', 'Philips','pan99.healthunit.org');
insert into Connects values('2015-06-02 08:00:00', '2017-01-31 08:00:00', '87650943', 'Philips','pan88.healthunit.org');
insert into Connects values('2015-06-02 08:00:00', '2017-01-31 08:00:00', '12098765', 'Philips','pan33.healthunit.org');
insert into Connects values('2013-07-02 08:00:00', '2999-12-31 00:00:00', '67756535', 'Xiaomi','pan66.healthunit.org');
insert into Connects values('2013-07-02 08:00:00', '2999-12-31 00:00:00', '97754422', 'Xiaomi','pan66.healthunit.org');
insert into Connects values('2013-07-02 08:00:00', '2999-12-31 00:00:00', '55342299', 'Xiaomi','pan66.healthunit.org');
insert into Connects values('2013-07-02 08:00:00', '2999-12-31 00:00:00', '35647828', 'Philips','pan66.healthunit.org'); --fails
insert into Connects values('2000-07-02 08:00:00', '2001-12-31 00:00:00', '35647828', 'Philips','pan71.healthunit.org');
insert into Connects values('2015-07-02 08:00:00', '2999-12-31 00:00:00', '45545545', 'Samsung','pan66.healthunit.org');
insert into Connects values('2013-07-02 08:00:00', '2015-08-31 00:00:00', '11111111', 'Xiaomi','pan77.healthunit.org');
insert into Connects values('2015-06-02 08:00:00', '2017-01-31 08:00:00', '22222222', 'Xiaomi','pan33.healthunit.org');
insert into Connects values('2015-01-02 08:00:00', '2017-01-31 08:00:00', '33333333', 'Xiaomi','pan99.healthunit.org');

insert into Connects values('2015-01-12 00:00:00', '2015-01-31 00:00:00', '12369901', 'Sony','pan01.healthunit.org');
insert into Connects values('2015-01-12 00:00:00', '2015-01-31 00:00:00', '12369902', 'Xiaomi','pan01.healthunit.org');
insert into Connects values('2015-01-12 00:00:00', '2999-12-31 00:00:00', '12369903', 'Philips','pan01.healthunit.org');
insert into Connects values('2015-04-13 00:00:00', '2015-07-15 00:00:00', '12369904', 'Philips','pan02.healthunit.org');
insert into Connects values('2015-07-14 00:00:00', '2015-07-16 00:00:00', '12369904', 'Philips','pan03.healthunit.org');
insert into Connects values('2015-02-01 00:00:00', '2015-03-29 00:00:00', '12369902', 'Xiaomi','pan02.healthunit.org');

insert into Connects values('2015-08-25 00:00:00', '2999-12-31 23:59:59', '12369902', 'Xiaomi','pan01.healthunit.org');
insert into Connects values('2015-08-26 00:00:00', '2999-12-31 23:59:59', '12369903', 'Philips','pan01.healthunit.org');
insert into Connects values('2015-09-17 00:00:00', '2999-12-31 23:59:59', '12369901', 'Sony','pan02.healthunit.org');
insert into Connects values('2015-08-17 00:00:00', '2999-12-31 23:59:59', '33333333', 'Xiaomi', 'pan02.healthunit.org');

insert into Lives values('2015-01-02 08:00:00','2017-01-31 08:00:00','123456789','12345');
insert into Lives values('2015-01-02 08:00:00','2017-01-31 08:00:00','987654321','12345');
insert into Lives values('2015-01-02 08:00:00','2017-01-31 08:00:00','987654322','24351');
insert into Lives values('2015-01-02 08:00:00','2017-01-31 08:00:00','465748931','35374');
