-- USE sql_challenge;
-- 1. Salary Category 
SELECT emp_id,salary,
    CASE
        WHEN salary < 30000 THEN 'Low'
        WHEN salary BETWEEN 30000 AND 60000 THEN 'Medium'
        ELSE 'High'
    END AS category
FROM cleaned_salaries;

-- avg rating >= 4 = Good
-- avg rating >= 3 = Average
-- else = Poor

-- 2. Performance Category
SELECT emp_id,
    (rating_2022 + rating_2023 + rating_2024) / 3 AS avg_rating,
    CASE
        WHEN (rating_2022 + rating_2023 + rating_2024) / 3 >= 4
            THEN 'Good'
        WHEN (rating_2022 + rating_2023 + rating_2024) / 3 >= 3
            THEN 'Average'
        ELSE 'Poor'
    END AS performance_category
FROM cleaned_performance;

-- 3. Attendance Status Category
-- present = active
-- else = inactive
SELECT
    emp_id,
    status,
    CASE
        WHEN status = 'Present'
            THEN 'Active'
        ELSE 'Inactive'
    END AS attendance_category
FROM cleaned_attendance;

-- 4. Experience Category
SELECT
    emp_id,
    YEAR(CURDATE()) - YEAR(hire_date) AS experience_year,

    CASE
        WHEN YEAR(CURDATE()) - YEAR(hire_date) < 2
            THEN 'Freshers'

        WHEN YEAR(CURDATE()) - YEAR(hire_date)
             BETWEEN 2 AND 5
            THEN 'Mid-Level'

        ELSE 'Experienced'
    END AS exp_cat

FROM cleaned_employees;