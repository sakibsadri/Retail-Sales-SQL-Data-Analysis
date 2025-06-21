Select *from Retail_Sales_Analysis;
/*1. 
---------Data Exploration & Cleaning------------------
Record Count: Determine the total number of records in the dataset.
Customer Count: Find out how many unique customers are in the dataset.
Category Count: Identify all unique product categories in the dataset.
Null Value Check: Check for any null values in the dataset and delete records with missing data.
*/
Select COUNT(*) as transcations_id from Retail_Sales_Analysis;                    --2000
Select count(customer_id) as normal_customer from Retail_Sales_Analysis;          --2000
Select count(distinct customer_id) as unique_customer from Retail_Sales_Analysis; --155
Select distinct category from Retail_Sales_Analysis;                  -- 3 beauty electronics, chothing

--Null Value Check: Check for any null values in the dataset and delete records with missing data.
Select * from Retail_Sales_Analysis 
where transactions_id is Null
		OR sale_date is null
		or sale_time is Null
		or customer_id is null
		or gender is null
		or age is null
		or category is null
		or quantiy is null
		or price_per_unit is null
		or cogs is null
		or total_Sale is null; 
--13 missing values age have 10 missing values and quantiy is 3 , perice_per_unit 3 missing value, cogs have 3 missing value and total sales have 3 missing values

Delete from  Retail_Sales_Analysis 
where transactions_id is Null
		OR sale_date is null
		or sale_time is Null
		or customer_id is null
		or gender is null
		or age is null
		or category is null
		or quantiy is null
		or price_per_unit is null
		or cogs is null
		or total_Sale is null; 
Select count(*) as total_count from Retail_Sales_Analysis; --1987
/*
3. Data Analysis & Findings
The following SQL queries were developed to answer specific business questions:

1. Write a SQL query to retrieve all columns for sales made on '2022-11-05:
2. Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022:
3. Write a SQL query to calculate the total sales (total_sale) for each category.:
4. Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:
5. Write a SQL query to find all transactions where the total_sale is greater than 1000.:
6. Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:
7. Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:
8. Write a SQL query to find the top 5 customers based on the highest total sales 
9. Write a SQL query to find the number of unique customers who purchased items from each category.
10.Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)

*/

Select * from Retail_Sales_Analysis;
--1. Write a SQL query to retrieve all columns for sales made on '2022-11-05:

Select *from Retail_Sales_Analysis where sale_date='2022-11-05'; --11 records
--2. Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022:
Select *from Retail_Sales_Analysis 
where 
	category='Clothing' 
	and Month(sale_Date)=11
	And year ( sale_date)=2022
	and quantiy >=4;
--3. Write a SQL query to calculate the total sales (total_sale) for each category.:
Select category, sum(total_sale)as total_sales from Retail_Sales_Analysis 
group by category;

--4. Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:

Select avg(age) from Retail_Sales_Analysis where category='Beauty';

--5. Write a SQL query to find all transactions where the total_sale is greater than 1000.:
Select *from Retail_Sales_Analysis where total_sale>=1000 --402 rows

--6. Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:
Select gender, category, Count(transactions_id) as total_trancstions from Retail_Sales_Analysis 
Group by Gender, category
Order by Gender, category

--7. Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:

SELECT 
    year,
    month,
    avg_sale
FROM 
(
    SELECT 
        YEAR(sale_date) AS year,
        MONTH(sale_date) AS month,
        AVG(total_sale) AS avg_sale,
        RANK() OVER (
            PARTITION BY YEAR(sale_date) 
            ORDER BY AVG(total_sale) DESC
        ) AS rank
    FROM Retail_Sales_Analysis
    GROUP BY YEAR(sale_date), MONTH(sale_date)
) AS t1
WHERE rank = 1;


--8. Write a SQL query to find the top 5 customers based on the highest total sales
Select TOP 5 customer_id,sum(total_sale) as total_Sales from Retail_Sales_Analysis  group by customer_id  order by total_Sales desc

--9. Write a SQL query to find the number of unique customers who purchased items from each category.
Select category, count(distinct customer_id) as unique_Customer from Retail_Sales_Analysis  group by category 

--10.Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)
Select
	CASE
		WHEN DATEPART(HOUR,sale_time)<12THEN 'Morning'
		WHEN DATEPART(HOUR,sale_time) between 12 and 17 THEN 'Afternoon'
	    ELSE 'Evening'
	END as shift,
	count(*) as number_of_order
from Retail_Sales_Analysis 
GROUP BY 
  CASE 
    WHEN DATEPART(HOUR, sale_time) < 12 THEN 'Morning'
    WHEN DATEPART(HOUR, sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
    ELSE 'Evening'
  END;