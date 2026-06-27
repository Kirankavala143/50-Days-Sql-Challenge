-- use sql_challenge;

-- 1. Show current salary along with previous salary for each employee
SELECT
    emp_id,
    salary,
    salary_date,
    LAG(salary) OVER(
        PARTITION BY emp_id
        ORDER BY salary_date
    ) AS prev_salary
FROM cleaned_salaries;

-- 2. Calculate difference between current salary and previous salary
SELECT
    emp_id,
    salary,
    salary_date,
    LAG(salary) OVER(
        PARTITION BY emp_id
        ORDER BY salary_date
    ) AS prev_salary,

    salary -
    LAG(salary) OVER(
        PARTITION BY emp_id
        ORDER BY salary_date
    ) AS salary_difference

FROM cleaned_salaries;

-- 3. Analyze attendance trend (Current status vs Previous status)
SELECT
    emp_id,
    attendance_date,
    status,

    LAG(status) OVER(
        PARTITION BY emp_id
        ORDER BY attendance_date
    ) AS previous_status

FROM cleaned_attendance;




