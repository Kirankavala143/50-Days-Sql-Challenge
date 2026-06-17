-- use sql_challenge;

-- employees earning more than average salary
-- calculation -- comparing
-- avg salary---- e1>avg salary ==== result


select e.emp_id, e.emp_name, s.salary
from cleaned_employees e  
join cleaned_salaries s 
on e.emp_id = s.emp_id
where salary >

(SELECT avg(salary) from cleaned_salaries);

-- 2. employees with salary equal to maximum salary
SELECT e.emp_id,e.emp_name,s.salary
FROM cleaned_employees e
JOIN cleaned_salaries s
    ON e.emp_id = s.emp_id
WHERE s.salary =

(SELECT MAX(salary)FROM cleaned_salaries);


-- 3. employees earning less than average salary
SELECT e.emp_id,
       e.emp_name,
       s.salary
FROM cleaned_employees e
JOIN cleaned_salaries s
    ON e.emp_id = s.emp_id
WHERE s.salary <
(
    SELECT AVG(salary)
    FROM cleaned_salaries
);

-- 4 employees with minimum salary
SELECT e.emp_id,
       e.emp_name,
       s.salary
FROM cleaned_employees e
JOIN cleaned_salaries s
    ON e.emp_id = s.emp_id
WHERE s.salary =
(
    SELECT MIN(salary)
    FROM cleaned_salaries
);