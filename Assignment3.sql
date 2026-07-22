-- 22july2026 SQL Assignment 3

use practice

select name
from sys.tables

create table emp1
(EID INT,
ENAME VARCHAR (20),
DEPARTMENT VARCHAR (20),
ESALARY MONEY)

insert into emp1 values
(101,'Janavi','AI',80000),
(102,'Tejasvi','DA',65000),
(103,'Het','DA',25000),
(104,'Rohini','Cloud',54000),
(105,'Rohit','AI',60000),
(106,'Zalak','Cloud',45000),
(107,'Tejas','AI',35000)

select * from emp1

-- 1. Write a query to display each Department and the total number of employees working in that department from the Employee table.

select department,count(EID) as TotalEmployee
from emp1
group by Department

-- 2. Write a query to find the Department, the highest salary (MAX), and the average salary (AVG) for each department.

select department , max(esalary) as 'Highest salary',
avg(esalary) as 'Average Salary'
from emp1
group by department

-- 3. Write a query to count how many employees are in each Department.

select department,count(EID) as TotalEmployee
from emp1
group by Department

-- 4. Write a query to find the minimum salary in each Department.

select department, min(esalary) as 'Minimum Salary' 
from emp1
group by department

-- 5. Write a query to show departments that have more than 2 employees

select department, count(eid) as employees
from emp1
group by department
having count(eid) > 2

-- 6. Write a query to show departments where the total salary payout is greater than 100,000.

select department, sum(esalary) as TotalSalary
from emp1
group by department
having sum(esalary) > 100000


-- 7. Write a query to find departments where the average salary is above 60,000.

select department, avg(esalary)
from emp1
group by department
having avg(esalary) > 60000

-- 8. Write a query to show departments that have exactly 1 employee.

select department, count(eid)
from emp1
group by department
having count(eid) = 1 

-- 9. Write a query to list all employees sorted by Salary from highest to lowest.

select ename , esalary as Esalary 
from emp1
order by esalary desc

-- 10.Write a query to list all employees sorted by Ename in alphabetical order.

select ename 
from emp1
order by ename asc

-- 11.Write a  query to list all employees sorted by Department alphabetically, andthen by Ename alphabetically.

select department
from emp1
order by department asc

select ename
from emp1
order by ename asc












