USE sql_challenge;

-- ==========================================
-- Query 1: BEFORE INSERT Trigger
-- Prevent Negative Salary
-- ==========================================

DROP TRIGGER IF EXISTS before_sal_insert;

DELIMITER $$

CREATE TRIGGER before_sal_insert
BEFORE INSERT
ON cleaned_salaries
FOR EACH ROW
BEGIN

    IF NEW.salary < 0 THEN
        SET NEW.salary = 0;
    END IF;

END $$

DELIMITER ;

-- Test Trigger

INSERT INTO cleaned_salaries
(salary_id, emp_id, salary, salary_date)
VALUES
(501,901,-5000,'2024-01-01');

SELECT *
FROM cleaned_salaries
WHERE emp_id = 901;

-- Query 2 – Create Log Table
DROP TABLE IF EXISTS salary_logs;

CREATE TABLE salary_logs
(
    emp_id INT,
    old_salary INT,
    new_salary INT
);

-- Query 3 – AFTER UPDATE Trigger
DROP TRIGGER IF EXISTS salary_update_trigger;

DELIMITER $$

CREATE TRIGGER salary_update_trigger
AFTER UPDATE
ON cleaned_salaries
FOR EACH ROW
BEGIN

    INSERT INTO salary_logs
    (
        emp_id,
        old_salary,
        new_salary
    )
    VALUES
    (
        OLD.emp_id,
        OLD.salary,
        NEW.salary
    );

END $$

DELIMITER ;