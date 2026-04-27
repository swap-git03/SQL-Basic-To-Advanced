USE clg;

-- View all students
SELECT * FROM student;

-- Filter students
SELECT *
FROM student
WHERE id > 1;

-- Delete example
DELETE FROM student
WHERE id = 3;

-- Employee basic queries
SELECT name FROM emp;

SELECT *
FROM emp
WHERE dept_id = 1;

SELECT *
FROM emp
WHERE name LIKE 'A%';

SELECT *
FROM emp
ORDER BY name ASC;

SELECT *
FROM emp
WHERE dept_id = 1 OR dept_id = 2;

SELECT *
FROM emp
WHERE dept_id != 1;

SELECT *
FROM emp
WHERE name LIKE '%a%';