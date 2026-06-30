-- USE sql_challenge;

-- Query 1: Find Rank of Employees Within Each Department Based on Salary
SELECT
    e.emp_id,
    e.emp_name,
    d.dept_name,
    s.salary,

    DENSE_RANK() OVER (
        PARTITION BY d.dept_id
        ORDER BY s.salary DESC
    ) AS dept_rank

FROM cleaned_employees e
JOIN cleaned_salaries s
    ON e.emp_id = s.emp_id
JOIN cleaned_departments d
    ON e.dept_id = d.dept_id

ORDER BY
    d.dept_name,
    dept_rank;

-- Query 2: Compare Each Employee Salary With Department Average Salary
SELECT
    e.emp_id,
    e.emp_name,
    d.dept_name,
    s.salary,

    AVG(s.salary) OVER (
        PARTITION BY d.dept_id
    ) AS avg_salary,

    CASE
        WHEN s.salary >
             AVG(s.salary) OVER (PARTITION BY d.dept_id)
             THEN 'Above Avg'

        WHEN s.salary <
             AVG(s.salary) OVER (PARTITION BY d.dept_id)
             THEN 'Below Avg'

        ELSE 'Equal'
    END AS comparison

FROM cleaned_employees e
JOIN cleaned_salaries s
    ON e.emp_id = s.emp_id
JOIN cleaned_departments d
    ON e.dept_id = d.dept_id

ORDER BY
    d.dept_name,
    s.salary DESC;

-- Query 3: Top 3 Highest Paid Employees in Each Department
SELECT *
FROM
(
    SELECT
        e.emp_id,
        e.emp_name,
        d.dept_name,
        s.salary,

        DENSE_RANK() OVER(
            PARTITION BY d.dept_id
            ORDER BY s.salary DESC
        ) AS salary_rank

    FROM cleaned_employees e
    JOIN cleaned_salaries s
        ON e.emp_id = s.emp_id
    JOIN cleaned_departments d
        ON e.dept_id = d.dept_id
) x

WHERE salary_rank <= 3
ORDER BY dept_name, salary_rank;

-- Query 4: Lowest Paid Employee in Each Department
SELECT *
FROM
(
    SELECT
        e.emp_id,
        e.emp_name,
        d.dept_name,
        s.salary,

        DENSE_RANK() OVER(
            PARTITION BY d.dept_id
            ORDER BY s.salary ASC
        ) AS salary_rank

    FROM cleaned_employees e
    JOIN cleaned_salaries s
        ON e.emp_id = s.emp_id
    JOIN cleaned_departments d
        ON e.dept_id = d.dept_id
) x

WHERE salary_rank = 1
ORDER BY dept_name;
