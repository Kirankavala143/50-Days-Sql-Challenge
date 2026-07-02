-- USE sql_challenge;

-- 1 top 2 employees per department (top 2 highest paid emp in each dept)

SELECT *
from
(
select e.emp_id, e.dept_id, s.salary,
DENSE_RANK() over (PARTITION BY e.dept_id order by s.salary desc)
as
rnk
from cleaned_employees e
join cleaned_salaries s
on e.emp_id= s.emp_id
) t

where rnk <= 2;

-- 2. Salary Gap (Difference Between Current Salary and Previous Salary)

SELECT
    emp_id,
    salary,
    salary_date,

    LAG(salary) OVER (
        PARTITION BY emp_id
        ORDER BY salary_date
    ) AS prev_salary,

    salary - LAG(salary) OVER (
        PARTITION BY emp_id
        ORDER BY salary_date
    ) AS salary_gap

FROM cleaned_salaries;

-- 3 performance gap (change in performance between years)
SELECT
    emp_id,
    rating_2022,
    rating_2023,
    rating_2024,

    rating_2023 - rating_2022 AS gap_2023,

    rating_2024 - rating_2023 AS gap_2024

FROM cleaned_performance;
-- 4. Rank Filtering (Top Performers Only)

SELECT *
FROM
(
    SELECT
        e.emp_id,
        e.dept_id,
        s.salary,

        DENSE_RANK() OVER (
            PARTITION BY e.dept_id
            ORDER BY s.salary DESC
        ) AS rnk

    FROM cleaned_employees e
    JOIN cleaned_salaries s
    ON e.emp_id = s.emp_id

) ranked_employees

WHERE rnk <= 2;