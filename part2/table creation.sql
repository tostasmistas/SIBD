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
   (number  integer(9), -- health no. in portugal has 9 digits
    name    varchar(255),
    address	varchar(255),
    primary key(number));

create table PAN
   (domain	varchar(255),
    phone	  numeric(9,0),  -- phones numbers in portugal have 9 digits
    primary key(domain));

create table Device
   (serialnum     numeric(8,0), -- how many digits has the serial number of a device?
    manufacturer  varchar(255),
    description		varchar(255),
    primary key(serialnum, manufacturer));

create table Sensor
   (snum	numeric(8,0),
    manuf	varchar(255),
    units	varchar(255),
    primary key(snum, manuf),
    foreign key(snum, manuf) references Device(serialnum, manufacturer));

create table Actuator
   (snum	numeric(8,0),
    manuf	varchar(255),
    units	varchar(255),
    primary key(snum, manuf),
    foreign key(snum, manuf) references Device(serialnum, manufacturer));

create table Municipality
   (nut4code	numeric(5,0), -- 5 digit code assigned by the National Bureau of Statistics
    name		  varchar(255),
    primary key(nut4code));

create table Period
   (start	timestamp,
    end	  timestamp,
    primary key(start, end));

create table Reading
   (snum		  numeric(8,0),
    manuf     varchar(255),
    datetime  timestamp,
    value     numeric(5,2),  -- values read from the sensors have 5 total digits and 2 fractional digits
    primary key(snum, manuf, datetime),
    foreign key(snum, manuf) references Sensor(snum, manuf));

create table Setting
   (snum		  numeric(8,0),
    manuf		  varchar(255),
    datetime  timestamp,
    value		  numeric(5,2), -- settings sent to the actuators have 5 total digits and 2 fractional digits
    primary key(snum, manuf, datetime),
    foreign key(snum, manuf) references Actuator(snum, manuf));

create table Wears
   (start   timestamp,
    end    	timestamp,
    patient integer(9),
    pan     varchar(255),
    primary key(start, end, patient),
    foreign key(start, end) references Period(start, end),
    foreign key(patient) references Patient(number),
    foreign key(pan) references PAN(domain));

create table Lives
   (start   timestamp,
    end     timestamp,
    patient	integer(9),
    muni    numeric(5,0),
    primary key(start, end, patient),
    foreign key(start, end) references Period(start, end),
    foreign key(patient) references Patient(number),
    foreign key(muni) references Municipality(nut4code));

create table Connects
   (start timestamp,
    end   timestamp,
    snum	numeric(8,0),
    manuf varchar(255),
    pan   varchar(255),
    primary key(start, end, snum, manuf),
    foreign key(start, end) references Period(start, end),
    foreign key(snum, manuf) references Device(serialnum, manufacturer),
    foreign key(pan) references PAN(domain));
