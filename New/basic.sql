use bda;
show tables;

-- Get all users from Mumbai
select * from users where city = 'Mumbai';

-- Get all orders where:
-- order_amount > 500
-- AND status = 'Delivered'

Select * from orders
where order_amount > 500 and status = 'Delivered';

-- Find orders where delivery_time is NULL
Select * from orders
where delivery_time is Null;

-- Get top 5 highest order_amount orders
Select * from orders
ORDER BY order_amount DESC LIMIT 5;

-- Find users whose name is NULL
SELECT * from users
Where name is NULL;


-- Get users from Mumbai, Pune, or Delhi
Select * from users 
Where city in('Mumbai', 'Pune', 'Delhi');

-- Get orders where order_amount is between 200 and 800
Select * from orders
where order_amount Between 200 and 800;

-- Find users whose name starts with 'User_1'
Select * from users
WHere name like 'User\_1%';

-- Get orders that are NOT Cancelled
SELECT * from orders
where status NOT IN ('Cancelled');

-- Find users whose name contains '5'
SELECT * FROM users
WHERE name LIKE '%5%';