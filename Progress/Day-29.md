# Day 29 – Advanced Window Functions (Employee Salary Analysis)

## 📌 Topics Covered
- Rank Employees by Salary
- Compare Salary with Department Average
- Compare Current Salary with Previous Salary
- DENSE_RANK()
- AVG() OVER()
- LAG()
- CASE WHEN
- Window Functions

## 📝 Queries Implemented

### 1. Rank Employees Based on Salary
Assigned salary rankings within each department using `DENSE_RANK()`.

### 2. Compare Employee Salary with Department Average
Calculated the average salary of each department using Window Functions and identified whether an employee earns above, below, or equal to the department average.

### 3. Check Salary Increase or Decrease
Compared each employee's current salary with their previous salary using `LAG()` and identified whether the salary:
- Increased
- Decreased
- Remained the Same

## 🚀 Concepts Learned
- DENSE_RANK()
- AVG() OVER()
- LAG()
- PARTITION BY
- CASE Statements
- Salary Trend Analysis
- Employee Performance Reporting

## 💡 Key Takeaway
Window Functions make it possible to compare each employee with department-level metrics and historical salary records without using complex self-joins, making analytical SQL much more efficient.

---
Day 29 ✅ Completed
