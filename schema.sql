DROP TABLE IF EXISTS Payments CASCADE; 
DROP TABLE IF EXISTS Order_Items CASCADE;
DROP TABLE IF EXISTS Orders CASCADE;
DROP TABLE IF EXISTS Products CASCADE;
DROP TABLE IF EXISTS Categories CASCADE;
DROP TABLE IF EXISTS Customers CASCADE;



CREATE TABLE Customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE, 
    phone_number VARCHAR(20),
    street_address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    zip_code VARCHAR(10),
    registration_date DATE DEFAULT CURRENT_DATE 
);


CREATE TABLE Categories (
    category_id SERIAL PRIMARY KEY, 
    category_name VARCHAR(100) NOT NULL UNIQUE 
);


CREATE TABLE Products (
    product_id SERIAL PRIMARY KEY, 
    product_name VARCHAR(255) NOT NULL UNIQUE, 
    description TEXT, 
    price DECIMAL(10, 2) NOT NULL CHECK (price >= 0), 
    stock_quantity INT NOT NULL CHECK (stock_quantity >= 0), 
    category_id INT NOT NULL, 
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);


CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY, 
    customer_id INT NOT NULL, 
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    total_amount DECIMAL(10, 2) NOT NULL CHECK (total_amount >= 0),
    order_status VARCHAR(50) NOT NULL DEFAULT 'Pending' CHECK (order_status IN ('Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled', 'Refunded', 'Completed')), 
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);


CREATE TABLE Order_Items (
    order_item_id SERIAL PRIMARY KEY, 
    order_id INT NOT NULL, 
    product_id INT NOT NULL, 
    quantity INT NOT NULL CHECK (quantity > 0), 
    unit_price DECIMAL(10, 2) NOT NULL CHECK (unit_price >= 0), 
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE, 
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


CREATE TABLE Payments (
    payment_id SERIAL PRIMARY KEY, 
    order_id INT NOT NULL UNIQUE, 
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    amount DECIMAL(10, 2) NOT NULL CHECK (amount >= 0), 
    payment_method VARCHAR(50) NOT NULL CHECK (payment_method IN ('Credit Card', 'Debit Card', 'PayPal', 'UPI', 'Bank Transfer', 'Cash')), 
    transaction_id VARCHAR(255) UNIQUE, 
    payment_status VARCHAR(50) NOT NULL DEFAULT 'Pending' CHECK (payment_status IN ('Completed', 'Failed', 'Pending', 'Refunded')), 
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE 
);






