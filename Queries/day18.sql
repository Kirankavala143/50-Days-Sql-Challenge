-- use sql_challenge;

-- 1. Employees whose average performance rating > 4
SELECT
    e.emp_name,
    e.emp_id,
    d.dept_name,
    (p.rating_2022 + p.rating_2023 + p.rating_2024) / 3 AS avg_rating
FROM cleaned_employees e
JOIN cleaned_departments d
    ON e.dept_id = d.dept_id
JOIN cleaned_performance p
    ON e.emp_id = p.emp_id
WHERE (p.rating_2022 + p.rating_2023 + p.rating_2024) / 3 > 4;

-- 2. Employees with more than 10 present days
SELECT
    e.emp_id,
    e.emp_name,
    COUNT(a.attendance_id) AS present_days
FROM cleaned_employees e
JOIN cleaned_attendance a
    ON e.emp_id = a.emp_id
WHERE a.status = 'Present'
GROUP BY e.emp_id, e.emp_name
HAVING COUNT(a.attendance_id) > 10;

-- 3. Departments where total salary paid > 200000
SELECT
    d.dept_name,
    SUM(s.salary) AS total_salary
FROM cleaned_departments d
JOIN cleaned_employees e
    ON d.dept_id = e.dept_id
JOIN cleaned_salaries s
    ON e.emp_id = s.emp_id
GROUP BY d.dept_name
HAVING SUM(s.salary) > 200000;

-- 4. Employees whose total salary is greater than department average salary
SELECT
    e.emp_id,
    e.emp_name,
    s.salary,
    d.dept_name
FROM cleaned_employees e
JOIN cleaned_salaries s
    ON e.emp_id = s.emp_id
JOIN cleaned_departments d
    ON e.dept_id = d.dept_id
WHERE s.salary >
(
    SELECT AVG(s2.salary)
    FROM cleaned_employees e2
    JOIN cleaned_salaries s2
        ON e2.emp_id = s2.emp_id
    WHERE e2.dept_id = e.dept_id
);