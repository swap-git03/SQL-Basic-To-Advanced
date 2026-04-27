USE clg;

-- Total per city
SELECT customers.city, SUM(orders.amount) AS total_amount
FROM customers
INNER JOIN orders
ON customers.id = orders.customer_id
GROUP BY customers.city;

-- Revenue > 15000
SELECT customers.city, SUM(orders.amount)
FROM customers
INNER JOIN orders
ON customers.id = orders.customer_id
GROUP BY customers.city
HAVING SUM(orders.amount) > 15000;

-- Revenue + order count
SELECT customers.city, SUM(orders.amount), COUNT(order_id)
FROM customers
INNER JOIN orders
ON customers.id = orders.customer_id
GROUP BY customers.city
HAVING SUM(orders.amount) > 15000 AND COUNT(order_id) > 2;