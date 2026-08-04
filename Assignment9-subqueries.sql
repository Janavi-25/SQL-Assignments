-- 03aug2026
--subqueries assignment

create table product
(pid int,
pname varchar(20),
city varchar(20),
quantity int,
salesunit int)

insert into product values
(1, 'Laptop','Vadodara', 40, 15),
(2, 'Mouse','Mumbai', 25, 8),
(3, 'Keyboard','Vadodara', 10, 5),
(4, 'Monitor','Pune', 30, 12),
(5, 'Printer','Rajkot', 35, 10),
(6, 'Smartphone','Mumbai', 50, 20),
(7, 'Tablet', 'Rajkot', 15, 9),
(8, 'Speaker','Mumbai', 0, 6),
(9, 'Laptop','Ahmedabad',45, 18),
(10,'Camera','Pune',20, 11),
(11,'Mouse','Surat',18, 7),
(12,'Keyboard','Ahmedabad',22, 8),
(13,'Monitor','Surat', 28, 9),
(14,'Printer','Vadodara', 12, 4),
(15,'Speaker', 'Mumbai',  0, 3)

select * from product

-- (Single Value Subqueries)

-- 1. Find all products that have a Quantity greater than the average quantity of all products.

select pid,pname,quantity from product
where quantity > 
(select avg(quantity) as avg_quantity from product)

-- 2. Display the ProductName of products sold in the same city as 'Laptop'.

select pname from product
where city in 
(select city from product where pname = 'Laptop')


-- 3. Find the details of the products with the maximum Quantity.

select * from product
where quantity = 
(select max(quantity) as max_quantity from product)


-- 4. List products whose SalesUnit is higher than the SalesUnit of ProductID 5.

select pname from product
where salesunit > 
(select salesunit from product
where pid = 5)

-- 5. Find products that have a lower Quantity than the minimum Quantity found in 'Vadodara'.

select * from product
where quantity < 
(select min(quantity) as minimum_quantity from product
where city = 'Vadodara')

-- 6. Display products whose SalesUnit is greater than the average SalesUnit of products in 'Mumbai'.

select * from product
where salesunit >
(select avg(salesunit) avg_salesunit from product where city = 'Mumbai')


-- 7. Find the ProductName with the lowest SalesUnit.

select pname from product
where salesunit =
(select min(salesunit) as lowest_salesunit from product)

-- 8. List all products sold in cities that have more than 50 total Quantity across all their products.

select * from product
where city in (
select city 
from product 
group by city 
having sum(quantity) > 50)

-- 9. Show products whose Quantity is exactly equal to the SalesUnit of 'Smartphone'.

select pname from product
where quantity =
(select salesunit from product 
where pname = 'smartphone')


-- 10. Find the city which has the product with the highest SalesUnit.

select city from product
where salesunit = 
(select max(salesunit)  from product)


-- 11. Find all products sold in cities where at least one product has a Quantity of zero.

select * from product
where city in
(select city from product
where quantity = 0)

-- 12. List products whose SalesUnit is greater than the SalesUnit of all products in 'Surat'.

select * from product
where salesunit > all
(select salesunit from product 
where city = 'Surat')

-- 13. Find products that belong to cities where the average SalesUnit is greater than 10.

select * from product
where city in
(select city from product
group by city
having avg(salesunit) > 10)

-- 14. Display products that have a Quantity greater than any product's Quantity in 'Pune'.

select * from product
where quantity > ANY
(select quantity from product 
where city = 'Pune')

-- 15. Find all products whose ProductName is the same as any product sold in 'Ahmedabad'.

select * from product
where pname = any
(select pname from product 
where city = 'Ahmedabad')

-- 16. Select products where the Quantity is greater than the average Quantity of their own city.

Select * from Product P1
Where Quantity > 
(
Select AVG(Quantity) as AvgQuantity from Product P2
Where P1.City = P2.City
group by City
)

-- 17. Find cities where the total SalesUnit is higher than the total SalesUnit of 'Vadodara'.

select city from product
group by city
having sum(salesunit) >
(select sum(salesunit) from product
where city = 'Vadodara') 

-- 18. List products that are sold in the city that has the maximum variety (count) of products.

select * from product
where city =
(select top 1 city  from product
group by city
order by count(*) desc)


-- 19. Find the second highest Quantity from the Product table using a subquery.

select * from product
where quantity = 
(select max(quantity) from product
where quantity < 
(select max(quantity) from product))

-- 20. Display the ProductName and a calculated column showing
-- the difference between its Quantity and the global average Quantity.

select pname , quantity - 
(select avg(quantity)  from product) as difference from product
