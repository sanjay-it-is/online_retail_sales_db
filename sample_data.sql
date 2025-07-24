
INSERT INTO Customers (first_name, last_name, email, phone_number, street_address, city, state, zip_code, registration_date) VALUES
('John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Main St', 'Anytown', 'NY', '10001', '2023-01-15'),
('Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', '456 Oak Ave', 'Otherville', 'CA', '90210', '2023-02-20'),
('Robert', 'Johnson', 'robert.j@example.com', '555-123-4567', '789 Pine Rd', 'Villageton', 'TX', '77001', '2023-03-10'),
('Emily', 'White', 'emily.w@example.com', '111-222-3333', '101 Cedar Ln', 'Anytown', 'NY', '10001', '2023-04-01');



INSERT INTO Categories (category_name) VALUES
('Electronics'),
('Books'),
('Home Goods'),
('Apparel');



INSERT INTO Products (product_name, description, price, stock_quantity, category_id) VALUES
('Laptop Pro X1', 'High performance laptop for professionals.', 1200.00, 50, 1),      
('Smartphone Z', 'Latest model smartphone with advanced features.', 800.00, 120, 1),   
('SQL for Dummies', 'An easy guide to learning SQL.', 25.50, 200, 2),                
('Coffee Maker Deluxe', 'Programmable coffee maker with grinder.', 75.00, 80, 3),    
('Bluetooth Speaker', 'Portable speaker with great sound.', 50.00, 150, 1),          
('The Great Adventure', 'A thrilling fantasy novel.', 15.00, 300, 2);                



INSERT INTO Orders (customer_id, order_date, total_amount, order_status) VALUES
(1, '2024-05-10 10:00:00', 1225.50, 'Completed'), 
(2, '2024-05-10 11:30:00', 800.00, 'Processing'), 
(1, '2024-05-11 14:00:00', 75.00, 'Shipped'),     
(3, '2024-05-12 09:15:00', 2400.00, 'Pending'),    
(4, '2024-05-13 16:45:00', 50.00, 'Completed');   



INSERT INTO Order_Items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 1200.00), 
(1, 3, 1, 25.50),   
(2, 2, 1, 800.00),  
(3, 4, 1, 75.00),   
(4, 1, 2, 1200.00), 
(5, 5, 1, 50.00);   



INSERT INTO Payments (order_id, payment_date, amount, payment_method, transaction_id, payment_status) VALUES
(1, '2024-05-10 10:05:00', 1225.50, 'Credit Card', 'TXN001ABC', 'Completed'),
(2, '2024-05-10 11:35:00', 800.00, 'PayPal', 'TXN002DEF', 'Completed'),
(3, '2024-05-11 14:05:00', 75.00, 'UPI', 'TXN003GHI', 'Completed'),
(4, '2024-05-12 09:20:00', 2400.00, 'Credit Card', 'TXN004JKL', 'Pending'), 
(5, '2024-05-13 16:50:00', 50.00, 'Debit Card', 'TXN005MNO', 'Completed');






