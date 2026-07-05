-- USE sql_challenge;

-- 1 . employees whose otal sal >100000
-- a. total sal per emp ... b. > 100000

with total_sal as
(select emp_id, sum(salary) as total_sal
from cleaned_salaries
group by emp_id),

high_earners as
( select * from total_sal where total_sal>100000)

select * from high_earners;

-- 2. Show Employee Salary Along with Department Average Salary
USE sql_challenge;

WITH dept_avg AS
(
    SELECT
        e.dept_id,
        AVG(s.salary) AS avg_salary
    FROM cleaned_employees e
    JOIN cleaned_salaries s
    ON e.emp_id = s.emp_id
    GROUP BY e.dept_id
)

SELECT
    e.emp_id,
    e.emp_name,
    e.dept_id,
    s.salary,
    d.avg_salary
FROM cleaned_employees e
JOIN cleaned_salaries s
ON e.emp_id = s.emp_id
JOIN dept_avg d
ON e.dept_id = d.dept_id;

-- 3. Department with Highest Total Salary
USE sql_challenge;

WITH dept_total AS
(
    SELECT
        e.dept_id,
        SUM(s.salary) AS total_salary
    FROM cleaned_employees e
    JOIN cleaned_salaries s
    ON e.emp_id = s.emp_id
    GROUP BY e.dept_id
)

SELECT *
FROM dept_total
WHERE total_salary =
(
    SELECT MAX(total_salary)
    FROM dept_total
);