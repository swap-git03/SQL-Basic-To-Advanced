USE clg;

-- =========================================
-- 1. BASIC CTE (your original)
-- =========================================
WITH all_orders AS (
    SELECT * FROM orders
)
SELECT * FROM all_orders;

-- =========================================
-- 2. FILTER USING CTE (cleaner logic)
-- =========================================
WITH avg_table AS (
    SELECT AVG(amount) AS avg_val
    FROM orders
)
SELECT *
FROM orders
WHERE amount < (SELECT avg_val FROM avg_table);

-- =========================================
-- 3. TOTAL SPENDING PER CUSTOMER USING CTE
-- =========================================
WITH customer_total AS (
    SELECT customer_id, SUM(amount) AS total_spent
    FROM orders
    GROUP BY customer_id
)
SELECT *
FROM customer_total
WHERE total_spent > 15000;

-- =========================================
-- 4. JOIN + CTE (real interview pattern)
-- =========================================
WITH city_revenue AS (
    SELECT customers.city, SUM(orders.amount) AS total_revenue
    FROM customers
    INNER JOIN orders
    ON customers.id = orders.customer_id
    GROUP BY customers.city
)
SELECT *
FROM city_revenue
WHERE total_revenue > 15000;