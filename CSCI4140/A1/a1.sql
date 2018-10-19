create schema if not exists samplecompany;
use samplecompany;


CREATE TABLE IF NOT EXISTS  `customer`(
`no` int NOT NULL,
Customer_ID int not null,
Country varchar(45),
Gender char(1),
Personal_ID varchar(15),
Customer_Name varchar(90),
Customer_FirstName varchar(45),
Customer_LastName varchar(45),
Birth_Date date,
Customer_Address varchar(90),
Street_ID numeric(10),
Street_Number int,
Customer_Type_ID int,
primary key(`Customer_ID`)
);

CREATE TABLE IF NOT EXISTS  `employee_addresses`(
`no` int not null,
Employee_ID int not null,
Employee_Name varchar(45),
Street_ID numeric(10,0),
Street_Number int,
Street_Name varchar(45),
City varchar(45),
State char(2),
Postal_Code int,
Country char(2),
primary key(`no`),
CONSTRAINT `fk_emp_payroll_empid`
	foreign key(`Employee_ID`)
	references `staff`(`Employee_ID`)
);

CREATE TABLE IF NOT EXISTS  `employee_donations`(
`no` int not null,
Employee_ID int not null,
Qtr1 int,
Qtr2 int,
Qtr3 int,
Qtr4 int,
Recipients varchar(255),
Paid_By varchar(45),
primary key(`no`),
CONSTRAINT `fk_emp_donation_empid`
	foreign key(`Employee_ID`)
	references `staff`(`Employee_ID`)
);

CREATE TABLE IF NOT EXISTS  `employee_payroll`(
`no` int not null,
Employee_ID int not null,
Employee_Gender char(1),
Salary int,
Birth_Date date,
Employee_Hire_Date date,
Employee_Term_Date date default null,
Marital_Status char(1),
Dependents smallint,
primary key(`no`),
CONSTRAINT `fk_payroll_empid`
	foreign key(`Employee_ID`)
	references `staff`(`Employee_ID`)
);

CREATE TABLE IF NOT EXISTS  `product`(
`no` int not null,
Product_ID numeric(12),
Product_Line varchar(45),
Product_Category varchar(45),
Product_Group varchar(45),
Product_Name varchar(45),
Supplier_Country char(2),
Supplier_Name varchar(45),
Supplier_ID int,
primary key(`Product_ID`)
);

CREATE TABLE IF NOT EXISTS  `order_fact`(
`no` int not null,
Customer_ID int not null,
Employee_ID int not null,
Street_ID numeric(10),
Order_Date varchar(50),
Delivery_Date varchar(50),
Order_ID numeric(10) not null,
Order_Type int,
Product_ID bigint,
Quantity int,
Total_Retail_Price decimal(10,2),
CostPrice_Per_Unit decimal(10,2),
Discount varchar(10),
primary key(`no`),
CONSTRAINT `fk_order_fact_cusid`
	foreign key(`Customer_ID`)
	references `customer`(`Customer_ID`)
);

CREATE TABLE IF NOT EXISTS  `staff`(
`no` int not null,
Employee_ID int,
Start_Date date,
End_Date date,
Job_Title varchar(45),
Salary int,
Gender char(1),
Birth_Date date,
Emp_Hire_Date date,
Emp_Term_Date date,
Manager_ID int,
primary key(`Employee_ID`)
);

