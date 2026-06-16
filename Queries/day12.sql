-- use sql_challenge;

-- what is the avg salary in each department

select d.dept_name,avg(s.salary) as avg_salary
from cleaned_departments d
join cleaned_employees e 

on e.dept_id = d.dept_id
join cleaned_salaries s
on e.emp_id = s.emp_id
group by d.dept_name;

-- 2. how many days was each employee present.
SELECT emp_id, COUNT(attendance_id) AS days_present
FROM cleaned_attendance
GROUP BY emp_id;

-- 3: Which employees belong to the same department?
SELECT
    dept_id,
    GROUP_CONCAT(emp_name) AS employees
FROM cleaned_employees
GROUP BY dept_id
HAVING COUNT(*) > 1;

-- 4: Which employees have more than one salary record?
SELECT
    e.emp_id,
    e.emp_name,
    COUNT(s.salary_id) AS salary_records
FROM cleaned_employees e
JOIN cleaned_salaries s
    ON e.emp_id = s.emp_id
GROUP BY e.emp_id, e.emp_name
HAVING COUNT(s.salary_id) > 1;