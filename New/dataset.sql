create database bda;
use bda;
-- =============================
-- IMPORTANT (run first)
-- =============================
SET SESSION cte_max_recursion_depth = 30000;

DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS deliveries;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS restaurants;
DROP TABLE IF EXISTS drivers;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    signup_date DATE
);

CREATE TABLE drivers (
    driver_id INT PRIMARY KEY,
    name VARCHAR(50),
    vehicle_type VARCHAR(20),
    rating DECIMAL(2,1)
);

CREATE TABLE restaurants (
    restaurant_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    rating DECIMAL(2,1)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    restaurant_id INT,
    order_time DATETIME,
    delivery_time DATETIME,
    order_amount DECIMAL(10,2),
    status VARCHAR(20)
);

CREATE TABLE deliveries (
    delivery_id INT PRIMARY KEY,
    order_id INT,
    driver_id INT,
    pickup_time DATETIME,
    drop_time DATETIME,
    distance_km DECIMAL(5,2)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    method VARCHAR(20),
    status VARCHAR(20),
    payment_time DATETIME
);

-- =============================
-- USERS (5000)
-- =============================
INSERT INTO users
WITH RECURSIVE nums AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM nums WHERE n < 5000
)
SELECT 
  n,
  IF(RAND() < 0.05, NULL, CONCAT('User_', n)),
  ELT(FLOOR(1 + RAND()*5), 'Mumbai','Pune','Delhi','Bangalore','Hyderabad'),
  IF(RAND() < 0.1, NULL, DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND()*1000) DAY))
FROM nums;

-- =============================
-- DRIVERS (1000)
-- =============================
INSERT INTO drivers
WITH RECURSIVE nums AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM nums WHERE n < 1000
)
SELECT 
  n,
  CONCAT('Driver_', n),
  ELT(FLOOR(1 + RAND()*3), 'Bike','Car','Scooter'),
  IF(RAND() < 0.15, NULL, ROUND(RAND()*5,1))
FROM nums;

-- =============================
-- RESTAURANTS (1000)
-- =============================
INSERT INTO restaurants
WITH RECURSIVE nums AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM nums WHERE n < 1000
)
SELECT 
  n,
  CONCAT('Restaurant_', n),
  ELT(FLOOR(1 + RAND()*5), 'Mumbai','Pune','Delhi','Bangalore','Hyderabad'),
  IF(RAND() < 0.1, NULL, ROUND(RAND()*5,1))
FROM nums;

-- =============================
-- ORDERS (20000)
-- =============================
INSERT INTO orders
WITH RECURSIVE nums AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM nums WHERE n < 20000
)
SELECT 
  n,
  FLOOR(1 + RAND()*5000),
  FLOOR(1 + RAND()*1000),
  DATE_SUB(NOW(), INTERVAL FLOOR(RAND()*1000) MINUTE),
  IF(RAND() < 0.2, NULL, DATE_ADD(NOW(), INTERVAL FLOOR(RAND()*60) MINUTE)),
  IF(RAND() < 0.05, NULL, ROUND(RAND()*1000,2)),
  ELT(FLOOR(1 + RAND()*3), 'Delivered','Cancelled','Pending')
FROM nums;

-- =============================
-- DELIVERIES (20000)
-- =============================
INSERT INTO deliveries
WITH RECURSIVE nums AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM nums WHERE n < 20000
)
SELECT 
  n,
  n,
  FLOOR(1 + RAND()*1000),
  IF(RAND() < 0.1, NULL, DATE_SUB(NOW(), INTERVAL FLOOR(RAND()*500) MINUTE)),
  IF(RAND() < 0.2, NULL, NOW()),
  IF(RAND() < 0.1, NULL, ROUND(RAND()*20,2))
FROM nums;

-- =============================
-- PAYMENTS (20000)
-- =============================
INSERT INTO payments
WITH RECURSIVE nums AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM nums WHERE n < 20000
)
SELECT 
  n,
  n,
  ELT(FLOOR(1 + RAND()*3), 'UPI','Card','Cash'),
  IF(RAND() < 0.1, NULL, ELT(FLOOR(1 + RAND()*2), 'Success','Failed')),
  IF(RAND() < 0.15, NULL, NOW())
FROM nums;

-- =============================
-- TEST
-- =============================
SELECT COUNT(*) AS users_count FROM users;
SELECT COUNT(*) AS orders_count FROM orders;
SELECT * FROM orders WHERE delivery_time IS NULL LIMIT 5;