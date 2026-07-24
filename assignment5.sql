-- Assignment-5 24july2026

-- Section 1: DDL (Data Definition Language) — Q1 to Q12 

-- 1.	Create a database for the college records. 

create database collegeDB

use collegeDB

-- 2.	Create the Department table. 

create table department
(DEPARTMENTID INT ,
DNAME VARCHAR(30))

-- 3.	Create the Student table with all required columns. 

create table student
( ROLLNO INT ,
  SNAME VARCHAR(30),
  COURSE VARCHAR(30),
  MARKS INT,
  CITY VARCHAR(30),
  GENDER CHAR(1),
  AGE INT,
  ADMISSIONDATE DATE,
  FEE MONEY,
  DEPARTMENTID INT 
)

-- 4.	Add a new column to the Student table to store the student's email address. 

alter table student
add EMAIL VARCHAR(30) 

-- 5.	Modify the data type/size of the email column you just added.

ALTER TABLE STUDENT
ALTER COLUMN EMAIL VARCHAR(50)

-- 6.	Rename the newly added email column to something more suitable. 

Sp-rename 'student.email' ,'emailid'

-- 7.	Drop the email column from the Student table. 

alter table student
drop column emailid

-- 8.	Rename the Student table to StudentRecords and then rename it back to Student.

sp_rename 'student' , 'StudentRecords'

sp_rename 'StudentRecords' , 'student'

-- 9.	Write a query to view the complete structure of the Student table. 

sp_help student

-- 10.	Write a query to view the complete structure of the Department table. 

sp_help department

-- 11.	Truncate all the data from the Department table and recreate it. 

truncate table department

-- 12.	Drop the Department table and create it again with the same structure. 

drop table department

create table department
(DEPARTMENTID INT ,
DNAME VARCHAR(30))

-- Section 2: Constraints — PK, FK, UNIQUE, NOT NULL, DEFAULT, CHECK — Q13 to Q32 

-- 13.	Set the primary key on the Department table. 

alter table department
alter column DEPARTMENTID INT NOT NULL

alter table department 
add constraint pk_dept PRIMARY KEY (DEPARTMENTID)

-- 14.	Set the primary key on the Student table. 

alter table STUDENT
alter column ROLLNO INT NOT NULL

alter table student
add constraint pk_rollno PRIMARY KEY(ROLLNO)

-- 15.	Add a foreign key on the Student table that references the Department table. 

alter table student
add constraint fkk_dept
foreign key (DEPARTMENTID)
references department(DEPARTMENTID)

-- 16.	Try inserting a student record with a department value that does not exist in the Department table and observe the result. 

insert into student
(ROLLNO,SNAME,COURSE,MARKS,CITY,GENDER,AGE,ADMISSIONDATE,FEE,DEPARTMENTID)
values
(1,'Janavi','Computer Science',85,'Vadodara','F',20,'2024-06-01',25000,99)


-- 17.	Apply a NOT NULL constraint on the student's name column. 

alter table student
alter column SNAME VARCHAR(30) NOT NULL


-- 18.	Apply a NOT NULL constraint on the course column. 

alter table student
alter column COURSE VARCHAR(30) NOT NULL

-- 19.	Apply a UNIQUE constraint on a column that stores each student's roll number. 

alter table student
add constraint uq_rollno UNIQUE(ROLLNO)

-- 20.	Apply a UNIQUE constraint on the email column (add the column again if you had dropped it earlier). 

alter table student
add EMAILID VARCHAR(50)

alter table student
add constraint uq_email UNIQUE(EMAILID)


-- 21.	Apply a DEFAULT constraint on the city column with a default value of your choice. 

alter table student
add constraint df_city
DEFAULT 'Vadodara' FOR CITY


-- 22.	Apply a DEFAULT constraint on the fee column with a default value. 

alter table student
add constraint df_fee
DEFAULT 15000 FOR FEE

-- 23.	Apply a CHECK constraint on the marks column so that marks cannot be negative or greater than 100. 

alter table student
add constraint chk_marks
CHECK (MARKS BETWEEN 0 AND 100)

-- 24.	Apply a CHECK constraint on the age column so that age must be greater than or equal to 15. 

alter table student
add constraint chk_age
CHECK (AGE >= 15)


-- 25.	Apply a CHECK constraint on the gender column so that only 'M' or 'F' can be entered. 

alter table student
add constraint chk_gender
CHECK (GENDER IN ('M','F'))


-- 26.	Remove the CHECK constraint applied on the age column. 

alter table student
drop constraint chk_age


-- 27.	Remove the UNIQUE constraint applied on the roll number column. 

alter table student
drop constraint uq_rollno

-- 28.	Remove the DEFAULT constraint applied on the fee column. 

alter table student
drop constraint df_fee

-- 29.	Remove the foreign key constraint from the Student table. 

alter table student
drop constraint fkk_dept

-- 30.	Add the foreign key constraint back to the Student table. 

alter table student
add constraint fk_department
foreign key (DEPARTMENTID)
references department(DEPARTMENTID)


-- 31.	Remove the primary key from the Department table and then reapply it. 

alter table department
drop constraint pk_dept

alter table department
add constraint pk_dept
primary key(DEPARTMENTID)

-- 32.	Try deleting a department from the Department table that is still referenced by a student and observe the result. 

delete from department
where departmentid = 1

-- Section 3: DML (Data Manipulation Language) — Q33 to Q47 

-- 33. Insert 5 records into the Department table.

insert into department values
(1,'Computer Science'),
(2,'Commerce'),
(3,'Arts'),
(4,'Management'),
(5,'Science')

-- 34. Insert 20 records into the Student table.

insert into student values
(1,'Janavi','Computer Science',85,'Vadodara','F',20,'2024-06-01',25000,1,'janavi@gmail.com'),
(2,'Rohit','Commerce',72,'Ahmedabad','M',19,'2024-06-02',18000,2,'rohit@gmail.com'),
(3,'Tejasvi','Arts',68,'Surat','F',21,'2024-06-03',15000,3,'tejasvi@gmail.com'),
(4,'Het','Computer Science',92,'Vadodara','M',20,'2024-06-04',28000,1,'het@gmail.com'),
(5,'Zalak','Science',78,'Rajkot','F',22,'2024-06-05',22000,5,'zalak@gmail.com'),
(6,'Sujal','Management',65,'Delhi','M',23,'2024-06-06',26000,4,'sujal@gmail.com'),
(7,'Hemangi','Computer Science',88,'Ahmedabad','F',20,'2024-06-07',24000,1,'hemangi@gmail.com'),
(8,'Yuvraj','Commerce',55,'Jaipur','M',21,'2024-06-08',17000,2,'yuvraj@gmail.com'),
(9,'Drasti','Science',95,'Vadodara','F',22,'2024-06-09',30000,5,'drasti@gmail.com'),
(10,'Ashish','Arts',45,'Surat','M',20,'2024-06-10',16000,3,'ashish@gmail.com'),
(11,'Om','Management',83,'Delhi','M',23,'2024-06-11',27000,4,'om@gmail.com'),
(12,'Rina','Computer Science',91,'Ahmedabad','F',19,'2024-06-12',29000,1,'rina@gmail.com'),
(13,'Keval','Commerce',60,'Vadodara','M',20,'2024-06-13',21000,2,'keval@gmail.com'),
(14,'Neha','Science',73,'Rajkot','F',21,'2024-06-14',23000,5,'neha@gmail.com'),
(15,'Arjun','Management',81,'Delhi','M',22,'2024-06-15',26000,4,'arjun@gmail.com'),
(16,'Sakshi','Computer Science',98,'Ahmedabad','F',20,'2024-06-16',31000,1,'sakshi@gmail.com'),
(17,'Rohan','Commerce',34,'Jaipur','M',19,'2024-06-17',14000,2,'rohan@gmail.com'),
(18,'Divya','Arts',76,'Surat','F',20,'2024-06-18',20000,3,'divya@gmail.com'),
(19,'Atharva','Science',89,'Vadodara','M',22,'2024-06-19',28000,5,'atharva@gmail.com'),
(20,'Chirag','Computer Science',67,'Ahmedabad','M',21,'2024-06-20',25000,1,'chirag@gmail.com')

-- 35.	Insert a record into the Student table without providing a value for the city column, to check the DEFAULT constraint. 

insert into student
(ROLLNO,SNAME,COURSE,MARKS,GENDER,AGE,ADMISSIONDATE,FEE,DEPARTMENTID,EMAILID) values
(21,'Karan','Commerce',75,'M',20,'2024-06-21',18000,2,'karan@gmail.com')

-- 36.	Insert a record into the Student table without providing a value for the fee column, to check the DEFAULT constraint. 

insert into student
(ROLLNO,SNAME,COURSE,MARKS,CITY,GENDER,AGE,ADMISSIONDATE,DEPARTMENTID,EMAILID)
values
(22,'Priya','Science',82,'Vadodara','F',20,'2024-06-22',5,'priya@gmail.com')

-- 37.	Update the marks of a student whose roll number is a specific value, increasing it by 5. 

update student
set marks = marks+5
where rollno = 5

-- 38.	Update the fee amount of all students belonging to a particular course. 

update student
set fee = fee + 2000
where course = 'Computer Science'

-- 39.	Update the city of a student from one city to another. 

update student
set city = 'Gandhinagar'
where city = 'Vadodara'

-- 40.	Update the department of a student to a different valid department. 

update student
set departmentid = 5
where rollno = 8

-- 41.	Delete the record of a student with a specific roll number. 

delete from student
where rollno = 20

-- 42.	Delete all students whose marks are less than 35. 

delete from student
where marks < 35

-- 43.	Delete all students belonging to a particular city. 

delete from student
where city = 'Jaipur'

-- 44.	Insert a record leaving the student name blank and check whether the NOT NULL constraint blocks it. 

insert into student
(ROLLNO,COURSE,MARKS,CITY,GENDER,AGE,ADMISSIONDATE,FEE,DEPARTMENTID,EMAILID)
values
(23,'Science',80,'Vadodara','F',20,'2024-06-23',25000,5,'test@gmail.com')


-- 45.	Insert a record with a duplicate roll number and check whether the UNIQUE constraint blocks it. 

insert into student values
(1,'Rekha','Science',70,'Vadodara','M',20,'2024-06-24',20000,5,'rekha@gmail.com')


-- 46.	Insert a record with age less than the allowed minimum and check whether the CHECK constraint blocks it. 

insert into student values
(24,'Rakesh','Commerce',75,'Vadodara','M',12,'2024-06-24',18000,2,'rakesh@gmail.com')

-- 47.	Update the marks of a student to a value greater than 100 and check whether the CHECK constraint blocks it. 

update student
set marks = 110
where rollno = 2


-- Section 4: Operators — Q48 to Q62 

-- 48. Display all students whose marks are greater than 75.

select *
from student
where marks > 75


-- 49. Display all students whose fee is less than or equal to 20,000.

select *
from student
where fee <= 20000


-- 50. Display all students whose age is not equal to 18.

select *
from student
where age <> 18


-- 51. Display all students belonging to the 'Computer Science' course AND having marks greater than 60.

select *
from student
where course = 'Computer Science'
and marks > 60


-- 52. Display all students belonging to the 'Computer Science' course OR the 'Commerce' course.

select *
from student
where course = 'Computer Science'
or course = 'Commerce'


-- 53. Display all students whose marks are BETWEEN 50 and 90.

select *
from student
where marks between 50 and 90


-- 54. Display all students whose fee is BETWEEN 10,000 and 30,000.

select *
from student
where fee between 10000 and 30000


-- 55. Display all students whose city is IN ('Delhi', 'Jaipur', 'Ahmedabad').

select *
from student
where city in ('Delhi','Jaipur','Ahmedabad')


-- 56. Display all students whose course is NOT IN ('Arts', 'Commerce').

select *
from student
where course not in ('Arts','Commerce')


-- 57. Display all students whose name starts with the letter 'S' using the LIKE operator.

select *
from student
where SNAME like 'S%'


-- 58. Display all students whose name ends with the letter 'n' using the LIKE operator.

select *
from student
where  like '%n'


-- 59. Display all students whose name contains the substring 'an' anywhere in it.

select *
from student
where SNAME like '%an%'


-- 60. Display all students whose gender is 'F' and marks are greater than 80.

select *
from student
where gender = 'F'
and marks > 80


-- 61. Display all students whose DepartmentID value IS NULL (if any).

select *
from student
where departmentid is null


-- 62. Display all students whose DepartmentID value IS NOT NULL.

select *
from student
where departmentid is not null

-- Section 5: Aggregation Functions — Q63 to Q80 

-- 63. Find the total number of students using COUNT.

select count(rollno) as TotalStudents
from student


-- 64. Find the total number of students who belong to the 'Computer Science' course.

select count(rollno) as TotalStudents
from student
where course = 'Computer Science'


-- 65. Find the total fee collected from all students using SUM.

select sum(fee) as TotalFee
from student


-- 66. Find the total fee collected from students of a specific course.

select sum(fee) as TotalFee
from student
where course = 'Computer Science'


-- 67. Find the average marks of all students using AVG.

select avg(marks) as AverageMarks
from student


-- 68. Find the average fee paid by students belonging to a specific city.

select avg(fee) as AverageFee
from student
where city = 'Vadodara'


-- 69. Find the highest marks scored by any student using MAX.

select max(marks) as HighestMarks
from student


-- 70. Find the lowest marks scored by any student using MIN.

select min(marks) as LowestMarks
from student


-- 71. Find the highest fee paid by any student.

select max(fee) as HighestFee
from student


-- 72. Find the lowest fee paid by any student.

select min(fee) as LowestFee
from student


-- 73. Find the average age of all students.

select avg(age) as AverageAge
from student


-- 74. Find the total number of distinct courses offered, using COUNT with DISTINCT.

select count(distinct course) as TotalCourses
from student


-- 75. Find the total number of distinct cities the students belong to.

select count(distinct city) as TotalCities
from student


-- 76. Find the maximum age among all students.

select max(age) as MaximumAge
from student


-- 77. Find the minimum age among all students.

select min(age) as MinimumAge
from student


-- 78. Find the sum of marks of all students combined.

select sum(marks) as TotalMarks
from student


-- 79. Find the average marks of only the female students.

select avg(marks) as AverageMarks
from student
where gender = 'F'


-- 80. Find the count of students who scored more than 90 marks.

select count(rollno) as TotalStudents
from student
where marks > 90

-- Section 6: Clauses — GROUP BY, HAVING, ORDER BY — Q81 to Q100 81. Display 

-- 81. Display the total number of students in each course, using GROUP BY.

select course, count(rollno) as TotalStudents
from student
group by course


-- 82. Display the average marks of students, grouped by course.

select course, avg(marks) as AverageMarks
from student
group by course


-- 83. Display the total fee collected, grouped by department.

select departmentid, sum(fee) as TotalFee
from student
group by departmentid


-- 84. Display the maximum marks scored, grouped by city.

select city, max(marks) as MaximumMarks
from student
group by city


-- 85. Display the minimum age, grouped by gender.

select gender, min(age) as MinimumAge
from student
group by gender


-- 86. Display the count of students, grouped by city.

select city, count(rollno) as TotalStudents
from student
group by city


-- 87. Display the average fee, grouped by course and city together.

select course, city, avg(fee) as AverageFee
from student
group by course, city


-- 88. Display the sum of marks, grouped by department.

select departmentid, sum(marks) as TotalMarks
from student
group by departmentid


-- 89. Display courses having more than 5 students enrolled, using HAVING.

select course, count(rollno) as TotalStudents
from student
group by course
having count(rollno) > 5


-- 90. Display cities having an average fee greater than 15,000, using HAVING.

select city, avg(fee) as AverageFee
from student
group by city
having avg(fee) > 15000


-- 91. Display departments having a total student count greater than 3, using HAVING.

select departmentid, count(rollno) as TotalStudents
from student
group by departmentid
having count(rollno) > 3


-- 92. Display courses having an average marks greater than 70, using HAVING.

select course, avg(marks) as AverageMarks
from student
group by course
having avg(marks) > 70


-- 93. Display genders having a maximum marks value greater than 95, using HAVING.

select gender, max(marks) as MaximumMarks
from student
group by gender
having max(marks) > 95


-- 94. Display all student records sorted by marks in descending order, using ORDER BY.

select *
from student
order by marks desc


-- 95. Display all student records sorted by fee in ascending order.

select *
from student
order by fee asc


-- 96. Display all student records sorted by course (ascending) and then marks (descending).

select *
from student
order by course asc, marks desc


-- 97. Display all student records sorted by admission date, showing the most recently admitted students first.

select *
from student
order by admissiondate desc


-- 98. Display the top 10 students with the highest marks, using ORDER BY along with TOP.

select top 10 *
from student
order by marks desc


-- 99. Display all distinct courses sorted alphabetically.

select distinct course
from student
order by course asc


-- 100. Display department-wise student count sorted from highest to lowest count, combining GROUP BY and ORDER BY.

select departmentid, count(rollno) as TotalStudents
from student
group by departmentid
order by TotalStudents desc