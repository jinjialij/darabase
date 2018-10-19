/*excute sql one by one and insert data in this order*/
CREATE SCHEMA IF NOT EXISTS CCS;
use ccs;

create table gasstations_dim(
GasstationID int,
ChainID int,
Country varchar(5),
Segment varchar(55),
 primary key(GasstationID)
);

create table products_dim(
ProductID int,
Description varchar(255),
primary key(ProductID)
);

create table Customers_dim(
CustomerID int not null,
Segment varchar(5),
Currency varchar(5),
  primary key(CustomerID)
);

create table yearmonth(
No int not null,
CustomerID int,
Year int,
Month int,
Consumption decimal(15,2),
primary key(No),
constraint fk_ym_cust
foreign key (CustomerID)
references Customers(CustomerID)
);

create table Tansactions_fact(
TransactionID int not null,
Date date,
Time time,
CustomerID int,
CardID int,
GasstationID int,
ProductID int,
Amount int,
Price decimal(10,2),
primary key(TransactionID),
constraint fk_transaction_custID
foreign key(CustomerID)
references customers_dim(CustomerID),
constraint fk_transaction_gasstationID
foreign key(GasstationID)
references gasstations_dim(GasstationID),
constraint fk_transatcion_proID
foreign key(ProductID)
references products_dim(ProductID)
);

/*1 compare different gas stations' total price of transactions which is grouped by gasstationID*/
select GasstationID,ChainID, sum(Price) as Total, country
from transactions_fact left join gasstations_dim using(GasstationID)
Group by GasstationID  
order by Total desc, ChainID asc,country asc;

/*
2.To compare products sales according to each segnment in different chain gasstations in August*/
select Segment,Chainid,ProductID,sum(amount)as TotalAmount,sum(Price) as TotalIncome
from transactions_fact natural join gasstations_dim natural join products_dim
group by segment,ChainID,productid
order by segment,sum(Price) desc,chainid asc;


/*3.To find four most popular products' peck consumption hour of 3 segments' customers  */
select ProductID,Segment as CUS_Segment,sum(amount) as TotalSale,currency,left(time,2) as 'Hour' from transactions_fact natural join customers_dim
group by ProductID,segment,Hour
order by productid,currency asc,segment asc,totalsale desc;



/*4 to see total consumption of customers whose consumption is over 10000. By grouping data by currency, segment of customers
and customerid, mroe information of data can be access*/
select Currency,Segment,CustomerID,  sum(Consumption) as Sum_Consump
 from yearmonth_dim left join customers_dim using (customerID) 
 Group by Currency asc,Segment asc,CustomerID desc 
 having sum(Consumption)>10000
 order by sum(Consumption) desc;
