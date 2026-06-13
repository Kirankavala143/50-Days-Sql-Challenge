-- use sql_challenge;

-- find the employees who have valid departments

-- SELECT e.emp_id , e.emp_name , d.dept_name
-- from cleaned_employees e
-- join cleaned_departments d 
-- on e.dept_id = d.dept_id;

-- FIND ALL EMPLOYEES EVEN WITHOUT DEPARTMENTS

-- SELECT e.emp_id , e.emp_name , d.dept_name
-- from cleaned_employees e
-- left join cleaned_departments d 
-- on e.dept_id = d.dept_id;

-- 3.LIST EMPLOYEES WITHOUT DEPT

-- SELECT e.emp_id , e.emp_name , d.dept_name
-- from cleaned_employees e
-- left join cleaned_departments d 
-- on e.dept_id = d.dept_id
-- where dept_name is null;

-- 4. Who earns how much?

-- SELECT e.emp_id,e.emp_name,s.salary
-- FROM cleaned_employees e
-- JOIN cleaned_salaries s
-- ON e.emp_id = s.emp_id;

-- salary classification):

SELECT e.emp_id,e.emp_name,s.salary
FROM cleaned_employees e
LEFT JOIN cleaned_salaries s
ON e.emp_id = s.emp_id
WHERE s.salary IS NULL;