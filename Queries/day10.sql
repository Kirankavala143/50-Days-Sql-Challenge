-- use sql_challenge;

--  what are Perfomance Ratings of each employees

select e.emp_id, e.emp_name, p.rating_2022, p.rating_2023,p.rating_2024
from cleaned_employees e 
join cleaned_performance p 
on e.emp_id = p.emp_id;

-- 2.Which employees do not have salary records
select e.emp_name, e.emp_id
from cleaned_employees e 
left join cleaned_salaries s
on e.emp_id = s.emp_id
where s.emp_id is null;

-- 3 which employee do not have attendance record
SELECT e.emp_id, e.emp_name
FROM cleaned_employees e
LEFT JOIN cleaned_attendance a
ON e.emp_id = a.emp_id
WHERE a.emp_id IS NULL;


-- 4 what is the employee name, dept, salary together
SELECT e.emp_name,
       d.dept_name,
       s.salary
FROM cleaned_employees e
JOIN cleaned_departments d
ON e.dept_id = d.dept_id
JOIN cleaned_salaries s
ON e.emp_id = s.emp_id;
