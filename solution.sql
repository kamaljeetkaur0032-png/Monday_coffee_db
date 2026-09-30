use monday_coffee_db;
select * from sales;
select * from products;
select * from customers;
select * from city;





-- Q.1 Coffee Consumers Count
-- How many people in each city are estimated to consume coffee, given that 25% of the population does?
SELECT
    city_name,
    population,
    ROUND(population * 0.25) AS estimated_coffee_consumers
FROM city;


-- -- Q.2
-- Total Revenue from Coffee Sales
-- What is the total revenue generated from coffee sales across all cities in the last quarter of 2023?
SELECT
    SUM(total) AS total_revenue
FROM sales
WHERE YEAR(sales_date) = 2023
  AND QUARTER(sales_date) = 4;
  
  -- Q.3
-- Sales Count for Each Product
-- How many units of each coffee product have been sold?
SELECT
    p.product_name,
    COUNT(s.sales_id) AS total_units_sold
FROM products AS p
JOIN sales AS s
    ON p.product_id = s.product_id
GROUP BY p.product_name
ORDER BY total_units_sold DESC;




-- Q.4
-- Average Sales Amount per City
-- What is the average sales amount per customer in each city?

-- city abd total sale
-- no cx in each these city
SELECT
    ci.city_name,
    SUM(s.total) AS total_sales,
    COUNT(DISTINCT c.customer_id) AS total_customers,
    ROUND(
        SUM(s.total) / COUNT(DISTINCT c.customer_id),
        2
    ) AS average_sales_per_customer
FROM sales AS s
JOIN customers AS c
    ON s.customer_id = c.customer_id
JOIN city AS ci
    ON c.city_id = ci.city_id
GROUP BY ci.city_name
ORDER BY average_sales_per_customer DESC;


-- -- Q.5
-- City Population and Coffee Consumers (25%)
-- Provide a list of cities along with their populations and estimated coffee consumers.
-- return city_name, total current cx, estimated coffee consumers (25%)
SELECT
    ci.city_name,
    COUNT(DISTINCT c.customer_id) AS total_current_customers,
    ROUND(ci.population * 0.25) AS estimated_coffee_consumers
FROM city AS ci
LEFT JOIN customers AS c
    ON ci.city_id = c.city_id
GROUP BY
    ci.city_name,
    ci.population
ORDER BY ci.city_name;



-- Q.6
-- What are the top 3 selling products in each city based on sales volume?

select p.product_name,ci.city_name,count(s.sale_id) as sales_volume from 
sales as s
join customers as c 
on s.customer_id = c.customer_id
join city as ci 
on ci.city_id = c.city_id
join products as p
on p.product_id = s.product_id
group by 
ci.city_name,p.product_name 
ORDER BY sales_volume DESC
LIMIT 3;



-- Q.7
-- How many unique customers are there in each city who have purchased coffee products?
select ci.city_name, count(distinct c.customer_id) as unique_customers
from sales as s 
join customers as c
on s.customer_id = c.customer_id
join city as ci
on ci.city_id = c.city_id
group by ci.city_name 
order by unique_customers desc;

-- Q.8
-- Find each city and their average sale per customer and avg rent per customer

SELECT
    ci.city_name,
    ROUND(
        SUM(s.total) / COUNT(DISTINCT c.customer_id),
        2
    ) AS average_sale_per_customer,
    AVG(ci.estimated_rent) AS average_rent
FROM sales AS s
JOIN customers AS c
    ON s.customer_id = c.customer_id
JOIN city AS ci
    ON c.city_id = ci.city_id
GROUP BY ci.city_name;


-- Advanced Questions & Analysis
-- Q.9
-- Monthly Sales Growth
-- Sales growth rate: Calculate the percentage growth (or decline) in sales over different time periods (monthly).

with monthly_sales as(
select 
date_format(sale_date,"%y-%m") as month,
sum(total)as monthly_sales
from sales 
group by date_format(sale_date,"%y-%m")
)
,
sales_growth as
( select month, monthly_sales,
lag(monthly_sales) over (order by month) as previous_month_sales
from monthly_sales
)
select month,monthly_sales, previous_month_sales,
round((monthly_sales- previous_month_sales )/ previous_month_Sales*100,2) as growth_percentage
from sales_Growth
order by month asc;

-- Q.10
-- Market Potential Analysis
-- Identify top 3 city based on highest sales, return city name, total sale, total rent, total customers, estimated coffee consumer

select ci.city_name, sum(s.total) as total_Sales, ci.estimated_rent as total_rent, 
count(distinct c.customer_id) as total_Customers,ROUND(ci.population * 0.25) AS estimated_coffee_consumers
FROM sales AS s
JOIN customers AS c
    ON s.customer_id = c.customer_id
JOIN city AS ci
    ON c.city_id = ci.city_id
GROUP BY
    ci.city_name,
    ci.estimated_rent,
    ci.population
ORDER BY total_sales DESC
LIMIT 3;


/*
**Monday Coffee Sales Analysis — SQL**

**Key Findings**

* Identified **Pune, Delhi, and Jaipur** as the top 3 cities by total sales.
* Found that **Delhi has approximately 7.7 million estimated coffee consumers**, indicating a large potential customer base.
* Identified **Jaipur with 69 current customers** and average sales per customer of approximately **11.6K**.
* Analyzed city-level revenue, customer count, estimated coffee consumers, and rent to evaluate market potential.
* Identified top-selling coffee products by city based on sales volume.
* Analyzed monthly sales growth and decline to understand revenue trends.

*/
