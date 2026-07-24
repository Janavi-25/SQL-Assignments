-- 23july2036 Assignment-4

create database CompanyDB

use CompanyDB

Create table Employee
(EmpID INT,
FIRSTNAME VARCHAR (20),
LASTNAME VARCHAR(20),
DEPARTMENT VARCHAR(20),
DESIGNATION VARCHAR(20),
SALARY MONEY,
CITY VARCHAR(20),
GENDER CHAR(1),
JOININGDATE DATE,
AGE INT)
 

-- 3. Add a new column Email to the Employee table.

alter table employee
add EMAILID varchar (20)

-- 4. Modify the Email column to increase its size.

alter table employee
alter column emailid varchar (50)

-- 5. Rename the column City to Location.

 sp_rename 'employee.City', 'Location'

-- 6. Rename the table Employee to EmployeeDetails and then rename it back to Employee.

sp_rename 'employee' , 'EmployeeDetails'

sp_rename 'EmployeeDetails' , 'employee'

select name from sys.tables

-- 7. Drop the Email column from the Employee table.

alter table employee
drop column emailid

-- 8. Write a query to check the structure (columns and data types) of the Employee table.

sp_help employee

-- 9. Make EmpID column the Primary Key of the Employee table.

alter table employee
alter column EmpID INT NOT NULL

alter table employee
add constraint primary_key PRIMARY KEY (EMPID)

-- 10. Add a NOT NULL constraint on the FirstName column.

alter table employee
alter column FIRSTNAME VARCHAR(20) NOT NULL

-- 11. Add a UNIQUE constraint on the column to ensure no two employees have the same email (create a new column Email and apply the constraint).

alter table employee
add emailid varchar(50)

alter table employee
add constraint unique_emailid UNIQUE (emailid)

select * from employee

-- 12. Add a DEFAULT constraint on the Department column so that if no value is provided, it should be set as 'General'.

alter table employee 
add constraint DEFAULT_DEPT
DEFAULT 'General' for department

-- 13. Add a CHECK constraint on the Salary column so that salary cannot be less than 10,000.

alter table employee
add constraint check_con CHECK (salary > 10000)

-- 14. Add a CHECK constraint on the Age column so that age must be between 18 and 60.

alter table employee
add constraint check_age CHECK (age between 18 and 60)

-- 15. Remove the CHECK constraint applied on the Salary column.

alter table employee
drop constraint check_con 

-- 16. Add a FOREIGN KEY unrelated simple self-constraint task: add a Manager_EmpID column and apply a CHECK constraint so it cannot be equal to EmpID itself.

alter table employee
add manager_id Int

alter table Employee
add constraint CHK_Manager
check (Manager_id <> EmpID)


-- 17. Insert 15 records into the Employee table with different departments, cities, and salaries.

insert into employee values
(1, 'Janavi', 'Parmar', 'HR', 'Manager', 55000, 'Vadodara', 'M', '2020-03-15', 35,'janavi@gmail.com',2),
(2, 'Rohit', 'Solanki', 'IT', 'Executive', 45000, 'Ahmedabad', 'M', '2021-07-10', 20,'rohit@gmail.com',1),
(3, 'Rohan', 'Mehta', 'Sales', 'Analyst', 40000, 'Surat', 'M', '2019-11-05', 30,'rohan@gmail.com',1),
(4, 'Tejasvi', 'Panoli', 'Finance', 'Manager', 60000, 'Mumbai', 'F', '2018-06-20', 40,'tejasvi@gmail.com',1),
(5, 'Chikku', 'Panoli', 'IT', 'Analyst', 48000, 'Vadodara', 'M', '2022-01-12', 26,'chikku@gmail.com',2),
(6, 'Neha', 'Kapoor', 'HR', 'Executive', 42000, 'Delhi', 'F', '2020-09-25', 32,'neha@gmail.com',1),
(7, 'Arjun', 'Reddy', 'Sales', 'Manager', 52000, 'Hyderabad', 'M', '2017-04-18', 38,'arjun@gmail.com',1),
(8, 'Romin', 'Rajput', 'IT', 'Executive', 22000, 'Ahmedabad', 'F', '2021-07-10', 28,'romin@gmail.com',2),
(9, 'Atharva', 'Patel', 'Sales', 'Analyst', 85000, 'Surat', 'M', '2015-05-05', 30,'atharva@gmail.com',7),
(10, 'Om', 'Panchal', 'Finance', 'Manager', 65000, 'Mumbai', 'M', '2018-07-20', 44,'om@gmail.com',4),
(11, 'Sakshi', 'Nayak', 'IT', 'Analyst', 48000, 'Vadodara', 'F', '2018-02-12', 24,'sakshi@gmail.com',2),
(12, 'Drasti', 'Parmar', 'HR', 'Executive', 42000, 'Delhi', 'F', '2020-11-25', 22,'drasti@gmail.com',1),
(13, 'Yuvraj', 'Kachiya', 'Sales', 'Manager', 52000, 'Hyderabad', 'M', '2017-03-25', 20,'yuvraj@gmail.com',7),
(14, 'Hemangi', 'Zala', 'Finance', 'Manager', 52000, 'Vadodara', 'F', '2017-09-08', 55,'hemangi@gmail.com',4),
(15, 'Ashish', 'Rana', 'IT', 'Manager', 52000, 'Vadodara', 'M', '2017-04-22', 25,'ashish@gmail.com',2)

select * from employee
-- 18. Insert a new employee record without specifying the Department (to check the DEFAULT constraint).

insert into employee (EmpID, FirstName, LastName, Designation, Salary, Location, Gender, JoiningDate, Age, emailid, Manager_id) values
(16,'Keval','Patel','Executive',25000,'Vadodara','M','2024-07-01',23,'karan@gmail.com',2)

-- 19.Update the salary of all employees working in the IT department by increasing it by 10%. 

update employee
set salary = salary*1.10
where department = 'IT'

-- 20.	Update the Designation of an employee whose EmpID is 5 to 'Senior Executive'. 

update employee
set designation = 'Senior Executive'
where empid = 5

-- 21.	Delete the record of an employee whose EmpID is 10. 

delete from employee
where empid = 10

-- 22.	Delete all employees whose Salary is less than 15,000.

delete from employee
where salary < 15000

-- 23.	Update the City of all employees from 'Mumbai' to 'Pune'. 

update employee
set location = 'Pune'
where location = 'Mumbai'

-- 24.	Insert a record and intentionally leave FirstName blank to check if the NOT NULL constraint blocks it. 

insert into employee (EmpID, LastName, Department, Designation, Salary, Location, Gender, JoiningDate, Age, Email, Manager_id) values 
(117,'Parmar','IT','Executive', 25000 , 'Pune' ,'F' , '2024-07-20',25,'hetvi@gmail.com',2)

-- 25.	Write a query to display all the records from the Employee table. 

select * from employee

-- 26.	Write a query to display FirstName, LastName, and Salary of all employees. 

select firstname,lastname,salary from employee

-- 27.	Write a query to display the details of employees working in the 'HR' department. 

select * from employee 
where department = 'HR'

-- 28.	Write a query to display all distinct Department names from the table. 

select distinct department from employee

-- 29.	Write a query to display the total number of employees in the table. 

select count(EID) as totalemployee
from employee

-- 30.	Write a query to display FirstName and Salary and rename the Salary column as MonthlySalary using an alias. 

select firstname , salary as MonthlySalary
from employee

-- 31.	Write a query to display all employee details whose Gender is 'F'. 

select * from employee
where gender = 'F'

-- 32.	Write a query to display the top 5 highest paid employees. 

select top 5 salary
from employee
order by salary desc

-- 33.	Display all employees whose Salary is greater than 30,000 (comparison operator). 

select * from employee
where salary > 30000

-- 34.	Display all employees whose Department is 'IT' AND Salary is greater than 25,000 (logical operator). 

select * from employee
where department = 'IT' and salary > 25000

-- 35.	Display all employees whose Department is 'HR' OR 'Finance'. 

select * from employee
where department = 'HR' or department = 'Finance'

-- 36.	Display all employees whose Salary is BETWEEN 20,000 and 40,000. 

select * from employee
where salary between 20000 and 40000

-- 37.	Display all employees whose City IN ('Delhi', 'Mumbai', 'Pune'). 

select * from employee
where location in ('Delhi', 'Mumbai', 'Pune')

-- 38.	Display all employees whose FirstName LIKE starts with 'A'. 

select * from employee
where firstname like 'a%'

-- 39.	Display all employees whose FirstName LIKE ends with 'a'. 

select * from employee
where firstname like '%a'

-- 40.	Display all employees whose Department is NOT 'Sales' (NOT operator). 

select * from employee
where not department = 'sales'

-- 41.	Display the total number of employees in each department. 

select department , count(empid) as totalemployee
from employee
group by department

-- 42.	Display the average salary of employees department-wise. 

select department , avg(salary) as AverageSalary
from employee
group by department

-- 43.	Display the maximum salary in each department. 

select department , max(salary) as MaxSalary
from employee
group by department

-- 44.	Display the minimum salary city-wise.

select location , min(salary) as MinSalary
from employee
group by location

-- 45.	Display the total salary paid, grouped by Designation.

select Designation, sum(salary) as totalsalary
from employee
group by Designation

-- 46.	Display departments having more than 3 employees. 

select department, count(empid) as numberofemp
from employee
group by department
having count(empid) > 3

-- 47.	Display departments whose average salary is greater than 30,000. 

select department, avg(salary) as avgsalary
from employee
group by department
having avg(salary) > 30000

-- 48.	Display cities having a total employee count greater than 2. 

select location , count(empid) as numberofemp
from employee
group by location
having count(empid) > 2

-- 49.	Display all employee records sorted by Salary in descending order. 

select * from employee
order by salary desc

-- 50.	Display all employee records sorted by Department (ascending) and then by Salary (descending). 

select * from employee
order by department asc , salary desc
