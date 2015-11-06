insert into Patient values('12345678', 'Roberto', 'Da Street, n3, 1Esq, 1000-999 Lisboa');
insert into Patient values('98765432', 'Toni', 'Da Street, n2, 4Esq, 1300-200 Oeiras');
insert into Patient values('987654322', 'Toni', 'Da Street, n2, 4Esq, 1300-200 Oeiras');  -- should fail

insert into PAN values('pan99.healthunit.org', '914457220');
insert into PAN values('pan33.healthunit.org', '845 763 207');
insert into PAN values('pan99.healthunit.org', '+351 914457220'); -- should fail

insert into Device values('87650943', 'Philips', 'blood pressure');
insert into Device values('98765432', 'Philips', 'blood pressure');
insert into Device values('12345678', 'Philips', 'scale');
insert into Device values('12098765', 'Philips', 'scale');
insert into Device values('87650943', 'Philips', 'scale'); -- should fail
