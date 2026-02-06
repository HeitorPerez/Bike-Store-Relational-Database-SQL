Total-Revenue-per-Store:

SELECT 
s.store_name,
SUM(oi.quantity * oi.list_price) AS total
FROM stores s
JOIN orders o ON s.store_id = o.store_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY s.store_name
ORDER BY total DESC;  

> Currency formatting was intentionally omitted numeric precision for analytical operations


  
Top-10 Most-Expensive-Products:

SELECT  
p.product_name, 
MAX(p.list_price) AS Most_Expensive 
FROM products p
GROUP BY p.product_name
ORDER BY MAX(p.list_price) DESC
LIMIT 10;

> Currency formatting was intentionally omitted numeric precision for analytical operations




Order-Count-per-Staff-Member:

SELECT s.first_name,
COUNT(o.staff_id) AS order_count,
st.store_name
FROM staffs s
JOIN orders o ON s.staff_id = o.staff_id
JOIN stores st ON s.store_id = st.store_id
GROUP BY s.first_name , st.store_name
ORDER BY order_count DESC; 



Average-Product-Price-by-Category:

SELECT 
c.category_name,
AVG(p.list_price)
FROM categories c
JOIN products p ON c.category_id = p.category_id
GROUP BY c.category_name
ORDER BY AVG(p.list_price) DESC; 

> Currency formatting was intentionally omitted numeric precision for analytical operations



Revenue-by-Category:
  
SELECT 
c.category_name,
SUM(oi.quantity * oi.list_price) AS Top_revenue_category,
COUNT(oi.product_id)  AS times_sold 
FROM categories c 
JOIN products p ON c.category_id = p.category_id
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY c.category_id, c.category_name
ORDER BY Top_revenue_category DESC;

> Currency formatting was intentionally omitted numeric precision for analytical operations




Out-of-Stock-Products:

SELECT p.product_name AS NO_STOCK
FROM products p
join stocks s ON p.product_id = s.product_id
WHERE s.quantity = 0
GROUP BY p.product_name
ORDER BY p.product_name;



Frequent-Customers (More than 2 orders):

SELECT CONCAT(c.first_name,' ',c.last_name) AS full_name, COUNT(o.customer_id) AS orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, CONCAT(c.first_name,' ',c.last_name)
HAVING COUNT(o.customer_id) > 2
ORDER BY orders DESC; 



Average-Order-Value-(AOV)-per-Customer:

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

> Currency formatting was intentionally omitted numeric precision for analytical operations



Products-Never-Sold:

SELECT p.product_name AS zero_sales_product
FROM products p 
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL
GROUP BY p.product_id
ORDER BY p.product_name;



Total-Revenue-per-Staff-Member

SELECT 
CONCAT(s.first_name,' ',s.last_name),
SUM(oi.quantity*oi.list_price) FROM staffs s 
LEFT JOIN orders o ON s.staff_id = o.staff_id
LEFT JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY CONCAT(s.first_name,' ',s.last_name)
ORDER BY SUM(oi.quantity*oi.list_price) DESC NULLS last;

> Currency formatting was intentionally omitted numeric precision for analytical operations



Staff-Sales-Ranking-By-Store

WITH rnk AS (
  SELECT 
  CONCAT(s.first_name,' ',s.last_name),
  SUM(oi.quantity*oi.list_price),
  st.store_name,
  DENSE_RANK() OVER (PARTITION BY st.store_name ORDER BY SUM(oi.quantity*oi.list_price) DESC) AS moneyrank
  FROM staffs s
  JOIN orders o ON s.staff_id = o.staff_id
  JOIN stores st ON s.store_id = st.store_id
  JOIN order_items oi ON o.order_id = oi.order_id
  GROUP BY st.store_name, CONCAT(s.first_name,' ',s.last_name)
)

SELECT * FROM rnk
WHERE moneyrank <= 3;



Month-over-Month-Sales-Performance

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

> Currency formatting was intentionally omitted numeric precision for analytical operations




