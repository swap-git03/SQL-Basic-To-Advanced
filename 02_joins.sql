USE clg;

-- Basic INNER JOIN
SELECT emp.name, dept.name
FROM emp
INNER JOIN dept
ON emp.dept_id = dept.id;

-- With dept_id
SELECT emp.name, emp.dept_id, dept.name
FROM emp
INNER JOIN dept
ON emp.dept_id = dept.id;

-- Only HR employees
SELECT emp.name, dept.name
FROM emp
INNER JOIN dept
ON emp.dept_id = dept.id
WHERE dept.name = 'HR';

-- Sorted employees
SELECT emp.name, dept.name
FROM emp
INNER JOIN dept
ON emp.dept_id = dept.id
ORDER BY emp.name ASC;

-- Name starts with A
SELECT emp.name, dept.name
FROM emp
INNER JOIN dept
ON emp.dept_id = dept.id
WHERE emp.name LIKE 'A%';

-- Sort by department
SELECT emp.name, dept.name
FROM emp
INNER JOIN dept
ON emp.dept_id = dept.id
ORDER BY dept.name ASC;

-- Dept 1 or 2
SELECT emp.name, dept.name
FROM emp
INNER JOIN dept
ON emp.dept_id = dept.id
WHERE dept.id = 1 OR dept.id = 2;

-- Combined condition
SELECT emp.name, dept.name
FROM emp
INNER JOIN dept
ON emp.dept_id = dept.id
WHERE emp.name LIKE '%a%' AND dept.id = 1;

-- Exclude IT
SELECT emp.name, dept.name
FROM emp
INNER JOIN dept
ON emp.dept_id = dept.id
WHERE dept.id != 2;