-- use sql_challenge;

-- alter table cleaned_salaries
-- modify salary int;

-- select 

-- min(salary) as min_salary,
-- max(salary) as max_salary,
-- avg(salary) as avg_salary
-- from cleaned_salaries;

-- Client rules are: max salary = 2,00,000 and min salary = 20,000

-- alter Table cleaned_salaries
-- add column is_Outlier int;

-- update cleaned_salaries
-- set is_Outlier =
-- case
-- when salary < 20000 or salary > 200000 
-- then 1
-- else 0
-- end;

-- select * from cleaned_salaries
-- where is_Outlier = 1;

-- UPDATE cleaned_salaries
-- SET salary = 65000
-- WHERE salary_id = 17;

-- UPDATE cleaned_salaries
-- SET salary = 97000
-- WHERE salary_id = 37;

