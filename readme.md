# Monday Coffee Sales Analysis — SQL

A SQL data analysis project exploring coffee sales, customers, products, and city-level market potential using MySQL.

## Project Overview

This project analyzes coffee sales data using MySQL to understand:

* Sales performance across cities
* Customer purchasing behavior
* Product sales volume
* Monthly sales growth
* Estimated coffee consumer potential
* City-level market potential

The analysis uses SQL joins, aggregate functions, CTEs, and window functions to answer business-related questions from the dataset.


## Dataset

The dataset contains four main tables:

* **city** — city name, population, estimated rent, and city rank
* **customers** — customer information and city association
* **products** — coffee product names and prices
* **sales** — sales date, product, customer, sales amount, and rating

These tables are connected through customer, product, and city IDs.

## Tools & Skills

* MySQL
* SQL
* JOINs
* Aggregate Functions
* GROUP BY
* CTEs
* Window Functions
* Date Functions
* Data Analysis

## Analysis Performed

The project answers the following business questions:

1. Estimated coffee consumers by city
2. Total coffee sales revenue in Q4 2023
3. Sales volume of each coffee product
4. Average sales per customer in each city
5. Current customers compared with estimated coffee consumers
6. Top 3 selling products in each city
7. Unique customers in each city
8. Average sales per customer and estimated rent by city
9. Monthly sales growth
10. Top 3 cities by sales and market potential


## Key Findings

Based on the SQL analysis:

* **Pune, Delhi, and Jaipur** were the top 3 cities by total sales.
* **Delhi** had an estimated coffee consumer population of approximately **7.7 million**.
* **Jaipur** had **69 current customers** in the dataset.
* Jaipur's average sales per customer were approximately **11.6K**.
* City-level sales, customer counts, estimated coffee consumers, and estimated rent were compared to understand market potential.
* Product-level analysis identified the highest-selling coffee products and the top 3 products within each city.
* Monthly sales analysis was used to identify changes in sales performance over time.


## Business Insights

The analysis can be used to understand:

* Which cities generate the highest sales.
* Which coffee products have the highest sales volume.
* How customer activity differs across cities.
* How actual customers compare with the estimated coffee consumer population.
* How sales change from month to month.
* Which cities show a combination of sales activity, customer presence, and potential market size.

## Skills Demonstrated

* Data exploration using SQL
* Multi-table JOINs
* `GROUP BY` and aggregate functions
* `COUNT()` and `SUM()`
* `COUNT(DISTINCT ...)`
* Date and time functions
* Common Table Expressions (CTEs)
* Window functions
* `ROW_NUMBER()` and `LAG()`
* Ranking products within each city
* Monthly sales growth analysis
* Business-oriented data analysis


## Project Files

| File            | Description                         |
| --------------- | ----------------------------------- |
| `schema.sql`    | Database and table creation         |
| `solution.sql`  | SQL analysis and business questions |
| `sales.csv`     | Sales transaction data              |
| `products.csv`  | Coffee product data                 |
| `customers.csv` | Customer data                       |
| `city.csv`      | City, population, and rent data     |
| `screenshots/`  | Selected SQL analysis results       |
