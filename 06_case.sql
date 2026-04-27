USE clg;

-- Order classification
SELECT amount,
CASE
    WHEN amount > 7000 THEN 'HIGH'
    WHEN amount > 4000 THEN 'MEDIUM'
    ELSE 'LOW'
END AS category
FROM orders;

-- Customer classification
SELECT customers.name, SUM(orders.amount),
CASE
    WHEN SUM(orders.amount) > 20000 THEN 'VIP'
    WHEN SUM(orders.amount) > 10000 THEN 'REGULAR'
    ELSE 'LOW'
END AS category
FROM customers
INNER JOIN orders
ON customers.id = orders.customer_id
GROUP BY customers.name;