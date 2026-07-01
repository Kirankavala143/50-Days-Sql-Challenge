-- USE sql_challenge;

-- 1. compare each employee's salary with overall average salary ( > avh abovr avg, < avg -- below avg)

select emp_id, salary,

avg(salary) over() as overall_avg_salary,

CASE
when salary > avg(salary) over() then 'Above avg'
when salary < avg(salary) over() then 'Below avg'
else 'euqal'
end as comparison

from cleaned_salaries;

-- 2. compare employee salary with total salary of all employees ( sum(salary)*10% - high conributor )

select emp_id, salary, sum(salary) over() as total_salary,

case
when salary > sum(salary) over()*0.1 then ' high contributor'
else 'low contributor'
end as contibution

from cleaned_salaries;

-- 3. compare department total salary with overall total (dept total salary > 30% of total salary ---- high dept,< 30% of total)
SELECT
    e.emp_id,
    e.dept_id,
    s.salary,

    SUM(s.salary) OVER(PARTITION BY e.dept_id) AS dept_total_salary,

    SUM(s.salary) OVER() AS overall_total_salary,

    CASE
        WHEN SUM(s.salary) OVER(PARTITION BY e.dept_id)
             > SUM(s.salary) OVER() * 0.30
        THEN 'High Dept'
        ELSE 'Low Dept'
    END AS department_status

FROM cleaned_employees e
JOIN cleaned_salaries s
ON e.emp_id = s.emp_id;