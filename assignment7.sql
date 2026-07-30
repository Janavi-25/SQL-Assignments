--30july2026 SQL Joins Assignment

select name
from sys.tables

use janavi
create table employee
(EID INT,
ENAME VARCHAR(20),
ESALARY DECIMAL(8,2),
DID INT,
MID INT)

insert into employee values
(1,'Janavi',67000,101,201),
(2,'Zalak',35000,102,202),
(3,'Tejasvi',57000,103,203),
(4,'Het',25000,104,202),
(5,'Palak',56000,104,204)

insert into employee(eid,ename,esalary) values
(6,'Hetanshi',40000)

insert into employee values
(7,'Raj',54000,108,204),
(8,'Rohan',34000,102,209)


create table manager
(MID INT,
MNAME VARCHAR(20),
DID INT)

insert into manager values
(201,'Rohit',101),
(202,'Vibhas',102),
(203,'Ashish',103),
(204,'Omkar',104),
(205,'Harsh',103)

create table department 
(DID INT,
DNAME VARCHAR(20))

insert into department values
(101,'AI'),
(102,'Finance'),
(103,'BA'),
(104,'DA'),
(105,'DE')

create table project
(PID INT ,
PNAME VARCHAR(30),
EID INT)

insert into project values
(301,'Hospitalmobileapp',1),
(302,'e-commercewebsite',2),
(303,'foodwebsite',5),
(304,'databaseofhospital',2),
(305,'carmobileapp',3),
(306,'databaseofecom',3),
(307,'cloudproject',2)


select * from employee

select * from manager

select * from department

select * from project


-- 1. Display each employee's name and their corresponding department name.

select e.ename,d.dname
from employee e
inner join department d
on e.did = d.did

-- 2. List all projects along with the name of the employee assigned to them.

select p.pname , e.ename
from employee e
inner join project p
on e.eid = p.eid

-- 3. Show the names of employees and the names of their managers.

select e.ename , m.mname
from employee e
join manager m
on e.mid = m.mid

-- 4. Display the Project ID and the Department ID for every project.

select p.pname ,p.pid , d.did 
from employee e
inner join project p
on e.eid = p.eid
inner join department d
on e.did = d.did

-- 5. List employees who work in the 'IT' department.

select e.ename 
from employee e
join department d
on e.did = d.did
where d.dname = 'IT'

-- 6. Display employee names and their manager names for all employees in department 10.

select e.ename , m.mname
from employee e
join manager m
on e.mid = m.mid
join department d
on e.did = d.did
where d.did = 104

-- 7. Show all projects handled by 'Suresh'.

select p.pname
from employee e
join project p
on e.eid = p.eid
where e.ename = 'Suresh'

-- 8. Find the department name associated with Project ID 101.

select d.dname 
from employee e
join department d
on e.did = d.did
join project p
on e.eid = p.eid
where p.pid = 301

-- 9. List all employees whose manager's name is 'Suresh'.

select e.ename
from employee e
join manager m
on e.mid = m.mid
where m.mname = 'Suresh'


-- 10. Display the count of employees in each department name.

select d.dname , count(e.eid) as numberofemployee
from employee e
join department d
on e.did = d.did
group by d.dname


-- 11. List all departments and the employees working in them (including departments with no employees).

select e.ename , d.dname
from employee e
right join department d
on e.did = d.did

-- 12. Display all employees and the projects they are assigned to (including those with no projects).

select e.ename,p.pname
from employee e
left join project p
on e.eid = p.eid


-- 13. Show the names of employees, their department names, and their manager names in one result.

select e.ename,d.dname,m.mname
from employee e
join department d
on e.did = d.did
join manager m
on e.mid = m.mid

-- 14. Find all projects and the department name they belong to.

select p.pname , d.dname
from employee e
join project p
on e.eid = p.eid
join department d
on e.did = d.did

-- 15. List all managers and the names of employees reporting to them (including managers with no reporters).

select m.mname ,e.ename
from employee e
right join manager m
on m.mid = e.mid

-- 16. Find employees who are NOT assigned to any project.

select e.ename,p.pname
from employee e
left join project p
on e.eid = p.eid
where p.pid is null

-- 17. Display the names of all employees and the names of projects, but only for those in the 'IT' department.

select e.ename , p.pname 
from employee e
join project p
on e.eid = p.eid
join department d
on e.did = d.did
where d.dname = 'IT'

-- 18. Show the names of managers who are managing employees in the 'Finance' department.

select m.mname 
from employee e
join manager m
on e.mid = m.mid 
join department d
on e.did = d.did
where d.dname = 'Finance'

-- 19. Display Department Name, Employee Name, and Project Name for all matches.

select d.dname ,e.ename ,p.pname
from employee e
join department d
on e.did = d.did
join project p
on e.eid = p.eid

-- 20. List all projects and the manager's name responsible for the employee assigned to that project.

select p.pname , m.mname 
from employee e 
join manager m
on e.mid = m.mid
join project p
on e.eid = p.eid

