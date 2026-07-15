-- Query 1: Create Temporary Table
USE sql_challenge;

CREATE TEMPORARY TABLE temp_sal_summary
(
    emp_id INT,
    total_salary INT
);

-- Query 2: Insert Data into Temporary Table
INSERT INTO temp_sal_summary (emp_id, total_salary)
SELECT
    emp_id,
    SUM(salary)
FROM cleaned_salaries
GROUP BY emp_id;

-- Query 3: View Temporary Table
SELECT *
FROM temp_sal_summary;

-- Query 4: Join Temporary Table with Employee Table
SELECT
    e.emp_id,
    e.emp_name,
    t.total_salary
FROM cleaned_employees e
JOIN temp_sal_summary t
ON e.emp_id = t.emp_id;

-- Query 5: Drop Temporary Table
DROP TEMPORARY TABLE temp_sal_summary;

-- Query 6 (Intentional Error)
