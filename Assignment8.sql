-- 30july 2026 
-- Assignment-8

use janavi

create table trains
(train_id int primary key,
train_name varchar(50) not null,
source varchar(50) not null,
destination varchar(50) not null,
departure_time time not null,
arrival_time time not null,
distance_km int check(distance_km>0))

INSERT INTO Trains VALUES
(101, 'Shatabdi Exp', 'Delhi', 'Bhopal', '06:00', '14:00', 700),
(102, 'Rajdhani Exp', 'Delhi', 'Mumbai', '16:00', '08:00', 1400),
(103, 'Duronto Exp', 'Mumbai', 'Chennai', '20:00', '10:00', 1300),
(104, 'Garib Rath', 'Kolkata', 'Delhi', '12:00', '06:00', 1500),
(105, 'Chennai Exp', 'Chennai', 'Delhi', '08:00', '22:00', 2200),
(106, 'Howrah Exp', 'Howrah', 'Mumbai', '10:00', '20:00', 1960),
(107, 'Nizamuddin Exp', 'Delhi', 'Hyderabad', '15:00', '05:00', 1675),
(108, 'Goa Exp', 'Mumbai', 'Goa', '07:00', '15:00', 589),
(109, 'Kashi Exp', 'Varanasi', 'Delhi', '05:30', '13:30', 820),
(110, 'Jammu Tawi Exp', 'Delhi', 'Jammu', '18:00', '07:00', 670),
(111, 'Karnataka Exp', 'Bangalore', 'Delhi', '21:00', '14:00', 2360),
(112, 'Kerala Exp', 'Trivandrum', 'Delhi', '11:00', '22:00', 3045),
(113, 'Punjab Mail', 'Mumbai', 'Firozpur', '19:00', '09:00', 1925),
(114, 'Tamil Nadu Exp', 'Chennai', 'Delhi', '06:30', '20:30', 2180),
(115, 'Andhra Exp', 'Hyderabad', 'Delhi', '06:00', '19:00', 1700),
(116, 'Odisha Sampark', 'Bhubaneswar', 'Delhi', '14:00', '08:00', 1725),
(117, 'Maharashtra Exp', 'Mumbai', 'Nagpur', '09:00', '18:00', 840),
(118, 'Saurashtra Exp', 'Rajkot', 'Mumbai', '06:00', '14:00', 730),
(119, 'Utkal Exp', 'Puri', 'Delhi', '20:00', '12:00', 1850),
(120, 'Konark Exp', 'Mumbai', 'Bhubaneswar', '22:00', '14:00', 1950),
(121, 'Kaveri Exp', 'Mysore', 'Chennai', '23:00', '07:00', 500),
(122, 'Malwa Exp', 'Indore', 'Delhi', '21:00', '08:00', 850),
(123, 'Netravati Exp', 'Mumbai', 'Mangalore', '11:00', '20:00', 720),
(124, 'Ganga Kaveri Exp', 'Chennai', 'Patna', '16:00', '08:00', 2000),
(125, 'Deccan Exp', 'Pune', 'Mumbai', '07:00', '12:00', 192),
(126, 'Shatabdi Kolkata', 'Kolkata', 'Patna', '05:00', '11:00', 535),
(127, 'Sealdah Exp', 'Sealdah', 'Delhi', '15:00', '09:00', 1460),
(128, 'Sundar Exp', 'Bangalore', 'Hyderabad', '18:00', '06:00', 650),
(129, 'Ajmer Exp', 'Ajmer', 'Delhi', '12:00', '21:00', 500)


create table Passengers ( 
passenger_id INT PRIMARY KEY, 
name varchar(50) not null, 
age int check(age>0), 
gender char(1), 
city varchar(50))

INSERT INTO Passengers VALUES
(1, 'Ramesh', 45, 'M', 'Delhi'),
(2, 'Sita', 32, 'F', 'Mumbai'),
(3, 'Arjun', 28, 'M', 'Bhopal'),
(4, 'Priya', 19, 'F', 'Chennai'),
(5, 'Anil', 52, 'M', 'Kolkata'),
(6, 'Neha', 27, 'F', 'Delhi'),
(7, 'Vikram', 34, 'M', 'Mumbai'),
(8, 'Sunita', 40, 'F', 'Kolkata'),
(9, 'Rajesh', 50, 'M', 'Chennai'),
(10, 'Meena', 22, 'F', 'Bangalore'),
(11, 'Arvind', 29, 'M', 'Hyderabad'),
(12, 'Kiran', 31, 'M', 'Pune'),
(13, 'Lakshmi', 36, 'F', 'Delhi'),
(14, 'Deepak', 48, 'M', 'Patna'),
(15, 'Swati', 25, 'F', 'Jaipur'),
(16, 'Harish', 55, 'M', 'Varanasi'),
(17, 'Rohit', 19, 'M', 'Lucknow'),
(18, 'Sneha', 23, 'F', 'Ahmedabad'),
(19, 'Manoj', 60, 'M', 'Nagpur'),
(20, 'Kavita', 33, 'F', 'Bhopal'),
(21, 'Ajay', 42, 'M', 'Indore'),
(22, 'Ritu', 28, 'F', 'Mysore'),
(23, 'Pankaj', 37, 'M', 'Goa'),
(24, 'Divya', 30, 'F', 'Surat'),
(25, 'Suresh', 44, 'M', 'Ranchi'),
(26, 'Pooja', 26, 'F', 'Bhubaneswar'),
(27, 'Nitin', 32, 'M', 'Kanpur'),
(28, 'Shalini', 39, 'F', 'Chandigarh'),
(29, 'Gaurav', 21, 'M', 'Shimla'),
(30, 'Anita', 47, 'F', 'Trivandrum')

create table reservations
(res_id int,
passenger_ID Int,
train_id int,
travel_date date not null,
class varchar(50) check(class in ('Sleeper', 'AC1', 'AC2', 'AC3')),
fare  DECIMAL(10,2) check(fare >= 0),
status varchar(50) check(status in ('Confirmed', 'Waiting', 'Cancelled'))
Foreign key (passenger_id)
references passengers(passenger_id),
foreign key (train_id)
references trains(train_id))

INSERT INTO Reservations VALUES
(201, 1, 101, '2025-09-01', 'Sleeper', 500, 'Confirmed'),
(202, 2, 102, '2025-09-05', 'AC2', 1800, 'Confirmed'),
(203, 3, 101, '2025-09-01', 'Sleeper', 500, 'Waiting'),
(204, 4, 103, '2025-09-07', 'AC3', 1200, 'Confirmed'),
(205, 5, 104, '2025-09-10', 'Sleeper', 600, 'Cancelled'),
(206, 6, 105, '2025-09-12', 'AC1', 3500, 'Confirmed'),
(207, 7, 106, '2025-09-13', 'AC2', 2200, 'Waiting'),
(208, 8, 107, '2025-09-14', 'Sleeper', 950, 'Confirmed'),
(209, 9, 108, '2025-09-15', 'AC3', 1200, 'Cancelled'),
(210, 10, 109, '2025-09-16', 'AC2', 1400, 'Confirmed'),
(211, 11, 110, '2025-09-17', 'Sleeper', 600, 'Confirmed'),
(212, 12, 111, '2025-09-18', 'AC1', 3800, 'Confirmed'),
(213, 13, 112, '2025-09-19', 'AC3', 2800, 'Waiting'),
(214, 14, 113, '2025-09-20', 'AC2', 2100, 'Confirmed'),
(215, 15, 114, '2025-09-21', 'Sleeper', 950, 'Confirmed'),
(216, 16, 115, '2025-09-22', 'AC2', 1650, 'Cancelled'),
(217, 17, 116, '2025-09-23', 'Sleeper', 800, 'Confirmed'),
(218, 18, 117, '2025-09-24', 'AC3', 1200, 'Confirmed'),
(219, 19, 118, '2025-09-25', 'AC1', 2500, 'Confirmed'),
(220, 20, 119, '2025-09-26', 'Sleeper', 1100, 'Waiting'),
(221, 21, 120, '2025-09-27', 'AC2', 1900, 'Confirmed'),
(222, 22, 121, '2025-09-28', 'AC3', 750, 'Confirmed'),
(223, 23, 122, '2025-09-29', 'Sleeper', 670, 'Cancelled'),
(224, 24, 123, '2025-09-30', 'AC2', 1100, 'Confirmed'),
(225, 25, 124, '2025-10-01', 'AC1', 3100, 'Confirmed'),
(226, 26, 125, '2025-10-02', 'Sleeper', 250, 'Waiting'),
(227, 27, 126, '2025-10-03', 'AC3', 900, 'Confirmed'),
(228, 28, 127, '2025-10-04', 'AC2', 1750, 'Confirmed'),
(229, 29, 128, '2025-10-05', 'Sleeper', 500, 'Confirmed'),
(230, 30, 129, '2025-10-06', 'AC2', 800, 'Cancelled')

-- List all trains running from Delhi as source station. 

select * from trains
where source = 'Delhi'

-- Find all passengers who are above 40 years of age.

select * from passengers
where age > 40

-- Get the total number of reservations made.

select count(res_id) as total_reservation
from reservations

-- Count how many reservations are in 'Confirmed' status.

select count(res_id) as confirmed_reservation
from reservations 
where status = 'Confirmed'

-- Show the average fare paid for each train.

select train_id , avg(fare) as avg_amount
from reservations
group by train_id

-- List reservations ordered by fare in descending order.

select * from reservations
order by fare desc

-- Find passengers who booked AC classes (AC2, AC3).

select p.name
from passengers p
join reservations r 
on p.passenger_id = r.passenger_ID
where class in ('AC2','AC3')

-- Get total revenue collected per train (only Confirmed reservations).

select train_id , sum(fare) as total_revenue
from reservations
where status = 'confirmed'
group by train_id

-- Find the train with the maximum distance_km.

select  train_name , max(distance_km) as max_distance
from trains
group by train_name

-- Show number of male and female passengers.

select gender , count(passenger_id) as total_numbersof_passengers
from passengers
group by gender

-- Get the passenger names who have booked tickets in Sleeper class.

select p.name
from Passengers p
join reservations r
on p.passenger_id = r.passenger_ID
where class = 'sleeper'

-- Find total number of reservations made from each city (JOIN with Passengers).

select p.city , count(r.res_id) as Total_Reservations 
from reservations r
join Passengers p
on p.passenger_id = r.passenger_ID
Group by p.city

-- Show train name and total passengers booked for it, ordered by passenger count descending.

select t.train_name ,count(r.passenger_ID) as total_passengers
from trains t
join reservations r
on t.train_id = r.train_id
group by t.train_name 
order by count(r.passenger_ID) desc 

-- Find the average age of passengers who booked 'Confirmed' tickets.

select avg(p.age) as avg_ageof_passenger
from reservations r
join Passengers p
on p.passenger_id = r.passenger_ID
where status = 'confirmed'


-- Display travel_date and number of reservations made on that date.

select travel_date , count(res_id) as total_reservations
from reservations
group by travel_date

-- Show all reservations where fare is greater than 1000.

select * from reservations 
where fare > 1000

-- List all passengers who live in Delhi or Mumbai.

select * from passengers
where city = 'delhi' or city = 'mumbai'

-- Show all trains whose distance is more than 1200 km.

select * from trains
where distance_km > 1200

-- Find reservations which are not 'Cancelled'.

select * from reservations
where status <> 'Cancelled'

-- Show the details of trains that have 'Exp' in their name.

select * from trains
where train_name like '%Exp%'

-- List all passengers ordered by their age in descending order.

select * from Passengers
order by age desc

-- Display reservations sorted by travel_date (earliest first).

select * from reservations
order by travel_date asc

-- Find all trains ordered by distance (longest route first).

select * from trains
order by distance_km desc

-- Show passengers ordered by name alphabetically.

select * from Passengers
order by name asc

-- List reservations ordered by class and then by fare.

select * from reservations
order by class asc , fare asc

-- Count how many passengers are from each city.

select city ,count(passenger_id)
from passengers
group by city 

-- Find the total fare collected from all Confirmed reservations.

select sum(fare) as 'total fare collected'
from reservations
where status = 'confirmed'

-- Show the minimum, maximum, and average age of passengers.

select min(age) as min_age,
max(age) as max_Age,
avg(age) as avg_age
from Passengers

-- Find the highest fare paid in Sleeper class.

select max(fare) as highest_fare
from reservations
where class = 'sleeper'

-- Get the average fare per travel_date.

select travel_date ,avg(fare) as 'avg_fare'
from reservations
group by travel_date

-- Show each class and the total number of reservations in it.

select class,count(res_id) as 'number of reservations'
from reservations
group by class

-- Find trains that have more than 1 reservation.

select train_id , count(res_id) as 'total reservation'
from reservations
group by train_id
having count(res_id) >1

-- List cities where more than 1 passenger lives.

select city , count(passenger_id) as 'Total Passenger'
from passengers
group by city
having count(passenger_id) > 1

-- Show gender-wise average age of passengers.

select gender , avg(age) as 'avg age of passenger'
from Passengers
group by gender

-- Find passengers who booked more than 1 ticket.

select Passenger_id , count(passenger_id) as total_tickets
from Passengers
group by passenger_id
having count(passenger_id) > 1


-- Show passenger name, train name, and fare for each reservation.

select p.name , t.train_name , r.fare
from Passengers p
join reservations r
on p.passenger_id = r.passenger_id
join trains t
on t.train_id = r.train_id

-- List all passengers and the train name they booked (if any).

select  p.name, t.train_name
from Passengers p
join reservations r
on p.passenger_id = r.passenger_id
join trains t
on r.train_id = t.train_id

-- Show all trains and the number of passengers booked in each.

select t.train_name , count(passenger_id) as 'number of passengers' 
from trains t
join reservations r
on t.train_id = r.train_id
group by t.train_name

-- Find all passengers who booked Rajdhani Exp.

select p.name
from Passengers p
join reservations r
on p.passenger_id = r.passenger_id
join trains t
on t.train_id = r.train_id
where t.train_name ='Rajdhani Exp'


-- List passenger names with their travel_date and status.

select p.name , r.travel_date , r.status
from passengers p
join reservations r
on p.passenger_id = r.passenger_ID

-- Find the top 2 highest fare reservations.

select top 2 fare
from reservations
order by fare desc

-- Find the train with the lowest average fare.

select train_id , avg(fare) as avg_fare
from reservations
group by train_id
order by avg(fare) asc

-- Show the train(s) where total distance travelled by all passengers > 1000 km.

select t.train_name , sum(distance_km) as 'total distance'
from trains t
join reservations r
on t.train_id = r.train_id
group by t.train_name
having sum(distance_km) >1000

-- Find passengers whose reservation status is 'Waiting'.

select p.name 
from Passengers p
join reservations r
on p.passenger_id = r.passenger_id
where status = 'waiting'

-- Show the passenger(s) who paid the maximum fare overall.

select p.name , max(fare) as max_fare
from Passengers p
join reservations r
on p.passenger_id = r.passenger_id
group by p.name

-- Show all passengers whose age is between 20 and 40.

select *
from Passengers
where age between 20 and 40

-- Find trains that start from Kolkata or Chennai.

select *
from trains
where source in ('kolkata', 'chennai')

-- Show all reservations made after 2025-09-05.

select *
from reservations
where travel_date > '2025-09-05'

-- Display passengers whose name starts with 'A'.

select *
from Passengers
where name like 'A%'

-- List passengers whose city is NOT Delhi.

select *
from Passengers
where city <> 'Delhi'

-- Show the 3 youngest passengers.

select top 3 age
from Passengers
order by age asc

-- Show the 2 longest-distance trains.

select top 2 distance_km
from trains
order by distance_km desc

-- Display the 5 most expensive reservations (highest fare).

select top 5 fare
from reservations
order by fare desc

-- List trains in alphabetical order of train_name.

select *
from trains
order by train_name asc

-- Show passengers sorted by age (youngest first).

select *
from Passengers
order by age asc

-- Find the average fare of all reservations.

select avg(fare) as avg_fare
from reservations

-- Count the total number of male passengers.

select count(gender) as 'total number of male passengers'
from Passengers
where gender = 'M'

-- Show the maximum distance among all trains.

select max(distance_km) as max_distance
from trains


-- Find the total number of Sleeper class reservations.

select count(res_id) as 'total number of Sleeper class reservations'
from reservations
where class = 'sleeper'

-- Find the total fare paid by passengers from Mumbai.

select sum(fare) as total_fare
from Passengers p
join reservations r
on p.passenger_id = r.passenger_ID
where city = 'Mumbai'

-- Count the number of reservations per status (Confirmed/Waiting/Cancelled).

select status , count(res_id) as 'number of reservations'
from reservations
group by status

-- Find the total number of passengers per gender.

select gender, sum(passenger_id) as 'number of passengers'
from Passengers
group by gender

-- Show the average fare for each class.

select class , avg(fare) as 'avg_fare'
from reservations
group by class

-- Display the number of trains starting from each source city.

select source , count(train_id) as 'number of trains'
from trains
group by source

-- Show total reservations grouped by travel_date.

select travel_date , count(res_id) as 'total reservations'
from reservations
group by travel_date

-- Show passenger name, city, and train_name they booked.

select p.name , p.city , t.train_name
from Passengers p
join reservations r
on r.passenger_ID = p.passenger_id
join trains t
on t.train_id = r.train_id

-- List all reservations with passenger name and status.

select p.name , r.status
from Passengers p
join reservations r
on r.passenger_ID = p.passenger_id

-- Show train_name and number of confirmed passengers on it.

select t.train_name , count (r.res_id) as 'number of confirmed'
from trains t
join reservations r
on t.train_id = r.train_id
where r.status = 'Confirmed'
group by t.train_name

-- Display all passengers with train_name (if booked, else show NULL).

select p.name ,t.train_name
from Passengers p
left join reservations r
on r.passenger_ID = p.passenger_id
left join trains t 
on t.train_id = r.train_id

-- Find which passengers booked Garib Rath train.

select p.name
from Passengers p
right join reservations r
on r.passenger_ID = p.passenger_id
right join trains t
on t.train_id = r.train_id
where t.train_name = 'Garib Rath'

-- Show train_id and total fare collected, but only where fare > 1000.

select train_id , sum(fare) as total_fare
from reservations 
where fare > 1000
group by train_id

-- List source cities that have more than 1 train.

select source , count(train_id) as total_trains
from trains
group by source
having count(train_id) >1

-- Find passengers grouped by city where count > 1.

select city , count(passenger_id) as total_passengers 
from Passengers
group by city
having count(passenger_id) >1 

-- Show classes that earned more than 2000 fare in total.

select class , sum(fare) as total_fare
from reservations
group by class
having sum(fare) >2000

-- List trains that have at least 2 passengers booked.

select t.train_name , count(r.passenger_id) as total_passenger
from trains t
join reservations r
on t.train_id = r.train_id
group by t.train_name
having count(r.passenger_id) >= 2

-- Find the passenger(s) with the highest age.

select top 1 age
from Passengers
order by age desc

-- Show the train(s) with the shortest distance.

select top 1 distance_km
from trains 
order by distance_km asc

-- Find the reservation(s) with the lowest fare.

select top 1 distance_km
from trains 
order by distance_km asc

-- List passengers who paid above the average fare.

select p.name , avg(r.fare) as avg_fare
from Passengers p
join reservations r
on p.passenger_id = r.passenger_ID
group by p.name


-- Find trains whose distance is above the average train distance.

select train_name , avg(distance_km) as avg_distance_km
from trains
group by train_name

-- Show all reservations in September 2025.

select * from reservations
where travel_date between '2025-09-01' and '2025-09-30'


-- Find the earliest travel_date booked.

SELECT MIN(travel_date) AS earliest_date
FROM Reservations

-- Find the latest travel_date booked.

SELECT Max(travel_date) AS latest_date
FROM Reservations


-- Count how many reservations are made per day.

select travel_date , count(res_id) as tptal_reservation
from reservations
group by travel_date

-- List passengers who booked tickets on the same date.

select p.name , r.travel_date
from Passengers p
join reservations r
on p.passenger_id = r.passenger_id
order by r.travel_date 

-- Show passenger name, train_name, and distance travelled.

select p.name , t.train_name , t.distance_km
from Passengers p
join reservations r
on p.passenger_id = r.passenger_id
join trains t
on t.train_id = r.train_id

-- Find the city that contributed the highest number of passengers.

select top 1 city, count(passenger_id) as total_passengers
from passengers
group by city
order by count(passenger_id) desc

-- Display each train and its average fare (confirmed only).

select t.train_name , avg(r.fare) as avg_fare
from trains t
join reservations r
on r.train_id = t.train_id
where r.status = 'confirmed'
group by t.train_name

-- Show passengers who booked tickets in more than one class.

select passenger_id , count(class) as total_classes
from reservations
group by passenger_ID
having count(class) > 1


-- Find train_name with maximum number of reservations.


select  top 1 t.train_name , count(res_id) as total_reservations
from trains t
join reservations r
on t.train_id = r.train_id
group by t.train_name
order by count(res_id) desc

