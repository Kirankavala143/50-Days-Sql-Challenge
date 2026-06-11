use sql_challenge;

-- 1.remove month (invalid)>12

-- 25-08-2022 = 25-08 = 15 > 12

-- update cleaned_employees
-- set hire_date = null
-- where
-- cast(substring_index(substring_index(hire_date,'-',2),'-',-1) as unsigned) > 12;

-- STEP -2  DD-MM-YYYY TO YYYY-MM-DD
-- update cleaned_employees
-- set hire_date = CONCAT
-- (RIGHT(hire_date,4),'-',substring(hire_date,4,2),'-',LEFT(hire_date,2)
-- )

-- where hire_date like '__-__-____';

-- STEP -3 REMOVE INVALID DAYS

-- update cleaned_employees
-- set hire_date = null
-- where
-- cast(RIGHT(hire_date,2) as unsigned) > 31;

-- alter TABLE cleaned_employees
-- modify hire_date date;

-- select distinct hire_date from cleaned_employees;


-- REPLACE NULL AND EMPTY VALUES WITH -'2024-02-25'

UPDATE cleaned_employees
SET hire_date = '2024-02-25'
WHERE hire_date IS NULL;

-- FIX THE DATE FORMAT ISSUE IN SALARAY_DATE. ATTENDNCE_DATE
-- SALARY  TABLE
-- 1.remove month (invalid)>12
UPDATE cleaned_salaries
SET salary_date = NULL
WHERE CAST(
SUBSTRING_INDEX(
SUBSTRING_INDEX(salary_date,'-',2),
'-',
-1
) AS UNSIGNED
) > 12;

-- STEP -2  DD-MM-YYYY TO YYYY-MM-DD
UPDATE cleaned_salaries
SET salary_date = CONCAT(
RIGHT(salary_date,4),
'-',
SUBSTRING(salary_date,4,2),
'-',
LEFT(salary_date,2)
)
WHERE salary_date LIKE '__-__-____';

-- STEP -3 REMOVE INVALID DAYS
UPDATE cleaned_salaries
SET salary_date = NULL
WHERE CAST(RIGHT(salary_date,2) AS UNSIGNED) > 31;

Step 4: Replace NULL Values
UPDATE cleaned_salaries
SET salary_date = '2024-02-25'
WHERE salary_date IS NULL;

Step 5: Convert to DATE Type
ALTER TABLE cleaned_salaries
MODIFY salary_date DATE;

-- ATTENDACE TABLE
-- 1.remove month (invalid)>12
UPDATE cleaned_attendance
SET attendance_date = NULL
WHERE CAST(
SUBSTRING_INDEX(
SUBSTRING_INDEX(attendance_date,'-',2),
'-',
-1
) AS UNSIGNED
) > 12;

-- STEP -2  DD-MM-YYYY TO YYYY-MM-DD
UPDATE cleaned_attendance
SET attendance_date = CONCAT(
RIGHT(attendance_date,4),
'-',
SUBSTRING(attendance_date,4,2),
'-',
LEFT(attendance_date,2)
)
WHERE attendance_date LIKE '__-__-____';

-- STEP -3 REMOVE INVALID DAYS
UPDATE cleaned_attendance
SET attendance_date = NULL
WHERE CAST(RIGHT(attendance_date,2) AS UNSIGNED) > 31;

Step 4: Replace NULL Values
UPDATE cleaned_attendance
SET attendance_date = '2024-02-25'
WHERE attendance_date IS NULL;

Step 5: Convert to DATE Type
ALTER TABLE cleaned_attendance
MODIFY attendance_date DATE;