-- use sql_challenge;

-- emp/salary/performance

-- employees

-- with cte as(

-- select *, row_number() over(PARTITION BY  emp_id, emp_name,city
--  order by emp_id) as rn   
-- from cleaned_employees)

-- delete from cleaned_employees 
-- where emp_id in
-- (select emp_id from cte where rn>1);

-- salaries

-- with cte as(
--     SELECT *, row_number() over(PARTITION BY salary_id, emp_id, salary_date
--  ORDER BY salary_id) as rn   
-- from cleaned_salaries)

-- delete from cleaned_salaries 
-- where salary_id in(
--     select salary_id from cte where rn>1);

-- performance

-- with cte as(
--     SELECT *, row_number() over(PARTITION BY emp_id, rating_2022, rating_2023, rating_2024
--     ORDER BY emp_id) as rn
-- from cleaned_performance)

-- delete from cleaned_performance
-- where emp_id in(
--     select emp_id from cte where rn>1);


-- TASK 2 Identify Text Inconsistency
-- CITY

select distinct city 
from cleaned_employees;

UPDATE cleaned_employees
SET city = CONCAT(UPPER(LEFT(TRIM(city),1)),
LOWER(SUBSTRING(TRIM(city),2)));

update cleaned_employees
set city = case

when city in ('Delhi','Dlhi','Delhi ncr','New delhi') then 'DELHI'
when city in('Hydbd','Hyderabad') then 'Hyderabad'
when city in ('Banglore') then 'Bengaluru'

else city end;








