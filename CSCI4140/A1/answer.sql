/*Q1*/
select Employee_ID,employee_Gender,Marital_Status,
Salary,round((salary*1/3),2) as Tax
from employee_payroll;

/*Q2*/
select Employee_ID,Salary,round((salary*0.04),2) as Bonus
from employee_payroll;

/*Q3*/
select distinct City from employee_addresses;

/*Q4*/
select Employee_ID,Recipients,(Qtr1+Qtr2+Qtr3+Qtr4) as Total
from employee_donations
where (Qtr1+Qtr2+Qtr3+Qtr4)>90;

/*Q5*/
select Country,City,count(employee_ID) as Num_of_employees
from employee_addresses
group by City
order by Country,City desc;


/*Q6*/
select * from
(select country,count(customer_ID)as Total_num_of_Cus from customer group by Country)as t1 join (select country,count(customer_ID) as Total_Num_of_MCus from customer where gender like 'M' group by country) as t2
 using (country) left join 
(select Country,count(customer_ID) as Total_Num_of_FCus from customer where gender like 'F' group by country)as t3 using (country)
left join (select country,sm/sc as Percent_Male from
(select * from (select country,count(customer_ID) as sm from customer where gender like 'M' group by country) as t4 join
(select Country,count(Customer_ID) as sc from customer group by country)as t5 using(country))as t6)as t7 using(country)
order by Percent_Male asc;
/*explaination
this query join 4 tables which seperately selecting total number of customer, total number of male customer, total number of female customer and percent of male customer. Since some countries do not have female customer, I use left join*/

/*Q7*/
select P.Product_ID,P.Product_Name,sum(Quantity)as Total_Sold from 
order_fact AS O INNER JOIN product_dim AS P ON O.Product_ID = P.Product_ID
group by P.Product_ID,P.product_Name
order by Total_Sold desc,P.Product_Name asc;

/*select Product id and name by combining order_fact and product_dim table,and calculate total_sold by group product id and name*/

/*Q8*/
select Customer_Name as Name,count(customer_ID) as Purchase 
from order_fact o join customer c using(customer_ID) 
left join product_dim p using(product_ID) 
where Employee_ID='99999999' and country != Supplier_Country and (country = 'US' or country = 'AU') 
group by customer_ID,customer_Name
order by Purchase desc,Customer_Name asc;
/*joining order_fact,customer, and left join product_dim and use where statement to select orders done through internet and 
select customers who are from US or AU, then group by customer_id so that
the column of purchase will calculate the number of purchasing of each customer.Then order the table according to the value of
purchase. Bigger the value is, the topper the customer name would be. If 2 customer have the same purchase value, they will be listed
in the alphabetical order*/
/*
select * from order_fact o join customer c using(customer_ID) left join product_dim p using(product_ID) where Employee_ID='99999999' and (country = 'US' or country = 'AU') ;
*/


/*Q9*/
select * from
(select t1.Employee_ID,t1.Employee_Name,t1.Job_title,t1.Manager_ID,t2.Employee_Name as Manager_Name
from (select Employee_ID,Employee_Name,Job_title,Manager_ID from staff join employee_addresses using(employee_ID)) as t1,
(select Employee_ID,Employee_Name,Job_title,Manager_ID from staff join employee_addresses using(employee_ID)) as t2
where t1.Manager_ID=t2.employee_ID)as t3
where Job_Title like 'Temp.%' or Job_Title like 'Trainee'
order by employee_ID;
/*this query gets the Employee_ID,Employee_Name,Job_title,Manager_ID and Manager_Name through join itself by matching Manager_ID with employee_ID,and basing on 
that, select job_title*/