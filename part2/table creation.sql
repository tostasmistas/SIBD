drop table if exists Wears;
drop table if exists Lives;
drop table if exists Connects;
drop table if exists Reading;
drop table if exists Setting;
drop table if exists Actuator;
drop table if exists Sensor;
drop table if exists Patient;
drop table if exists PAN;
drop table if exists Device;
drop table if exists Municipality;
drop table if exists Period;

create table Patient
   (number  numeric(9,0), -- health no. in portugal has 9 digits
    name    varchar(255),
    address	varchar(255),
    primary key(number));

create table PAN
   (domain	varchar(255),
    phone	  numeric(9,0),  -- phones numbers in portugal have 9 digits
    primary key(domain));

create table Device
   (serialnum     NUMERIC(8,0), -- how many digits has the serial number of a device?
    manufacturer  VARCHAR(255),
    description		VARCHAR(255),
    primary key(serialnum, manufacturer));

create table Sensor
   (snum	NUMERIC(8,0),
    manuf	VARCHAR(255),
    units	VARCHAR(255),
    primary key(snum, manuf),
    foreign key(snum, manuf) references Device(serialnum, manufacturer));

create table Actuator
   (snum	NUMERIC(8,0),
    manuf	VARCHAR(255),
    units	VARCHAR(255),
    primary key(snum, manuf),
    foreign key(snum, manuf) references Device(serialnum, manufacturer));

create table Municipality
   (nut4code	NUMERIC(5,0), -- 5 digit code assigned by the National Bureau of Statistics
    name		  VARCHAR(255),
    primary key(nut4code));

create table Period
   (start	TIMESTAMP,
    ends		TIMESTAMP,
    primary key(start, ends));

create table Reading
   (snum		  NUMERIC(8,0),
    manuf     VARCHAR(255),
    datetime  TIMESTAMP,
    value     NUMERIC(5,2),  -- values read from the sensors have 5 total digits and 2 fractional digits
    primary key(snum, manuf, datetime),
    foreign key(snum, manuf) references Sensor(snum, manuf));

create table Setting
   (snum		  NUMERIC(8,0),
    manuf		  VARCHAR(255),
    datetime  TIMESTAMP,
    value		  NUMERIC(5,2), -- settings sent to the actuators have 5 total digits and 2 fractional digits
    primary key(snum, manuf, datetime),
    foreign key(snum, manuf) references Actuator(snum, manuf));

create table Wears
   (start     TIMESTAMP,
    ends    	  TIMESTAMP,
    patient   NUMERIC(9,0),
    pan       VARCHAR(255),
    primary key(start, ends, patient),
    foreign key(start, ends) references Period(start, ends),
    foreign key(patient) references Patient(number),
    foreign key(pan) references PAN(domain));

create table Lives
   (start   TIMESTAMP,
    ends    	TIMESTAMP,
    patient	NUMERIC(9,0),
    muni    NUMERIC(5,0),
    primary key(start, ends, patient),
    foreign key(start, ends) references Period(start, ends),
    foreign key(patient) references Patient(number),
    foreign key(muni) references Municipality(nut4code));

create table Connects
   (start   TIMESTAMP,
    ends    	TIMESTAMP,
    snum	  NUMERIC(8,0),
    manuf   VARCHAR(255),
    pan     VARCHAR(255),
    primary key(start, ends, snum, manuf),
    foreign key(start, ends) references Period(start, ends),
    foreign key(snum, manuf) references Device(serialnum, manufacturer),
    foreign key(pan) references PAN(domain));
