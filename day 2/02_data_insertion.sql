-- Day 2: Data Insertion Techniques
-- This script demonstrates various ways to insert data into MySQL tables

USE my_first_database;

-- ============================================
-- BASIC INSERT STATEMENTS
-- ============================================

-- First, let's create a simple table for demonstrations
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    department VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE,
    is_active BOOLEAN DEFAULT TRUE
);

-- Method 1: INSERT INTO with column names (RECOMMENDED)
INSERT INTO employees (first_name, last_name, email, department, salary, hire_date)
VALUES ('John', 'Doe', 'john.doe@company.com', 'IT', 75000.00, '2023-01-15');

-- Method 2: INSERT INTO without column names (must provide all columns)
INSERT INTO employees 
VALUES (NULL, 'Jane', 'Smith', 'jane.smith@company.com', 'HR', 65000.00, '2023-02-20', TRUE);

-- Method 3: INSERT with DEFAULT values
INSERT INTO employees (first_name, last_name, email, department, salary, hire_date)
VALUES ('Mike', 'Johnson', 'mike.johnson@company.com', 'Finance', 70000.00, '2023-03-10');

-- ============================================
-- INSERTING MULTIPLE ROWS
-- ============================================

-- Insert multiple rows in a single statement
INSERT INTO employees (first_name, last_name, email, department, salary, hire_date)
VALUES 
    ('Sarah', 'Wilson', 'sarah.wilson@company.com', 'Marketing', 68000.00, '2023-04-05'),
    ('David', 'Brown', 'david.brown@company.com', 'IT', 80000.00, '2023-04-15'),
    ('Lisa', 'Davis', 'lisa.davis@company.com', 'HR', 62000.00, '2023-05-01'),
    ('Tom', 'Miller', 'tom.miller@company.com', 'Finance', 72000.00, '2023-05-10');

-- ============================================
-- INSERTING WITH DIFFERENT DATA TYPES
-- ============================================

-- Create a table to demonstrate different data types
CREATE TABLE product_catalog (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2),
    stock_quantity INT,
    is_featured BOOLEAN DEFAULT FALSE,
    category ENUM('Electronics', 'Clothing', 'Books', 'Home', 'Sports'),
    tags SET('sale', 'new', 'popular', 'limited'),
    launch_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert data with various data types
INSERT INTO product_catalog (product_name, description, price, stock_quantity, is_featured, category, tags, launch_date)
VALUES 
    ('Laptop Pro 15"', 'High-performance laptop for professionals', 1299.99, 25, TRUE, 'Electronics', 'new,popular', '2023-06-01'),
    ('Cotton T-Shirt', 'Comfortable 100% cotton t-shirt', 19.99, 100, FALSE, 'Clothing', 'sale', '2023-05-15'),
    ('JavaScript Guide', 'Complete guide to modern JavaScript', 49.99, 50, TRUE, 'Books', 'new,popular', '2023-06-10'),
    ('Coffee Maker', 'Automatic drip coffee maker', 89.99, 15, FALSE, 'Home', 'sale,limited', '2023-04-20');

-- ============================================
-- INSERTING WITH FUNCTIONS AND EXPRESSIONS
-- ============================================

-- Insert with MySQL functions
INSERT INTO employees (first_name, last_name, email, department, salary, hire_date)
VALUES 
    ('Alice', 'Cooper', 'alice.cooper@company.com', 'IT', 85000.00, CURDATE()),
    ('Bob', 'Taylor', 'bob.taylor@company.com', 'Marketing', 70000.00, DATE_ADD(CURDATE(), INTERVAL -30 DAY));

-- Insert with calculated values
INSERT INTO employees (first_name, last_name, email, department, salary, hire_date)
VALUES 
    ('Carol', 'White', 'carol.white@company.com', 'Finance', 75000.00 * 1.1, '2023-07-01');

-- ============================================
-- INSERT IGNORE AND ON DUPLICATE KEY UPDATE
-- ============================================

-- Create a table with unique constraint for demonstration
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    email VARCHAR(100) UNIQUE,
    full_name VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert some initial data
INSERT INTO users (username, email, full_name)
VALUES 
    ('john_doe', 'john@example.com', 'John Doe'),
    ('jane_smith', 'jane@example.com', 'Jane Smith');

-- INSERT IGNORE: Skip rows that would cause duplicate key errors
INSERT IGNORE INTO users (username, email, full_name)
VALUES 
    ('john_doe', 'john_new@example.com', 'John Doe Updated'),  -- This will be ignored
    ('mike_wilson', 'mike@example.com', 'Mike Wilson');        -- This will be inserted

-- ON DUPLICATE KEY UPDATE: Update existing rows or insert new ones
INSERT INTO users (username, email, full_name)
VALUES ('john_doe', 'john_updated@example.com', 'John Doe Updated')
ON DUPLICATE KEY UPDATE 
    email = VALUES(email),
    full_name = VALUES(full_name);

-- ============================================
-- INSERT FROM SELECT STATEMENT
-- ============================================

-- Create a backup table
CREATE TABLE employees_backup (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE,
    is_active BOOLEAN,
    backup_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert data from existing table
INSERT INTO employees_backup (first_name, last_name, email, department, salary, hire_date, is_active)
SELECT first_name, last_name, email, department, salary, hire_date, is_active 
FROM employees 
WHERE department = 'IT';

-- ============================================
-- INSERTING WITH NULL VALUES
-- ============================================

-- Insert with explicit NULL values
INSERT INTO employees (first_name, last_name, email, department, salary, hire_date)
VALUES ('Frank', 'Green', NULL, 'Sales', NULL, '2023-08-01');

-- Insert with missing columns (will be NULL if no DEFAULT)
INSERT INTO employees (first_name, last_name, department)
VALUES ('Grace', 'Lee', 'Marketing');

-- ============================================
-- BULK INSERT FROM CSV (PREPARATION)
-- ============================================

-- Create table for bulk import example
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    city VARCHAR(50),
    country VARCHAR(50),
    registration_date DATE,
    total_orders INT DEFAULT 0
);

-- Example of how to prepare for LOAD DATA INFILE (for CSV import)
-- Note: This would typically be used with a CSV file
-- LOAD DATA INFILE 'customers.csv'
-- INTO TABLE customers
-- FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS
-- (customer_name, email, phone, city, country, registration_date, total_orders);

-- ============================================
-- VERIFYING INSERTED DATA
-- ============================================

-- View all data in employees table
SELECT * FROM employees;

-- View all data in product_catalog table
SELECT * FROM product_catalog;

-- View all data in users table
SELECT * FROM users;

-- View all data in employees_backup table
SELECT * FROM employees_backup;

-- Count records in each table
SELECT 
    'employees' as table_name, COUNT(*) as record_count FROM employees
UNION ALL
SELECT 
    'product_catalog' as table_name, COUNT(*) as record_count FROM product_catalog
UNION ALL
SELECT 
    'users' as table_name, COUNT(*) as record_count FROM users
UNION ALL
SELECT 
    'employees_backup' as table_name, COUNT(*) as record_count FROM employees_backup;

-- ============================================
-- COMMON INSERT ERRORS AND SOLUTIONS
-- ============================================

-- Error 1: Duplicate key error
-- INSERT INTO users (username, email, full_name)
-- VALUES ('john_doe', 'duplicate@example.com', 'Duplicate User');  -- This will fail

-- Solution: Use INSERT IGNORE or ON DUPLICATE KEY UPDATE
INSERT IGNORE INTO users (username, email, full_name)
VALUES ('john_doe', 'duplicate@example.com', 'Duplicate User');

-- Error 2: NOT NULL constraint violation
-- INSERT INTO employees (last_name, email, department, salary, hire_date)
-- VALUES ('Test', 'test@example.com', 'IT', 50000.00, '2023-01-01');  -- Missing first_name

-- Solution: Provide all NOT NULL columns
INSERT INTO employees (first_name, last_name, email, department, salary, hire_date)
VALUES ('Test', 'Test', 'test@example.com', 'IT', 50000.00, '2023-01-01');
