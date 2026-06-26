-- use sql_challenge;

-- -- 1. Department Average Salary (Show each employee with department average salary)
SELECT
    e.emp_id,
    e.dept_id,
    s.salary,
    AVG(s.salary) OVER (PARTITION BY e.dept_id) AS dept_avg_salary
FROM cleaned_employees e
JOIN cleaned_salaries s
ON e.emp_id = s.emp_id;

-- -- 2. Total Salary of Each Department
SELECT
    e.emp_id,
    e.dept_id,
    s.salary,
    SUM(s.salary) OVER(PARTITION BY e.dept_id) AS dept_total_salary
FROM cleaned_employees e
JOIN cleaned_salaries s
ON e.emp_id = s.emp_id;

-- -- 3. Average Performance Rating of Each Department
SELECT
    p.emp_id,
    e.dept_id,
    AVG((p.rating_2022 + p.rating_2023 + p.rating_2024) / 3)
        OVER(PARTITION BY e.dept_id) AS dept_avg_rating
FROM cleaned_performance p
JOIN cleaned_employees e
ON p.emp_id = e.emp_id;