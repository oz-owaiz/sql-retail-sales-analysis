-- Creating a database 
CREATE DATABASE retail_sales_analysis;

-- Using the database
USE retail_sales_analysis;

-- Import the CSV file into the database

-- To check if all the data has been imported into the dataset
SELECT *
FROM retail_sales_table;

-- To check the count of all the rows are counted for (should be 1000)
SELECT COUNT(*)
FROM retail_sales_table;

-- Describing the table will help in displaying the column names, data types, null values, and primary key(s).
DESCRIBE retail_sales_table;

-- Show create table shows the complete defination of the table
SHOW CREATE TABLE retail_sales_table;

-- D A T A     Q U A L I T Y     C H E C K --

-- 1. Check for missing dates
SELECT COUNT(*) AS missing_dates
FROM retail_sales_table
WHERE `Date` IS NULL OR TRIM(`Date`) = '';

-- 2. Check for invalid dates
SELECT COUNT(*) AS invalid_dates
FROM retail_sales_table
WHERE STR_TO_DATE(TRIM(`Date`), '%Y-%m-%d') IS NULL
AND `Date` IS NOT NULL
AND TRIM(`Date`) <> '';

-- 3. Check distinct transaction IDs
SELECT DISTINCT `Transaction ID`
FROM retail_sales_table
LIMIT 20;

SELECT *
FROM retail_sales_table
LIMIT 5;

SELECT
COUNT(*) AS total_records,
COUNT(DISTINCT `Transaction ID`) AS unique_transactions,
MIN(`Transaction ID`) AS minimum_id,
MAX(`Transaction ID`) AS maximum_id
FROM retail_sales_table;

SELECT
`Date`,
STR_TO_DATE(TRIM(`Date`), '%Y-%m-%d') AS converted_date
FROM retail_sales_table
WHERE `Transaction ID` <= 5;

SELECT COUNT(*) AS records_with_date_header
FROM retail_sales_table
WHERE `Date` = 'Date';

-- Since some column names have spaces in them renaming them is required
ALTER TABLE retail_sales_table
RENAME COLUMN `Transaction ID` TO transaction_id;

ALTER TABLE retail_sales_table
RENAME COLUMN `Date` TO sale_date;

ALTER TABLE retail_sales_table
RENAME COLUMN `Customer ID` TO customer_id;

ALTER TABLE retail_sales_table
RENAME COLUMN `Gender` TO gender;

ALTER TABLE retail_sales_table
RENAME COLUMN `Age` TO age;

ALTER TABLE retail_sales_table
RENAME COLUMN `Product Category` TO product_category;

ALTER TABLE retail_sales_table
RENAME COLUMN `Quantity` TO quantity;

ALTER TABLE retail_sales_table
RENAME COLUMN `Price per Unit` TO price_per_unit;

ALTER TABLE retail_sales_table
RENAME COLUMN `Total Amount` TO total_amount;

-- To check if the columns have been renamed and see their data types
DESCRIBE retail_sales_table;

-- Changing datatypes for some --

ALTER TABLE retail_sales_table
MODIFY COLUMN sale_date DATE;

ALTER TABLE retail_sales_table
MODIFY COLUMN customer_id VARCHAR(20);

ALTER TABLE retail_sales_table
MODIFY COLUMN gender VARCHAR(10);

ALTER TABLE retail_sales_table
MODIFY COLUMN product_category VARCHAR(50);

ALTER TABLE retail_sales_table
MODIFY COLUMN price_per_unit DECIMAL(10,2);

ALTER TABLE retail_sales_table
MODIFY COLUMN total_amount DECIMAL(10,2);

-- To verify that the data types have been successfully changed --
DESCRIBE retail_sales_table;

SELECT *
FROM retail_sales_table
WHERE total_amount <> quantity * price_per_unit;

-- L E V E L - 1 :    B E G I N N E R     S Q L --

-- Q1. Count the total number of transactions.
SELECT COUNT(transaction_id) AS total_number_transactions
FROM retail_sales_table;

-- Q2. Count the number of male customers transactions.
SELECT COUNT(gender) AS male_transactions
FROM retail_sales_table
WHERE gender = 'Male';

-- Q3. Count the number of female customers' transactions.
SELECT COUNT(gender) AS female_transactions
FROM retail_sales_table
WHERE gender = 'Female';

-- Q4. Find the youngest customer's age.
SELECT MIN(age) AS youngest_customer
FROM retail_sales_table;

-- Q5. Find the oldest customer's age.
SELECT MAX(age) AS oldest_customer
FROM retail_sales_table;

-- Q6. Display all different product categories.
SELECT DISTINCT(product_category)
FROM retail_sales_table;

-- Q7. Count the total number of different product categories.
SELECT COUNT(DISTINCT(product_category))
FROM retail_sales_table;

-- Q8. Find the total quantity of products sold.
SELECT SUM(quantity) AS total_quantity_sold
FROM retail_sales_table;

-- Q9. Find the total revenue generated from all transactions.
SELECT SUM(total_amount) AS total_revenue
FROM retail_sales_table;

-- Q10. Find the average age of customers.
SELECT AVG(age) AS average_age_customers
FROM retail_sales_table;

-- Q11. Find the average transaction amount.
SELECT AVG(total_amount) AS average_transaction_amount
FROM retail_sales_table;

-- Q12. Display all transactions where the gender is Male.
SELECT total_amount, gender
FROM retail_sales_table
WHERE gender = 'Male';

-- Q13. Display all transactions where the product category is Clothing.
SELECT total_amount, product_category
FROM retail_sales_table
WHERE product_category = 'Clothing';

-- Q14. Find all transactions where the total amount is greater than 500.
SELECT total_amount
FROM retail_sales_table
WHERE total_amount > 500;

-- Q15. Display the 10 transactions with the highest total amount.
SELECT total_amount
FROM retail_sales_table
ORDER BY total_amount DESC
LIMIT 10;

-- Q16. Find the total quantity of products sold in each product category.
SELECT product_category, SUM(quantity) AS total_quantity
FROM retail_sales_table
GROUP BY product_category;

-- Q17. Find the total revenue generated by each product category.
SELECT product_category, SUM(total_amount) AS total_revenue
FROM retail_sales_table
GROUP BY product_category;

-- Q18. Find the average selling price for each product category.
SELECT product_category, AVG(price_per_unit) AS average_selling_price
FROM retail_sales_table
GROUP BY product_category;

-- Q19. Count the number of transactions for each product category.
SELECT product_category, COUNT(transaction_id) AS total_transactions
FROM retail_sales_table
GROUP BY product_category;

-- Q20. Find the number of transactions made by each gender.
SELECT gender, COUNT(transaction_id) AS total_transaction
FROM retail_sales_table
GROUP BY gender;

-- Q21. Calculate the total revenue generated by male and female customers separately.
SELECT gender, SUM(total_amount) AS total_revenue
FROM retail_sales_table
GROUP BY gender;

-- Q22. Find the average age of customers in each gender.
SELECT gender, AVG(age) AS average_age
FROM retail_sales_table
GROUP BY gender;

-- Q23. Find the highest transaction amount in each product category.
SELECT product_category, MAX(total_amount) AS highest_transaction
FROM retail_sales_table
GROUP BY product_category;

-- Q24. Find the lowest transaction amount in each product category.
SELECT product_category, MIN(total_amount) AS lowest_transaction
FROM retail_sales_table
GROUP BY product_category;

-- Q25. Display product categories generating total revenue greater than 10,000.
SELECT product_category, SUM(total_amount) AS total_revenue
FROM retail_sales_table
GROUP BY product_category
HAVING SUM(total_amount) > 10000;

-- Q26. Find the product category with the highest total quantity sold.
SELECT product_category, SUM(quantity) AS total_quantity
FROM retail_sales_table
GROUP BY product_category
ORDER BY SUM(quantity) DESC
LIMIT 1;

-- Q27. Find the total revenue generated in each year.
SELECT YEAR(sale_date) AS yearly_sales, SUM(total_amount) AS total_revenue
FROM retail_sales_table
GROUP BY YEAR(sale_date)
ORDER BY YEAR(sale_date); 


-- Q28. Find total revenue generated in each month.
SELECT
YEAR(sale_date) AS sales_year,
MONTH(sale_date) AS sales_month,
SUM(total_amount) AS total_revenue
FROM retail_sales_table
GROUP BY YEAR(sale_date), MONTH(sale_date)
ORDER BY sales_year, sales_month;

-- Q29. Find the number of transactions made in each month.
SELECT
YEAR(sale_date) AS sales_year,
MONTH(sale_date) AS sales_month,
COUNT(transaction_id) AS total_transactions
FROM retail_sales_table
GROUP BY YEAR(sale_date), MONTH(sale_date)
ORDER BY sales_year, sales_month;

-- Q30. Display transactions between two specified dates.
SELECT *
FROM retail_sales_table
WHERE sale_date BETWEEN '2023-11-01' AND '2024-02-29';

-- Q31. Find the product category with the highest revenue using a subquery.
SELECT product_category, SUM(total_amount) AS total_revenue
FROM retail_sales_table
GROUP BY product_category
HAVING SUM(total_amount) =
(
SELECT MAX(category_total)
FROM (
SELECT SUM(total_amount) AS category_total
FROM retail_sales_table
GROUP BY product_category
) AS t
);

-- Q32. Display transactions with amounts greater than the overall average transaction amount.
SELECT transaction_id AS transaction, total_amount AS total_spending
FROM retail_sales_table
WHERE total_amount >
(
SELECT AVG(total_amount)
FROM retail_sales_table
);

-- Q33. Classify transactions into High, Medium and Low spending categories using CASE WHEN.
SELECT total_amount, transaction_id,
CASE
WHEN total_amount >= 1000 THEN 'HIGH'
WHEN total_amount >= 500 THEN 'MEDIUM'
ELSE 'LOW'
END AS transaction_category
FROM retail_sales_table;

-- Q34. Rank product categories based on their total revenue using RANK().
SELECT product_category, 
SUM(total_amount) AS total_revenue,
RANK() OVER(ORDER BY SUM(total_amount) DESC) AS revenue_rank
FROM retail_sales_table
GROUP BY product_category;

-- Q35. Find the top three highest-value transactions in each product category using ROW_NUMBER().
SELECT transaction_id, product_category, total_amount, rn
FROM (
SELECT transaction_id, product_category, total_amount,
ROW_NUMBER() OVER (PARTITION BY product_category ORDER BY total_amount DESC) AS rn
FROM retail_sales_table
) AS ranked
WHERE rn <= 3;

-- Q36. Calculate the percentage contribution of each product category to total revenue.
SELECT product_category,
SUM(total_amount) AS category_revenue,
ROUND(SUM(total_amount) * 100.0 /
(SELECT SUM(total_amount) FROM retail_sales_table), 2) AS revenue_percentage
FROM retail_sales_table
GROUP BY product_category
ORDER BY revenue_percentage DESC;

-- Q37. Calculate the cumulative revenue across transactions using a window function.
SELECT transaction_id, sale_date, total_amount,
SUM(total_amount) OVER(ORDER BY sale_date,transaction_id) AS cumulative_revenue
FROM retail_sales_table;
