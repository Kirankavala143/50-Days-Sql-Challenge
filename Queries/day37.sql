USE sql_challenge;
-- Query 1: Procedure with IF Condition (High/Low Salary)
DROP PROCEDURE IF EXISTS salary_check;

DELIMITER $$

CREATE PROCEDURE salary_check(IN emp INT)
BEGIN
    DECLARE sal INT;

    SELECT salary
    INTO sal
    FROM cleaned_salaries
    WHERE emp_id = emp
    LIMIT 1;

    IF sal > 50000 THEN
        SELECT 'High Salary' AS Result;
    ELSE
        SELECT 'Low Salary' AS Result;
    END IF;
END $$
DELIMITER ;
CALL salary_check(210);


-- Query 2: Procedure with CASE Statement (Salary Category)
DROP PROCEDURE IF EXISTS salary_category;

DELIMITER $$

CREATE PROCEDURE salary_category(IN emp INT)
BEGIN
    DECLARE sal INT;

    SELECT salary
    INTO sal
    FROM cleaned_salaries
    WHERE emp_id = emp
    LIMIT 1;

    SELECT
        CASE
            WHEN sal > 70000 THEN 'High Salary'
            WHEN sal BETWEEN 40000 AND 70000 THEN 'Medium Salary'
            ELSE 'Low Salary'
        END AS Salary_Category;
END $$

DELIMITER ;

CALL salary_category(210);

-- Query 3: Procedure with Aggregation (Total Salary per Employee)
DROP PROCEDURE IF EXISTS total_salary;

DELIMITER $$

CREATE PROCEDURE total_salary(IN emp INT)
BEGIN
    SELECT
        emp_id,
        SUM(salary) AS Total_Salary
    FROM cleaned_salaries
    WHERE emp_id = emp
    GROUP BY emp_id;
END $$

DELIMITER ;

CALL total_salary(210);