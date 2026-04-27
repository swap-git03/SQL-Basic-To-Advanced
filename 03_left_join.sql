USE clg;

-- All employees (including NULL dept)
SELECT emp.name, dept.name
FROM emp
LEFT JOIN dept
ON emp.dept_id = dept.id;

-- Employees without department
SELECT emp.name, dept.name
FROM emp
LEFT JOIN dept
ON emp.dept_id = dept.id
WHERE dept.id IS NULL;

-- Sorted
SELECT emp.name, dept.name
FROM emp
LEFT JOIN dept
ON emp.dept_id = dept.id
ORDER BY emp.name ASC;

-- Only A names
SELECT emp.name, dept.name
FROM emp
LEFT JOIN dept
ON emp.dept_id = dept.id
WHERE emp.name LIKE 'A%';

-- Only with department
SELECT emp.name, dept.name
FROM emp
LEFT JOIN dept
ON emp.dept_id = dept.id
WHERE dept.id IS NOT NULL;

-- Not HR + include NULL
SELECT emp.name, dept.name
FROM emp
LEFT JOIN dept
ON emp.dept_id = dept.id
WHERE dept.name != 'HR' OR dept.name IS NULL;

-- HR OR NULL
SELECT emp.name, dept.name
FROM emp
LEFT JOIN dept
ON emp.dept_id = dept.id
WHERE dept.name = 'HR' OR dept.name IS NULL;