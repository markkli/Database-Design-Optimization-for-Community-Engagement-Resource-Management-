create database if not exists Urban_Root_DB; use Urban_Root_DB;
create table seed (
Product_ID INT primary key,
cost_per_plant decimal(10,2) not null, yield_per_plant int not null, area_per_plant decimal(5,1) not null, required_soil_type char(5) not null, quantity int not null
);
create table plot(
Plot_ID INT primary key,
size int not null,
location varchar(10) not null, soil_type char(5) not null
);
create table Person(
PID INT PRIMARY KEY, name Varchar(100),
Age INT,
Gender Varchar(20),
City Varchar(20),
State Varchar(20) );
CREATE TABLE Fund (
Fund_ID INT PRIMARY KEY,
Fund_Type ENUM('Cash', 'Credit Card', 'Check'), Amount DECIMAL(10, 2),
PID INT,
FOREIGN KEY (PID) REFERENCES Person(PID)
);
create table Fund_invest_Planting_schedule( Fund_ID INT,
Plot_ID varchar(5),
Schedule_ID varchar(5),
Invest_Date varchar(15),
foreign key (Fund_ID) references Fund(Fund_ID)
);
create table Event
(
Event_ID INT PRIMARY KEY, Event_Date Datetime,
Name Varchar(50),
Capacity INT
);
Create table Member
(
PID INT,
foreign key(PID) references person(PID), Membership_Status Varchar(20), Join_Date Datetime,
Renewal_Date Datetime, Duty Varchar(100)
);
create table member_attend_workshop (

PID INT,
foreign key(PID) references person(PID), Event_ID INT,
foreign key(Event_ID) references Event(Event_ID) );
create table visitor_participate_educational_tour (
PID INT,
foreign key(PID) references person(PID), Event_ID INT,
foreign key(Event_ID) references Event(Event_ID) );
create table volunteer_support_volunteer_day (
PID INT,
foreign key(PID) references person(PID), Event_ID INT,
foreign key(Event_ID) references Event(Event_ID) );
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.0/Uploads/Event.csv' INTO TABLE Event
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 ROWS;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.0/Uploads/person.csv' INTO TABLE person
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 ROWS;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.0/Uploads/Member.csv' INTO TABLE Member
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.0/Uploads/member_attend_workshop.csv'
INTO TABLE member_attend_workshop
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 ROWS;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.0/Uploads/Visitor_participate_tour.csv'
INTO TABLE visitor_participate_educational_tour
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 ROWS;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.0/Uploads/Volunteer_support_day.csv'
INTO TABLE volunteer_support_volunteer_day
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 ROWS;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.0/Uploads/Seed.csv' INTO TABLE seed
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 ROWS;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.0/Uploads/Fund.csv' INTO TABLE fund
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 ROWS;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.0/Uploads/Plot.csv' INTO TABLE plot
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.0/Uploads/Fund_invest_Planting_schedule.csv'
INTO TABLE fund_invest_planting_Schedule
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 ROWS;