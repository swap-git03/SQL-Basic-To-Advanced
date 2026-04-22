-- Reset database
DROP DATABASE IF EXISTS clg;
CREATE DATABASE clg;
USE clg;

-- ========================
-- STUDENT TABLE
-- ========================
CREATE TABLE student (
    id INT PRIMARY KEY,
    name VARCHAR(12),
    percentile FLOAT,
    email VARCHAR(30)
);

INSERT INTO student VALUES
(1, 'swap', 98.23, 'swap@gmail.com'),
(2, 'raj', 85.50, 'raj@gmail.com'),
(3, 'neha', 91.20, 'neha@gmail.com');

-- ========================
-- DEPARTMENT
-- ========================
CREATE TABLE dept (
    id INT PRIMARY KEY,
    name VARCHAR(20)
);

INSERT INTO dept VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');

-- ========================
-- EMPLOYEE
-- ========================
CREATE TABLE emp (
    id INT PRIMARY KEY,
    name VARCHAR(20),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES dept(id)
);

INSERT INTO emp VALUES
(1, 'Amit', 1),
(2, 'Neha', 2),
(3, 'Ravi', 1),
(4, 'Karan', 3),
(5, 'Pooja', NULL),
(6, 'Anjali', 2),
(7, 'Arjun', 1);

-- ========================
-- CUSTOMERS
-- ========================
CREATE TABLE customers (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(20)
);

INSERT INTO customers VALUES
(1, 'Rahul', 'Mumbai'),
(2, 'Sneha', 'Pune'),
(3, 'Amit', 'Mumbai'),
(4, 'Priya', 'Delhi'),
(5, 'Karan', 'Pune');

-- ========================
-- ORDERS
-- ========================
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

INSERT INTO orders VALUES
(101, 1, 5000, '2025-01-10'),
(102, 1, 8000, '2025-01-15'),
(103, 2, 12000, '2025-02-10'),
(104, 3, 7000, '2025-02-15'),
(105, 3, 9000, '2025-03-01'),
(106, 4, 3000, '2025-03-10'),
(107, 1, 10000, '2025-03-15'),
(108, 2, 6000, '2025-03-20'),
(109, 5, 4000, '2025-03-25');