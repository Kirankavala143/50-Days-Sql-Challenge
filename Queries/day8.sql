-- use sql_challenge;
SELECT * FROM cleaned_departments;

-- UPDATE cleaned_employees
-- set EMP_NAME = trim(emp_name);

-- conversion of datatype

-- 1.employees
alter table cleaned_employees
modify emp_id int,
modify emp_name varchar(100),
modify age int,
modify city varchar(50),
modify dept_id int,
modify hire_date date;

DESCRIBE cleaned_employees;


-- -- 2.departments

alter table cleaned_departments
modify dept_id int,
modify dept_name varchar(100); 

DESCRIBE cleaned_departments;

-- 3 attendance
ALTER TABLE cleaned_attendance
MODIFY attendance_id INT,
MODIFY emp_id INT,
MODIFY attendance_date date,
MODIFY status VARCHAR(20);

DESCRIBE cleaned_attendance;

-- 4 salaries
ALTER TABLE cleaned_salaries
MODIFY salary_id INT,
MODIFY emp_id INT,
MODIFY salary INT,
MODIFY salary_date DATE,
MODIFY is_Outlier TINYINT;

DESCRIBE cleaned_salaries;

-- 5 performance
ALTER TABLE cleaned_performance
MODIFY emp_id INT,
MODIFY rating_2022 INT,
MODIFY rating_2023 INT,
MODIFY rating_2024 INT;

DESCRIBE cleaned_performance;