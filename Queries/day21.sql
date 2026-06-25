-- use sql_challenge;

-- 1. Rank employees by salary

SELECT emp_id,
       salary,
       RANK() OVER(ORDER BY salary DESC) AS salary_rank
FROM cleaned_salaries;

-- 2. Department-wise salary ranking
SELECT e.emp_id,
       e.dept_id,
       s.salary,
       DENSE_RANK() OVER(
           PARTITION BY e.dept_id
           ORDER BY s.salary DESC
       ) AS dept_rank
FROM cleaned_employees e
JOIN cleaned_salaries s
ON e.emp_id = s.emp_id;

-- 3. Rank employees by average performance
SELECT emp_id,
       (rating_2022 + rating_2023 + rating_2024)/3 AS avg_rating,
       DENSE_RANK() OVER(
           ORDER BY (rating_2022 + rating_2023 + rating_2024)/3 DESC
       ) AS performance_rank
FROM cleaned_performance;

-- 4. Top 3 highest-paid employees
SELECT *
FROM (
    SELECT emp_id,
           salary,
           DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk
    FROM cleaned_salaries
) t
WHERE rnk <= 3;