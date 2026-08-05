-- 5Aug2026
-- Assignment- 10 

-- employee : eid ,ename , doj , mid , did 
-- department : did , dname , location 
-- salary : salaryid , eid , salary , bonus


create table employee 
(EID INT PRIMARY KEY,
ENAME VARCHAR(20),
DOJ DATE,
MID INT,
DID INT
FOREIGN KEY(DID)
REFERENCES DEPARTMENT(DID)
)

INSERT INTO employee VALUES
 (101,'JANAVI','2026-07-21',102,201),
 (102,'TEJASVI','2026-03-21',104,203),
 (103,'HET','2026-07-20',102,204),
 (104,'ROHIT','2024-01-22',103,201),
 (105,'ZALAK','2020-06-21',101,201)


 insert into employee (eid,ename,doj) values
 (106,'Pranjal','2020-03-24')

 insert into employee(eid,ename,doj,did) values
 (107,'Ankit','2010-03-24',205)


CREATE TABLE DEPARTMENT
(DID INT PRIMARY KEY,
DNAME VARCHAR(20),
LOCATION  VARCHAR(20))

insert into department values
(201,'AI','Vadodara'),
(202,'Fianace','Mumbai'),
(203,'BA','Vadodara'),
(204,'DA','Ahmedabad'),
(205,'DE','Surat'),
(206,'IT','Vadodara')


CREATE TABLE SALARY
(SALARYID INT PRIMARY KEY,
EID INT,
SALARY DECIMAL(10,2),
BONUS DECIMAL(10,2),
foreign key(eid)
references employee(eid)
)

insert into salary(salaryid,eid,salary,bonus) values
(301,101,80000,10000),
(302,102,45000,5000),
(303,103,23000,2000),
(304,104,35000,4000),
(305,105,20000,7000),
(306,106,71000,3000),
(307,107,30000,5000)

insert into employee(eid,ename,doj) values
(108,'Rohan','2025-09-19')

-- Question 1
-- Write a query to calculate the total compensation paid (BasicSalary + Bonus) across all
-- payouts for each department. Display the DeptName, Location, and the total expenditure
-- aliased as TotalExpenditure.

select d.dname , d.location , sum(s.salary+s.bonus) as TotalExpenditure 
from employee e
join department d
on e.did = d.did
join salary s
on e.eid = s.eid
group by d.dname ,  d.location


-- Question 2
-- Write a query to display all employee names (EName), their date of joining (DOJ), and their
-- DeptName. Ensure that employees who are not assigned to any department are included in
-- the result, displaying 'Unassigned' for their department name.

select e.ename , e.doj , isnull(d.dname ,'Unassigned') as departmentname
from employee e
left join department d
on e.did = d.did

-- Question 3
-- Write a query to display every employee's name (EmployeeName), their assigned
-- department's name (DeptName), and their manager's name (ManagerName). Exclude
-- employees who do not have a manager.

select e.ename , d.dname , m.ename as manager
from employee e 
join department d
on e.did = d.did
join employee m
on e.mid = m.eid

-- Question 4
-- Find all departments where the average total compensation (BasicSalary + Bonus) exceeds
-- ₹60,000. Display DeptName, Location

select d.dname ,d.location 
from employee e
join department d
on e.did = d.did
join salary s
on e.eid = s.eid
group by d.dname ,d.location
having avg(s.salary+s.bonus) > 60000


-- Question 5
-- Write a query to display the DeptID, DeptName, and Location of all departments that
-- currently have no employees assigned to them.

select e.ename , d.did , d.dname , d.location 
from employee e
right join department d
on e.did = d.did
where e.ename is null

-- Question 6
-- Retrieve the EName, DeptName, BasicSalary, and Bonus of all employees whose
-- department is located in either 'Vadodara' or 'Mumbai' and whose BasicSalary is greater
-- than ₹40,000. Sort the results by BasicSalary in descending order.

select e.ename , d.dname , s.salary , s.bonus 
from employee e
join department d
on e.did = d.did
join salary s
on e.eid = s.eid
where location in ('Vadodara','Mumbai') and salary > 40000
order by salary desc

-- Question 7
-- Find all pairs of employees who belong to the exact same department. Display DeptName,
-- Employee_1, and Employee_2. Ensure an employee is not paired with themselves and
-- eliminate duplicate reverse pairs

select d.dname , e1.ename as employee_1 ,e2.ename as employee_2
from employee e1
join employee e2
on e1.did = e2.did
and e1.eid < e2.eid
join department d
on e1.did = d.did



-- Question 8
-- Write a query using a full reconciliation approach to list all EName, DeptName, and
-- BasicSalary. The output must include employees without departments, departments
-- without employees, and employees without salary records.

select e.ename , d.dname , s.salary 
from employee e
full join department d
on e.did = d.did
full join salary s
on e.eid = s.eid


-- Question 9
-- Write a query to find all employees who earn a higher BasicSalary than the average
-- BasicSalary of their own department. Display EName, DeptName, and BasicSalary.

select e.ename , d.dname  , s.salary 
from employee e
join department d
on e.did = d.did
join salary s
on e.eid = s.eid
where s.salary >
(select avg(s2.salary)
from employee e2
join salary s2
on e2.eid = s2.eid
where e2.did = e.did)
