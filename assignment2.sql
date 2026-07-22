
-- 21july 2026 SQL Assignment 2

use practice

create table emp
(EID INT,
ENAME VARCHAR (30),
DEPARTMENT VARCHAR (20),
ESALARY MONEY,
BONUS MONEY,
EXPERIENCE INT,
CITY VARCHAR(20))

insert into emp values
(101,'JANAVI', 'IT', 85000, 10000, 20, 'VADODARA'),
(102,'TEJASVI', 'IT', 90000, 4000, 21, 'VADODARA'),
(103,'VISHAL', 'IT', 50000, 7000, 35, 'SURAT'),
(104,'ROHIT', 'IT', 75000, 5000, 19, 'VADODARA'),
(105,'HET', 'Finance', 22000, 9000, 20, 'RAJKOT'),
(106,'NIDHI', 'Finance', 25000, 14000, 20, 'AHEMDABAD')

insert into emp values
(107,'ZALAK', 'Finance', 30000, 1000, 24, 'DELHI'),
(108,'DINESH', 'IT', 18000, 1000, 22, 'MUMBAI')


select * from emp

delete from emp
where eid = 107

-- 1. Write a query to display all employees whose salary is greater than 50,000.

select * from emp
where esalary > 50000

-- 2. Retrieve employees who work in the IT department and have more than 5 years of experience.

select * from emp
where department = 'IT' and experience > 5

-- 3. Write a query to display employees whose salary is between 45,000 and 60,000.

select * from emp
where esalary between 45000 and 60000

-- 4. Display employees whose city is either Mumbai or Delhi.
 
 select * from emp
 where city = 'mumbai' or city = 'delhi' 

-- 5. Write a query to display employee name along with their annual income

 select ename ,(esalary+bonus) as annualincome from emp

-- 6. Find employees whose name starts with the letter 'A'.

select * from emp
where ename like 'a%'

-- 7. Find the highest salary among all employees.

select max(esalary) from emp

-- 8. Find the total bonus paid to employees in the IT department.

select sum(bonus) as totalbonus
from emp
where department = 'IT'

-- 9. Display the minimum and maximum experience of employees.

select max(EXPERIENCE) as maximum,
min(EXPERIENCE) as minimum
from emp 

-- 10.Count the number of employees in each department.

select department ,(count(eid)) as numberofemployee
from emp    
group by department

-- 11. Find the total bonus paid to employees in the IT department.

select sum(bonus) as totalbonus
from emp
where department = 'IT'

-- 12. Write an SQL statement to add a new column named Email of type VARCHAR(100) to the Employees table.

alter table emp
add EMAIL VARCHAR (100)

sp_help emp

-- 13. Write an SQL statement to modify the Salary column so that it becomes DECIMAL(10,2).

alter table emp
alter column esalary DECIMAL(10,2)

sp_help emp

-- 14. Write an SQL statement to drop the Bonus column from the Employees table.

alter table emp
drop column bonus

select * from emp
