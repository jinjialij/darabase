use ccs;
select Segment,Chainid,ProductID, sum(Price) as TotalIncome, sum(Amount)
from transactions_fact inner join gasstations_dim using (GasstationID )
group by ProductID,ChainID,segment
having sum(Amount)>1500
order by segment,sum(Price) desc,chainid asc;

select Segment,ProductID,Chainid,sum(Price) as TotalIncome, sum(Amount)
from transactions_fact inner join gasstations_dim using (GasstationID )
where segment='Other' and productid=2 and ChainID=3
group by ProductID
order by segment;

select * from transactions_fact left join gasstations_dim using (gasstationid)
where segment='Other';

select * 
from (select * from transactions_fact left join gasstations_dim using (gasstationid) 
where segment='Other')as t1
where chainID=3;

/*Q2*/
select Segment,Chainid,ProductID,sum(Price) as TotalIncome, sum(Amount) as SaleQuantity
from (select * from transactions_fact inner join gasstations_dim using (gasstationid) 
where segment='Other')as t1
group by chainID,productID
having sum(Price) >500
order by ChainID,ProductID;

select *  from  transactions_fact left join  gasstations_dim using (gasstationid)  left join products_dim using (productID);


select productid,segment,sum(amount) as TotalSale,currency,left(time,2) as 'Hour' from transactions_fact natural join customers_dim
group by ProductID,segment,Hour
order by productid,currency asc,segment asc,totalsale desc;

select productid,segment,sum(amount) as TotalSale,currency,left(time,2) as 'Hour' from transactions_fact inner join customers_dim using (customerID) where Currency like 'CZK' and ProductID=2
group by Hour,segment
order by Hour,segment desc;


select GasstationID,ChainID, sum(Price) as Total, country
from transactions_fact left join gasstations_dim using(GasstationID)
Group by GasstationID  
having sum(Price)>5000
order by Total desc, ChainID asc,country asc;

select Currency,Segment,CustomerID,  sum(Consumption) as Sum_Consump
 from yearmonth_dim left join customers_dim using (customerID) 
 Group by Currency asc,Segment asc,CustomerID desc 
 having sum(Consumption)>50000
 order by Currency asc,sum(Consumption) desc;

select * from transactions_fact inner join (select customerID,currency from customers_dim) as t using(customerID) inner join gasstations_dim using (gasstationID) where Currency='CZK';


select sum(Price) as TotalPrice,chainID,ProductID from(
select * from transactions_fact inner join (select customerID,currency from customers_dim) as t using(customerID) inner join gasstations_dim using (gasstationID) where Currency='CZK') as t1
group by chainID,ProductID
order by sum(Price) desc, ChainID asc,ProductID asc;