# SQL Retail Sales Analysis

## Project Overview

This project focuses on analyzing retail sales data using **MySQL**. The objective is to explore transaction records, examine sales performance, identify trends, and extract meaningful business insights using SQL queries.

The project includes data quality checks and 37 SQL questions, progressing from basic queries to more advanced SQL concepts.

## Dataset

- **Source:** [Kaggle – Retail Sales Dataset](https://www.kaggle.com/datasets/mohammadtalib786/retail-sales-dataset)
- **Records:** 1,000 transactions
- **Columns:** 9
- **License:** CC0: Public Domain

### Dataset Columns

| Column | Description |
|---|---|
| Transaction ID | Unique transaction identifier |
| Date | Transaction date |
| Customer ID | Customer identifier |
| Gender | Customer gender |
| Age | Customer age |
| Product Category | Category of purchased product |
| Quantity | Number of units purchased |
| Price per Unit | Price of one unit |
| Total Amount | Total transaction amount |

## Tools Used

- MySQL
- MySQL Workbench
- GitHub

## Project Workflow

1. Imported the retail sales CSV file into MySQL.
2. Performed data quality checks.
3. Checked for missing values, invalid dates, and duplicate transaction IDs.
4. Renamed columns and adjusted data types.
5. Performed exploratory and analytical queries.
6. Analyzed sales by gender, product category, date, and transaction value.
7. Applied advanced SQL techniques to calculate rankings, percentages, and cumulative revenue.

## SQL Concepts Practiced

### Basic SQL
- SELECT and WHERE
- ORDER BY
- DISTINCT
- LIMIT
- Aggregate functions (COUNT, SUM, AVG, MIN, MAX)

### Intermediate SQL
- GROUP BY and HAVING
- CASE statements
- Date functions
- Subqueries

### Advanced SQL
- Window functions
- RANK()
- ROW_NUMBER()
- PARTITION BY
- Cumulative calculations
- Revenue contribution analysis

## Key Findings / Results

Based on the analysis of the dataset:

- **Total Transactions:** 1,000
- **Total Revenue:** 456,000 (currency not specified in the dataset)
- **Total Quantity Sold:** 2,514 units
- **Average Transaction Amount:** 456
- **Top Revenue-Generating Category:** Electronics, with 156,905 in revenue.
- **Second Highest Revenue Category:** Clothing, with 155,580 in revenue.
- **Third Highest Revenue Category:** Beauty, with 143,515 in revenue.

These findings provide an overview of transaction activity and product category performance.

## Challenges Faced

During the project, I encountered and worked through several challenges:

- Identifying and checking invalid date values during data validation.
- Understanding how to standardize column names and adjust data types.
- Writing subqueries to solve more complex analytical questions.
- Understanding the application of window functions for ranking records.
- Calculating category-wise revenue contributions and cumulative revenue.
- Progressing from straightforward SQL queries to more challenging analytical problems.

## Knowledge Gained

Through this project, I gained practical experience in:

- Performing data exploration and data quality checks using SQL.
- Applying aggregate functions to summarize transactional data.
- Grouping and filtering data to identify meaningful patterns.
- Using subqueries to solve multi-step analytical problems.
- Applying window functions such as RANK() and ROW_NUMBER().
- Performing time-based analysis using date functions.
- Calculating cumulative revenue and percentage contributions.
- Translating SQL query results into meaningful business observations.

## Dataset Limitations

One important limitation identified during the analysis is that each customer ID appears only once in the dataset.

As a result, the dataset does not support meaningful analysis of repeat purchases, customer retention, or purchasing frequency over time.

## How to Run This Project

1. Download or clone this repository.
2. Open MySQL Workbench.
3. Execute the database creation statement included in the SQL script.
4. Import `retail_sales.csv` into a table named `retail_sales_table`.
5. Open `retail_sales_analysis.sql` in MySQL Workbench.
6. Execute the SQL statements in sequence.

**Note:** The CSV must be imported into MySQL before running the analysis queries. The SQL script assumes that the table has already been imported.

## Project Structure

```text
sql-retail-sales-analysis/
│
├── retail_sales.csv
├── retail_sales_analysis.sql
└── README.md
```

## Learning Outcome

This project helped me strengthen my SQL skills by working with a retail sales dataset and solving 37 analytical questions of increasing difficulty.

It also improved my ability to approach data-related problems systematically, write analytical queries, and extract useful insights from transactional data.

This project is part of my ongoing journey toward becoming a Machine Learning / AI Engineer.
