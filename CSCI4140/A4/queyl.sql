create schema 108House;
USE 108HOUSE;
create table 108House(
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
select * from 108house where STATE='ALASKA' AND REP_PARTY='REPUBLICAN'
ORDER BY YEAR,MONTH,DAY ASC;

/*Q2*/
select distinct Question from 108house order by question asc;

/*Q3*/
select REP_NAME, count(REP_NAME) from 108house where STATE='CALIFOR' and VOTE='NAY' GROUP BY REP_NAME;

select * from 108house where STATE='CALIFOR' and VOTE='NAY' ;
/*Q4*/
select REP_NAME, COUNT(REP_NAME) as numberOfVotes 
FROM HOUSE 
group by REP_NAME
ORDER BY COUNT(REP_NAME) asc limit 5 ;
/*Q5*/
select CONGR_DISTRICT,count(REP_NAME) from 108house group by CONGR_DISTRICT;
/*Q6*/
select VOTE,count(VOTE) as frequencyOfVote from HOUSE GROUP BY VOTE ;
/*Q7*/
SELECT state ,count(state) as totalNumberOfVotes from HOUSE group by state;
