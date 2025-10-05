-- Day 2: Practice Exercises - Advanced Data Types and Data Insertion
-- Complete these exercises to practice advanced data types and data insertion

USE my_first_database;

-- ============================================
-- EXERCISE 1: E-COMMERCE DATABASE
-- ============================================
-- Create a comprehensive e-commerce database with advanced data types

-- 1.1 Create a 'categories' table with:
--     - id (auto increment primary key)
--     - name (varchar, not null, unique)
--     - description (text)
--     - is_active (boolean, default true)
--     - created_at (timestamp, default current timestamp)

CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 1.2 Create a 'products' table with:
--     - id (auto increment primary key)
--     - name (varchar 200, not null)
--     - description (long text)
--     - price (decimal with 2 decimal places)
--     - cost (decimal with 2 decimal places)
--     - stock_quantity (unsigned integer)
--     - min_stock_level (unsigned integer, default 10)
--     - category_id (foreign key to categories)
--     - status (enum: 'draft', 'active', 'inactive', 'discontinued')
--     - tags (set: 'featured', 'sale', 'new', 'limited', 'bestseller')
--     - weight (decimal for shipping)
--     - dimensions (varchar for LxWxH)
--     - launch_date (date)
--     - created_at (timestamp)

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    description LONGTEXT,
    price DECIMAL(10,2),
    cost DECIMAL(10,2),
    stock_quantity INT UNSIGNED,
    min_stock_level INT UNSIGNED DEFAULT 10,
    category_id INT,
    status ENUM('draft', 'active', 'inactive', 'discontinued') DEFAULT 'draft',
    tags SET('featured', 'sale', 'new', 'limited', 'bestseller'),
    weight DECIMAL(8,3),
    dimensions VARCHAR(50),
    launch_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- 1.3 Create a 'customers' table with:
--     - id (auto increment primary key)
--     - email (varchar, unique, not null)
--     - password_hash (binary 64)
--     - first_name (varchar 50)
--     - last_name (varchar 50)
--     - phone (varchar 20)
--     - date_of_birth (date)
--     - gender (enum: 'male', 'female', 'other', 'prefer_not_to_say')
--     - address (json for storing complex address data)
--     - preferences (json for storing user preferences)
--     - account_status (enum: 'active', 'inactive', 'suspended', 'deleted')
--     - email_verified (boolean, default false)
--     - created_at (timestamp)

CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(150) UNIQUE NOT NULL,
    password_hash BINARY(64),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone VARCHAR(20),
    date_of_birth DATE,
    gender ENUM('male', 'female', 'other', 'prefer_not_to_say'),
    address JSON,
    preferences JSON,
    account_status ENUM('active', 'inactive', 'suspended', 'deleted') DEFAULT 'active',
    email_verified BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================
-- EXERCISE 2: DATA INSERTION PRACTICE
-- ============================================

-- 2.1 Insert sample categories
INSERT INTO categories (name, description) VALUES
('Electronics', 'Electronic devices and accessories'),
('Clothing', 'Fashion and apparel for all ages'),
('Books', 'Books, magazines, and educational materials'),
('Home & Garden', 'Home improvement and gardening supplies'),
('Sports & Fitness', 'Sports equipment and fitness gear');

-- 2.2 Insert sample products with various data types
INSERT INTO products (name, description, price, cost, stock_quantity, category_id, status, tags, weight, dimensions, launch_date) VALUES
('iPhone 15 Pro', 'Latest Apple smartphone with advanced camera system', 999.99, 650.00, 50, 1, 'active', 'featured,new', 0.187, '14.67x7.15x0.83 cm', '2023-09-15'),
('Cotton T-Shirt', '100% organic cotton t-shirt in various colors', 29.99, 12.50, 200, 2, 'active', 'sale', 0.150, 'M: 70x55 cm', '2023-01-01'),
('JavaScript Complete Guide', 'Comprehensive guide to modern JavaScript development', 49.99, 25.00, 100, 3, 'active', 'bestseller', 0.800, '23x18x3 cm', '2023-06-01'),
('Smart Home Hub', 'Central control for all your smart home devices', 149.99, 85.00, 25, 1, 'active', 'featured,limited', 0.320, '12x12x3 cm', '2023-08-20'),
('Running Shoes', 'Professional running shoes with advanced cushioning', 129.99, 65.00, 75, 5, 'active', 'new', 0.650, 'Various sizes', '2023-09-01');

-- 2.3 Insert sample customers with JSON data
INSERT INTO customers (email, first_name, last_name, phone, date_of_birth, gender, address, preferences, account_status, email_verified) VALUES
('john.doe@email.com', 'John', 'Doe', '+1-555-0123', '1985-03-15', 'male', 
 '{"street": "123 Main St", "city": "New York", "state": "NY", "zip": "10001", "country": "USA"}',
 '{"newsletter": true, "sms_notifications": false, "language": "en", "currency": "USD"}',
 'active', TRUE),

('jane.smith@email.com', 'Jane', 'Smith', '+1-555-0456', '1990-07-22', 'female',
 '{"street": "456 Oak Ave", "city": "Los Angeles", "state": "CA", "zip": "90210", "country": "USA"}',
 '{"newsletter": false, "sms_notifications": true, "language": "en", "currency": "USD"}',
 'active', TRUE),

('mike.wilson@email.com', 'Mike', 'Wilson', '+1-555-0789', '1988-11-08', 'male',
 '{"street": "789 Pine Rd", "city": "Chicago", "state": "IL", "zip": "60601", "country": "USA"}',
 '{"newsletter": true, "sms_notifications": true, "language": "en", "currency": "USD"}',
 'active', FALSE);

-- ============================================
-- EXERCISE 3: ADVANCED INSERTION TECHNIQUES
-- ============================================

-- 3.1 Create a 'orders' table for order management
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_number VARCHAR(20) UNIQUE NOT NULL,
    customer_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('pending', 'confirmed', 'shipped', 'delivered', 'cancelled', 'returned'),
    total_amount DECIMAL(10,2),
    shipping_address JSON,
    billing_address JSON,
    notes TEXT,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- 3.2 Insert orders using different techniques
-- Using generated order numbers
INSERT INTO orders (order_number, customer_id, status, total_amount, shipping_address, billing_address, notes) VALUES
(CONCAT('ORD-', DATE_FORMAT(NOW(), '%Y%m%d'), '-', LPAD(1, 4, '0')), 1, 'delivered', 1029.98, 
 '{"street": "123 Main St", "city": "New York", "state": "NY", "zip": "10001"}',
 '{"street": "123 Main St", "city": "New York", "state": "NY", "zip": "10001"}',
 'Please deliver after 5 PM'),

(CONCAT('ORD-', DATE_FORMAT(NOW(), '%Y%m%d'), '-', LPAD(2, 4, '0')), 2, 'shipped', 79.98,
 '{"street": "456 Oak Ave", "city": "Los Angeles", "state": "CA", "zip": "90210"}',
 '{"street": "456 Oak Ave", "city": "Los Angeles", "state": "CA", "zip": "90210"}',
 'Gift wrapping requested');

-- 3.3 Create order_items table
CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT UNSIGNED,
    unit_price DECIMAL(10,2),
    total_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- 3.4 Insert order items with calculated totals
INSERT INTO order_items (order_id, product_id, quantity, unit_price, total_price) VALUES
(1, 1, 1, 999.99, 999.99 * 1),  -- iPhone
(1, 3, 1, 29.99, 29.99 * 1),    -- T-shirt
(2, 2, 2, 29.99, 29.99 * 2),    -- Two t-shirts
(2, 4, 1, 19.99, 19.99 * 1);    -- Book

-- ============================================
-- EXERCISE 4: BULK OPERATIONS
-- ============================================

-- 4.1 Insert multiple products in a single statement
INSERT INTO products (name, description, price, cost, stock_quantity, category_id, status, tags, weight, launch_date) VALUES
('Laptop Stand', 'Adjustable aluminum laptop stand', 39.99, 20.00, 100, 1, 'active', 'new', 0.800, '2023-10-01'),
('Wireless Mouse', 'Ergonomic wireless mouse with RGB lighting', 24.99, 12.00, 150, 1, 'active', 'sale', 0.120, '2023-09-15'),
('Office Chair', 'Ergonomic office chair with lumbar support', 199.99, 120.00, 30, 4, 'active', 'featured', 15.000, '2023-08-01'),
('Yoga Mat', 'Non-slip yoga mat for home workouts', 34.99, 18.00, 80, 5, 'active', 'new', 1.200, '2023-09-20'),
('Coffee Maker', 'Programmable drip coffee maker', 89.99, 45.00, 25, 4, 'active', 'bestseller', 2.500, '2023-07-15');

-- 4.2 Insert customers using INSERT IGNORE to handle duplicates
INSERT IGNORE INTO customers (email, first_name, last_name, phone, date_of_birth, gender, address, preferences, account_status) VALUES
('john.doe@email.com', 'John', 'Doe', '+1-555-0123', '1985-03-15', 'male', 
 '{"street": "123 Main St", "city": "New York", "state": "NY", "zip": "10001"}',
 '{"newsletter": true, "sms_notifications": false}', 'active'),  -- This will be ignored (duplicate)
('sarah.jones@email.com', 'Sarah', 'Jones', '+1-555-0987', '1992-05-30', 'female',
 '{"street": "321 Elm St", "city": "Boston", "state": "MA", "zip": "02101"}',
 '{"newsletter": true, "sms_notifications": true}', 'active');   -- This will be inserted

-- ============================================
-- EXERCISE 5: DATA VALIDATION AND CONSTRAINTS
-- ============================================

-- 5.1 Create a table with various constraints
CREATE TABLE product_reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    customer_id INT,
    rating TINYINT UNSIGNED CHECK (rating >= 1 AND rating <= 5),
    title VARCHAR(200),
    review_text TEXT,
    is_verified_purchase BOOLEAN DEFAULT FALSE,
    helpful_votes INT UNSIGNED DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- 5.2 Insert reviews with different constraint validations
INSERT INTO product_reviews (product_id, customer_id, rating, title, review_text, is_verified_purchase) VALUES
(1, 1, 5, 'Excellent phone!', 'Great camera quality and battery life. Highly recommended!', TRUE),
(2, 2, 4, 'Good quality t-shirt', 'Comfortable and fits well. Good value for money.', TRUE),
(1, 3, 5, 'Amazing device', 'Best phone I have ever owned. Worth every penny.', FALSE);

-- Try to insert invalid data (this should fail)
-- INSERT INTO product_reviews (product_id, customer_id, rating, title, review_text) VALUES
-- (1, 1, 6, 'Invalid rating', 'This should fail');  -- Rating > 5

-- ============================================
-- VERIFICATION QUERIES
-- ============================================

-- Show all tables created
SHOW TABLES;

-- Display record counts
SELECT 'categories' as table_name, COUNT(*) as record_count FROM categories
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'customers', COUNT(*) FROM customers
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items
UNION ALL
SELECT 'product_reviews', COUNT(*) FROM product_reviews;

-- Show sample data from each table
SELECT 'Categories:' as info;
SELECT * FROM categories LIMIT 3;

SELECT 'Products:' as info;
SELECT id, name, price, status, tags FROM products LIMIT 3;

SELECT 'Customers:' as info;
SELECT id, email, first_name, last_name, account_status FROM customers LIMIT 3;

SELECT 'Orders:' as info;
SELECT id, order_number, status, total_amount FROM orders LIMIT 3;
