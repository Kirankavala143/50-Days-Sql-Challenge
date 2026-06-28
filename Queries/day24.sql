-- USE sql_challenge;

-- 1 current and next slary
select emp_id, salary, salary_date,

lead(salary) over (PARTITION BY emp_id order by salary_date)
as next_salary
from cleaned_salaries;

-- 2. Growth Analysis (Compare Current Salary with Next Salary)
SELECT
    emp_id,
    salary,
    salary_date,

    LEAD(salary) OVER(
        PARTITION BY emp_id
        ORDER BY salary_date
    ) AS next_salary,

    LEAD(salary) OVER(
        PARTITION BY emp_id
        ORDER BY salary_date
    ) - salary AS salary_growth

FROM cleaned_salaries;

-- 3. Trend Prediction (Today's Attendance vs Next Day)
SELECT
    emp_id,
    attendance_date,
    status,

    LEAD(status) OVER (
        PARTITION BY emp_id
        ORDER BY attendance_date
    ) AS next_status

FROM cleaned_attendance;