-- use sql_challenge;

-- 1. Total Salary Per Employee
SELECT e.emp_id,
       e.emp_name,
       SUM(s.salary) AS total_salary
FROM cleaned_salaries s
JOIN cleaned_employees e
ON e.emp_id = s.emp_id
GROUP BY e.emp_id, e.emp_name;

-- 2. Average Salary Per Employee
SELECT e.emp_id,
       e.emp_name,
       AVG(s.salary) AS avg_salary
FROM cleaned_salaries s
JOIN cleaned_employees e
ON e.emp_id = s.emp_id
GROUP BY e.emp_id, e.emp_name;

-- 3. Count Salary Records For Each Employee
SELECT e.emp_id,
       e.emp_name,
       COUNT(*) AS salary_records
FROM cleaned_salaries s
JOIN cleaned_employees e
ON e.emp_id = s.emp_id
GROUP BY e.emp_id, e.emp_name;

-- 4. Maximum Salary Per Employee
SELECT e.emp_id,
       e.emp_name,
       MAX(s.salary) AS max_salary
FROM cleaned_salaries s
JOIN cleaned_employees e
ON e.emp_id = s.emp_id
GROUP BY e.emp_id, e.emp_name;

-- 5Minimum Salary Per Employee
SELECT e.emp_id,
       e.emp_name,
       MIN(s.salary) AS min_salary
FROM cleaned_salaries s
JOIN cleaned_employees e
ON e.emp_id = s.emp_id
GROUP BY e.emp_id, e.emp_name;