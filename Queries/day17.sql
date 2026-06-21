-- use sql_challenge;

-- 1: Employees with more than 2 salary records
SELECT emp_id,
COUNT(*) AS total_records
FROM cleaned_salaries
GROUP BY emp_id
HAVING COUNT(*) > 2;

-- 2: List Departments With More Than 3 Employees
SELECT dept_id,
    COUNT(emp_id) AS total_employees
FROM cleaned_employees
GROUP BY dept_id
HAVING COUNT(emp_id) > 3;


-- List employees with total salary greater than 100000
SELECT e.emp_id,e.emp_name,
SUM(s.salary) AS total_salary
FROM cleaned_employees e
JOIN cleaned_salaries s
ON e.emp_id = s.emp_id
GROUP BY e.emp_id, e.emp_name
HAVING SUM(s.salary) > 100000;

-- List departments with high average salary (greater than 50000)
SELECT e.dept_id,
AVG(s.salary) AS avg_salary
FROM cleaned_employees e
JOIN cleaned_salaries s
ON e.emp_id = s.emp_id
GROUP BY e.dept_id
HAVING AVG(s.salary) > 50000;