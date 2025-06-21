🛍️ Retail Sales Analysis with SQL Server

📌 Project Overview

This beginner-friendly project demonstrates real-world SQL techniques used by data analysts for retail data analysis. It covers setting up a database, cleaning raw data, and answering critical business questions.

Database: p1_retail_dbTool: Microsoft SQL ServerTable Used: retail_sales

🎯 Objectives

✅ Create & populate the retail_sales table

🧹 Clean null/missing data

🔍 Perform exploratory data analysis (EDA)

📊 Answer 10 key business questions with SQL

🧱 Database Setup

CREATE DATABASE p1_retail_db;

CREATE TABLE retail_sales (
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

🧼 Data Exploration & Cleaning

-- Total Records
SELECT COUNT(*) FROM retail_sales;

-- Unique Customers
SELECT COUNT(DISTINCT customer_id) FROM retail_sales;

-- Unique Categories
SELECT DISTINCT category FROM retail_sales;

-- Check and Delete Nulls
DELETE FROM retail_sales
WHERE
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR
    gender IS NULL OR age IS NULL OR category IS NULL OR
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;

📈 Data Analysis & Insights

All queries are in analysis_queries.sql. Highlights:

🔎 Sales on a specific date (2022-11-05)

👗 Clothing category + quantity filter

💰 Top 5 high-paying customers

🧛 Avg age by category (e.g., Beauty)

📆 Best-selling month by year

⏰ Sales by time of day (Morning, Afternoon, Evening)

Example:

-- Top 5 Customers by Sales
SELECT TOP 5 customer_id, SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC;

📊 Key Findings

💸 Multiple transactions > ₹1000 → high-value customers exist.

👵 Beauty buyers tend to be older (avg. age ~40+).

⏒ Morning & Afternoon shifts have the highest sales.

🗓️ November often shows highest average monthly sales.

🚀 How to Use

Clone the repo:

git clone https://github.com/your-username/Retail-Sales-Analysis-SQL.git

Import database_setup.sql in your SQL Server

Run each file:

data_exploration_cleaning.sql

analysis_queries.sql

Analyze & build Power BI dashboards or reports!

📚 Skills Demonstrated

SQL Server querying & filtering

Window functions (e.g., RANK() for best month)

Joins, aggregations, case logic

Data Cleaning

📌 License

MIT License © [Your Name]

