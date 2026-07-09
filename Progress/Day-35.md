# Day 35 – SQL Index Optimization

## 📌 Topics Covered
- EXPLAIN ANALYZE
- Indexes
- Single Column Index
- Query Performance Analysis
- Query Optimization
- Execution Plan

## 📝 Queries Implemented

### 1. Analyze Query Before Applying Index
- Used `EXPLAIN ANALYZE`
- Measured query execution before indexing
- Observed full table scan performance

### 2. Apply Index and Analyze Again
- Created indexes on `emp_id`
- Compared execution plan before and after indexing
- Observed improved query performance

### 3. Analyze Query Using Employee ID
- Retrieved records for a specific employee
- Used `EXPLAIN ANALYZE`
- Compared lookup efficiency after indexing

## 🚀 Concepts Learned
- SQL Indexes
- Query Optimization
- EXPLAIN ANALYZE
- Execution Plans
- Single Column Index
- Performance Tuning

## 💡 Key Takeaway
Indexes significantly improve query performance by reducing the number of rows scanned. Using `EXPLAIN ANALYZE` helps understand execution plans and identify optimization opportunities.

---
Day 35 ✅ Completed
