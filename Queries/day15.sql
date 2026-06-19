-- use sql_challenge;

-- 1: Employees With Salary Records
SELECT e.emp_id,e.emp_name
FROM cleaned_employees e
WHERE EXISTS
(
SELECT 1
FROM cleaned_salaries s
WHERE s.emp_id = e.emp_id
);

-- 2: Employees Without Salary Records
SELECT e.emp_id,e.emp_name
FROM cleaned_employees e
WHERE NOT EXISTS
(
SELECT 1
FROM cleaned_salaries s
WHERE s.emp_id = e.emp_id
);

-- 3: Employees With Attendance Records
SELECT e.emp_id,e.emp_name
FROM cleaned_employees e
WHERE EXISTS
(
SELECT 1
FROM cleaned_attendance a
WHERE a.emp_id = e.emp_id
);

-- 4: Employees Without Attendance Records
SELECT e.emp_id,e.emp_name
FROM cleaned_employees e
WHERE NOT EXISTS
(
SELECT 1
FROM cleaned_attendance a
WHERE a.emp_id = e.emp_id
);