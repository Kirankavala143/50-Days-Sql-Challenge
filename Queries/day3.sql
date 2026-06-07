use sql_challenge;

-- dept_name
update cleaned_employees
set emp_name = 'Unknown'
where emp_name is null or emp_name = '';


-- city
update cleaned_employees
set city = 'Delhi'
where emp_id = 13;

-- city
update cleaned_employees
set city = 'Delhi NCR'
where city is null or city = '';

    
-- rating_2023
update cleaned_performance
set rating_2023 =0
where rating_2023 is null or rating_2023 = '';


-- Find Duplicate values

-- 1) Employees

select emp_id,emp_name,city, count(*)
from cleaned_employees
group by emp_id,emp_name,city
having count(*)>1;

-- 2) Departments

select dept_id,dept_name, count(*)
from cleaned_departments
group by dept_id,dept_name
having count(*)>1;

-- 3) Salaries

select salary_id,emp_id,salary_date, count(*)
from cleaned_salaries
group by salary_id,emp_id,salary_date
having count(*)>1;

-- 4) Attendance

select attendance_id,emp_id,attendance_date, count(*)
from cleaned_attendance
group by attendance_id,emp_id,attendance_date
having count(*)>1;

-- 5) Performance

select emp_id,rating_2022,rating_2023,rating_2024, count(*)
from cleaned_performance
group by emp_id,rating_2022,rating_2023,rating_2024
having count(*)>1;