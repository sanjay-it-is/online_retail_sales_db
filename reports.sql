-- Clean up 
---DROP VIEW IF EXISTS Customer_Spending_Summary;
---DROP VIEW IF EXISTS Product_Sales_Overview;
---DROP VIEW IF EXISTS Completed_Order_Details;


-- Section 1: SQL JOIN Queries for Reports

-- Query 1: Retrieve all orders with customer details
SELECT
    o.order_id,
    c.first_name,
    c.last_name,
    c.email,
    o.order_date,
    o.total_amount,
    o.order_status
FROM
    Orders o
JOIN
    Customers c ON o.customer_id = c.customer_id
ORDER BY
    o.order_date DESC;

-- Query 2: List all products included in each order

SELECT
    o.order_id,
    o.order_date,
    p.product_name,
    oi.quantity,
    oi.unit_price,
    (oi.quantity * oi.unit_price) AS item_total
FROM
    Orders o
JOIN
    Order_Items oi ON o.order_id = oi.order_id
JOIN
    Products p ON oi.product_id = p.product_id
ORDER BY
    o.order_id, p.product_name;

-- Query 3: Calculate total revenue per product category

SELECT
    cat.category_name,
    SUM(oi.quantity * oi.unit_price) AS total_category_revenue
FROM
    Categories cat
JOIN
    Products p ON cat.category_id = p.category_id
JOIN
    Order_Items oi ON p.product_id = oi.product_id
GROUP BY
    cat.category_name
ORDER BY
    total_category_revenue DESC;

-- Query 4: Find customers who have NOT placed any orders

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email
FROM
    Customers c
LEFT JOIN
    Orders o ON c.customer_id = o.customer_id
WHERE
    o.order_id IS NULL; 

-- Query 5: Get order details along with their payment method and status

SELECT
    o.order_id,
    c.first_name AS customer_first_name,
    c.last_name AS customer_last_name,
    o.order_date,
    o.total_amount,
    p.payment_method,
    p.payment_status
FROM
    Orders o
JOIN
    Customers c ON o.customer_id = c.customer_id
JOIN
    Payments p ON o.order_id = p.order_id
ORDER BY
    o.order_id;

-- Query 6: Products currently low in stock (e.g., less than 50 units)

SELECT
    product_name,
    stock_quantity
FROM
    Products
WHERE
    stock_quantity < 50
ORDER BY
    stock_quantity ASC;

-- Query 7: Top 3 best-selling products by quantity sold

SELECT
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM
    Products p
JOIN
    Order_Items oi ON p.product_id = oi.product_id
GROUP BY
    p.product_name
ORDER BY
    total_quantity_sold DESC
LIMIT 3;


-- Section 2: Database Views for Common Reports

-- View 1: Customer_Spending_Summary

CREATE VIEW Customer_Spending_Summary AS
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    COUNT(o.order_id) AS total_orders, 
    COALESCE(SUM(o.total_amount), 0) AS total_spent 
FROM
    Customers c
LEFT JOIN
    Orders o ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id, c.first_name, c.last_name, c.email
ORDER BY
    total_spent DESC;



-- How to use the view:
SELECT * FROM Customer_Spending_Summary;
SELECT * FROM Customer_Spending_Summary WHERE total_orders = 0;


-- View 2: Product_Sales_Overview

CREATE VIEW Product_Sales_Overview AS
SELECT
    p.product_id,
    p.product_name,
    cat.category_name,
    SUM(oi.quantity) AS total_quantity_sold,
    SUM(oi.quantity * oi.unit_price) AS total_revenue_from_product
FROM
    Products p
JOIN
    Categories cat ON p.category_id = cat.category_id
JOIN
    Order_Items oi ON p.product_id = oi.product_id
GROUP BY
    p.product_id, p.product_name, cat.category_name
ORDER BY
    total_revenue_from_product DESC;

-- How to use the view:
SELECT * FROM Product_Sales_Overview;
SELECT product_name, total_revenue_from_product FROM Product_Sales_Overview WHERE total_revenue_from_product > 1000;


-- View 3: Completed_Order_Details

CREATE VIEW Completed_Order_Details AS
SELECT
    o.order_id,
    c.first_name AS customer_first_name,
    c.last_name AS customer_last_name,
    o.order_date,
    o.total_amount,
    p.payment_method,
    p.payment_status,
    o.order_status
FROM
    Orders o
JOIN
    Customers c ON o.customer_id = c.customer_id
JOIN
    Payments p ON o.order_id = p.order_id
WHERE
    o.order_status = 'Completed' AND p.payment_status = 'Completed'
ORDER BY
    o.order_date DESC;

-- How to use the view:
SELECT * FROM Completed_Order_Details;
SELECT COUNT(*) FROM Completed_Order_Details;