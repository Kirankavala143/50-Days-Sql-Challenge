🚀 Overview

Day 39 focuses on MySQL Triggers, which are special database objects that execute automatically when specific events occur on a table. In this project, I implemented both BEFORE INSERT and AFTER UPDATE triggers to automate data validation and maintain audit logs.

📚 Concepts Covered
BEFORE INSERT Trigger
AFTER UPDATE Trigger
OLD and NEW Keywords
Automatic Data Validation
Audit Logging
Trigger Testing
🛠 Tasks Performed
1️⃣ BEFORE INSERT Trigger

Created a trigger that automatically checks employee salary before inserting a new record.

Purpose

Prevent negative salary values.
Replace negative salaries with 0 before insertion.
2️⃣ AFTER UPDATE Trigger

Created a trigger that automatically stores salary changes in a separate log table.

Purpose

Track salary updates.
Store previous and updated salary values.
Maintain an audit history.
📂 Tables Used
cleaned_salaries
salary_logs
💡 Key SQL Features Used
CREATE TRIGGER
BEFORE INSERT
AFTER UPDATE
NEW Keyword
OLD Keyword
IF Statement
INSERT INTO
UPDATE
SELECT
🎯 Learning Outcomes

By completing this project, I learned how to:

Create database triggers.
Validate data automatically.
Track changes using audit logs.
Use OLD and NEW values.
Automate database operations without manual intervention.
🛠 Technologies Used
MySQL
SQL
VS Code
SQLTools Extension
📸 Output

✔ Negative salary is automatically converted to 0 before insertion.

✔ Every salary update is recorded in the salary_logs table with:

Employee ID
Old Salary
New Salary
📖 Interview Questions Covered
What is a Trigger?
Types of Triggers in MySQL
BEFORE vs AFTER Trigger
OLD vs NEW Keywords
Real-world use cases of Triggers
Advantages and limitations of Triggers
⭐ Repository Goal

This repository is part of my 50 Days SQL Challenge, where I practice SQL concepts daily to strengthen my Database Management and Data Analytics skills.
