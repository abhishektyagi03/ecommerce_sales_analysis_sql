# 🛒 E-Commerce Sales Analysis — SQL Project

## 📌 Project Overview

This project focuses on analyzing **e-commerce order and sales data using SQL** to extract meaningful business insights related to revenue, product categories, regions, quantities, discounts, payment methods, delivery performance, and customer ratings.

The project demonstrates practical SQL skills including **data exploration, filtering, aggregation, grouping, sorting, conditional analysis, subqueries, and business-focused analytical queries**.

---

## 🎯 Project Objective

The main objective of this project is to analyze e-commerce order data and answer important business questions such as:

* What is the total revenue generated?
* Which product category generates the highest revenue?
* Which region has the highest sales?
* What is the average order value?
* Which payment method is most commonly used?
* How do discounts affect revenue?
* What is the average delivery time by region?
* Which product categories receive the highest customer ratings?
* What are the top-performing orders by revenue?
* What factors are associated with higher sales and customer satisfaction?

---

## 📊 Dataset

The dataset contains e-commerce order, customer, sales, delivery, and rating information. The fields analyzed in this project are:

| Column             | Description                          |
| ------------------ | ------------------------------------ |
| `order_id`         | Unique order identifier              |
| `order_date`       | Date on which the order was placed   |
| `customer_id`      | Unique customer identifier           |
| `product_category` | Category of the purchased product    |
| `region`           | Geographic region of the order       |
| `quantity`         | Number of units purchased            |
| `unit_price`       | Price per unit                       |
| `discount`         | Discount applied to the order        |
| `payment_method`   | Payment method used by the customer  |
| `delivery_days`    | Number of days required for delivery |
| `customer_rating`  | Customer rating for the order        |
| `revenue`          | Revenue generated from the order     |

---

## 🛠️ Technologies Used

* **SQL**
* **MySQL**
* **GitHub**
* **CSV Dataset**

---

## 🧠 SQL Concepts Used

This project covers several important SQL concepts:

* `SELECT`
* `WHERE`
* `ORDER BY`
* `GROUP BY`
* `HAVING`
* `DISTINCT`
* `CASE`
* Aggregate Functions

  * `COUNT()`
  * `SUM()`
  * `AVG()`
  * `MIN()`
  * `MAX()`
* Conditional Filtering
* Subqueries
* Data Aggregation
* Performance Analysis
* Business Intelligence Queries

---

## 🔍 Key Business Questions

### Q1. What is the total revenue generated from all orders?

### Q2. What is the average revenue per order?

### Q3. Which product category generates the highest revenue?

### Q4. Which region has the highest total revenue?

### Q5. Which payment method is most frequently used?

### Q6. What is the average delivery time for each region?

### Q7. Which product category has the highest average customer rating?

### Q8. How does discount affect revenue?

### Q9. What are the top 10 orders by revenue?

### Q10. What factors are associated with higher revenue and customer satisfaction?

---

## 📈 Example SQL Analysis

### Total Revenue

```sql
SELECT
    SUM(revenue) AS Total_Revenue
FROM e_commerce_sales_analysis;
```

### Revenue by Product Category

```sql
SELECT
    product_category,
    SUM(revenue) AS Total_Revenue
FROM e_commerce_sales_analysis
GROUP BY product_category
ORDER BY Total_Revenue DESC;
```

### Revenue by Region

```sql
SELECT
    region,
    SUM(revenue) AS Total_Revenue
FROM e_commerce_sales_analysis
GROUP BY region
ORDER BY Total_Revenue DESC;
```

### Top 10 Orders by Revenue

```sql
SELECT
    order_id,
    order_date,
    product_category,
    region,
    revenue
FROM e_commerce_sales_analysis
ORDER BY revenue DESC
LIMIT 10;
```

### Average Customer Rating by Product Category

```sql
SELECT
    product_category,
    AVG(customer_rating) AS Average_Rating
FROM e_commerce_sales_analysis
GROUP BY product_category
ORDER BY Average_Rating DESC;
```

---

## 📂 Project Structure

```text
E-Commerce-Sales-SQL-Analysis/
│
├── e_commerce_sales_analysis.sql
├── e_commerce_sales_dataset.csv
├── README.md
└── project_screenshot.png
```

---

## 💡 Key Insights

The analysis can help identify:

* Overall revenue and average order value.
* Top-performing product categories.
* Regional sales performance.
* Customer purchasing patterns.
* Most-used payment methods.
* The relationship between discounts and revenue.
* Delivery performance across regions.
* Customer satisfaction across product categories.

---

## 🚀 How to Run the Project

### Step 1 — Download the Repository

Clone the repository using:

```bash
git clone https://github.com/your-username/E-Commerce-Sales-SQL-Analysis.git
```

### Step 2 — Open MySQL

Open **MySQL Workbench** or another MySQL-compatible SQL environment.

### Step 3 — Create/Select Database

```sql
CREATE DATABASE ecommerce_analysis;

USE ecommerce_analysis;
```

### Step 4 — Create the Table

Run the table creation query from:

```text
e_commerce_sales_analysis.sql
```

### Step 5 — Import Dataset

Import the student performance CSV dataset into the table:

```text
e_commerce_sales_analysis
```

### Step 6 — Run Analysis Queries

Execute the analytical SQL queries provided in the SQL file.

---

## 📌 Project Highlights

✅ Real-world e-commerce sales analysis
✅ 10+ business-focused SQL questions
✅ Revenue and sales analysis
✅ Product category and regional analysis
✅ Customer rating analysis
✅ Discount and delivery analysis
✅ Conditional categorization using `CASE`
✅ Beginner-to-intermediate SQL concepts
✅ Portfolio-ready Data Analyst project

---

## 👨‍💻 Author

### Abhishek Tyagi

**MCA | Aspiring Data Analyst / Data Scientist**

Skills:

`SQL` `Python` `Excel` `Power BI` `Pandas` `NumPy` `Data Analysis`

---

## ⭐ If You Like This Project

If you find this project useful, consider giving the repository a **⭐ Star** on GitHub.

---

## 📜 License

This project is created for **educational and portfolio purposes**.
