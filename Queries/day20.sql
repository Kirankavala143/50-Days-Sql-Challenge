-- use sql_challenge;


-- 1. Latest Salary per Employee
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY emp_id
               ORDER BY salary_date DESC
           ) AS rn
    FROM cleaned_salaries
) t
WHERE rn = 1;

-- 2. First Salary per Employee
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY emp_id
               ORDER BY salary_date ASC
           ) AS rn
    FROM cleaned_salaries
) t
WHERE rn = 1;

-- 3. Rank Salary Entries for Each Employee
SELECT
    emp_id,
    salary,
    ROW_NUMBER() OVER (
        PARTITION BY emp_id
        ORDER BY salary_date DESC
    ) AS rank_number
FROM cleaned_salaries;

-- 4. Get Top 2 Salary Records per Employee
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY emp_id
               ORDER BY salary_date DESC
           ) AS rn
    FROM cleaned_salaries
) t
WHERE rn <= 2;