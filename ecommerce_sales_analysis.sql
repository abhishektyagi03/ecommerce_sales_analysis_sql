-- What are the total orders, customers, quantity sold, revenue, and average order value?

SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    SUM(quantity) AS total_quantity_sold,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(revenue) / COUNT(DISTINCT order_id), 2) AS average_order_value
FROM ecommerce_sales;


-- Who are the Top 10 customers by revenue?
SELECT
    customer_id,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM ecommerce_sales
GROUP BY customer_id
ORDER BY total_revenue DESC
LIMIT 10;


-- Which product categories generate the highest revenue?
SELECT
    product_category,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM ecommerce_sales
GROUP BY product_category
ORDER BY total_revenue DESC;


-- Which regions generate the highest sales?
SELECT
    region,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(AVG(revenue), 2) AS average_order_value
FROM ecommerce_sales
GROUP BY region
ORDER BY total_revenue DESC;


-- What is the monthly revenue and order trend?
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM ecommerce_sales
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month;


-- Which payment method is most frequently used?
SELECT
    payment_method,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM ecommerce_sales
GROUP BY payment_method
ORDER BY total_orders DESC;
-- What is the average customer rating for each product category?
SELECT
    product_category,
    ROUND(AVG(customer_rating), 2) AS average_rating,
    COUNT(DISTINCT order_id) AS total_orders
FROM ecommerce_sales
GROUP BY product_category
ORDER BY average_rating DESC;


-- Which regions have the highest average delivery time?
SELECT
    region,
    ROUND(AVG(delivery_days), 2) AS average_delivery_days,
    MIN(delivery_days) AS minimum_delivery_days,
    MAX(delivery_days) AS maximum_delivery_days
FROM ecommerce_sales
GROUP BY region
ORDER BY average_delivery_days DESC;


-- What are the Top 10 highest-value orders?
SELECT
    order_id,
    order_date,
    customer_id,
    product_category,
    region,
    quantity,
    unit_price,
    discount,
    revenue
FROM ecommerce_sales
ORDER BY revenue DESC
LIMIT 10;


-- Which customers are repeat customers?
SELECT
    customer_id,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM ecommerce_sales
GROUP BY customer_id
HAVING COUNT(DISTINCT order_id) > 1
ORDER BY total_orders DESC;
-- What percentage of total revenue comes from each product category?
SELECT
    product_category,
    ROUND(SUM(revenue), 2) AS category_revenue,
    ROUND(
        SUM(revenue) * 100 /
        (SELECT SUM(revenue) FROM ecommerce_sales),
        2
    ) AS revenue_percentage
FROM ecommerce_sales
GROUP BY product_category
ORDER BY category_revenue DESC;


-- Does discount level affect revenue?
SELECT
    CASE
        WHEN discount = 0 THEN 'No Discount'
        WHEN discount < 0.10 THEN 'Low Discount'
        WHEN discount < 0.25 THEN 'Medium Discount'
        ELSE 'High Discount'
    END AS discount_category,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(AVG(discount) * 100, 2) AS average_discount_percentage,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(AVG(revenue), 2) AS average_order_value
FROM ecommerce_sales
GROUP BY
    CASE
        WHEN discount = 0 THEN 'No Discount'
        WHEN discount < 0.10 THEN 'Low Discount'
        WHEN discount < 0.25 THEN 'Medium Discount'
        ELSE 'High Discount'
    END
ORDER BY total_revenue DESC;


-- Which product categories have above-average revenue?
SELECT
    product_category,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM ecommerce_sales
GROUP BY product_category
HAVING SUM(revenue) >
(
    SELECT AVG(category_revenue)
    FROM
    (
        SELECT SUM(revenue) AS category_revenue
        FROM ecommerce_sales
        GROUP BY product_category
    ) AS category_summary
)
ORDER BY total_revenue DESC;


-- What is the cumulative monthly revenue?
WITH monthly_sales AS
(
    SELECT
        DATE_FORMAT(order_date, '%Y-%m') AS month,
        SUM(revenue) AS monthly_revenue
    FROM ecommerce_sales
    GROUP BY DATE_FORMAT(order_date, '%Y-%m')
)
SELECT
    month,
    ROUND(monthly_revenue, 2) AS monthly_revenue,
    ROUND(
        SUM(monthly_revenue) OVER (
            ORDER BY month
        ),
        2
    ) AS cumulative_revenue
FROM monthly_sales
ORDER BY month;


-- Which high-revenue orders have low customer satisfaction?
SELECT
    order_id,
    customer_id,
    product_category,
    region,
    revenue,
    customer_rating,
    delivery_days
FROM ecommerce_sales
WHERE customer_rating <= 3
AND revenue >
(
    SELECT AVG(revenue)
    FROM ecommerce_sales
)
ORDER BY revenue DESC;