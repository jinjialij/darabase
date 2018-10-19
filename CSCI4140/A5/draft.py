import mysql.connector
conn = mysql.connector.connect(
         user='root',
         password='RogerF1520',
         host='localhost',
         database='studentinfo')
cur = conn.cursor()
 
query1 = ("Alter table student_info add (Abb_Name varchar (10))")

cur.execute(query1)
 
cur.close()
conn.close()



import mysql.connector
conn = mysql.connector.connect(
         user='root',
         password='RogerF1520',
         host='localhost',
         database='studentinfo')

cur = conn.cursor()

query = ("Update student_info set Abb_Name='H.F' where ID=1")
cur.execute(query)

 
cur.close()
conn.close()



import mysql.connector
conn = mysql.connector.connect(
         user='root',
         password='RogerF1520',
         host='localhost',
         database='studentinfo')
cur = conn.cursor()

query = ("Insert into student_info values(101,'Jiali','Jin','jialijin@dal.ca','J.F')")
cur.execute(query)

 
cur.close()
conn.close()


import mysql.connector
conn = mysql.connector.connect(
         user='root',
         password='RogerF1520',
         host='localhost',
         database='studentinfo')
cur = conn.cursor()

query = ("Insert into student_info values(101,'Jiali','Jin','jialijin@dal.ca','J.F')")
cur.execute(query)

 
cur.close()
conn.close()



import mysql.connector
conn = mysql.connector.connect(
         user='root',
         password='RogerF1520',
         host='localhost',
         database='studentinfo')
cur = conn.cursor()
 
query = ("create table class(Stu_ID int,First_Name varchar(55),Last_Name varchar(55),Class_Numer int)")

cur.execute(query)

cur.close()
conn.close()


import mysql.connector
conn = mysql.connector.connect(
         user='root',
         password='RogerF1520',
         host='localhost',
         database='studentinfo')
cur = conn.cursor()
 
query = ("create table class(Stu_ID int,First_Name varchar(55),Last_Name varchar(55),Class_Numer int)")

cur.execute(query)

cur.close()
conn.close()

import mysql.connector
conn = mysql.connector.connect(
         user='root',
         password='RogerF1520',
         host='localhost',
         database='studentinfo')
         cur = conn.cursor()
 
query = ("drop table class")

cur.execute(query)

cur.close()
conn.close()


cur = conn.cursor()
 
query = ("create table class(Stu_ID int,First_Name varchar(55),Last_Name varchar(55),Class_Numer int)")

cur.execute(query)

cur.close()
conn.commit()

cur = conn.cursor()
 
query = ("Insert into class values(2,1)")


cur.execute(query)

cur.close()
conn.commit()
cur = conn.cursor()
 
query = ("SELECT * FROM course")

cur.execute(query)

print("ID First_name Last_Name Class_Name")
for (col1,col2,col3,col4) in cur:
    print("{}, {}, {}, {}".format(col1,col2,col3,col4))
 
cur.close()
conn.commit()

cur = conn.cursor()
 
query = ("drop table class")

cur.execute(query)

cur.close()
conn.commit()
conn.close()


cur = conn.cursor()
 
query1 = ("Insert into course values(3，3)")
query2 = ("Insert into course values(3，4)")
query3 = ("Insert into course values(3，5)")
query4 = ("Insert into course values(1，6)")
query5 = ("Insert into course values(2，7)")


cur.execute(query1)
cur.execute(query2)
cur.execute(query3)
cur.execute(query4)
cur.execute(query5)

cur.close()
conn.commit()
