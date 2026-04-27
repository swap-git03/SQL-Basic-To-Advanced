USE clg;

-- Count orders per customer
SELECT customer_id, COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id;

-- Total amount
SELECT customer_id, SUM(amount) AS total_amount
FROM orders
GROUP BY customer_id;

-- Highest order
SELECT customer_id, MAX(amount) AS highest_order
FROM orders
GROUP BY customer_id;

-- Lowest order
SELECT customer_id, MIN(amount) AS lowest_order
FROM orders
GROUP BY customer_id;