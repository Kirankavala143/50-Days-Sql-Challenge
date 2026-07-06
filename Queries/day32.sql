USE sql_challenge;
-- 1 create employee view ( find create a reusae view of ep detais)

DROP VIEW IF EXISTS emp_view;

CREATE VIEW emp_view AS
SELECT emp_id, emp_name, dept_id, city
FROM cleaned_employees;
SELECT *
FROM emp_view
WHERE city = 'Mumbai';

-- 2. create salaruy view

DROP VIEW IF EXISTS salary_view;
create view salary_view as
select emp_id, salary, salary_date
from cleaned_salaries;

select * from salary_view
where emp_id= 444;

-- 3. Create Joined View (emp_salary_view)
CREATE VIEW emp_salary_view AS
SELECT
    e.emp_id,
    e.emp_name,
    e.dept_id,
    e.city,
    s.salary,
    s.salary_date
FROM cleaned_employees e
JOIN cleaned_salaries s
ON e.emp_id = s.emp_id;

-- 4. Use the view to find employees with salary > 500000
SELECT *
FROM emp_salary_view
WHERE salary > 500000;