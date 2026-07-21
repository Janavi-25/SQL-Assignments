-- Assignment 1
-- Literal SELECT Statement Practice Problems

  create database practice

  use practice

-- 1) Execute a literal select statement that returns your name.
   select 'Janavi' + ' ' +'Parmar'

-- 2) Write the literal select statement that evaluates the product of 7 and 4.
      select 7*4

-- 3) Write the literal select statement that takes the difference of 7 and 4 then multiplies that difference by 8.
      select (7-4)*8

-- 4) Write a literal select statement that returns the phrase “Brewster’s SQL Training Class”. (Hint: note the single apostrophe in the string).
      select 'Brewster’s SQL Training Class'

-- 5) Execute a literal SELECT statement that returns the phrase “Day 1 of Training” in one column and the result of 5*3 in another column.
      select 'Day 1 of Training' , 5*3  

-- Insert/Update/Delete
-- Insert a new employee record with all details provided directly.

 create table employee
 (EID INT,
 ENAME VARCHAR (20),
 DEPARTMENT VARCHAR (20),
 SALARY MONEY)


 INSERT INTO employee values
 ( 01 , 'Janavi' , 'Cloud', 90000),
 (02 , 'Tejsawi' , 'HR' , 40000),
 (03 , 'Amisha', 'AI', 20000),
 (06, 'Ramesh' , 'Finance' , 70000),
 (07, 'Reshma', 'Cloud' , 20000)

 select * from employee
 

-- 2. Add multiple new team members to the HR department at once.
insert into employee values
(04 , 'Divya', 'HR', 20000),
(05, 'Raj', 'HR', 18000)

select * from employee

-- 3. Register an employee who hasn't been assigned a salary yet.

insert into employee (EID,ENAME,DEPARTMENT) values
( 08 , 'Rohit', 'AI')

-- 4. Update the salary to 85,000 for everyone working in the 'Cloud' department.
update employee
set salary = 85000
where department = 'cloud'

-- 5. Change both the department and salary for a specific employee by name.
update employee
Set salary = 80000,
department = 'HR'
where ename = 'amisha'

-- 6. Give a flat 10% appraisal boost to employee working in AI department.
update employee
set salary = salary*1.10
where department = 'AI'


-- 7. Assign an initial entry-level salary of 30,000 to anyone whose salary column is completely blank (NULL).
update employee
set salary = 30000
where salary is NULL

-- 8. Remove a specific employee from the system using their unique ID.
delete from employee
where eid = 7

select * from employee

-- 9. Remove all records belonging to a department that has been completely shut down.
 
 delete from employee
 where DEPARTMENT = 'AI'


-- 10.Drop records of any employee earning less than 20,000 in the Finance division.
insert into employee values
(09, 'Dharini', 'Finance', 16000)

delete from employee
where department = 'Finance' and
salary <20000