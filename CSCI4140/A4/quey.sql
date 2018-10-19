create schema HOUSE;
USE HOUSE;

create table House(
BILL_ID varchar(35),
CQ int,
YEAR int,
Month INT,
DAY INT,
TITLE VARCHAR(255),
REP_NAME varchar(35),
REP_PARTY varchar(35),
STATE VARCHAR(35),
STATE_CODE INT(11),
CONGR_DISTRICT INT(11),
VOTE VARCHAR(35),
QUESTION VARCHAR(255)
);

create table House108th1(
BILL_ID varchar(35),
CQ int,
YEAR int,
Month INT,
DAY INT,
TITLE VARCHAR(255),
REP_NAME varchar(35),
REP_PARTY varchar(35),
STATE VARCHAR(35),
STATE_CODE INT(11),
CONGR_DISTRICT INT(11),
VOTE VARCHAR(35),
QUESTION VARCHAR(255)
);

/*Q1*/
select * from HOUSE where STATE='ALASKA' AND REP_PARTY='REPUBLICAN'
ORDER BY YEAR,MONTH,DAY ASC;

/*Q2*/
select distinct Question from HOUSE order by question asc;
/*Q3*/
select REP_NAME, count(REP_NAME) as TimesVotingForNay from HOUSE where STATE='CALIFOR' and VOTE='NAY' GROUP BY REP_NAME;

/*Q4*/
select REP_NAME, COUNT(REP_NAME) as numberOfVotes FROM HOUSE group by REP_NAME
ORDER BY COUNT(REP_NAME) asc limit 5 ;
/*Q5*/
select CONGR_DISTRICT,count(REP_NAME) as numberOfRepresentatives from HOUSE group by CONGR_DISTRICT order by count(REP_NAME);

/*Q6*/
select VOTE,count(VOTE) as frequencyOfVote from HOUSE GROUP BY VOTE ;
/*Q7*/
SELECT state ,count(state) as totalNumberOfVotes from HOUSE group by state;