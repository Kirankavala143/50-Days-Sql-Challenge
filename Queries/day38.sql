-- Query 1: BEFORE UPDATE Trigger (Prevent Negative Salary)

USE sql_challenge;

DROP TRIGGER IF EXISTS prevent_negative_salary;

DELIMITER $$

CREATE TRIGGER prevent_negative_salary
BEFORE UPDATE
ON cleaned_salaries
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SET NEW.salary = OLD.salary;
    END IF;
END $$

DELIMITER ;

-- Check employee salary
SELECT *
FROM cleaned_salaries
WHERE emp_id = 164;

-- Try updating salary with a negative value
UPDATE cleaned_salaries
SET salary = -4000
WHERE emp_id = 164;

-- Verify result
SELECT *
FROM cleaned_salaries
WHERE emp_id = 164;

-- Query 2: AFTER INSERT Trigger (Attendance Log)
DROP TABLE IF EXISTS attendance_logs;

CREATE TABLE attendance_logs (
    emp_id INT,
    attendance_date DATE,
    message VARCHAR(100)
);

DROP TRIGGER IF EXISTS attendance_insert_log;

DELIMITER $$

CREATE TRIGGER attendance_insert_log
AFTER INSERT
ON cleaned_attendance
FOR EACH ROW
BEGIN
    INSERT INTO attendance_logs(emp_id, attendance_date, message)
    VALUES (
        NEW.emp_id,
        NEW.attendance_date,
        'Attendance Added'
    );
END $$

DELIMITER ;

-- View log table
SELECT *
FROM attendance_logs;

-- Insert new attendance
INSERT INTO cleaned_attendance
VALUES (202601,101,'2026-08-06','Present');

-- Verify trigger execution
SELECT *
FROM attendance_logs;