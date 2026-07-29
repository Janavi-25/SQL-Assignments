-- 28july2026 JOIN Assignment

create database joins
 
 use joins

create table employee
( emp_id INT,
 emp_name VARCHAR(20),
 department_id INT,
 designation VARCHAR(20),
 salary DECIMAL(8,2),
 join_date DATE,
 manager_id INT
)

INSERT INTO Employee VALUES
(1,'Janavi',101,'HR Executive',80000,'2014-02-02',201),
(2,'Zalak',102,'Software Developer',35000,'2020-04-24',202),
(3,'Het',103,'Accountant',56000,'2019-03-04',205),
(4,'Tejasvi',103,'Finance Manager',70000,'2024-11-08',203),
(5,'Rohan',102,'Software Tester',14000,'2020-03-25',202),
(6,'Rohit',114,'Project Manager',36000,'2026-08-28',201),
(7,'Hemant',110,'Sales Executive',65000,'2018-02-02',202),
(8,'Yuvraj',106,'Support Engineer',40000,'2010-02-02',202)

create table department
( department_id INT,
 department_name VARCHAR(20),
 location VARCHAR(20),
 budget decimal(12,2)
)

INSERT INTO Department VALUES
(101,'HR','Vadodara',1500000),
(102,'IT','Ahmedabad',4000000),
(103,'Finance','Mumbai',2500000),
(104,'Sales','Surat',3000000),
(105,'Marketing','Pune',1800000),
(106,'Support','Delhi',1200000),
(107,'Research','Bangalore',5000000),
(108,'Admin','Jaipur',1000000)

-- 1. Display employee name along with the department name they belong to.

select e.emp_name , d.department_name
from employee e
inner join department d
on e.department_id = d.department_id

-- 2. List all employees with their department, including employees who are not assigned to any department.

select e.emp_name , d.department_name
from employee e
left join department d
on e.department_id = d.department_id


-- 3. Show all department names along with employee names, including departments that have no employees.

select d.department_name , e.emp_name 
from employee e
right join department d
on e.department_id = d.department_id


-- 4. Display employee name, designation, and department name for employees assigned to a valid department.

select e.emp_name , e.designation , d.department_name
from employee e
inner join department d
on e.department_id = d.department_id


-- 5. Show department name, location, and employee name for every department, even if no employee works there.

select d.department_name , d.location,e.emp_name
from employee e
right join department d
on e.department_id = d.department_id

-- 6. Display employee name and department name for every employee, including those without a department.

select e.emp_name, d.department_name 
from employee e
left join department d
on e.department_id = d.department_id

-- 7. List employee name, salary, and department name only for employees whose department exists.

select e.emp_name , e.salary ,d.department_name
from employee e
inner join department d
on e.department_id = d.department_id

-- 8. Show department name, budget, employee name, and salary for all departments, including those without employees.

select d.department_name , d.budget , e.emp_name ,e.salary
from employee e
right join department d
on e.department_id = d.department_id

-- 9. Display the complete list of employees with their department names, ensuring no employee is excluded.

select e.emp_name , d.department_name 
from employee e
left join department d
on e.department_id = d.department_id

-- 10. List employee name, designation, and department location for employees with an assigned department.

select e.emp_name ,e.designation , d.location
from employee e
inner join department d
on e.department_id = d.department_id

-- 11. Show all departments with the count of employees in each department, including empty departments.

select d.department_name, count(e.emp_id) as totalemployees
from employee e
right join department d
on e.department_id = d.department_id
group by d.department_name


-- 12. Display employee name, join date, and department name for employees assigned to a department.

select e.emp_name , e.join_date , d.department_name
from employee e
inner join department d
on e.department_id = d.department_id


-- 13. List every department with employee name and salary, including departments with no employees.

select d.department_name ,e.emp_name , e.salary 
from employee e
right join department d
on e.department_id = d.department_id

-- 14. Show employee name and department name for every employee, regardless of department status.

select e.emp_name ,  d.department_name 
from employee e
left join department d
on e.department_id = d.department_id

-- 15. Display employee name, department name, and budget for departments having a budget greater than 2,000,000.

select e.emp_name ,  d.department_name , d.budget
from employee e
inner join department d
on e.department_id = d.department_id
where d.budget > 2000000

-- 16. List department name, location, and employee name for all departments, including those without employees.

select e.emp_name ,  d.department_name , d.location
from employee e
right join department d
on e.department_id = d.department_id

-- 17. Show employee name, designation, and department name, excluding employees without a department.

select e.emp_name , e.designation ,d.department_name 
from employee e
inner join department d
on e.department_id = d.department_id

-- 18. Display all employees with their department location, including employees without a department.

select e.emp_name , d.location
from employee e
left join department d
on e.department_id = d.department_id

-- 19. List all department names with employee names, ensuring departments without employees are included.

select d.department_name ,e.emp_name 
from employee e
right join department d
on e.department_id = d.department_id

-- 20. Show employee name, salary, and department name only where a valid department match exists.

select e.emp_name,e.salary,d.department_name  
from employee e
inner join department d
on e.department_id = d.department_id

-- 21. Display employee name, manager ID, and department name for employees assigned to a department.

select e.emp_name,e.manager_id,d.department_name  
from employee e
inner join department d
on e.department_id = d.department_id

-- 22. List all departments with their budget and employee names, including departments without employees.

select d.department_name , d.budget,e.emp_name 
from employee e
right join department d
on e.department_id = d.department_id

-- 23. Show every employee with the corresponding department name, including employees without a department.

select d.department_name ,e.emp_name 
from employee e
left join department d
on e.department_id = d.department_id

-- 24. Display department name, location, and employee name only where a valid department relationship exists.

select d.department_name , d.location,e.emp_name 
from employee e
inner join department d
on e.department_id = d.department_id


-- 25. List every department with employee name and designation, including departments with no employees.

select d.department_name ,e.emp_name , e.designation 
from employee e
right join department d
on e.department_id = d.department_id

-- 26. Show employee name, department name, and join date only for employees with a valid department.

select e.emp_name , d.department_name ,e.join_date
from employee e
inner join department d
on e.department_id = d.department_id

-- 27. Display all employees with department name, including employees whose department ID is NULL.

select d.department_name ,e.emp_name 
from employee e
left join department d
on e.department_id = d.department_id

-- 28. List department name, budget, and employee name for all departments, including empty departments.

select d.department_name ,d.budget,e.emp_name 
from employee e
right join department d
on e.department_id = d.department_id

-- 29. Show employee name and salary for employees working in departments with a budget greater than 3,000,000.

select e.emp_name ,e.salary  
from employee e
left join department d
on e.department_id = d.department_id
where d.budget >3000000

-- 30. Display the complete employee list with department name and location, ensuring no employee is excluded.

select e.emp_name ,d.department_name,d.location 
from employee e
left join department d
on e.department_id = d.department_id 

-- 31. List all departments with employee names, including departments without current employees.

select e.emp_name ,d.department_name
from employee e
right join department d
on e.department_id = d.department_id 

-- 32. Show employee name, designation, and department name where employee and department records match.

select e.emp_name ,e.designation,d.department_name
from employee e
inner join department d
on e.department_id = d.department_id 

-- 33. Display department name, budget, and employee name for all departments, including those without employees.

select d.department_name,d.budget,e.emp_name  
from employee e
right join department d
on e.department_id = d.department_id 

-- 34. List employee name and department name for every employee, including those without a department.

select e.emp_name ,d.department_name
from employee e
left join department d
on e.department_id = d.department_id 

-- 35. Show employee name, salary, and department name only when the department ID matches a valid department.

select e.emp_name,e.salary,d.department_name 
from employee e
inner join department d
on e.department_id = d.department_id 

-- 36. Display all department details with assigned employees, including departments without employees.

select d.department_name,e.emp_name 
from employee e
right join department d
on e.department_id = d.department_id 

-- 37. List employee name and department name only for employees with an existing department.

select e.emp_name ,d.department_name
from employee e
inner join department d
on e.department_id = d.department_id 

-- 38. Show every employee with department name, ensuring all employees appear in the result.

select e.emp_name,d.department_name 
from employee e
left join department d
on e.department_id = d.department_id 

select * from employee

-- 39. Display department name, location, and employee name for all departments, including those without employees.

select d.department_name, d.location, e.emp_name
from employee e
right join department d
on e.department_id = d.department_id

-- 40. List employee name, designation, and department name only where a valid department match exists.

select e.emp_name,d.department_name,e.designation  
from employee e
inner join department d
on e.department_id = d.department_id 

-- 41. Show all employees with employee name and department name, including employees whose department ID is missing.

select  e.emp_name,d.department_name,e.department_id
from employee e
left join department d
on e.department_id = d.department_id

-- 42. Display department name and employee name for all departments, including those without employees.

select d.department_name,e.emp_name 
from employee e
right join department d
on e.department_id = d.department_id 

-- 43. List employee name, salary, and department name only when employee and department data match correctly.

select e.emp_name,e.salary,d.department_name 
from employee e
inner join department d
on e.department_id = d.department_id

-- 44. Show the complete employee list with department name, including employees without a department.

select e.emp_name, d.department_name 
from employee e
left join department d
on e.department_id = d.department_id

-- 45. Display all departments with employee name, location, and budget, including departments without employees.

select e.emp_name, d.department_name,d.location,d.budget 
from employee e
right join department d
on e.department_id = d.department_id

-- 46. List employee name and department name only for employees linked to an existing department.

select e.emp_name, d.department_name
from employee e
inner join department d
on e.department_id = d.department_id

-- 47. Show employee name, designation, and department name for every employee, including those without department details.

select e.emp_name,e.designation, d.department_name 
from employee e
left join department d
on e.department_id = d.department_id

-- 48. Display department name, budget, and employee name for every department, including departments with no employees.

select d.department_name,d.budget, e.emp_name
from employee e
right join department d
on e.department_id = d.department_id

-- 49. List employee name and department name only where the department relationship is valid.

select e.emp_name,d.department_name
from employee e
inner join department d
on e.department_id = d.department_id

-- 50. Show all employees and all departments together with emp_name and department_name, keeping every department visible even without staff, and every employee visible even without a department (attempt this with two separate queries: one keeping all employees, another keeping all departments).

select  e.emp_name,d.department_name
from employee e
left join department d
on e.department_id = d.department_id

select  e.emp_name,d.department_name
from employee e
right join department d
on e.department_id = d.department_id
