-- USE sql_challenge;
-- 1. Salary Running Total (Cumulative Salary)
SELECT
    emp_id,
    salary,
    salary_date,

    SUM(salary) OVER(
        PARTITION BY emp_id
        ORDER BY salary_date
    ) AS running_salary

FROM cleaned_salaries;

-- 2. Attendance Running Count (Total Attendance Over Time)
SELECT
    emp_id,
    attendance_date,
    status,

    COUNT(*) OVER(
        PARTITION BY emp_id
        ORDER BY attendance_date
    ) AS attendance_count

FROM cleaned_attendance;

-- 3. Department Cumulative Salary
USE sql_challenge;

SELECT
    d.dept_id,
    d.dept_name,
    e.emp_id,
    s.salary,
    s.salary_date,

    SUM(s.salary) OVER (
        PARTITION BY d.dept_id
        ORDER BY s.salary_date
    ) AS cumulative_department_salary

FROM cleaned_salaries s
JOIN cleaned_employees e
    ON s.emp_id = e.emp_id
JOIN cleaned_departments d
    ON e.dept_id = d.dept_id

ORDER BY
    d.dept_id,
    s.salary_date;