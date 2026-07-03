-- USE sql_challenge;
-- 1. latest salary per employee along with total salary till that point

select * from
(select emp_id, salary, salary_date,

row_number() over (PARTITION BY emp_id order by salary_date desc) as

rnk,

sum(salary) over ( PARTITION BY emp_id order by salary_date)

running_total

from cleaned_salaries ) t

where rnk=1;

-- 2. Rank employees based on salary and compare with department average
USE sql_challenge;

SELECT
    e.emp_id,
    e.emp_name,
    e.dept_id,
    s.salary,

    DENSE_RANK() OVER (
        PARTITION BY e.dept_id
        ORDER BY s.salary DESC
    ) AS salary_rank,

    AVG(s.salary) OVER (
        PARTITION BY e.dept_id
    ) AS dept_avg_salary,

    CASE
        WHEN s.salary > AVG(s.salary) OVER (PARTITION BY e.dept_id)
            THEN 'Above Department Average'
        WHEN s.salary < AVG(s.salary) OVER (PARTITION BY e.dept_id)
            THEN 'Below Department Average'
        ELSE 'Equal to Department Average'
    END AS salary_comparison

FROM cleaned_employees e
JOIN cleaned_salaries s
ON e.emp_id = s.emp_id;

-- 3. Check whether salary increased or decreased compared to previous salary
USE sql_challenge;

SELECT
    emp_id,
    salary,
    salary_date,

    LAG(salary) OVER (
        PARTITION BY emp_id
        ORDER BY salary_date
    ) AS previous_salary,

    CASE
        WHEN salary > LAG(salary) OVER (
            PARTITION BY emp_id
            ORDER BY salary_date
        ) THEN 'Increased'

        WHEN salary < LAG(salary) OVER (
            PARTITION BY emp_id
            ORDER BY salary_date
        ) THEN 'Decreased'

        ELSE 'No Change'
    END AS salary_status

FROM cleaned_salaries;