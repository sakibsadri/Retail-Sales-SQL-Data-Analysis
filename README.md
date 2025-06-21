<h1 align="center">🧾 Retail Sales Analysis Using SQL Server</h1>

<p align="center">
  <b>Clean, Analyze, and Visualize Retail Data with SQL Server</b><br>
  A complete SQL project focused on real-world problem solving for beginner to intermediate data enthusiasts.
</p>

---

## 📘 About the Project

This project simulates a real-time retail scenario where raw sales data is imported into SQL Server, cleaned, and analyzed through powerful SQL queries to generate actionable business insights.

> 🎯 Created by **Sakib Sadri** — [📧 sakibsadri@gmail.com](mailto:sakibsadri@gmail.com)

---

## 🧩 Key Features

- 📦 **Database Design** – Create and define tables with proper data types
- 🧼 **Data Cleaning** – Eliminate missing/null entries
- 📊 **Exploratory Data Analysis (EDA)** – Explore patterns and trends
- 🧠 **Business Intelligence Queries** – 10+ real-world SQL challenges
- 🔍 **Shift Analysis & Top Customer Reports**

---

## 🧱 Schema Overview

**Database:** `Sadri_projects`  
**Table:** `Retail_Sales`

```sql
CREATE TABLE Retail_Sales (
  transactions_id INT PRIMARY KEY,
  sale_date DATE,
  sale_time TIME,
  customer_id INT,
  gender VARCHAR(10),
  age INT,
  category VARCHAR(35),
  quantity INT,
  price_per_unit FLOAT,
  cogs FLOAT,
  total_sale FLOAT
);

🧽 Data Cleaning Summary
sql
Copy
Edit
-- Total records
SELECT COUNT(*) FROM Retail_Sales;

-- Unique customers
SELECT COUNT(DISTINCT customer_id) FROM Retail_Sales;

-- Categories
SELECT DISTINCT category FROM Retail_Sales;

-- Remove missing values
DELETE FROM Retail_Sales
WHERE sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR
      gender IS NULL OR age IS NULL OR category IS NULL OR
      quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL OR total_sale IS NULL;
🔍 Business Questions & SQL Queries
📅 Q1: Show all sales made on 2022-11-05
sql
Copy
Edit
SELECT * FROM Retail_Sales
WHERE sale_date = '2022-11-05';
