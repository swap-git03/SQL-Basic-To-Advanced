# SQL-Basic-To-Advanced

# SQL Practice Repository

## 📌 Overview

This repository contains structured SQL practice covering core to intermediate-level concepts.
It is designed to build a strong foundation in querying relational databases using a consistent dataset and topic-wise organization.

The focus is on **clarity, correctness, and real interview relevance**, rather than random or disconnected queries.

---

## 🧠 What This Repository Covers

* Basic Queries (SELECT, WHERE, ORDER BY)
* Filtering & Pattern Matching (`LIKE`, conditions)
* INNER JOIN and relational queries
* LEFT JOIN and handling NULL cases
* Aggregation (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`)
* GROUP BY and HAVING
* CASE statements (conditional logic)
* Subqueries (including correlated subqueries)
* Common Table Expressions (CTEs)

---

## 🗂️ Project Structure

```
sql-practice/
│
├── 00_dataset.sql        # Database + sample data (run first)
├── 01_basic_queries.sql
├── 02_joins.sql
├── 03_left_join.sql
├── 04_group_by.sql
├── 05_having.sql
├── 06_case.sql
├── 07_subqueries.sql
├── 08_cte.sql
```

---

## ⚙️ How to Use

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/sql-practice.git
   cd sql-practice
   ```

2. Open your SQL environment (MySQL / PostgreSQL / SQLite)

3. Run the dataset file first:

   ```sql
   SOURCE 00_dataset.sql;
   ```

4. Execute other files one by one:

   ```sql
   SOURCE 01_basic_queries.sql;
   SOURCE 02_joins.sql;
   ...
   ```

---

## 📊 Dataset Description

The repository uses a simple relational schema:

### Tables:

| Table       | Purpose                        |
| ----------- | ------------------------------ |
| `student`   | Basic CRUD operations          |
| `dept`      | Department reference           |
| `emp`       | Employee data with foreign key |
| `customers` | Customer information           |
| `orders`    | Transaction/order records      |

### Key Relationships:

* `emp.dept_id → dept.id`
* `orders.customer_id → customers.id`

The dataset includes:

* NULL values (for LEFT JOIN practice)
* Multiple records per entity (for aggregation)
* Varied data distribution (for CASE & HAVING)

---

## 🎯 Purpose

This repository is built to:

* Strengthen SQL fundamentals
* Practice commonly asked interview queries
* Understand relational data handling
* Build confidence in writing clean and structured SQL

---

## ⚠️ Limitations (Honest Notes)

This repository focuses on **core SQL**. It does NOT yet include:

* Window Functions (`RANK`, `ROW_NUMBER`, `LEAD/LAG`)
* Indexing and query optimization
* Advanced normalization or large-scale schema design
* Stored procedures / triggers

---

## 🚀 Future Improvements

Planned additions:

* Advanced SQL (Window Functions)
* Real-world interview question sets
* Performance optimization examples
* Complex multi-table scenarios

---

## 🤝 Contributing

Contributions are welcome. If you have:

* Better queries
* Edge cases
* Optimization improvements

Feel free to open a pull request.

---

## 📌 Author

Maintained as part of SQL learning and interview preparation.

---
