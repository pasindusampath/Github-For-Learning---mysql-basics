-- Day 3: Basic SELECT Statements
-- This script introduces you to retrieving data from MySQL tables

USE my_first_database;

-- ============================================
-- SETUP: Create a simple products table
-- ============================================

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT,
    is_available BOOLEAN DEFAULT TRUE
);

-- Insert sample data to work with
INSERT INTO products (product_name, category, price, stock_quantity, is_available)
VALUES 
    ('Laptop', 'Electronics', 899.99, 15, TRUE),
    ('Mouse', 'Electronics', 25.99, 50, TRUE),
    ('Keyboard', 'Electronics', 79.99, 30, TRUE),
    ('T-Shirt', 'Clothing', 19.99, 100, TRUE),
    ('Jeans', 'Clothing', 49.99, 75, TRUE),
    ('Novel Book', 'Books', 14.99, 40, TRUE),
    ('Coffee Maker', 'Home', 89.99, 20, TRUE),
    ('Blender', 'Home', 59.99, 0, FALSE),
    ('Basketball', 'Sports', 29.99, 25, TRUE),
    ('Running Shoes', 'Sports', 79.99, 35, TRUE);

-- ============================================
-- BASIC SELECT: GET ALL DATA
-- ============================================

-- Select everything from the products table
-- The asterisk (*) means "all columns"
SELECT * FROM products;

-- This shows: id, product_name, category, price, stock_quantity, is_available

-- ============================================
-- SELECT SPECIFIC COLUMNS
-- ============================================

-- Select just the product names
SELECT product_name FROM products;

-- Select product name and price
SELECT product_name, price FROM products;

-- Select multiple specific columns
SELECT product_name, category, price, stock_quantity FROM products;

-- You control the order of columns in output
SELECT price, product_name, category FROM products;

-- ============================================
-- COLUMN ALIASES (Making Output Readable)
-- ============================================

-- Use AS to give columns a different name in the output
SELECT 
    product_name AS 'Product',
    price AS 'Price ($)',
    stock_quantity AS 'In Stock'
FROM products;

-- Alias without AS keyword (also works)
SELECT 
    product_name 'Product Name',
    price 'Price',
    category 'Category'
FROM products;

-- Useful for calculated columns (we'll learn more later)
SELECT 
    product_name AS 'Product',
    price AS 'Original Price',
    price * 0.9 AS 'Sale Price (10% off)'
FROM products;

-- ============================================
-- SIMPLE WHERE CLAUSE (Introduction to Filtering)
-- ============================================

-- Get products that cost exactly $79.99
SELECT * FROM products WHERE price = 79.99;

-- Get products in the Electronics category
SELECT * FROM products WHERE category = 'Electronics';

-- Get products that are available
SELECT * FROM products WHERE is_available = TRUE;

-- Combine SELECT specific columns with WHERE
SELECT product_name, price 
FROM products 
WHERE category = 'Electronics';

-- ============================================
-- UNDERSTANDING THE BASICS
-- ============================================

/*
Basic SELECT Syntax:

SELECT column1, column2, ...
FROM table_name
WHERE condition;

Components:
1. SELECT - tells MySQL what columns you want
2. FROM - tells MySQL which table to get data from
3. WHERE - tells MySQL which rows to include (optional)

Think of it like:
- SELECT = "What do I want to see?"
- FROM = "Where is it stored?"
- WHERE = "Which ones do I want?"
*/

-- ============================================
-- PRACTICE EXAMPLES
-- ============================================

-- Example 1: See all product names
SELECT product_name FROM products;

-- Example 2: See product names and prices for Electronics
SELECT product_name, price 
FROM products 
WHERE category = 'Electronics';

-- Example 3: See available products with their stock
SELECT product_name, stock_quantity 
FROM products 
WHERE is_available = TRUE;

-- Example 4: See all product information for Clothing
SELECT * 
FROM products 
WHERE category = 'Clothing';

-- ============================================
-- VIEWING TABLE STRUCTURE
-- ============================================

-- See the structure of the products table
DESCRIBE products;
-- or
DESC products;

-- This shows:
-- - Field names
-- - Data types
-- - NULL allowed
-- - Key information
-- - Default values

-- See how the table was created
SHOW CREATE TABLE products;

-- ============================================
-- COUNTING ROWS (Preview of aggregate functions)
-- ============================================

-- How many products do we have?
SELECT COUNT(*) FROM products;

-- How many Electronics products?
SELECT COUNT(*) FROM products WHERE category = 'Electronics';

-- How many categories do we have?
SELECT DISTINCT category FROM products;

-- ============================================
-- REAL-WORLD SCENARIOS
-- ============================================

-- Scenario 1: Customer wants to see all available products
SELECT product_name, category, price 
FROM products 
WHERE is_available = TRUE;

-- Scenario 2: Store manager wants to check Electronics inventory
SELECT product_name, price, stock_quantity 
FROM products 
WHERE category = 'Electronics';

-- Scenario 3: Website needs to display all product names for a dropdown
SELECT id, product_name FROM products;

-- Scenario 4: Admin wants to see complete product catalog
SELECT 
    id AS 'Product ID',
    product_name AS 'Name',
    category AS 'Category',
    price AS 'Price',
    stock_quantity AS 'Stock',
    is_available AS 'Available'
FROM products;

-- ============================================
-- KEY TAKEAWAYS
-- ============================================

/*
✅ SELECT * gets all columns
✅ SELECT column1, column2 gets specific columns
✅ FROM specifies which table to query
✅ WHERE filters which rows to return
✅ AS creates column aliases for better readability
✅ String values use single quotes: 'Electronics'
✅ Numbers don't use quotes: 79.99
✅ Boolean values: TRUE or FALSE

Common Pattern:
SELECT what_you_want
FROM where_its_stored
WHERE filtering_condition;
*/

-- ============================================
-- EXERCISES FOR YOU TO TRY
-- ============================================

-- Exercise 1: Select only product names and categories
-- (Try it yourself before looking at the answer below)

-- ANSWER:
-- SELECT product_name, category FROM products;

-- Exercise 2: Select all Sports products
-- ANSWER:
-- SELECT * FROM products WHERE category = 'Sports';

-- Exercise 3: Select product names and prices, showing price with a "Cost" alias
-- ANSWER:
-- SELECT product_name, price AS 'Cost' FROM products;

-- Exercise 4: Select available products from the Books category
-- ANSWER:
-- SELECT * FROM products WHERE category = 'Books' AND is_available = TRUE;

