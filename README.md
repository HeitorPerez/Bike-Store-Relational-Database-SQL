## Project Workflow

1. The dataset was obtained from Kaggle
2. CSV files were uploaded to Supabase (PostgreSQL)
3. Data exploration and analysis were performed using SQL
4. Query results were exported
5. Dashboards were created in Tableau

## Tools Used

- Kaggle (data source)
- Supabase (PostgreSQL)
- SQL
- Tableau

## How to Reproduce

1. Download the dataset from Kaggle  
2. Upload the CSV files to a PostgreSQL database (Supabase or local)
3. Execute the queries available in `sql/data_analysis.sql`
4. Export query results as CSV
5. Import the results into Tableau to recreate the visualizations

## Data Source

- Dataset: Bike Store Sales Dataset  
- Source: https://www.kaggle.com/datasets/dillonmyrick/bike-store-sample-database  
- Data was uploaded as raw CSV files into Supabase (PostgreSQL)

## Visualizations

The charts were created in Tableau based on the SQL query outputs.

Project Overview:
- This project performs data analysis of a multi-store bicycle retail chain using SQL.

Database Schema:
The database consists of 9 tables organized into two main schemas:

- Sales: customers, orders, order_items, staffs, and stores.

- Production: categories, brands, products, and stocks.

![DER do banco de dados](DER-BIKE-STORE.png)

The diagram above represents the relational model of the Bike Store database,
including entities such as Customer, Orders, Products, and Staff, as well as
their relationships and primary and foreign keys.

## Example of questions solved:

```sql
> Order Count per Staff Member:
This query is used to calculate the productivity based on the total number of sales per employee.

SELECT s.first_name,
COUNT(o.staff_id) AS order_count,
st.store_name
FROM staffs s
JOIN orders o ON s.staff_id = o.staff_id
JOIN stores st ON s.store_id = st.store_id
GROUP BY s.first_name , st.store_name
ORDER BY order_count DESC; 


> Average Order Value (AOV) per Customer:
This query identifies spending patterns using the Average Order Value (AOV) per customer.

WITH Total_price_per_order AS (
  SELECT oi.order_id, o.customer_id, SUM(oi.quantity * oi.list_price) AS total FROM order_items oi
  JOIN orders o ON oi.order_id = o.order_id
  GROUP BY oi.order_id, o.customer_id
)

SELECT 
CONCAT(c.first_name,' ',c.last_name) AS full_name,
AVG(t.total)
FROM customers c
JOIN Total_price_per_order t ON c.customer_id = t.customer_id
GROUP BY c.customer_id,c.first_name,c.last_name
ORDER BY AVG(t.total) DESC;


> Month-over-Month Sales Performance:
This query analyses the revenue month by month, the result was used to create a year over year char in Tableau.

WITH monthly AS(
  SELECT 
  EXTRACT(YEAR FROM o.order_date::DATE) AS year,
  EXTRACT(MONTH FROM o.order_date::DATE) AS month,
  SUM(oi.quantity*oi.list_price) AS sales_month
  FROM orders o
  JOIN order_items oi ON o.order_id = oi.order_id
  GROUP BY 1, 2
  ORDER BY 1, 2
)

SELECT 
  year,
  month,
  sales_month,
  LAG(sales_month) OVER (ORDER BY year,month) AS month_before,
  (sales_month - LAG(sales_month) OVER (ORDER BY year, month)) AS sales_difference,
  CASE
    WHEN (sales_month - LAG(sales_month) OVER (ORDER BY year,month)) IS NULL THEN 'First month!'
    WHEN (sales_month - LAG(sales_month) OVER (ORDER BY year,month)) = 0 THEN 'No difference between months!'
    WHEN (sales_month - LAG(sales_month) OVER (ORDER BY year,month)) > 0 THEN 'Growth!'
    ELSE 'Decline'
  END AS MonthPerformace
FROM monthly;





