Day 40 – MySQL Temporary Tables | 50 Days SQL Challenge
🚀 Overview

Day 40 focuses on Temporary Tables in MySQL. Temporary tables are created to store intermediate results during a database session and are automatically removed when the session ends. They help simplify complex queries, improve readability, and perform temporary calculations without affecting permanent database tables.

📚 Concepts Covered
Temporary Tables
Creating Temporary Tables
Inserting Data into Temporary Tables
Joining Temporary Tables
Dropping Temporary Tables
Session Scope
Temporary Data Processing
🛠 Tasks Performed
1️⃣ Created a Temporary Table

Created a temporary table to store the total salary of each employee.

2️⃣ Inserted Aggregated Data

Used the SUM() function with GROUP BY to calculate the total salary for every employee and stored the results in the temporary table.

3️⃣ Retrieved Temporary Table Data

Verified the stored records using the SELECT statement.

4️⃣ Joined Temporary Table

Joined the temporary table with the employee table to display employee names along with their total salaries.

5️⃣ Dropped the Temporary Table

Removed the temporary table using DROP TEMPORARY TABLE and observed that it was no longer accessible.

📂 Tables Used
cleaned_employees
cleaned_salaries
temp_sal_summary (Temporary Table)
💡 Key SQL Features Used
CREATE TEMPORARY TABLE
INSERT INTO ... SELECT
SUM()
GROUP BY
INNER JOIN
DROP TEMPORARY TABLE
SELECT
🎯 Learning Outcomes

By completing this project, I learned how to:

Create and use temporary tables.
Store intermediate query results.
Improve query readability.
Perform aggregation using SUM() and GROUP BY.
Join temporary tables with permanent tables.
Understand the lifecycle and session scope of temporary tables.
🛠 Technologies Used
MySQL
SQL
VS Code
SQLTools Extension
📸 Output

✔ Created a temporary table to store employee salary summaries.

✔ Calculated total salary for each employee.

✔ Joined employee details with salary summaries.

✔ Successfully removed the temporary table.

✔ Verified that the table no longer exists after dropping it.

📖 Interview Questions Covered
What is a Temporary Table?
Why do we use Temporary Tables?
Temporary Table vs Normal Table
Can Temporary Tables be accessed by other users?
When are Temporary Tables deleted?
How do Temporary Tables improve query performance?
