-- Assignment of SQL
-- Airline Flight Manaement System

create database airline_db

use airline_db



CREATE TABLE airports
(
    airport_id INT IDENTITY(1,1) PRIMARY KEY,
    airport_name VARCHAR(150) NOT NULL UNIQUE,
    airport_code CHAR(3) NOT NULL UNIQUE,
    city VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    timezone VARCHAR(50) NOT NULL
)

INSERT INTO airports
(airport_name, airport_code, city, country, timezone)
VALUES
('Indira Gandhi International Airport', 'DEL', 'New Delhi', 'India', 'Asia/Kolkata'),
('Chhatrapati Shivaji Maharaj International Airport', 'BOM', 'Mumbai', 'India', 'Asia/Kolkata'),
('Kempegowda International Airport', 'BLR', 'Bangalore', 'India', 'Asia/Kolkata'),
('Chennai International Airport', 'MAA', 'Chennai', 'India', 'Asia/Kolkata'),
('Netaji Subhas Chandra Bose International Airport', 'CCU', 'Kolkata', 'India', 'Asia/Kolkata'),
('Rajiv Gandhi International Airport', 'HYD', 'Hyderabad', 'India', 'Asia/Kolkata'),
('Sardar Vallabhbhai Patel International Airport', 'AMD', 'Ahmedabad', 'India', 'Asia/Kolkata'),
('Dubai International Airport', 'DXB', 'Dubai', 'UAE', 'Asia/Dubai'),
('Heathrow Airport', 'LHR', 'London', 'United Kingdom', 'Europe/London'),
('John F. Kennedy International Airport', 'JFK', 'New York', 'USA', 'America/New_York'),
('Singapore Changi Airport', 'SIN', 'Singapore', 'Singapore', 'Asia/Singapore'),
('Sydney Kingsford Smith Airport', 'SYD', 'Sydney', 'Australia', 'Australia/Sydney'),
('Frankfurt Airport', 'FRA', 'Frankfurt', 'Germany', 'Europe/Berlin'),
('Bangkok Suvarnabhumi Airport', 'BKK', 'Bangkok', 'Thailand', 'Asia/Bangkok'),
('Kuala Lumpur International Airport', 'KUL', 'Kuala Lumpur', 'Malaysia', 'Asia/Kuala_Lumpur')


   CREATE TABLE airlines
(
    airline_id INT IDENTITY(1,1) PRIMARY KEY,
    airline_name VARCHAR(100) NOT NULL UNIQUE,
    iata_code CHAR(2) NOT NULL UNIQUE,
    country VARCHAR(100) NOT NULL,
    contact_email VARCHAR(100) NOT NULL UNIQUE,
    status VARCHAR(20) CHECK (status IN ('Active', 'Suspended'))
)

INSERT INTO airlines
(airline_name, iata_code, country, contact_email, status)
VALUES
('Air India', 'AI', 'India', 'support@airindia.in', 'Active'),
('IndiGo', '6E', 'India', 'care@goindigo.in', 'Active'),
('SpiceJet', 'SG', 'India', 'support@spicejet.com', 'Active'),
('Vistara', 'UK', 'India', 'customercare@airvistara.com', 'Active'),
('Emirates', 'EK', 'UAE', 'support@emirates.com', 'Active'),
('British Airways', 'BA', 'United Kingdom', 'help@britishairways.com', 'Active'),
('Singapore Airlines', 'SQ', 'Singapore', 'customercare@singaporeair.com', 'Active'),
('AirAsia', 'AK', 'Malaysia', 'support@airasia.com', 'Suspended')

CREATE TABLE aircrafts
(
    aircraft_id INT IDENTITY(1,1) PRIMARY KEY,
    aircraft_code VARCHAR(20) NOT NULL UNIQUE,
    model VARCHAR(100) NOT NULL,
    airline_id INT,
    total_seats INT NOT NULL,
    manufacture_year INT NOT NULL,

    FOREIGN KEY (airline_id)
    REFERENCES airlines(airline_id)
)

INSERT INTO aircrafts
(aircraft_code, model, airline_id, total_seats, manufacture_year)
VALUES
('VT-PPB', 'Boeing 787-8 Dreamliner', 1, 256, 2015),
('VT-IGL', 'Airbus A320neo', 2, 186, 2018),
('VT-IGM', 'Airbus A320neo', 2, 186, 2019),
('VT-SGF', 'Boeing 737-800', 3, 189, 2016),
('VT-SGG', 'Boeing 737-800', 3, 189, 2017),
('VT-TTB', 'Airbus A320', 4, 158, 2020),
('VT-TTC', 'Boeing 787-9 Dreamliner', 4, 268, 2021),
('A6-ENA', 'Boeing 777-300ER', 5, 354, 2014),
('A6-ENB', 'Airbus A380-800', 5, 489, 2013),
('G-XWBA', 'Airbus A350-1000', 6, 331, 2019),
('9V-SKA', 'Boeing 777-300ER', 7, 299, 2016),
('9M-AQA', 'Airbus A320', 8, 180, 2017)

CREATE TABLE flights
(
    flight_id INT IDENTITY(1,1) PRIMARY KEY,
    flight_number VARCHAR(10) NOT NULL UNIQUE,
    airline_id INT,
    aircraft_id INT,
    origin_id INT,
    destination_id INT,
    departure_time DATETIME NOT NULL,
    arrival_time DATETIME NOT NULL,
    fare DECIMAL(8,2) NOT NULL,
    status VARCHAR(20)
        CHECK (status IN ('Scheduled', 'Delayed', 'Cancelled', 'Completed')),

    FOREIGN KEY (airline_id)
    REFERENCES airlines(airline_id),

    FOREIGN KEY (aircraft_id)
    REFERENCES aircrafts(aircraft_id),

    FOREIGN KEY (origin_id)
    REFERENCES airports(airport_id),

    FOREIGN KEY (destination_id)
    REFERENCES airports(airport_id)
)

INSERT INTO flights
(flight_number, airline_id, aircraft_id, origin_id, destination_id,
 departure_time, arrival_time, fare, status)
VALUES
('AI-101', 1, 1, 1, 2, '2024-03-01 06:00:00', '2024-03-01 08:10:00', 4500.00, 'Completed'),
('AI-202', 1, 1, 2, 9, '2024-03-02 22:00:00', '2024-03-03 04:30:00', 32000.00, 'Completed'),
('6E-301', 2, 2, 1, 3, '2024-03-03 07:30:00', '2024-03-03 09:45:00', 3200.00, 'Completed'),
('6E-402', 2, 3, 3, 6, '2024-03-04 11:00:00', '2024-03-04 12:30:00', 2800.00, 'Completed'),
('SG-501', 3, 4, 1, 4, '2024-03-05 08:00:00', '2024-03-05 10:15:00', 3500.00, 'Completed'),
('SG-602', 3, 5, 4, 7, '2024-03-06 14:00:00', '2024-03-06 15:45:00', 2600.00, 'Delayed'),
('UK-701', 4, 6, 1, 5, '2024-03-07 09:30:00', '2024-03-07 13:00:00', 5200.00, 'Scheduled'),
('UK-802', 4, 7, 2, 8, '2024-03-08 18:00:00', '2024-03-08 21:30:00', 18000.00, 'Scheduled'),
('EK-901', 5, 8, 8, 10, '2024-03-09 02:00:00', '2024-03-09 14:00:00', 55000.00, 'Completed'),
('EK-1002', 5, 9, 8, 9, '2024-03-10 08:30:00', '2024-03-10 13:00:00', 42000.00, 'Completed'),
('BA-201', 6, 10, 9, 1, '2024-03-11 10:00:00', '2024-03-11 23:30:00', 48000.00, 'Completed'),
('BA-302', 6, 10, 9, 13, '2024-03-12 12:00:00', '2024-03-12 14:30:00', 22000.00, 'Cancelled'),
('SQ-401', 7, 11, 11, 1, '2024-03-13 00:30:00', '2024-03-13 05:00:00', 36000.00, 'Completed'),
('SQ-502', 7, 11, 11, 12, '2024-03-14 09:00:00', '2024-03-14 18:30:00', 41000.00, 'Scheduled'),
('AI-303', 1, 1, 2, 4, '2024-03-15 07:00:00', '2024-03-15 09:30:00', 3800.00, 'Completed'),
('6E-503', 2, 2, 1, 2, '2024-03-16 06:30:00', '2024-03-16 08:40:00', 3100.00, 'Scheduled'),
('SG-703', 3, 4, 4, 1, '2024-03-17 16:00:00', '2024-03-17 18:15:00', 3300.00, 'Delayed'),
('UK-903', 4, 6, 1, 3, '2024-03-18 13:00:00', '2024-03-18 15:10:00', 4100.00, 'Scheduled'),
('EK-1103', 5, 8, 8, 14, '2024-03-19 03:00:00', '2024-03-19 07:30:00', 28000.00, 'Completed'),
('AK-101', 8, 12, 15, 11, '2024-03-20 10:00:00', '2024-03-20 12:00:00', 8500.00, 'Cancelled')

CREATE TABLE passengers
(
    passenger_id INT IDENTITY(1,1) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) UNIQUE,
    passport_no VARCHAR(20) UNIQUE,
    nationality VARCHAR(50) NOT NULL,
    dob DATE NOT NULL
)

INSERT INTO passengers
(full_name, email, phone, passport_no, nationality, dob)
VALUES
('Aarav Sharma', 'aarav.sharma@gmail.com', '9876543210', 'P1234567', 'Indian', '1990-04-15'),
('Priya Mehta', 'priya.mehta@yahoo.com', '9823456781', 'P2345678', 'Indian', '1992-07-22'),
('Rahul Verma', 'rahul.verma@outlook.com', '9712345682', 'P3456789', 'Indian', '1988-11-05'),
('Sneha Patel', 'sneha.patel@gmail.com', '9634567893', 'P4567890', 'Indian', '1995-02-18'),
('Vikram Singh', 'vikram.singh@hotmail.com', '9545678904', 'P5678901', 'Indian', '1985-09-30'),
('Ananya Iyer', 'ananya.iyer@gmail.com', '9456789015', 'P6789012', 'Indian', '1998-06-12'),
('Karan Kapoor', 'karan.kapoor@gmail.com', '9367890126', 'P7890123', 'Indian', '1993-03-25'),
('Divya Nair', 'divya.nair@rediffmail.com', '9278901237', 'P8901234', 'Indian', '1991-12-08'),
('Mohammed Al Farsi', 'mohammed.alfarsi@email.ae', '0551234568', 'UAE123456', 'Emirati', '1987-08-14'),
('Sarah Johnson', 'sarah.j@gmail.com', '07911123459', 'GB123456', 'British', '1989-05-20'),
('Liu Wei', 'liu.wei@163.com', '13812345670', 'CN123456', 'Chinese', '1994-01-17'),
('Emily Watson', 'emily.watson@yahoo.com', '21298765431', 'US123456', 'American', '1996-10-03'),
('Rohan Desai', 'rohan.desai@gmail.com', '9189012342', 'P9012345', 'Indian', '1990-07-29'),
('Meera Krishnan', 'meera.k@gmail.com', '9090123453', 'P0123456', 'Indian', '1997-04-11'),
('Arjun Reddy', 'arjun.reddy@gmail.com', '9901234564', 'P1122334', 'Indian', '1986-02-28'),
('Fatima Sheikh', 'fatima.sheikh@email.ae', '0559876545', 'UAE654321', 'Emirati', '1993-09-19'),
('James Miller', 'james.miller@gmail.com', '07922334456', 'GB654321', 'British', '1984-12-31'),
('Nisha Agarwal', 'nisha.agarwal@gmail.com', '9812345677', 'P2233445', 'Indian', '1999-08-05'),
('Chen Jing', 'chen.jing@qq.com', '13987654328', 'CN654321', 'Chinese', '1991-03-16'),
('Siddharth Joshi', 'siddharth.j@gmail.com', '9723456789', 'P3344556', 'Indian', '1988-06-22')

CREATE TABLE bookings
(
    booking_id INT IDENTITY(1,1) PRIMARY KEY,
    passenger_id INT,
    flight_id INT,
    booking_date DATE DEFAULT CAST(GETDATE() AS DATE),
    seat_number VARCHAR(5) NOT NULL,
    seat_class VARCHAR(20)
        CHECK (seat_class IN ('Economy', 'Business', 'First')),
    amount_paid DECIMAL(8,2) NOT NULL,
    booking_status VARCHAR(20)
        CHECK (booking_status IN ('Confirmed', 'Cancelled', 'Pending')),

    FOREIGN KEY (passenger_id)
    REFERENCES passengers(passenger_id),

    FOREIGN KEY (flight_id)
    REFERENCES flights(flight_id)
)

INSERT INTO bookings
(passenger_id, flight_id, booking_date, seat_number, seat_class, amount_paid, booking_status)
VALUES
(1, 1, '2024-02-15', '12A', 'Economy', 4500.00, 'Confirmed'),
(2, 1, '2024-02-16', '14B', 'Economy', 4500.00, 'Confirmed'),
(3, 2, '2024-02-10', '3A', 'Business', 64000.00, 'Confirmed'),
(4, 3, '2024-02-20', '22C', 'Economy', 3200.00, 'Confirmed'),
(5, 4, '2024-02-22', '8D', 'Economy', 2800.00, 'Confirmed'),
(6, 5, '2024-02-25', '18E', 'Economy', 3500.00, 'Confirmed'),
(7, 6, '2024-02-26', '5A', 'Business', 7800.00, 'Confirmed'),
(8, 7, '2024-02-28', '11B', 'Economy', 5200.00, 'Pending'),
(9, 9, '2024-02-05', '2A', 'First', 110000.00, 'Confirmed'),
(10, 10, '2024-02-08', '1B', 'First', 84000.00, 'Confirmed'),
(11, 13, '2024-02-12', '20C', 'Economy', 36000.00, 'Confirmed'),
(12, 11, '2024-02-14', '4A', 'Business', 96000.00, 'Confirmed'),
(13, 15, '2024-03-01', '9C', 'Economy', 3800.00, 'Confirmed'),
(14, 3, '2024-02-21', '25D', 'Economy', 3200.00, 'Confirmed'),
(15, 4, '2024-02-23', '7E', 'Business', 8400.00, 'Confirmed'),
(16, 8, '2024-02-27', '6B', 'Business', 36000.00, 'Pending'),
(17, 10, '2024-02-09', '10A', 'Economy', 42000.00, 'Confirmed'),
(18, 16, '2024-03-05', '30F', 'Economy', 3100.00, 'Confirmed'),
(19, 14, '2024-03-02', '15C', 'Economy', 41000.00, 'Pending'),
(20, 7, '2024-02-28', '2B', 'Business', 15600.00, 'Confirmed'),
(1, 15, '2024-03-03', '19A', 'Economy', 3800.00, 'Confirmed'),
(2, 5, '2024-02-24', '13B', 'Economy', 3500.00, 'Cancelled'),
(3, 9, '2024-02-06', '1A', 'First', 110000.00, 'Confirmed'),
(5, 11, '2024-02-13', '22D', 'Economy', 48000.00, 'Confirmed'),
(6, 19, '2024-03-08', '17E', 'Economy', 28000.00, 'Confirmed'),
(7, 13, '2024-02-11', '5C', 'Business', 72000.00, 'Confirmed'),
(8, 16, '2024-03-06', '28F', 'Economy', 3100.00, 'Cancelled'),
(10, 2, '2024-02-11', '6A', 'Economy', 32000.00, 'Confirmed'),
(13, 17, '2024-03-10', '14D', 'Economy', 3300.00, 'Pending'),
(15, 19, '2024-03-09', '3B', 'Business', 56000.00, 'Confirmed')

-- Q1. Write a CREATE TABLE statement for the passengers table with all constraints as defined in the schema.


CREATE TABLE passengers
(
    passenger_id INT IDENTITY(1,1) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) UNIQUE,
    passport_no VARCHAR(20) UNIQUE,
    nationality VARCHAR(50) NOT NULL,
    dob DATE NOT NULL
)

-- Q2. Write a CREATE TABLE statement for the bookings table. Include all FOREIGN KEY references and CHECK constraints on seat_class and booking_status.


CREATE TABLE bookings
(
    booking_id INT IDENTITY(1,1) PRIMARY KEY,
    passenger_id INT,
    flight_id INT,
    booking_date DATE DEFAULT CAST(GETDATE() AS DATE),
    seat_number VARCHAR(5) NOT NULL,
    seat_class VARCHAR(20)
        CHECK (seat_class IN ('Economy', 'Business', 'First')),
    amount_paid DECIMAL(8,2) NOT NULL,
    booking_status VARCHAR(20)
        CHECK (booking_status IN ('Confirmed', 'Cancelled', 'Pending')),

    FOREIGN KEY (passenger_id)
        REFERENCES passengers(passenger_id),

    FOREIGN KEY (flight_id)
        REFERENCES flights(flight_id)
)

-- Q3. Insert 3 records into the airports table with realistic values for airport_name, airport_code, city, country, and timezone.

INSERT INTO airports
(airport_name, airport_code, city, country, timezone)
VALUES
('Indira Gandhi International Airport',
 'DEL', 'New Delhi', 'India', 'Asia/Kolkata'),

('Chhatrapati Shivaji Maharaj International Airport',
 'BOM', 'Mumbai', 'India', 'Asia/Kolkata'),

('Dubai International Airport',
 'DXB', 'Dubai', 'UAE', 'Asia/Dubai')


-- Q4. Insert 2 records into the flights table. Set the status of one flight as 'Delayed' and the other as 'Scheduled'.

INSERT INTO flights
(flight_number, airline_id, aircraft_id,origin_id, destination_id,departure_time, arrival_time, fare, status) VALUES
('AI-501', 1, 1, 1, 2,'2024-04-01 08:00:00','2024-04-01 10:00:00',5000.00,'Delayed'),
('AI-502', 1, 1, 2, 1, '2024-04-02 12:00:00','2024-04-02 14:00:00',4500.00,'Scheduled')

-- Q5. Write an UPDATE query to change the status of all flights operated by airline_id = 3 from 'Scheduled' to 'Cancelled'.

update flights
set status = 'Cancelled'
where airline_id = 3 and status = 'Scheduled'


-- Q6. Delete all booking records where booking_status = 'Cancelled' and booking_date is older than '2023-06-01'.

delete from bookings
where booking_status = 'Cancelled' and booking_date < '2023-06-01'

-- PART B: Constraints

-- Q7. Add a CHECK constraint on the fare column of the flights table to ensure fare is always greater than 0.

alter table flights
add constraint ck_farecolumn check(fare>0)

-- Q8. Add a UNIQUE constraint on the passport_no column of the passengers table using ALTER TABLE.

alter table passengers
add constraint pasno_Unique UNIQUE (passport_no)

-- Q9. Write a query that attempts to insert a duplicate iata_code into the airlines table. Explain in a comment why it will be rejected.

NSERT into airlines
(airline_name, iata_code, country, contact_email, status)
VALUES
('Air India Duplicate', 'AI', 'India',
 'duplicate@airindia.in', 'Active')
 
 -- insert data rejected because iata_code has unique constraint 

-- Q10. Add a NOT NULL constraint to the seat_number column in the bookings table using ALTER TABLE.

alter table bookings
alter column seat_number varchar(5) NOT NULL

-- Q11. Set a DEFAULT value of 'Scheduled' for the status column of the flights table using ALTER TABLE.

alter table flights
add constraint df_bookingstatus 
Default 'Scheduled' for status

-- Q12. Drop the existing CHECK constraint on booking_status and re-add it to also allow the value 'Waitlisted'.

ALTER TABLE bookings
DROP CONSTRAINT CK_Bookings_BookingStatus;

ALTER TABLE bookings
ADD CONSTRAINT CK_Bookings_BookingStatus
CHECK (booking_status IN
       ('Confirmed', 'Cancelled', 'Pending', 'Waitlisted'))

-- PART C: JOIN Queries  

-- Section C-1: INNER JOIN

-- Q13. List all flights along with the name of the operating airline. Display flight_number, airline_name, departure_time, and status.

select f.flight_number , a.airline_name , f.departure_time , f.status
from airlines a
join flights f
on a.airline_id = f.airline_id

-- Q14. Display all bookings with passenger full names and their corresponding flight numbers. Show full_name, flight_number, seat_class, and amount_paid.

select p.full_name , f.flight_number , b.seat_class, b.amount_paid
from bookings b
join flights f
on b.flight_id = f.flight_id
join passengers p
on b.passenger_id = p.passenger_id

-- Q15. Show each flight's origin and destination city names. Use INNER JOIN on airports twice (aliased separately for origin and destination). Display flight_number, origin_city, and destination_city.

select f.flight_number , a.city as origin_city , d.city as destination_city
from flights f
join airports a
on f.origin_id = a.airport_id
join airports d
on f.destination_id = d.airport_id

-- Q16. List all passengers who have made at least one booking, 
-- along with the flight they booked and the fare paid. 
-- Show full_name, flight_number, and amount_paid.

select p.full_name , f.flight_number , b.amount_paid
from bookings b
join flights f
on b.flight_id = f.flight_id
join passengers p
on b.passenger_id = p.passenger_id

-- Q17. Display aircraft details for every scheduled flight. 
-- Show flight_number, model, total_seats, and departure_time.

select f.flight_number , a.model , a.total_seats , f.departure_time
from flights f
join aircrafts a
on f.aircraft_id = a.aircraft_id
Where f.status = 'Scheduled'

-- Q18. Join airlines and aircrafts to list each aircraft along with 
-- its airline name, aircraft model, and manufacture year.

select ac.model , ac.manufacture_year , a.airline_name
from airlines a
join aircrafts ac
on a.airline_id = ac.airline_id


-- Section C-2: LEFT JOIN / RIGHT JOIN

-- Q19. Find all passengers who have NOT made any booking yet. 
-- Use LEFT JOIN between passengers and bookings. 
-- Display full_name and email.

select p.full_name , p.email
from passengers p
left join bookings b
on p.passenger_id = b.passenger_id
where b.booking_id is NULL

-- Q20. List all flights along with their total booking count,
-- including flights with zero bookings. Use LEFT JOIN and GROUP BY.

select f.flight_number , count(b.booking_id) as totalbooking
from flights f
left join bookings b
on f.flight_id = b.flight_id
group by f.flight_number 


-- Q21. Find all airlines that currently have NO aircrafts registered under them.
-- Use LEFT JOIN between airlines and aircrafts.

select a.airline_name
from airlines a
left join aircrafts ac 
on a.airline_id = ac.airline_id
where ac.aircraft_id is null

-- Q22. Display all airports along with the number of flights departing from 
-- each airport. Include airports with no departing flights. Use LEFT JOIN.

select a.airport_code, a.airport_name, count(f.flight_id) departing_flights
from airports a
left join flights f
on a.airport_id = f.origin_id
group by a.airport_id, a.airport_code, a.airport_name

-- Q23. List all aircrafts with their assigned flights. 
-- Include aircrafts that have not been assigned to any flight yet. Use LEFT JOIN.

select a.aircraft_code , f.flight_number 
from aircrafts a
left join flights f
on a.aircraft_id = f.aircraft_id


-- Q24. Using RIGHT JOIN, display all flights with their booking records, showing flights that have no bookings on the right side.

select f.flight_number, b.booking_id, b.passenger_id,
       b.seat_number, b.booking_status
from bookings b
right join flights f
on b.flight_id = f.flight_id


-- Q25. Write a query joining passengers, bookings, and flights to display: full_name, flight_number, seat_class, departure_time, and booking_status.

select p.full_name, f.flight_number, b.seat_class,
       f.departure_time, b.booking_status
from passengers p
inner join bookings b
on p.passenger_id = b.passenger_id
inner join flights f
on b.flight_id = f.flight_id


-- Q26. Show complete flight route details for each booking: full_name, flight_number, origin city, destination city, and amount_paid. Join bookings, passengers, flights, and airports (twice).

select p.full_name, f.flight_number,
       ao.city origin_city,
       ad.city destination_city,
       b.amount_paid
from bookings b
inner join passengers p
on b.passenger_id = p.passenger_id
inner join flights f
on b.flight_id = f.flight_id
inner join airports ao
on f.origin_id = ao.airport_id
inner join airports ad
on f.destination_id = ad.airport_id



-- Q27. Generate a full flight manifest: passenger full_name, passport_no, flight_number, airline_name, seat_number, seat_class, and departure_time. Use all 6 tables.

select p.full_name, p.passport_no, f.flight_number,
       a.airline_name, b.seat_number,
       b.seat_class, f.departure_time
from bookings b
inner join passengers p
on b.passenger_id = p.passenger_id
inner join flights f
on b.flight_id = f.flight_id
inner join airlines a
on f.airline_id = a.airline_id
inner join aircrafts ac
on f.aircraft_id = ac.aircraft_id
inner join airports ao
on f.origin_id = ao.airport_id
inner join airports ad
on f.destination_id = ad.airport_id


-- Q28. List all passengers who travelled in Business or First class, along with the airline name and aircraft model of their flight.


select p.full_name, b.seat_class,
       a.airline_name, ac.model aircraft_model
from passengers p
inner join bookings b
on p.passenger_id = b.passenger_id
inner join flights f
on b.flight_id = f.flight_id
inner join airlines a
on f.airline_id = a.airline_id
inner join aircrafts ac
on f.aircraft_id = ac.aircraft_id
where b.seat_class in ('Business', 'First')


-- Q29. Find all flights that are 'Delayed' and display: flight_number, airline_name, aircraft model, origin city, and destination city.

select f.flight_number, a.airline_name,
       ac.model aircraft_model,
       ao.city origin_city,
       ad.city destination_city
from flights f
inner join airlines a
on f.airline_id = a.airline_id
inner join aircrafts ac
on f.aircraft_id = ac.aircraft_id
inner join airports ao
on f.origin_id = ao.airport_id
inner join airports ad
on f.destination_id = ad.airport_id
where f.status = 'Delayed'


-- Q30. Find the airport from which the highest number of passenger bookings have originated. Join airports, flights, and bookings. Use GROUP BY and ORDER BY.

select top 1 ap.airport_name, ap.airport_code,
       count(b.booking_id) total_bookings
from airports ap
inner join flights f
on ap.airport_id = f.origin_id
inner join bookings b
on f.flight_id = b.flight_id
group by ap.airport_id, ap.airport_name, ap.airport_code
order by total_bookings desc


-- Q31. Find pairs of passengers who share the same nationality. Use a SELF JOIN on the passengers table. Show passenger1_name, passenger2_name, and nationality.

select p1.full_name passenger1_name,
       p2.full_name passenger2_name,
       p1.nationality
from passengers p1
inner join passengers p2
on p1.nationality = p2.nationality
and p1.passenger_id < p2.passenger_id


-- Q32. Find pairs of flights that share the same origin airport and the same destination airport (i.e., duplicate routes). Use SELF JOIN on the flights table. Display both flight numbers and the shared route.

select f1.flight_number flight1,
       f2.flight_number flight2,
       f1.origin_id origin_airport,
       f1.destination_id destination_airport
from flights f1
inner join flights f2
on f1.origin_id = f2.origin_id
and f1.destination_id = f2.destination_id
and f1.flight_id < f2.flight_id

-- Q33. Write a FULL OUTER JOIN between passengers and bookings to display all passengers (with or without bookings) and all bookings (matched or unmatched).

select p.passenger_id, p.full_name,
       b.booking_id, b.flight_id, b.booking_status
from passengers p
full outer join bookings b
on p.passenger_id = b.passenger_id

-- Q34. Write a CROSS JOIN between airlines and seat classes (create a small derived table with values: 'Economy', 'Business', 'First') to generate all possible airline-seat class combinations.

select a.airline_name, sc.seat_class
from airlines a
cross join
(values ('Economy'),('Business'),('First')
) sc(seat_class)

-- PART D: GROUP BY, HAVING & ORDER BY

-- Q35. Count the total number of flights operated by each airline. Display airline_name and total_flights. Order by total_flights descending.

select a.airline_name, count(f.flight_id) total_flights
from airlines a
left join flights f
on a.airline_id = f.airline_id
group by a.airline_id, a.airline_name
order by total_flights desc

-- Q36. Find the total revenue collected per flight (sum of amount_paid from bookings). Display flight_number and total_revenue. Order by total_revenue descending.

select f.flight_number, sum(b.amount_paid) total_revenue
from flights f
inner join bookings b
on f.flight_id = b.flight_id
group by f.flight_id, f.flight_number
order by total_revenue desc

-- Q37. Group bookings by seat_class and count how many bookings exist in each class. Display seat_class and booking_count.

select b.seat_class, count(b.booking_id) booking_count
from bookings b
group by b.seat_class

-- Q38. Find all destination airports that have received more than 10 arriving flights. Use GROUP BY on destination_id and HAVING.

select f.destination_id, count(f.flight_id) arriving_flights
from flights f
group by f.destination_id
having count(f.flight_id) > 10

-- Q39. List airlines that have more than 5 aircrafts registered. Display airline_name and aircraft_count. Use GROUP BY and HAVING.

select a.airline_name, count(ac.aircraft_id) aircraft_count
from airlines a
inner join aircrafts ac
on a.airline_id = ac.airline_id
group by a.airline_id, a.airline_name
having count(ac.aircraft_id) > 5


-- Q40. Display the number of bookings made each month (from booking_date). Group by YEAR and MONTH and order chronologically.

select year(b.booking_date) booking_year,
       month(b.booking_date) booking_month,
       count(b.booking_id) booking_count
from bookings b
group by year(b.booking_date), month(b.booking_date)
order by booking_year, booking_month

-- Q41. Find passengers who have made more than 3 bookings. Display full_name and total_bookings, ordered by total_bookings descending.

select p.full_name, count(b.booking_id) total_bookings
from passengers p
inner join bookings b
on p.passenger_id = b.passenger_id
group by p.passenger_id, p.full_name
having count(b.booking_id) > 3
order by total_bookings desc

-- Q42. Group all flights by status and count how many flights exist in each status category. Display status and flight_count.

select f.status, count(f.flight_id) flight_count
from flights f
group by f.status


-- Q43. Find the average amount paid per seat_class across all bookings. Display seat_class and avg_amount. Round to 2 decimal places.

select b.seat_class,
       round(avg(b.amount_paid), 2) avg_amount
from bookings b
group by b.seat_class

-- Q44. List all routes (origin to destination) and how many flights operate on each route. Display origin airport code, destination airport code, and route_count. Show only routes with more than 2 flights.

select ao.airport_code origin_airport_code,
       ad.airport_code destination_airport_code,
       count(f.flight_id) route_count
from flights f
inner join airports ao
on f.origin_id = ao.airport_id
inner join airports ad
on f.destination_id = ad.airport_id
group by ao.airport_code, ad.airport_code
having count(f.flight_id) > 2

-- PART E: AGGREGATION FUNCTIONS

-- Q45. Find the highest, lowest, and average fare across all flights. Use MAX, MIN, and AVG in a single query. Use meaningful column aliases.

select max(f.fare) highest_fare,
       min(f.fare) lowest_fare,
       round(avg(f.fare), 2) average_fare
from flights f

-- Q46. Calculate the total revenue generated by each airline by joining flights, bookings, and airlines. Use SUM with GROUP BY.

select a.airline_name, sum(b.amount_paid) total_revenue
from airlines a
inner join flights f
on a.airline_id = f.airline_id
inner join bookings b
on f.flight_id = b.flight_id
group by a.airline_id, a.airline_name
order by total_revenue desc

-- Q47. Count the total number of confirmed bookings per passenger nationality. Join passengers and bookings. Use COUNT and GROUP BY.

select p.nationality, count(b.booking_id) confirmed_bookings
from passengers p
inner join bookings b
on p.passenger_id = b.passenger_id
where b.booking_status = 'Confirmed'
group by p.nationality


-- Q48. Find the passenger who has spent the most total amount across all their bookings. Use SUM, GROUP BY, ORDER BY, and LIMIT 1.

select top 1 p.full_name, sum(b.amount_paid) total_spent
from passengers p
inner join bookings b
on p.passenger_id = b.passenger_id
group by p.passenger_id, p.full_name
order by total_spent desc

-- Q49. Find the aircraft model that has been used for the most number of flights. Use COUNT with GROUP BY and ORDER BY. Join flights and aircrafts.

select top 1 ac.model aircraft_model,
       count(f.flight_id) flight_count
from aircrafts ac
inner join flights f
on ac.aircraft_id = f.aircraft_id
group by ac.aircraft_id, ac.model
order by flight_count desc


-- Q50. Write a comprehensive summary query displaying: airline_name, total_flights, total_passengers, total_revenue, avg_fare, and max_fare. Group by airline and order by total_revenue descending.

select a.airline_name,
       count(distinct f.flight_id) total_flights,
       count(distinct b.passenger_id) total_passengers,
       coalesce(sum(b.amount_paid), 0) total_revenue,
       round(avg(f.fare), 2) avg_fare,
       max(f.fare) max_fare
from airlines a
left join flights f
on a.airline_id = f.airline_id
left join bookings b
on f.flight_id = b.flight_id
group by a.airline_id, a.airline_name
order by total_revenue desc