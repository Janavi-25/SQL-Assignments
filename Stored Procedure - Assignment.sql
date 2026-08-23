
-- Stored Procedure Assignment

create table employee 
(EID INT,
ENAME VARCHAR(20),
DEPTID INT,
SALARY DECIMAL(10,2),
FOREIGN KEY (DEPTID)
REFERENCES department(DEPTID))

INSERT INTO Employee values
(1, 'Janavi', 101, 50000),
(2, 'Zalak', 101, 60000),
(3, 'Priya', 102, 45000),
(4, 'Amit', 103, 70000),
(5, 'Neha', 103, 55000),
(6, 'Karan', 104, 40000),
(7, 'Anjali', 105, 65000),
(8, 'Rohan', 101, 75000),
(9, 'Ayesha', 102, 52000),
(10, 'Akash', 105, 48000)

create table department
(DEPTID INT PRIMARY KEY,
DNAME VARCHAR(20),
LOCATION VARCHAR(20))

INSERT INTO Department values
(101, 'IT', 'Vadodara'),
(102, 'HR', 'Ahmedabad'),
(103, 'Finance', 'Vadodara'),
(104, 'Marketing', 'Surat'),
(105, 'Sales', 'Ahmedabad')

CREATE TABLE PROJECT
(PID INT PRIMARY KEY,
PNAME VARCHAR(255),
STATUS VARCHAR(255))

INSERT INTO project values
(1, 'Website Development', 'Pending'),
(2, 'Mobile Application', 'In Progress'),
(3, 'Database Migration', 'Pending'),
(4, 'Employee Management System', 'In Progress'),
(5, 'Sales Dashboard', 'Completed')

-- Create a stored procedure that accepts a DeptID and a MinSalary as input
-- parameters and returns all employees belonging to that department who earn more
-- than the specified salary.

create procedure sp_minsalary_deptid
@minsalary DECIMAL(11,2),
@DEPTID INT
as
begin
	select *
	from employee
	where deptid = @DEPTID
	and salary > @minsalary
end

execute sp_minsalary_deptid 70000 ,101

-- Create a stored procedure that takes a DeptID as an input parameter and uses an 
-- OUTPUT parameter to return the total employee count for that department. 

create procedure sp_employeecount_bydeptid
@deptid int,
@employeecount int output
as
begin 
	select @employeecount =count(eid)
	from employee
	where deptid = @deptid
end

declare @employeecount int
execute sp_employeecount_bydeptid 101,@employeecount out
print @employeecount 

-- Create a stored procedure to update an employee's salary given their EID and a 
-- percentage increase (e.g., 10 for 10%). 

create procedure sp_increasesalary_bypercentage
@eid int,
@percentagesalary DECIMAL(5,2)
as
begin 
 update employee
 set salary = salary + (salary*@percentagesalary/100)
 where eid = @eid
end

exec sp_increasesalary_bypercentage 1 , 20

SELECT * FROM Employee
WHERE EID = 1

-- Create a stored procedure to insert a new department record into the Department 
-- table by passing DeptID, DeptName, and Location as parameters. 

create procedure sp_insert_department
@deptid int,
@dname varchar(20),
@location varchar(20)
as
begin 
	insert into department values
	(@deptid,@dname,@location)
end

exec sp_insert_department 110, ' Data Analytics','VADODARA'

select * from department

-- Create a stored procedure that takes an EID and a NewSalary as parameters to 
-- update an employee's salary in the Employee table.

create procedure sp_updatesalary_byeid
@eid int ,
@updatesalary DECIMAL(10,2)
as
begin 
	update employee
	set salary = @updatesalary
	where eid = @eid
end

exec sp_updatesalary_byeid 3 , 80000

select * from employee
where eid = 3

-- Create a stored procedure that takes a search string parameter (e.g., 'a') and returns 
-- all employees whose names start with that letter.

create procedure sp_searchename
@searchename varchar(20)
as
begin 
	select * from employee
	where ename like @searchename + '%'
end

exec sp_searchename 'R'

-- Create a stored procedure that calculates and returns the average salary of all 
-- employees in the Employee table. 

create procedure sp_avgsalary
as
begin 
	select avg(salary)
	from employee
end

exec sp_avgsalary

-- Create a stored procedure that takes two input parameters, MinSalary and 
-- MaxSalary, and returns all employees whose salary falls within that range. 

create procedure sp_minmax_salary
@minsalaryy DECIMAL(10,2),
@maxsalary DECIMAL(10,2)
as
begin 
	select *
	from employee
	where salary between @minsalaryy and @maxsalary
end

exec sp_minmax_salary 50000, 70000

-- Create a stored procedure that takes a ProjectID and a new Status string (e.g., 
-- 'Completed') as input parameters and updates the status of that project in the 
-- Project table. 

create procedure sp_updatestatus_bypid
@pid int,
@newstatus varchar(20)
as
begin 
	update project
	set status = @newstatus
	where pid = @pid
end

exec sp_updatestatus_bypid 1 ,'Completed'

select * from project
where pid =1

-- Create a stored procedure that takes a City / Location name as an input parameter 
-- and displays the total number of departments located in that city.

Create procedure sp_totaldept_city
@locationcity varchar(20)
as
begin 
	select count(deptid) as totaldepartment
	from department
	where location = @locationcity
end


exec sp_totaldept_city 'Vadodara'