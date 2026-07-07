-- USE sql_challenge;

-- ==========================================
-- 1. Update Employee Data Using a View
-- ==========================================

DROP VIEW IF EXISTS emp_basic;

CREATE VIEW emp_basic AS
SELECT emp_id, emp_name, city
FROM cleaned_employees;

-- Check employee
SELECT *
FROM emp_basic
WHERE emp_id = 110;

-- Update through the view
UPDATE emp_basic
SET city = 'Mumbai'
WHERE emp_id = 110;

-- Verify update
SELECT *
FROM emp_basic
WHERE emp_id = 110;


-- ==========================================
-- 2. High Salary View
-- ==========================================

DROP VIEW IF EXISTS high_salary_view;

CREATE VIEW high_salary_view AS
SELECT emp_id, salary, salary_date
FROM cleaned_salaries
WHERE salary > 50000;

SELECT *
FROM high_salary_view;


-- ==========================================
-- 3. Employee + Department + Salary View
-- ==========================================

DROP VIEW IF EXISTS emp_dept_salary_view;

CREATE VIEW emp_dept_salary_view AS
SELECT
    e.emp_id,
    e.emp_name,
    d.dept_name,
    s.salary,
    s.salary_date
FROM cleaned_employees e
JOIN cleaned_departments d
ON e.dept_id = d.dept_id
JOIN cleaned_salaries s
ON e.emp_id = s.emp_id;

SELECT *
FROM emp_dept_salary_view;


-- ==========================================
-- 4. HR Dashboard View
-- ==========================================

DROP VIEW IF EXISTS hr_dashboard;

CREATE VIEW hr_dashboard AS
SELECT
    e.emp_id,
    e.emp_name,
    d.dept_name,
    s.salary
FROM cleaned_employees e
JOIN cleaned_departments d
ON e.dept_id = d.dept_id
JOIN cleaned_salaries s
ON e.emp_id = s.emp_id
WHERE s.salary > 50000;

SELECT *
FROM hr_dashboard;