<h1 align="center">🧾 Retail Sales Analysis Using SQL Server</h1>

<p align="center">
  <b>A beginner-friendly SQL project to clean, explore, and analyze retail data using SQL Server.</b><br>
  Perfect for aspiring Data Analysts looking to strengthen real-world SQL skills.
</p>

---

## 📘 Overview

This project simulates a real-life retail sales environment where raw data is transformed into insights using SQL.  
You'll go from **database setup** to **data cleaning**, followed by **business analysis**, answering crucial questions to support data-driven decisions.

> Created by **Sakib Sadri** ([@sakibsadri](mailto:sakibsadri@gmail.com))

---

## 🧩 Project Highlights

- ✅ **Database Setup** – Design and create a schema in SQL Server  
- 🧽 **Data Cleaning** – Handle nulls, inconsistencies, and validate fields  
- 📊 **EDA** – Understand key patterns and metrics using SQL  
- 📈 **Business Queries** – Answer 10 insightful business questions  

---

## 🗂 Project Structure

```bash
Retail-Sales-Analysis-SQL/
├── database_setup.sql              # Create database and tables
├── data_exploration_cleaning.sql   # Data validation and cleaning
├── analysis_queries.sql            # Business intelligence queries
├── retail_data.csv                 # Sample dataset (optional)
└── README.md                       # Project documentation

🧱 Database Schema
Database: Sadri_projects
Table: Retail_Sales

sql
Copy
Edit
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
🧹 Data Cleaning Steps
sql
Copy
Edit
-- Total records
SELECT COUNT(*) FROM Retail_Sales;

-- Unique customers
SELECT COUNT(DISTINCT customer_id) FROM Retail_Sales;

-- Distinct categories
SELECT DISTINCT category FROM Retail_Sales;

-- Remove records with missing values
DELETE FROM Retail_Sales
WHERE sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR
      gender IS NULL OR age IS NULL OR category IS NULL OR
      quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL OR total_sale IS NULL;
🧠 Business Intelligence Queries
Answering real-world questions using SQL.

1️⃣ Sales made on 2022-11-05
sql
Copy
Edit
SELECT * FROM Retail_Sales WHERE sale_date = '2022-11-05';
2️⃣ Clothing sales with quantity > 4 in November 2022
sql
Copy
Edit
SELECT * FROM Retail_Sales
WHERE category = 'Clothing'
  AND MONTH(sale_date) = 11
  AND YEAR(sale_date) = 2022
  AND quantity > 4;
3️⃣ Total sales by category
sql
Copy
Edit
SELECT category, SUM(total_sale) AS total_sales
FROM Retail_Sales
GROUP BY category;
4️⃣ Average age of customers who purchased from "Beauty"
sql
Copy
Edit
SELECT AVG(age)
FROM Retail_Sales
WHERE category = 'Beauty';
5️⃣ Transactions with total sale > 1000
sql
Copy
Edit
SELECT * FROM Retail_Sales
WHERE total_sale > 1000;
6️⃣ Transactions count by gender and category
sql
Copy
Edit
SELECT gender, category, COUNT(transactions_id) AS total_transactions
FROM Retail_Sales
GROUP BY gender, category;
7️⃣ Best-selling month each year by average sale
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
8️⃣ Top 5 customers based on total sales
sql
Copy
Edit
SELECT TOP 5 customer_id, SUM(total_sale) AS total_sales
FROM Retail_Sales
GROUP BY customer_id
ORDER BY total_sales DESC;
9️⃣ Unique customers per category
sql
Copy
Edit
SELECT category, COUNT(DISTINCT customer_id) AS unique_customers
FROM Retail_Sales
GROUP BY category;
🔟 Order count by shift (Morning, Afternoon, Evening)
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
📊 Key Insights
🔥 November consistently sees peak sales across years

👗 Clothing leads in category-wise revenue

🧓 Customers in the Beauty segment have a higher average age

💰 Significant number of transactions above ₹1000

🚀 Getting Started
Step 1: Clone the Repository
bash
Copy
Edit
git clone https://github.com/sakibsadri/retail-sales-analysis-sql.git
Step 2: Open SQL Server Management Studio
Step 3: Execute SQL Files in Order
database_setup.sql

data_exploration_cleaning.sql

analysis_queries.sql

🛠 Tools & Technologies
SQL Server

Window Functions & Ranking

CASE & Aggregation

Joins & Grouping

📜 License
This project is licensed under the MIT License
© 2024 Sakib Sadri

🙌 Contributing
Contributions are welcome!
Feel free to fork, improve, and submit a pull request.

📬 Contact
📧 Email: sakibsadri@gmail.com
🔗 LinkedIn: linkedin.com/in/sakibsadri

yaml
Copy
Edit

---

✅ Let me know if you want this saved as a `.md` file, or want a version tailored for **GitHub Pages** or **portfolio site** styling with icons, badges, or interactive SQL preview.

Shall I generate the actual file for you now?
