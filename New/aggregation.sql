-- DAY 2
use bda;
show tables;
-- Count total number of users
Select COUNT(*) From users;

-- Count number of orders where status = 'Delivered'
Select Count(*) from orders
where status = 'Delivered';

-- Find total revenue (sum of order_amount) from all orders
Select Sum(order_amount) from orders;

-- Find total revenue per status (Delivered, Cancelled, etc.)
Select Sum(order_amount), status from orders
Group BY Status;

-- Find statuses where total revenue is greater than 5000
Select Sum(order_amount), status from orders
Group by status
Having Sum(order_amount) > 5000;

-- Find total number of orders per user_id
-- Show only users who have placed more than 5 orders
Select Count(order_id), user_id from orders
Group BY user_id
Having Count(order_id) > 5;


-- Find average order_amount per status
-- Only include statuses where average order_amount > 300
Select avg(order_amount), status from orders
GRoup by Status
Having avg(order_amount) > 300;



-- Find top 3 users who have placed the highest number of orders
Select count(order_id), user_id from orders
Group BY (user_id) 
ORDER BY count(order_id) Desc
LIMIT 3;


-- Find number of orders per day (based on order_time)
SELECT DATE(order_time), COUNT(order_id)
FROM orders
GROUP BY DATE(order_time);