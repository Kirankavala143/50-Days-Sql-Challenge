# Day 24 - SQL Window Functions (LEAD)

## 📌 Objective

Learn how to use the **LEAD()** window function to compare current records with future records without using self joins.

## Queries Completed

### 1. Current Salary and Next Salary

* Displayed each employee's current salary.
* Retrieved the next salary record using `LEAD()`.

### 2. Salary Growth Analysis

* Compared current salary with the next salary.
* Calculated salary progression for each employee.

### 3. Attendance Trend Prediction

* Compared today's attendance status with the next attendance record.
* Used `LEAD()` with `PARTITION BY` and `ORDER BY` to analyze attendance trends.

## SQL Concepts Practiced

* LEAD()
* Window Functions
* OVER()
* PARTITION BY
* ORDER BY
* Trend Analysis
* Salary Comparison
* Attendance Analysis

## Key Learning

The `LEAD()` function allows us to access the next row within the same partition, making it ideal for trend analysis, forecasting, and comparing sequential records without complex joins.

---

**Challenge:** Day 24 of the 50 Days SQL Challenge
