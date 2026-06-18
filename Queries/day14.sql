-- use sql_challenge;

-- 1. Employees earning more than department average salary
SELECT e1.emp_id,e1.emp_name,e1.dept_id,s1.salary
FROM cleaned_employees e1
JOIN cleaned_salaries s1
ON e1.emp_id = s1.emp_id
WHERE s1.salary >
(
    SELECT AVG(s.salary)
    FROM cleaned_salaries s
    JOIN cleaned_employees e
    ON s.emp_id = e.emp_id
    WHERE e.dept_id = e1.dept_id
);

-- Employees having highest salary in each department
SELECT e.emp_id,e.emp_name,e.dept_id,s.salary
FROM cleaned_employees e
JOIN cleaned_salaries s
ON e.emp_id = s.emp_id
WHERE s.salary =
(
    SELECT MAX(s2.salary)
    FROM cleaned_salaries s2
    JOIN cleaned_employees e2
    ON s2.emp_id = e2.emp_id
    WHERE e2.dept_id = e.dept_id
);

-- Employees having lowest salary in each department
SELECT e.emp_id,e.emp_name,e.dept_id,s.salary
FROM cleaned_employees e
JOIN cleaned_salaries s
ON e.emp_id = s.emp_id
WHERE s.salary =
(
    SELECT MIN(s2.salary)
    FROM cleaned_salaries s2
    JOIN cleaned_employees e2
    ON s2.emp_id = e2.emp_id
    WHERE e2.dept_id = e.dept_id
);