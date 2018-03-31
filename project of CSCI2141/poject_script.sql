CREATE SCHEMA IF NOT EXISTS `Rental`;
use Rental;
/*use jiali;*/


CREATE TABLE IF NOT EXISTS  `Customer` (
`Customer_ID` INT NOT NULL auto_increment,
`Customer_FName` VARCHAR(45) NOT NULL,
`Customer_LName` VARCHAR(45) NOT NULL,
`Customer_Occupation` VARCHAR(45),
`Customer_Phone_Number`INT,
`Customer_Email`VARCHAR(45),
PRIMARY KEY (`Customer_ID`)
);

CREATE TABLE IF NOT EXISTS `Region` (
  `Region_Code` INT NOT NULL,
  `Region_Name` VARCHAR(45) NOT NULL,  
  PRIMARY KEY (`Region_Code`)
);

CREATE TABLE IF NOT EXISTS `Customer_Requirement` (
  `Customer_Requirement_ID` INT NOT NULL auto_increment,
  `Region_Code` INT NOT NULL,
  `RoomType_Code` INT,
  `MIN_Price`INT,
  `MAX_Price`INT,
  `Building_Type_Code` INT,
  `Bus available` TINYINT(1) default 0,
  `Pet requirement` TINYINT(1) default 0,
  `Facility_ID` INT default 1,
  `Customer_ID` INT NOT NULL,
  PRIMARY KEY (`Customer_Requirement_ID`),
  CONSTRAINT `fk_CR_Region`
    FOREIGN KEY (`Region_Code`)
    REFERENCES `Region` (`Region_Code`),
  CONSTRAINT `fk_CR_Customer`
	FOREIGN KEY (`Customer_ID`)
	REFERENCES `Customer` (`Customer_ID`)
);

CREATE TABLE IF NOT EXISTS `Building_Type` (
  `Building_Type_Code` INT NOT NULL,
  `BuildingType_Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Building_Type_Code`)
);


CREATE TABLE IF NOT EXISTS `Building` (
  `Building_Code` INT NOT NULL,
  `Building_Name` VARCHAR(45) NOT NULL,
  `Building_Type_Code` INT NOT NULL,
  `Region_Code` INT NOT NULL,
  `Bus-stop_Code` INT NOT NULL,
  `Pet restriction` TINYINT(1),
  PRIMARY KEY (`Building_Code`),
  CONSTRAINT `fk_Building_Region`
    FOREIGN KEY (`Region_Code`)
    REFERENCES `Region` (`Region_Code`),
  CONSTRAINT `fk_Building_Type`
    FOREIGN KEY (`Building_Type_Code`)
    REFERENCES `Building_Type` (`Building_Type_Code`)
);

CREATE TABLE IF NOT EXISTS `Bus` (  
  `Bus_Code` INT NOT NULL,
  PRIMARY KEY (`Bus_Code`)
);

CREATE TABLE IF NOT EXISTS `Bus-Stop` (
  `Bus-stop_Code` INT NOT NULL,
  `Building_Code` INT NOT NULL,
  PRIMARY KEY (`Bus-stop_Code`),
  CONSTRAINT `fk_Building`
    FOREIGN KEY (`Building_Code`)
    REFERENCES `Building` (`Building_Code`)
);

CREATE TABLE IF NOT EXISTS `Bus_Route` (  
  `Index` INT auto_increment,
  `Bus_Code` INT NOT NULL,
  `Bus-stop_Code` INT NOT NULL,
  PRIMARY KEY (`Index`),
  CONSTRAINT `fk_Bus`
    FOREIGN KEY (`Bus_Code`)
    REFERENCES `Bus` (`Bus_Code`),
  CONSTRAINT `fk_Bus-stop`
    FOREIGN KEY (`Bus-stop_Code`)
    REFERENCES `Bus-Stop` (`Bus-stop_Code`)
);


CREATE TABLE IF NOT EXISTS `FloorType` (
  `FloorType_Code` INT NOT NULL,
  `FloorTypeName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`FloorType_Code`)
);

CREATE TABLE IF NOT EXISTS `Room` (
  `Room_Code` INT NOT NULL,
  `Building_Code` INT NOT NULL,
  `RoomType_Code` INT NOT NULL,
  `RoomType_Name` VARCHAR(45) NOT NULL,
  `FloorType_Code` INT NOT NULL,
  `Price` INT NOT NULL,
  `Toilet_Num` INT NOT NUll,
  `SquareSize` INT NOT NULL,
  PRIMARY KEY (`Room_Code`),
  CONSTRAINT `fk_FloorType`
    FOREIGN KEY (`FloorType_Code`)
    REFERENCES `FloorType` (`FloorType_Code`),
  CONSTRAINT `fk_R_BuildingType`
    FOREIGN KEY (`Building_Code`)
    REFERENCES `Building` (`Building_Code`)
);

CREATE TABLE IF NOT EXISTS `Facility` (
  `Facility_ID` INT NOT NULL,
  `Facility_Name` VARCHAR(45) NOT NULL,
  `Facility_IsShared` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Facility_ID`)
);


CREATE TABLE IF NOT EXISTS `Building_Facility` (
  `BF_Num` INT NOT NULL,
  `Facility_ID` INT NOT NULL,
  `Building_Code` INT NOT NULL,
  PRIMARY KEY (`BF_Num`),
  CONSTRAINT `fk_Building_Facility_Facility1`
    FOREIGN KEY (`Facility_ID`)
    REFERENCES `Facility` (`Facility_ID`),
  CONSTRAINT `fk_Building_Facility_Cottage1`
    FOREIGN KEY (`Building_Code`)
    REFERENCES `Building` (`Building_Code`)
);

insert into Customer values(10000,'Bob','James','Student','2391178','bomb@dal.com');
insert into Customer values(10001,'Jan','Wang','Student','1132778','jw@email.cn');
insert into Customer values(10002,'Jose','Lee','Student','9287721','jlee@qqmail.com');
insert into Customer values(10003,'Harris','Lu','Student','4536682','hlu@dal.com');
insert into Customer values(10004,'Russ','Dong','Engineer','6721034','russD@Dong.com');
insert into Customer values(10005,'Song','Boss','Student','7082234','sBoss@Songrz.com');
insert into Customer values(10006,'Liu','Jabin','Student','9152741','LiuJ@Jiabin.com');
insert into Customer values(10007,'Guo','Zige','Student','09127320','zGuo@Guodal.com');

insert into Region values(100,'Halifax');
insert into Region values(101,'Bedford');
insert into Region values(102,'Dartmouth');


insert into Customer_Requirement values(1,100,1,400,1200,1,1,0,5,10000);
insert into Customer_Requirement values(2,101,2,800,1800,2,1,0,1,10001);
insert into Customer_Requirement values(3,102,3,900,1300,1,1,1,5,10002);
insert into Customer_Requirement values(4,102,2,580,1600,1,1,1,4,10003);
insert into Customer_Requirement values(5,101,4,1000,1500,2,0,0,3,10004);
insert into Customer_Requirement values(6,101,3,1000,2000,3,1,1,0,10005);
insert into Customer_Requirement values(7,100,4,1000,2500,3,1,1,2,10006);
insert into Customer_Requirement values(8,102,3,400,1700,2,1,0,5,10007);
insert into Customer_Requirement values(9,101,1,500,1200,1,1,0,5,10001);


insert into Bus values(10);
insert into Bus values(11);
insert into Bus values(12);
insert into Bus values(13);
insert into Bus values(14);
insert into Bus values(15);
insert into Bus values(16);
insert into Bus values(17);

insert into Building_Type values (1,'House');
insert into Building_Type values (2,'Apartment');
insert into Building_Type values (3,'Condo');

insert into Building values(1001,'Quingate',1,100,0,1);
insert into Building values(1002,'Quincourt',1,100,460,1);
insert into Building values(2003,'Queentower',2,101,462,0);
insert into Building values(2004,'Southpoint',2,101,463,0);
insert into Building values(3005,'Towerroad',3,102,0,1);
insert into Building values(3006,'Fenwick',3,102,464,1);
insert into Building values(1007,'Springwoter',2,101,461,0);
insert into Building values(2008,'Barrington',1,102,0,0);

insert into `Bus-Stop` values(460,1002);
insert into `Bus-Stop` values(461,3006);
insert into `Bus-Stop` values(462,2003);
insert into `Bus-Stop` values(463,2004);
insert into `Bus-Stop` values(464,3005);

insert into Bus_Route values(1,10,460);
insert into Bus_Route values(2,11,460);
insert into Bus_Route values(3,12,460);
insert into Bus_Route values(4,10,461);
insert into Bus_Route values(5,13,461);
insert into Bus_Route values(6,14,461);
insert into Bus_Route values(7,10,462);
insert into Bus_Route values(8,13,462);
insert into Bus_Route values(9,15,462);
insert into Bus_Route values(10,10,463);
insert into Bus_Route values(11,16,463);
insert into Bus_Route values(12,17,463);
insert into Bus_Route values(13,15,464);


insert into FloorType values (1,'Floor');
insert into FloorType values (2,'Carpet');

insert into Room values (1001,1001,1,'One bedroom',1,1100,1,750);
insert into Room values (1103,1002,1,'One bedroom',1,1125,1,890);
insert into Room values (1104,1007,1,'One bedroom',2,1125,1,890);
insert into Room values (2013,1007,2,'Two bedroom',2,1700,1,1100);
insert into Room values (2022,2003,2,'Two bedroom',1,1500,2,970);
insert into Room values (3021,2008,3,'Three bedroom',1,2100,1,1150);
insert into Room values (3042,3005,3,'Three bedroom',2,2500,2,1500);
insert into Room values (4064,3006,4,'Bachelor',1,850,1,475);
insert into Room values (4051,2004,4,'Bachelor',1,1050,1,575);

insert into Facility values (1,'Kitchen appliance',0);
insert into Facility values (2,'Balchony',0);
insert into Facility values (3,'Microwave',0);
insert into Facility values (4,'Swimming Pool',1);
insert into Facility values (5,'Gym',1);

insert into Building_Facility values (1,1,1001);
insert into Building_Facility values (2,2,1001);
insert into Building_Facility values (3,3,1001);
insert into Building_Facility values (4,4,1001);
insert into Building_Facility values (5,5,1001);
insert into Building_Facility values (6,1,1002);
insert into Building_Facility values (7,2,1002);
insert into Building_Facility values (8,4,1002);
insert into Building_Facility values (9,1,2003);
insert into Building_Facility values (10,2,2003);
insert into Building_Facility values (11,3,2003);
insert into Building_Facility values (12,5,2003);
insert into Building_Facility values (13,1,2004);
insert into Building_Facility values (14,2,2004);
insert into Building_Facility values (15,3,2004);
insert into Building_Facility values (16,4,2004);
insert into Building_Facility values (17,5,2004);
insert into Building_Facility values (18,1,3005);
insert into Building_Facility values (19,2,3005);
insert into Building_Facility values (20,3,3005);
insert into Building_Facility values (21,5,3005);
insert into Building_Facility values (22,1,3006);
insert into Building_Facility values (23,2,3006);
insert into Building_Facility values (24,3,3006);
insert into Building_Facility values (25,5,3006);
insert into Building_Facility values (26,1,1007);
insert into Building_Facility values (27,2,1007);
insert into Building_Facility values (28,3,1007);
insert into Building_Facility values (29,4,1007);
insert into Building_Facility values (30,1,2008);
insert into Building_Facility values (31,2,2008);
insert into Building_Facility values (32,3,2008);
insert into Building_Facility values (33,4,2008);
insert into Building_Facility values (34,5,2008);


;

/*The purpose of building2 is to change the Bus-stop_Code to bus condition so that in the front end, users can choose if they 
want to select rooms that can access bus*/
 create view building2 as
 select Building_Code,Building_Name,Building_Type_Code,Region_Code,`Pet restriction`, 
 case when `Bus-stop_Code`!=0 then 1
	when `Bus-stop_Code`=0 then 0
	end as Bus_condition
 from Building;
 
 /*this table is to combine building2 with other tables*/
create view table1 as
 select * from building2 natural join Region natural join Room natural join FloorType;
 
 /*table2 is to simplifed tables with columns that are needed.*/
 create view table2 as
 select * from
 (select Building_Code,Building_Name from Building)as t1 natural join Building_Facility natural join Facility;
 

 /*
 select * from table1;
 select * from table2;
 select * from table1  natural join table2;*/
 