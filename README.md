# Internship Task 4 – SQL Intermediate (JOINS)

This repository contains my submission for **Task 4** of my Data Analyst internship, focused on **SQL JOIN operations** (INNER JOIN, LEFT JOIN) and generating meaningful business insights from joined data.

---

## 📌 Objective
- Practice and implement **SQL JOINs**
- Combine multiple datasets to answer business questions
- Export joined results into a CSV file
- Provide insights based on analysis

---

## 📂 Datasets Used
The following datasets were used:
- `customers.csv` → customer details
- `categories.csv` → category information
- `restaurant_orders.csv` → order transactions

> Note: JOINing was done based on available common fields (Customer name / IDs where applicable).

---

## 🛠 Tools & Technologies
- SQL (MySQL / SQL Workbench)
- CSV dataset files
- GitHub for submission

---

## 📁 Files in this Repository
| File Name | Description |
|----------|-------------|
| `joins_queries.sql` | All SQL queries using INNER JOIN and LEFT JOIN (with comments) |
| `joined_output.csv` | Exported output of a JOIN query |
| `insights.txt` | 3 business insights derived from the JOIN results |
| `README.md` | Project documentation |

---

## ✅ SQL Concepts Covered
- `INNER JOIN`
- `LEFT JOIN`
- Filtering using `WHERE`
- Aggregations: `SUM()`, `COUNT()`, `AVG()`
- `GROUP BY`
- Sorting using `ORDER BY`

---

## 🔍 Example Use Cases Solved
- Joining customer records with orders to create a complete transaction view
- Finding customers with **no orders** using LEFT JOIN
- Product/category performance based on revenue & order count
- Total spending per customer

---

## 📌 Business Insights (Summary)
Insights are included in `insights.txt`. Some examples:
- Identification of high-performing categories/products
- Customer purchase behavior patterns
- Customers with no purchase history (potential marketing targets)

---

## ▶️ How to Run
1. Import the CSV files into your SQL database
2. Open `joins_queries.sql`
3. Run queries one by one in MySQL Workbench / any SQL editor
4. Export results as CSV (output already provided in `joined_output.csv`)

---

## 👤 Author
**Samarth Joshi**  
(Data Analyst Internship Submission – Task 4)
