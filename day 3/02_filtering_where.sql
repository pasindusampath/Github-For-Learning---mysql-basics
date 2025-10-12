-- Day 3: Filtering Data with WHERE Clause
-- This script covers all the ways to filter data in MySQL

USE my_first_database;

-- ============================================
-- SETUP: Create an expanded products table
-- ============================================

CREATE TABLE store_products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    description TEXT,
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT,
    is_featured BOOLEAN DEFAULT FALSE,
    is_available BOOLEAN DEFAULT TRUE,
    created_date DATE
);

-- Insert comprehensive sample data
INSERT INTO store_products (product_name, description, category, price, stock_quantity, is_featured, is_available, created_date)
VALUES 
    ('Gaming Laptop', 'High-performance gaming laptop', 'Electronics', 1299.99, 10, TRUE, TRUE, '2024-01-15'),
    ('Wireless Mouse', 'Ergonomic wireless mouse', 'Electronics', 25.99, 50, FALSE, TRUE, '2024-02-01'),
    ('Mechanical Keyboard', 'RGB mechanical keyboard', 'Electronics', 79.99, 30, TRUE, TRUE, '2024-02-15'),
    ('USB Cable', NULL, 'Electronics', 9.99, 100, FALSE, TRUE, '2024-03-01'),
    ('Cotton T-Shirt', 'Premium cotton t-shirt', 'Clothing', 19.99, 150, FALSE, TRUE, '2024-01-20'),
    ('Denim Jeans', 'Classic fit denim jeans', 'Clothing', 49.99, 75, FALSE, TRUE, '2024-02-10'),
    ('Winter Jacket', 'Warm winter jacket', 'Clothing', 129.99, 20, TRUE, TRUE, '2024-11-01'),
    ('Mystery Novel', 'Bestselling mystery novel', 'Books', 14.99, 60, TRUE, TRUE, '2024-01-05'),
    ('Python Programming', 'Learn Python from scratch', 'Books', 39.99, 40, FALSE, TRUE, '2024-02-20'),
    ('Coffee Maker', 'Automatic drip coffee maker', 'Home', 89.99, 25, FALSE, TRUE, '2024-03-01'),
    ('Blender', 'High-speed blender', 'Home', 59.99, 0, FALSE, FALSE, '2024-01-10'),
    ('Vacuum Cleaner', NULL, 'Home', 199.99, 5, FALSE, TRUE, '2024-02-05'),
    ('Basketball', 'Official size basketball', 'Sports', 29.99, 40, FALSE, TRUE, '2024-01-25'),
    ('Running Shoes', 'Lightweight running shoes', 'Sports', 89.99, 35, TRUE, TRUE, '2024-02-28'),
    ('Yoga Mat', 'Non-slip yoga mat', 'Sports', 24.99, 50, FALSE, TRUE, '2024-03-10'),
    ('Smartphone', 'Latest model smartphone', 'Electronics', 899.99, 15, TRUE, TRUE, '2024-03-15'),
    ('Tablet', '10-inch tablet', 'Electronics', 349.99, 20, FALSE, TRUE, '2024-03-20'),
    ('Headphones', 'Noise-canceling headphones', 'Electronics', 149.99, 0, TRUE, FALSE, '2024-01-30'),
    ('Summer Dress', 'Floral summer dress', 'Clothing', 39.99, 45, FALSE, TRUE, '2024-04-01'),
    ('Cookbook', 'Easy recipes for beginners', 'Books', 24.99, 30, FALSE, TRUE, '2024-03-05');

-- ============================================
-- COMPARISON OPERATORS
-- ============================================

-- Equal to (=)
SELECT product_name, price FROM store_products WHERE price = 29.99;

-- Not equal to (!= or <>)
SELECT product_name, category FROM store_products WHERE category != 'Electronics';
SELECT product_name, category FROM store_products WHERE category <> 'Electronics';

-- Greater than (>)
SELECT product_name, price FROM store_products WHERE price > 100;

-- Less than (<)
SELECT product_name, price FROM store_products WHERE price < 30;

-- Greater than or equal to (>=)
SELECT product_name, price FROM store_products WHERE price >= 100;

-- Less than or equal to (<=)
SELECT product_name, price FROM store_products WHERE price <= 50;

-- ============================================
-- LOGICAL OPERATORS: AND
-- ============================================

-- AND: All conditions must be TRUE

-- Find Electronics products under $100
SELECT product_name, category, price 
FROM store_products 
WHERE category = 'Electronics' AND price < 100;

-- Find featured products that are available
SELECT product_name, is_featured, is_available 
FROM store_products 
WHERE is_featured = TRUE AND is_available = TRUE;

-- Find Electronics products under $100 that are featured
SELECT product_name, category, price, is_featured 
FROM store_products 
WHERE category = 'Electronics' 
AND price < 100 
AND is_featured = TRUE;

-- ============================================
-- LOGICAL OPERATORS: OR
-- ============================================

-- OR: At least one condition must be TRUE

-- Find products that are either Electronics OR Books
SELECT product_name, category 
FROM store_products 
WHERE category = 'Electronics' OR category = 'Books';

-- Find products that are either featured OR under $25
SELECT product_name, price, is_featured 
FROM store_products 
WHERE is_featured = TRUE OR price < 25;

-- ============================================
-- LOGICAL OPERATORS: NOT
-- ============================================

-- NOT: Negates a condition

-- Find products that are NOT Electronics
SELECT product_name, category 
FROM store_products 
WHERE NOT category = 'Electronics';

-- Alternative way (more common)
SELECT product_name, category 
FROM store_products 
WHERE category != 'Electronics';

-- Find products that are NOT available
SELECT product_name, is_available 
FROM store_products 
WHERE NOT is_available = TRUE;
-- Or simply:
SELECT product_name, is_available 
FROM store_products 
WHERE is_available = FALSE;

-- ============================================
-- COMBINING AND & OR
-- ============================================

-- Find Electronics OR Books that cost less than $50
SELECT product_name, category, price 
FROM store_products 
WHERE (category = 'Electronics' OR category = 'Books') 
AND price < 50;

-- Find products that are (featured AND available) OR (priced under $20)
SELECT product_name, price, is_featured, is_available 
FROM store_products 
WHERE (is_featured = TRUE AND is_available = TRUE) 
OR price < 20;

-- ============================================
-- PATTERN MATCHING WITH LIKE
-- ============================================

-- % matches any sequence of characters (zero or more)
-- _ matches exactly one character

-- Find products with "phone" anywhere in the name
SELECT product_name FROM store_products WHERE product_name LIKE '%phone%';

-- Find products starting with "Coffee"
SELECT product_name FROM store_products WHERE product_name LIKE 'Coffee%';

-- Find products ending with "Shoes"
SELECT product_name FROM store_products WHERE product_name LIKE '%Shoes';

-- Find products with exactly 6 characters
SELECT product_name FROM store_products WHERE product_name LIKE '______';

-- Find products with "book" in the name (case-insensitive by default)
SELECT product_name FROM store_products WHERE product_name LIKE '%book%';

-- NOT LIKE: Find products that don't contain "er"
SELECT product_name FROM store_products WHERE product_name NOT LIKE '%er%';

-- ============================================
-- RANGE FILTERING WITH BETWEEN
-- ============================================

-- BETWEEN is inclusive (includes both boundary values)

-- Find products priced between $20 and $100
SELECT product_name, price 
FROM store_products 
WHERE price BETWEEN 20 AND 100;

-- Same as:
SELECT product_name, price 
FROM store_products 
WHERE price >= 20 AND price <= 100;

-- Find products created in February 2024
SELECT product_name, created_date 
FROM store_products 
WHERE created_date BETWEEN '2024-02-01' AND '2024-02-29';

-- NOT BETWEEN: Find products outside a price range
SELECT product_name, price 
FROM store_products 
WHERE price NOT BETWEEN 20 AND 100;

-- ============================================
-- LIST FILTERING WITH IN
-- ============================================

-- IN: Match any value in a list

-- Find products in specific categories
SELECT product_name, category 
FROM store_products 
WHERE category IN ('Electronics', 'Books', 'Sports');

-- Same as:
SELECT product_name, category 
FROM store_products 
WHERE category = 'Electronics' 
OR category = 'Books' 
OR category = 'Sports';

-- Find products with specific prices
SELECT product_name, price 
FROM store_products 
WHERE price IN (29.99, 49.99, 89.99);

-- NOT IN: Exclude specific categories
SELECT product_name, category 
FROM store_products 
WHERE category NOT IN ('Clothing', 'Home');

-- ============================================
-- NULL VALUE HANDLING
-- ============================================

-- Find products with no description
SELECT product_name, description 
FROM store_products 
WHERE description IS NULL;

-- Find products with a description
SELECT product_name, description 
FROM store_products 
WHERE description IS NOT NULL;

-- IMPORTANT: You cannot use = or != with NULL
-- WRONG: WHERE description = NULL
-- RIGHT: WHERE description IS NULL

-- ============================================
-- REAL-WORLD FILTERING SCENARIOS
-- ============================================

-- Scenario 1: Customer searches for "laptop" under $1000
SELECT product_name, price, stock_quantity 
FROM store_products 
WHERE product_name LIKE '%laptop%' 
AND price < 1000 
AND is_available = TRUE;

-- Scenario 2: Find budget-friendly featured products
SELECT product_name, category, price 
FROM store_products 
WHERE is_featured = TRUE 
AND price < 50 
AND is_available = TRUE;

-- Scenario 3: Find out-of-stock or low-stock products
SELECT product_name, stock_quantity, is_available 
FROM store_products 
WHERE stock_quantity <= 10 
OR is_available = FALSE;

-- Scenario 4: Find products in specific categories within budget
SELECT product_name, category, price 
FROM store_products 
WHERE category IN ('Electronics', 'Sports') 
AND price BETWEEN 50 AND 200 
AND is_available = TRUE;

-- Scenario 5: Find products that need descriptions
SELECT product_name, category 
FROM store_products 
WHERE description IS NULL;

-- Scenario 6: Winter shopping - find seasonal items
SELECT product_name, category, price 
FROM store_products 
WHERE (product_name LIKE '%winter%' OR product_name LIKE '%jacket%')
AND is_available = TRUE;

-- Scenario 7: Find premium products (over $100) that are featured
SELECT product_name, price, category 
FROM store_products 
WHERE price > 100 
AND is_featured = TRUE 
AND is_available = TRUE;

-- Scenario 8: Exclude specific categories and find affordable items
SELECT product_name, category, price 
FROM store_products 
WHERE category NOT IN ('Electronics', 'Home') 
AND price <= 50;

-- ============================================
-- COMPLEX FILTERING COMBINATIONS
-- ============================================

-- Complex example 1: Multiple conditions with parentheses
SELECT product_name, category, price, stock_quantity 
FROM store_products 
WHERE (category = 'Electronics' AND price < 100) 
OR (category = 'Clothing' AND stock_quantity > 50);

-- Complex example 2: Search with multiple patterns
SELECT product_name 
FROM store_products 
WHERE product_name LIKE '%phone%' 
OR product_name LIKE '%tablet%' 
OR product_name LIKE '%laptop%';

-- Complex example 3: Inventory management query
SELECT product_name, category, stock_quantity, is_available 
FROM store_products 
WHERE (stock_quantity BETWEEN 1 AND 20 OR stock_quantity = 0) 
AND category IN ('Electronics', 'Home');

-- ============================================
-- PERFORMANCE TIP: Operator Precedence
-- ============================================

/*
Operator precedence (highest to lowest):
1. Parentheses ()
2. NOT
3. AND
4. OR

Always use parentheses to make your logic clear!

Example:
WHERE A OR B AND C  -- Evaluated as: A OR (B AND C)
WHERE (A OR B) AND C  -- Clearer and often what you want
*/

-- ============================================
-- SUMMARY OF OPERATORS
-- ============================================

/*
COMPARISON OPERATORS:
=       Equal to
!=, <>  Not equal to
>       Greater than
<       Less than
>=      Greater than or equal to
<=      Less than or equal to

LOGICAL OPERATORS:
AND     All conditions must be true
OR      At least one condition must be true
NOT     Negates a condition

PATTERN MATCHING:
LIKE    Pattern matching with wildcards
%       Matches any characters (zero or more)
_       Matches exactly one character

RANGE AND LISTS:
BETWEEN x AND y    Value in range (inclusive)
IN (a, b, c)       Value matches any in list
NOT IN (a, b, c)   Value doesn't match any in list

NULL HANDLING:
IS NULL            Value is NULL
IS NOT NULL        Value is not NULL
*/

-- ============================================
-- PRACTICE EXERCISES
-- ============================================

-- Exercise 1: Find all Sports products under $50
-- ANSWER:
-- SELECT product_name, price FROM store_products 
-- WHERE category = 'Sports' AND price < 50;

-- Exercise 2: Find products with "book" in the name or in Books category
-- ANSWER:
-- SELECT product_name, category FROM store_products 
-- WHERE product_name LIKE '%book%' OR category = 'Books';

-- Exercise 3: Find available products between $25 and $75
-- ANSWER:
-- SELECT product_name, price FROM store_products 
-- WHERE is_available = TRUE AND price BETWEEN 25 AND 75;

-- Exercise 4: Find Electronics or Home products that are featured
-- ANSWER:
-- SELECT product_name, category FROM store_products 
-- WHERE category IN ('Electronics', 'Home') AND is_featured = TRUE;

-- Exercise 5: Find products without descriptions that cost more than $50
-- ANSWER:
-- SELECT product_name, price FROM store_products 
-- WHERE description IS NULL AND price > 50;

