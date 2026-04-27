USE clg;

-- Above average orders
SELECT *
FROM orders
WHERE amount > (SELECT AVG(amount) FROM orders);

-- Highest order
SELECT *
FROM orders
WHERE amount = (SELECT MAX(amount) FROM orders);

-- Customers with orders
SELECT *
FROM customers
WHERE id IN (SELECT customer_id FROM orders);

-- Customers without orders
SELECT *
FROM customers
WHERE id NOT IN (SELECT customer_id FROM orders);

-- Correlated subquery
SELECT *
FROM orders o1
WHERE amount > (
    SELECT AVG(amount)
    FROM orders o2
    WHERE o2.customer_id = o1.customer_id
);