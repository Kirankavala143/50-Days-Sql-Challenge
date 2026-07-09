USE sql_challenge;

-- 1. Analyze Query Before Applying Index
EXPLAIN ANALYZE
SELECT
    e.emp_name,
    s.salary
FROM cleaned_employees e
JOIN cleaned_salaries s
ON e.emp_id = s.emp_id;


-- 2. Apply Index and Analyze Again
-- Create indexes
CREATE INDEX idx_emp_emp
ON cleaned_employees(emp_id);

CREATE INDEX idx_emp_sal
ON cleaned_salaries(emp_id);

-- Analyze again
EXPLAIN ANALYZE
SELECT
    e.emp_name,
    s.salary
FROM cleaned_employees e
JOIN cleaned_salaries s
ON e.emp_id = s.emp_id;

-- 3. Analyze Query for Employee ID 101
EXPLAIN ANALYZE
SELECT *
FROM cleaned_salaries
WHERE emp_id = 101;