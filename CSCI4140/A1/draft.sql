/*Q6 draft*/
(select country,count(customer_ID) as statictic_male from customer where gender like 'M' group by country);
select Country,count(Customer_ID) as statistic_country from customer group by country;




select s.Employee_ID,e1.Employee_Name,s.Job_title,s.Manager_ID,e2.Employee_Name as Manager_Name
from staff s,employee_addresses e1,employee_addresses e2
where s.Employee_ID=e1.Employee_ID and e2.Employee_ID=s.Manager_ID
and s.Job_Title like 'Temp.%' or s.Job_Title like 'Trainee';


select t1.Employee_ID,t1.Employee_Name,t1.Job_title,t1.Manager_ID,e2.Employee_Name as Manager_Name
from staff natural join employee_addresses as t1,employee_addresses e2
where t1.Job_Title like 'Temp.%' or t1.Job_Title like 'Trainee' and
e2.Employee_ID=t1.Manager_ID;

select t1.Employee_ID,t1.Employee_Name,t1.Job_title,t1.Manager_ID,t2.Employee_Name as Manager_Name
from staff as s1 join employee_addresses as t1 using (employee_ID), staff s2 join employee_addresses as t2 using (employee_ID)
where t3.Manager_ID=t2.Employee_ID and t1.Job_Title like 'Temp.%' or t1.Job_Title like 'Trainee';

select t1.Employee_ID,t1.Employee_Name,t1.Job_title,t1.Manager_ID,e.Employee_Name as Manager_Name
from staff join employee_addresses using (employee_ID),employee_addresses e
where Job_Title like 'Temp.%' or Job_Title like 'Trainee';

select s.Employee_ID,e.Employee_Name,Job_title,s.Manager_ID,t1.Employee_Name as Manager_Name
from (select * from staff where Job_Title like 'Temp.%' or Job_Title like 'Trainee' ) as s, 
employee_addresses e,(select Employee_ID,Employee_Name from employee_addresses) as t1
where s.Employee_ID=e.Employee_ID and t1.employee_ID=s.Manager_ID;

select * from staff join employee_addresses using(employee_ID);

select t3.Employee_ID,t3.Employee_Name,t3.Job_title,t3.Manager_ID,e.Employee_Name as Manager_Name
from
(select Employee_ID, Employee_Name,Job_title, Manager_ID from staff join employee_addresses using (employee_ID) where Job_Title like 'Temp.%' or Job_Title like 'Trainee')as t3,
employee_addresses e
where t3.Manager_ID=e.Employee_ID
order by Employee_ID;

/*
select count(customer_ID)as Total_num_of_Cus
from customer
group by Country;

select count(customer_ID) as Total_Num_of_MCus 
from customer 
where gender like 'M'
group by country;

select Country,count(customer_ID) as Total_Num_of_FCus 
from customer 
where gender like 'F'
group by country;


select country,sm/sc as 'Percent_Male' from
(select *
from (select country,count(customer_ID) as sm from customer where gender like 'M' group by country) as t1 join
(select Country,count(Customer_ID) as sc from customer group by country)as t2 using(country))as t3 
order by Percent_Male asc;

(select country,count(customer_ID) as statictic_male from customer where gender like 'M' group by country);
select Country,count(Customer_ID) as statistic_country from customer group by country;
*/



select s.Employee_ID,e.Employee_Name,s.Job_title,s.Manager_ID,t1.Employee_Name as Manager_Name
from (select * from staff where Job_Title like 'Temp.%' or Job_Title like 'Trainee' ) as s, 
employee_addresses e,(select Employee_ID,Employee_Name from employee_addresses) as t1
where s.Employee_ID=e.Employee_ID and t1.employee_ID=s.Manager_ID;


select *
from product_dim p, order_fact o
where left(p.Product_ID,2) =left(o.Product_ID,2);


select o.Product_ID, Product_Name,sum(Quantity)as Total_Sold
from product_dim p, order_fact o
where left(p.Product_ID,2) =left(o.Product_ID,2)
group by product_ID;


(select * from 
	order_fact AS O
	INNER JOIN product_dim AS P
	ON O.Product_ID = P.Product_ID);
    
    select o.Product_ID, 
case when left(p.Product_ID,3) =left(o.Product_ID,3) then Product_Line
when left(p.Product_ID,3) !=left(o.Product_ID,3) then null
end as Product_Name,
sum(Quantity)as Total_Sold
from product_dim p, order_fact o
where left(p.Product_ID,2) =left(o.Product_ID,2)
group by product_ID
order by Total_Sold desc,Product_Line asc;


/*select Product_ID,Product_Name,sum(Quantity)as Total_Sold from
(select O.Product_ID,P.Product_Name,Quantity from 
	order_fact AS O
	INNER JOIN product_dim AS P
	ON O.Product_ID = P.Product_ID)as a
group by Product_ID,product_Name
order by Total_Sold desc,Product_Name asc;*/