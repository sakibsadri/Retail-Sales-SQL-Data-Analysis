# 🧾 Retail Sales Analysis Using SQL Server

![SQL Server](https://img.shields.io/badge/SQL-Server-red?style=for-the-badge\&logo=MicrosoftSQLServer)

> A beginner-friendly project to explore, clean, and analyze retail data using SQL Server. Perfect for aspiring Data Analysts who want to strengthen their SQL skills by solving real-world business problems.

---

## 📘 Project Description

This project simulates a common retail sales scenario where SQL is used to perform end-to-end data analysis. You'll begin with raw data, clean it, and use SQL queries to derive insights for business decision-making.

Created by **Sakib Sadri (sakibsadri)**

---

## 🧩 Features & Objectives

* 📦 **Database Setup** – Design a structured schema in SQL Server
* 🧹 **Data Cleaning** – Identify and remove null or missing values
* 🔍 **Exploratory Data Analysis (EDA)** – Understand distributions and counts
* 💡 **Business Intelligence Queries** – Answer 10 key business questions

---

## 🗂️ Project Structure

```bash
Retail-Sales-Analysis-SQL/
│
├── database_setup.sql              # Create database and table
├── data_exploration_cleaning.sql   # Data checks and cleaning queries
├── analysis_queries.sql            # EDA and business logic queries
├── retail_data.csv                 # Sample dataset (optional)
└── README.md                       # Project documentation
```

---

## 🧱 Database Schema

**Database**: `Sadri_projects`
**Table**: `Retail_Sales`

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
```

---

## 🧽 Data Cleaning Steps

```sql
-- Total Records
SELECT COUNT(*) FROM Retail_Sales;

-- Unique Customers
SELECT COUNT(DISTINCT customer_id) FROM Retail_Sales;

-- Category Types
SELECT DISTINCT category FROM Retail_Sales;

-- Delete rows with missing/nulls
DELETE FROM Retail_Sales
WHERE sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR
      gender IS NULL OR age IS NULL OR category IS NULL OR
      quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL OR total_sale IS NULL;
```

---

## 🧠 Business Questions Answered

### 1️⃣ Write a SQL query to retrieve all columns for sales made on '2022-11-05:

```sql
SELECT * FROM Retail_Sales WHERE sale_date = '2022-11-05';
```

### 2️⃣ Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022:

```sql
SELECT * FROM Retail_Sales
WHERE category = 'Clothing'
  AND MONTH(sale_date) = 11
  AND YEAR(sale_date) = 2022
  AND quantity > 4;
```

### 3️⃣ Write a SQL query to calculate the total sales (total\_sale) for each category:

```sql
SELECT category, SUM(total_sale) AS total_sales FROM Retail_Sales GROUP BY category;
```

### 4️⃣ Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category:

```sql
SELECT AVG(age) FROM Retail_Sales WHERE category = 'Beauty';
```

### 5️⃣ Write a SQL query to find all transactions where the total\_sale is greater than 1000:

```sql
SELECT * FROM Retail_Sales WHERE total_sale > 1000;
```

### 6️⃣ Write a SQL query to find the total number of transactions (transaction\_id) made by each gender in each category:

```sql
SELECT gender, category, COUNT(transactions_id) AS total_transactions
FROM Retail_Sales
GROUP BY gender, category;
```

### 7️⃣ Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:

```sql
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
```

### 8️⃣ Write a SQL query to find the top 5 customers based on the highest total sales:

```sql
SELECT TOP 5 customer_id, SUM(total_sale) AS total_sales
FROM Retail_Sales
GROUP BY customer_id
ORDER BY total_sales DESC;
```

### 9️⃣ Write a SQL query to find the number of unique customers who purchased items from each category:

```sql
SELECT category, COUNT(DISTINCT customer_id) AS unique_customers FROM Retail_Sales GROUP BY category;
```

### 🔟 Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17):

```sql
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
```

---

## 📊 Insights Summary

* 📈 November is the peak month for sales across years
* 👗 Clothing is the top-performing category
* 🧓 Beauty buyers have higher average age
* 💸 Many high-value purchases over ₹1000

---

## 🚀 How to Run This Project

1. Clone the repository

```bash
git clone https://github.com/sakibsadri/retail-sales-analysis-sql.git
```

2. Open `SQL Server Management Studio`
3. Run each SQL file in order:

   * `database_setup.sql`
   * `data_exploration_cleaning.sql`
   * `analysis_queries.sql`

---

## 🛠️ Tools & Technologies

* SQL Server
* SQL Window Functions
* Aggregations and Case Logic
* Joins, Group By, Ranking

---

## 📜 License

MIT License © Sakib Sadri

---

## 🙌 Contributing

Contributions are welcome! Feel free to fork the repo and submit a pull request.

---

## 📬 Contact

Connect with me on [LinkedIn](https://linkedin.com/in/sakibsadri) or email me at `sakibsadri@gmail.com`
