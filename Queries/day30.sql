-- USE sql_challenge;

-- 1. create a temp table of salaries and use it .

with salary_cte as
( select emp_id, salary
from cleaned_salaries)

select * from salary_cte
where emp_id= 62;

-- 2. combine employees ans salaries using cte

with emp_salary AS
(select e.emp_id, e.dept_id, s.salary
from cleaned_employees e
join cleaned_salaries s
on e.emp_id = s.emp_id)

select *
from emp_salary
where dept_id= 3;

-- 3. calculate department avg salary

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

SELECT *
FROM dept_avg;

-- 4. Find Employees Earning More Than Department Average


WITH emp_salary AS
(
    SELECT
        e.emp_id,
        e.emp_name,
        e.dept_id,
        s.salary
    FROM cleaned_employees e
    JOIN cleaned_salaries s
    ON e.emp_id = s.emp_id
),

dept_avg AS
(
    SELECT
        dept_id,
        AVG(salary) AS avg_salary
    FROM emp_salary
    GROUP BY dept_id
)

SELECT
    e.emp_id,
    e.emp_name,
    e.dept_id,
    e.salary,
    d.avg_salary
FROM emp_salary e
JOIN dept_avg d
ON e.dept_id = d.dept_id
WHERE e.salary > d.avg_salary;