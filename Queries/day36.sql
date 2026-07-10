USE sql_challenge;

-- ==========================================
-- Query 1: Create Procedure to Get All Employees
-- ==========================================

DROP PROCEDURE IF EXISTS get_all_emp;

-- DELIMITER $$
CREATE PROCEDURE get_all_emp()
BEGIN
    SELECT * FROM cleaned_employees;
END;
-- DELIMITER ;

CALL get_all_emp();


-- ==========================================
-- Query 2: Procedure with Input Parameter
-- Find Employee by emp_id
-- ==========================================

DROP PROCEDURE IF EXISTS get_emp_by_id;

DELIMITER $$

CREATE PROCEDURE get_emp_by_id(IN emp_id_input INT)
BEGIN
    SELECT *
    FROM cleaned_employees
    WHERE emp_id = emp_id_input;
END $$

DELIMITER ;

CALL get_emp_by_id(120);


-- ==========================================
-- Query 3: Procedure with JOIN
-- Employee and Salary Details
-- ==========================================

DROP PROCEDURE IF EXISTS emp_salary_details;

DELIMITER $$

CREATE PROCEDURE emp_salary_details()
BEGIN
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
END $$

DELIMITER ;

CALL emp_salary_details();


-- ==========================================
-- Query 4: Salary Report
-- Employees with Salary > 50000
-- ==========================================

DROP PROCEDURE IF EXISTS high_salary_report;

DELIMITER $$

CREATE PROCEDURE high_salary_report()
BEGIN
    SELECT
        e.emp_id,
        e.emp_name,
        s.salary,
        s.salary_date
    FROM cleaned_employees e
    JOIN cleaned_salaries s
    ON e.emp_id = s.emp_id
    WHERE s.salary > 50000;
END $$

DELIMITER ;

CALL high_salary_report();