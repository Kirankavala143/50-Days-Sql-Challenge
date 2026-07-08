-- USE sql_challenge;

-- ==========================================
-- Query 1: Create Index on emp_id
-- ==========================================

DROP INDEX idx_emp_id ON cleaned_employees;

CREATE INDEX idx_emp_id
ON cleaned_employees(emp_id);

SELECT *
FROM cleaned_employees
WHERE emp_id = 101;


-- ==========================================
-- Query 2: Create Index on dept_id
-- ==========================================

DROP INDEX idx_dept_id ON cleaned_employees;

CREATE INDEX idx_dept_id
ON cleaned_employees(dept_id);

SELECT *
FROM cleaned_employees
WHERE dept_id = 5;


-- ==========================================
-- Query 3: Create Composite Index
-- (emp_id, salary_date)
-- ==========================================

DROP INDEX idx_emp_salary_date
ON cleaned_salaries;

CREATE INDEX idx_emp_salary_date
ON cleaned_salaries(emp_id, salary_date);

SELECT *
FROM cleaned_salaries
WHERE emp_id = 101
AND salary_date = '2024-01-01';


-- ==========================================
-- Query 4: Show All Indexes
-- ==========================================

SHOW INDEX
FROM cleaned_employees;

SHOW INDEX
FROM cleaned_salaries;