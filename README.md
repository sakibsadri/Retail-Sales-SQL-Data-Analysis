# 🧾 Retail Sales Analysis Using SQL Server

A **beginner-friendly SQL project** to explore, clean, and analyze retail data using **SQL Server**. Ideal for aspiring **Data Analysts** looking to strengthen their SQL skills through real-world business scenarios.

Created by **Sakib Sadri** (sakibsadri)

---

## 📘 Project Description

This project simulates a retail sales scenario where SQL is used to perform **end-to-end data analysis**. Start from **raw data**, clean it, and extract valuable **business insights** using SQL queries.

---

## 🧩 Features & Objectives

- 📦 **Database Setup** – Design a structured schema in SQL Server  
- 🧹 **Data Cleaning** – Identify and remove null or missing values  
- 🔍 **Exploratory Data Analysis (EDA)** – Understand distributions and patterns  
- 💡 **Business Intelligence Queries** – Answer 10+ real-world business questions  

---

## 🗂️ Project Structure

Retail-Sales-Analysis-SQL/
│
├── database_setup.sql # Create database and table
├── data_exploration_cleaning.sql # Data checks and cleaning queries
├── analysis_queries.sql # EDA and business logic queries
├── retail_data.csv # Sample dataset (optional)
└── README.md # Project documentation

pgsql
Copy
Edit

---

## 🧱 Database Schema

**Database:** `Sadri_projects`  
**Table:** `Retail_Sales`

```sql
CREATE DATABASE Sadri_projects;
GO

USE Sadri_projects;
GO

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
🧽 Data Cleaning Steps
sql
Copy
Edit
-- Total Records
SELECT COUNT(*) FROM Retail_Sales;

-- Unique Customers
SELECT COUNT(DISTINCT customer_id) FROM Retail_Sales;

-- Category Types
SELECT DISTINCT category FROM Retail_Sales;

-- Remove rows with null values
DELETE FROM Retail_Sales
WHERE sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR
      gender IS NULL OR age IS NULL OR category IS NULL OR
      quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL OR total_sale IS NULL;
🧠 Business Questions Answered
1️⃣ Sales made on 2022-11-05

sql
Copy
Edit
SELECT * FROM Retail_Sales WHERE sale_date = '2022-11-05';
2️⃣ 'Clothing' category sales with quantity > 4 in Nov 2022

sql
Copy
Edit
SELECT * FROM Retail_Sales
WHERE category = 'Clothing' AND MONTH(sale_date) = 11 AND YEAR(sale_date) = 2022 AND quantity > 4;
3️⃣ Total sales by category

sql
Copy
Edit
SELECT category, SUM(total_sale) AS total_sales FROM Retail_Sales GROUP BY category;
4️⃣ Average age of customers who purchased 'Beauty' items

sql
Copy
Edit
SELECT AVG(age) FROM Retail_Sales WHERE category = 'Beauty';
5️⃣ Transactions with total_sale > 1000

sql
Copy
Edit
SELECT * FROM Retail_Sales WHERE total_sale > 1000;
6️⃣ Number of transactions by gender and category

sql
Copy
Edit
SELECT gender, category, COUNT(transactions_id) AS total_transactions
FROM Retail_Sales
GROUP BY gender, category;
7️⃣ Best selling month of each year based on average sales

sql
Copy
Edit
SELECT year, month, avg_sale FROM (
  SELECT
    YEAR(sale_date) AS year,
    MONTH(sale_date) AS month,
    AVG(total_sale) AS avg_sale,
    RANK() OVER(PARTITION BY YEAR(sale_date) ORDER BY AVG(total_sale) DESC) AS rank
  FROM Retail_Sales
  GROUP BY YEAR(sale_date), MONTH(sale_date)
) AS ranked_months
WHERE rank = 1;
8️⃣ Top 5 customers by total sales

sql
Copy
Edit
SELECT TOP 5 customer_id, SUM(total_sale) AS total_sales
FROM Retail_Sales
GROUP BY customer_id
ORDER BY total_sales DESC;
9️⃣ Unique customers by category

sql
Copy
Edit
SELECT category, COUNT(DISTINCT customer_id) AS unique_customers
FROM Retail_Sales
GROUP BY category;
🔟 Order count by time of day (shift)

sql
Copy
Edit
SELECT
  CASE
    WHEN DATEPART(HOUR, sale_time) < 12 THEN 'Morning'
    WHEN DATEPART(HOUR, sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
    ELSE 'Evening'
  END AS shift,
  COUNT(*) AS number_of_orders
FROM Retail_Sales
GROUP BY
  CASE
    WHEN DATEPART(HOUR, sale_time) < 12 THEN 'Morning'
    WHEN DATEPART(HOUR, sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
    ELSE 'Evening'
  END;
📊 Insights Summary
📈 November is the peak month for sales across years

👗 Clothing is the top-performing category

🧓 Customers in the Beauty category have higher average age

💸 Numerous transactions over ₹1000 value

🚀 How to Run This Project
Clone the repository

bash
Copy
Edit
git clone https://github.com/sakibsadri/retail-sales-analysis-sql.git
Open SQL Server Management Studio

Execute the following scripts in order:

database_setup.sql

data_exploration_cleaning.sql

analysis_queries.sql

🛠️ Tools & Technologies
Microsoft SQL Server

SQL Queries (Joins, Aggregations, Group By, Ranking)

CASE Statements and Window Functions

📜 License
Licensed under the MIT License
© Sakib Sadri

🙌 Contributing
Have suggestions or want to contribute?
Fork the repo, create a branch, and submit a pull request — Contributions are welcome!

📬 Contact
📧 sakibsadri@gmail.com
🔗 Connect on LinkedIn

vbnet
Copy
Edit

Let me know if you'd like this in an actual file or want it formatted for GitHub Pages or Notion too.
