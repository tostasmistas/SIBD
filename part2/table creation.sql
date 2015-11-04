drop table if exists Patient;
drop table if exists PAN;
drop table if exists Device;
drop table if exists Sensor;
drop table if exists Actuator;
drop table if exists Municipality;
drop table if exists Period;
drop table if exists Reading;
drop table if exists Setting;
drop table if exists Wears;
drop table if exists Lives;
drop table if exists Connects;

create table Patient
   (number  ,
    name    varchar(255),
    address varchar(255),
    primary key(number));

create table PAN
   (domain  varchar(255),
    phone   ,
    primary key(domain));

create table Device
   (serialnum     ,
    manufacturer  varchar(255),
    description   varchar(255),
    primary key(serialnum, manufacturer));

create table Sensor
   (snum     ,
    manuf varchar(255),
    units varchar(255),
    primary key(snum, manuf),
    foreign key(snum) references Device(serialnum)
    foreign key(manuf) references Device(manufacturer));

create table Actuator
   (snum     ,
    manuf varchar(255),
    units varchar(255),
    primary key(snum, manuf),
    foreign key(snum) references Device(serialnum)
    foreign key(manuf) references Device(manufacturer));

create table Municipality
   (nut4code     ,
    name      varchar(255),
    primary key(nut4code));

create table Period
   (start     ,
    end       ,
    primary key(start, end));

create table Reading
   (snum     ,
    manuf     varchar(255),
    datetime  DATETIME
    value
    primary key(snum, manuf, datetime),
    foreign key(snum) references Sensor(snum)
    foreign key(manuf) references Sensor(manuf));

create table Setting
   (snum     ,
    manuf     varchar(255),
    datetime  DATETIME
    value
    primary key(snum, manuf, datetime),
    foreign key(snum) references Actuator(snum)
    foreign key(manuf) references Actuator(manuf));

create table Wears
   (start     ,
    end    	varchar(255),
    patient
    pan
    primary key(start, end, patient),
    foreign key(start) references Period(start),
    foreign key(end) references Period(end),
    foreign key(patient) references Patient(number),
    foreign key(pan) references PAN(domain));

create table Lives
   (start     ,
    end    	varchar(255),
    patient
    muni
    primary key(start, end, patient),
    foreign key(start) references Period(start),
    foreign key(end) references Period(end),
    foreign key(patient) references Patient(number),
    foreign key(muni) references Municipality(nut4code));

create table Connects
   (start     ,
    end    	varchar(255),
    snum
    manuf
    pan
    primary key(start, end, snum, manuf),
    foreign key(start) references Period(start),
    foreign key(end) references Period(end),
    foreign key(snum) references Device(serialnum),
    foreign key(manuf) references Device(manufacturer)
    foreign key(pan) references PAN(domain));
