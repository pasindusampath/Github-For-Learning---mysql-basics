-- Day 3: Practice Exercises - Filtering and Retrieving Products
-- Put your skills to the test with real-world scenarios!

USE my_first_database;

-- ============================================
-- SETUP: Create a complete e-commerce database
-- ============================================

CREATE TABLE products_catalog (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    description TEXT,
    category VARCHAR(50),
    subcategory VARCHAR(50),
    brand VARCHAR(50),
    price DECIMAL(10,2),
    original_price DECIMAL(10,2),
    discount_percent INT DEFAULT 0,
    stock_quantity INT DEFAULT 0,
    min_stock_level INT DEFAULT 5,
    is_featured BOOLEAN DEFAULT FALSE,
    is_on_sale BOOLEAN DEFAULT FALSE,
    is_available BOOLEAN DEFAULT TRUE,
    is_new_arrival BOOLEAN DEFAULT FALSE,
    rating DECIMAL(3,2),
    reviews_count INT DEFAULT 0,
    created_date DATE,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert realistic e-commerce data
INSERT INTO products_catalog (
    product_name, description, category, subcategory, brand, price, original_price, 
    discount_percent, stock_quantity, min_stock_level, is_featured, is_on_sale, 
    is_available, is_new_arrival, rating, reviews_count, created_date
) VALUES 
    -- Electronics
    ('MacBook Pro 16"', 'Powerful laptop for professionals', 'Electronics', 'Laptops', 'Apple', 2499.99, 2499.99, 0, 8, 5, TRUE, FALSE, TRUE, TRUE, 4.8, 342, '2024-03-15'),
    ('Dell XPS 15', 'Premium Windows laptop', 'Electronics', 'Laptops', 'Dell', 1799.99, 1999.99, 10, 12, 5, TRUE, TRUE, TRUE, FALSE, 4.6, 256, '2024-01-20'),
    ('Gaming Laptop RTX 4060', 'High-performance gaming', 'Electronics', 'Laptops', 'ASUS', 1299.99, 1499.99, 13, 15, 5, FALSE, TRUE, TRUE, FALSE, 4.5, 189, '2024-02-10'),
    ('Budget Laptop', 'Basic computing needs', 'Electronics', 'Laptops', 'HP', 449.99, 449.99, 0, 25, 10, FALSE, FALSE, TRUE, FALSE, 4.2, 98, '2024-01-15'),
    
    ('iPhone 15 Pro', 'Latest smartphone from Apple', 'Electronics', 'Smartphones', 'Apple', 999.99, 999.99, 0, 20, 10, TRUE, FALSE, TRUE, TRUE, 4.7, 567, '2024-03-20'),
    ('Samsung Galaxy S24', 'Flagship Android phone', 'Electronics', 'Smartphones', 'Samsung', 899.99, 999.99, 10, 18, 10, TRUE, TRUE, TRUE, TRUE, 4.6, 423, '2024-03-18'),
    ('Google Pixel 8', 'Pure Android experience', 'Electronics', 'Smartphones', 'Google', 699.99, 799.99, 13, 22, 10, FALSE, TRUE, TRUE, FALSE, 4.5, 312, '2024-02-25'),
    ('Budget Smartphone', 'Affordable smartphone', 'Electronics', 'Smartphones', 'Motorola', 199.99, 199.99, 0, 45, 15, FALSE, FALSE, TRUE, FALSE, 4.0, 156, '2024-01-10'),
    
    ('Sony WH-1000XM5', 'Premium noise-canceling headphones', 'Electronics', 'Audio', 'Sony', 349.99, 399.99, 13, 30, 10, TRUE, TRUE, TRUE, FALSE, 4.9, 891, '2024-01-05'),
    ('AirPods Pro', 'Wireless earbuds with ANC', 'Electronics', 'Audio', 'Apple', 249.99, 249.99, 0, 40, 15, TRUE, FALSE, TRUE, FALSE, 4.7, 678, '2024-02-01'),
    ('JBL Bluetooth Speaker', 'Portable waterproof speaker', 'Electronics', 'Audio', 'JBL', 79.99, 99.99, 20, 50, 20, FALSE, TRUE, TRUE, FALSE, 4.4, 234, '2024-01-18'),
    ('Wired Earbuds', 'Basic earbuds', 'Electronics', 'Audio', 'Generic', 9.99, 9.99, 0, 100, 30, FALSE, FALSE, TRUE, FALSE, 3.8, 45, '2023-12-01'),
    
    -- Clothing
    ('Premium Cotton T-Shirt', '100% organic cotton', 'Clothing', 'Tops', 'Nike', 29.99, 29.99, 0, 200, 50, FALSE, FALSE, TRUE, FALSE, 4.3, 167, '2024-02-15'),
    ('Graphic T-Shirt', 'Cool graphic design', 'Clothing', 'Tops', 'Adidas', 24.99, 34.99, 29, 150, 40, FALSE, TRUE, TRUE, FALSE, 4.1, 89, '2024-01-20'),
    ('Plain White Tee', 'Classic white t-shirt', 'Clothing', 'Tops', 'Hanes', 12.99, 12.99, 0, 300, 100, FALSE, FALSE, TRUE, FALSE, 4.0, 234, '2023-11-10'),
    
    ('Slim Fit Jeans', 'Modern slim fit', 'Clothing', 'Bottoms', "Levi's", 69.99, 89.99, 22, 80, 30, FALSE, TRUE, TRUE, FALSE, 4.5, 345, '2024-01-05'),
    ('Cargo Pants', 'Utility cargo pants', 'Clothing', 'Bottoms', 'Carhartt', 54.99, 54.99, 0, 60, 20, FALSE, FALSE, TRUE, FALSE, 4.2, 123, '2024-02-10'),
    ('Athletic Shorts', 'Breathable workout shorts', 'Clothing', 'Bottoms', 'Under Armour', 34.99, 44.99, 22, 120, 40, FALSE, TRUE, TRUE, FALSE, 4.3, 178, '2024-03-01'),
    
    ('Winter Parka', 'Warm winter coat', 'Clothing', 'Outerwear', 'North Face', 249.99, 249.99, 0, 15, 10, TRUE, FALSE, TRUE, TRUE, 4.8, 234, '2023-10-15'),
    ('Rain Jacket', 'Waterproof rain jacket', 'Clothing', 'Outerwear', 'Columbia', 89.99, 119.99, 25, 35, 15, FALSE, TRUE, TRUE, FALSE, 4.4, 156, '2023-11-20'),
    ('Hoodie', 'Comfortable pullover hoodie', 'Clothing', 'Outerwear', 'Champion', 39.99, 49.99, 20, 100, 30, FALSE, TRUE, TRUE, FALSE, 4.2, 267, '2024-01-15'),
    
    -- Books
    ('The Midnight Library', 'Fiction bestseller', 'Books', 'Fiction', 'Penguin', 16.99, 16.99, 0, 45, 10, TRUE, FALSE, TRUE, FALSE, 4.6, 5678, '2024-01-10'),
    ('Atomic Habits', 'Self-improvement guide', 'Books', 'Self-Help', 'Penguin', 18.99, 18.99, 0, 60, 15, TRUE, FALSE, TRUE, FALSE, 4.8, 8934, '2023-12-01'),
    ('Python Crash Course', 'Programming for beginners', 'Books', 'Technology', "O'Reilly", 39.99, 39.99, 0, 30, 10, FALSE, FALSE, TRUE, FALSE, 4.7, 1234, '2024-02-05'),
    ('The Art of War', 'Classic strategy book', 'Books', 'Classics', 'Dover', 8.99, 8.99, 0, 100, 20, FALSE, FALSE, TRUE, FALSE, 4.5, 3456, '2023-10-10'),
    ('Cookbook Collection', '500 easy recipes', 'Books', 'Cooking', 'Better Homes', 24.99, 29.99, 17, 40, 10, FALSE, TRUE, TRUE, FALSE, 4.3, 678, '2024-01-20'),
    
    -- Home
    ('Dyson V15 Vacuum', 'Cordless stick vacuum', 'Home', 'Appliances', 'Dyson', 649.99, 649.99, 0, 10, 5, TRUE, FALSE, TRUE, TRUE, 4.7, 234, '2024-03-10'),
    ('KitchenAid Mixer', 'Stand mixer', 'Home', 'Appliances', 'KitchenAid', 379.99, 449.99, 16, 15, 5, TRUE, TRUE, TRUE, FALSE, 4.8, 567, '2024-01-15'),
    ('Instant Pot', 'Multi-cooker', 'Home', 'Appliances', 'Instant Pot', 99.99, 129.99, 23, 25, 10, FALSE, TRUE, TRUE, FALSE, 4.6, 1234, '2023-11-20'),
    ('Coffee Maker', 'Drip coffee maker', 'Home', 'Appliances', 'Mr. Coffee', 39.99, 49.99, 20, 40, 15, FALSE, TRUE, TRUE, FALSE, 4.2, 345, '2024-01-05'),
    ('Toaster', '4-slice toaster', 'Home', 'Appliances', 'Cuisinart', 49.99, 49.99, 0, 30, 10, FALSE, FALSE, TRUE, FALSE, 4.1, 178, '2024-02-01'),
    
    ('Memory Foam Pillow', 'Ergonomic pillow', 'Home', 'Bedding', 'Tempur-Pedic', 79.99, 99.99, 20, 50, 20, FALSE, TRUE, TRUE, FALSE, 4.5, 456, '2024-01-10'),
    ('Bed Sheets Set', 'Egyptian cotton sheets', 'Home', 'Bedding', 'Brooklinen', 129.99, 129.99, 0, 35, 15, TRUE, FALSE, TRUE, FALSE, 4.6, 234, '2024-02-15'),
    ('Comforter', 'All-season comforter', 'Home', 'Bedding', 'Linenspa', 59.99, 79.99, 25, 45, 20, FALSE, TRUE, TRUE, FALSE, 4.3, 567, '2024-01-20'),
    
    -- Sports
    ('Yoga Mat', 'Non-slip exercise mat', 'Sports', 'Fitness', 'Manduka', 34.99, 34.99, 0, 80, 30, FALSE, FALSE, TRUE, FALSE, 4.4, 345, '2024-01-15'),
    ('Dumbbells Set', 'Adjustable dumbbells', 'Sports', 'Fitness', 'Bowflex', 299.99, 349.99, 14, 20, 10, TRUE, TRUE, TRUE, FALSE, 4.7, 456, '2024-02-10'),
    ('Resistance Bands', 'Set of 5 bands', 'Sports', 'Fitness', 'TheraBand', 19.99, 24.99, 20, 100, 30, FALSE, TRUE, TRUE, FALSE, 4.2, 234, '2024-01-05'),
    ('Exercise Ball', 'Stability ball', 'Sports', 'Fitness', 'Gaiam', 24.99, 24.99, 0, 60, 20, FALSE, FALSE, TRUE, FALSE, 4.1, 167, '2024-02-01'),
    
    ('Basketball', 'Official size basketball', 'Sports', 'Outdoor', 'Spalding', 29.99, 29.99, 0, 50, 20, FALSE, FALSE, TRUE, FALSE, 4.5, 234, '2024-01-20'),
    ('Soccer Ball', 'Professional soccer ball', 'Sports', 'Outdoor', 'Adidas', 34.99, 39.99, 13, 40, 15, FALSE, TRUE, TRUE, FALSE, 4.4, 189, '2024-02-05'),
    ('Tennis Racket', 'Beginner tennis racket', 'Sports', 'Outdoor', 'Wilson', 79.99, 79.99, 0, 25, 10, FALSE, FALSE, TRUE, FALSE, 4.3, 123, '2024-01-10'),
    
    ('Running Shoes', 'Lightweight running shoes', 'Sports', 'Footwear', 'Nike', 119.99, 139.99, 14, 45, 20, TRUE, TRUE, TRUE, FALSE, 4.6, 678, '2024-03-01'),
    ('Training Shoes', 'Cross-training shoes', 'Sports', 'Footwear', 'Reebok', 89.99, 89.99, 0, 35, 15, FALSE, FALSE, TRUE, FALSE, 4.3, 234, '2024-02-15'),
    ('Hiking Boots', 'Waterproof hiking boots', 'Sports', 'Footwear', 'Merrell', 149.99, 169.99, 12, 28, 10, TRUE, TRUE, TRUE, TRUE, 4.7, 345, '2024-03-05');

-- View all the data
SELECT * FROM products_catalog;

-- ============================================
-- EXERCISE SET 1: BASIC FILTERING (Easy)
-- ============================================

-- Exercise 1.1: Get all products in the 'Electronics' category
-- Your query here:


-- ANSWER:
SELECT * FROM products_catalog WHERE category = 'Electronics';


-- Exercise 1.2: Find all products that cost exactly $29.99
-- Your query here:


-- ANSWER:
SELECT product_name, price FROM products_catalog WHERE price = 29.99;


-- Exercise 1.3: Find all featured products
-- Your query here:


-- ANSWER:
SELECT product_name, is_featured FROM products_catalog WHERE is_featured = TRUE;


-- Exercise 1.4: Get all products from the 'Apple' brand
-- Your query here:


-- ANSWER:
SELECT product_name, brand, price FROM products_catalog WHERE brand = 'Apple';


-- Exercise 1.5: Find all products that are currently unavailable
-- Your query here:


-- ANSWER:
SELECT product_name, is_available FROM products_catalog WHERE is_available = FALSE;


-- ============================================
-- EXERCISE SET 2: COMPARISON OPERATORS (Easy-Medium)
-- ============================================

-- Exercise 2.1: Find all products priced under $50
-- Your query here:


-- ANSWER:
SELECT product_name, price FROM products_catalog WHERE price < 50;


-- Exercise 2.2: Find all products with stock quantity greater than 50
-- Your query here:


-- ANSWER:
SELECT product_name, stock_quantity FROM products_catalog WHERE stock_quantity > 50;


-- Exercise 2.3: Find products with rating of 4.5 or higher
-- Your query here:


-- ANSWER:
SELECT product_name, rating FROM products_catalog WHERE rating >= 4.5;


-- Exercise 2.4: Find products with less than 20 items in stock
-- Your query here:


-- ANSWER:
SELECT product_name, stock_quantity FROM products_catalog WHERE stock_quantity < 20;


-- Exercise 2.5: Find products with 100 or more reviews
-- Your query here:


-- ANSWER:
SELECT product_name, reviews_count FROM products_catalog WHERE reviews_count >= 100;


-- ============================================
-- EXERCISE SET 3: LOGICAL OPERATORS (Medium)
-- ============================================

-- Exercise 3.1: Find Electronics products that are on sale
-- Your query here:


-- ANSWER:
SELECT product_name, category, is_on_sale, price 
FROM products_catalog 
WHERE category = 'Electronics' AND is_on_sale = TRUE;


-- Exercise 3.2: Find products that are either featured OR new arrivals
-- Your query here:


-- ANSWER:
SELECT product_name, is_featured, is_new_arrival 
FROM products_catalog 
WHERE is_featured = TRUE OR is_new_arrival = TRUE;


-- Exercise 3.3: Find available products under $100 in the Sports category
-- Your query here:


-- ANSWER:
SELECT product_name, category, price, is_available 
FROM products_catalog 
WHERE category = 'Sports' AND price < 100 AND is_available = TRUE;


-- Exercise 3.4: Find products that are NOT in the Clothing category
-- Your query here:


-- ANSWER:
SELECT product_name, category FROM products_catalog WHERE category != 'Clothing';


-- Exercise 3.5: Find products that are either Apple OR Samsung brand
-- Your query here:


-- ANSWER:
SELECT product_name, brand 
FROM products_catalog 
WHERE brand = 'Apple' OR brand = 'Samsung';


-- ============================================
-- EXERCISE SET 4: PATTERN MATCHING (Medium)
-- ============================================

-- Exercise 4.1: Find all products with "Phone" in their name
-- Your query here:


-- ANSWER:
SELECT product_name FROM products_catalog WHERE product_name LIKE '%Phone%';


-- Exercise 4.2: Find products that start with "Premium"
-- Your query here:


-- ANSWER:
SELECT product_name FROM products_catalog WHERE product_name LIKE 'Premium%';


-- Exercise 4.3: Find products with "Shoes" at the end of the name
-- Your query here:


-- ANSWER:
SELECT product_name FROM products_catalog WHERE product_name LIKE '%Shoes';


-- Exercise 4.4: Find all Nike or Adidas products (use brand column with pattern)
-- Your query here:


-- ANSWER:
SELECT product_name, brand FROM products_catalog WHERE brand LIKE 'Nike' OR brand LIKE 'Adidas';


-- Exercise 4.5: Find products with "book" anywhere in the name (case-insensitive)
-- Your query here:


-- ANSWER:
SELECT product_name FROM products_catalog WHERE product_name LIKE '%book%';


-- ============================================
-- EXERCISE SET 5: RANGE AND LIST (Medium)
-- ============================================

-- Exercise 5.1: Find products priced between $50 and $150
-- Your query here:


-- ANSWER:
SELECT product_name, price FROM products_catalog WHERE price BETWEEN 50 AND 150;


-- Exercise 5.2: Find products in Electronics, Books, or Sports categories
-- Your query here:


-- ANSWER:
SELECT product_name, category 
FROM products_catalog 
WHERE category IN ('Electronics', 'Books', 'Sports');


-- Exercise 5.3: Find products with ratings between 4.5 and 5.0
-- Your query here:


-- ANSWER:
SELECT product_name, rating FROM products_catalog WHERE rating BETWEEN 4.5 AND 5.0;


-- Exercise 5.4: Find products from Nike, Adidas, or Under Armour brands
-- Your query here:


-- ANSWER:
SELECT product_name, brand 
FROM products_catalog 
WHERE brand IN ('Nike', 'Adidas', 'Under Armour');


-- Exercise 5.5: Find products NOT in Home or Clothing categories
-- Your query here:


-- ANSWER:
SELECT product_name, category 
FROM products_catalog 
WHERE category NOT IN ('Home', 'Clothing');


-- ============================================
-- EXERCISE SET 6: COMPLEX SCENARIOS (Hard)
-- ============================================

-- Exercise 6.1: Find budget-friendly deals
-- Find products that are on sale, under $100, available, and have rating >= 4.0
-- Your query here:


-- ANSWER:
SELECT product_name, price, rating, is_on_sale 
FROM products_catalog 
WHERE is_on_sale = TRUE 
AND price < 100 
AND is_available = TRUE 
AND rating >= 4.0;


-- Exercise 6.2: Find premium featured products
-- Find featured products over $500 that are new arrivals
-- Your query here:


-- ANSWER:
SELECT product_name, price, is_featured, is_new_arrival 
FROM products_catalog 
WHERE is_featured = TRUE 
AND price > 500 
AND is_new_arrival = TRUE;


-- Exercise 6.3: Low stock alert
-- Find products where stock is below minimum stock level OR stock is zero
-- Your query here:


-- ANSWER:
SELECT product_name, stock_quantity, min_stock_level 
FROM products_catalog 
WHERE stock_quantity < min_stock_level OR stock_quantity = 0;


-- Exercise 6.4: Electronics deal finder
-- Find Electronics in Laptops or Smartphones subcategory, on sale, under $1000
-- Your query here:


-- ANSWER:
SELECT product_name, subcategory, price, discount_percent 
FROM products_catalog 
WHERE category = 'Electronics' 
AND subcategory IN ('Laptops', 'Smartphones') 
AND is_on_sale = TRUE 
AND price < 1000;


-- Exercise 6.5: Customer favorite search
-- Find products with at least 200 reviews and rating of 4.5+, that are available
-- Your query here:


-- ANSWER:
SELECT product_name, rating, reviews_count, price 
FROM products_catalog 
WHERE reviews_count >= 200 
AND rating >= 4.5 
AND is_available = TRUE;


-- Exercise 6.6: Seasonal shopping
-- Find Clothing in Outerwear subcategory, OR any product with "Winter" in name
-- Your query here:


-- ANSWER:
SELECT product_name, category, subcategory 
FROM products_catalog 
WHERE (category = 'Clothing' AND subcategory = 'Outerwear') 
OR product_name LIKE '%Winter%';


-- Exercise 6.7: Budget electronics search
-- Find Electronics under $100 OR Books/Sports under $50, must be available
-- Your query here:


-- ANSWER:
SELECT product_name, category, price 
FROM products_catalog 
WHERE ((category = 'Electronics' AND price < 100) 
    OR (category IN ('Books', 'Sports') AND price < 50))
AND is_available = TRUE;


-- Exercise 6.8: Premium brand search
-- Find Apple, Samsung, or Sony products that are featured and cost over $200
-- Your query here:


-- ANSWER:
SELECT product_name, brand, price, is_featured 
FROM products_catalog 
WHERE brand IN ('Apple', 'Samsung', 'Sony') 
AND is_featured = TRUE 
AND price > 200;


-- ============================================
-- REAL-WORLD SCENARIOS
-- ============================================

-- Scenario 1: Website Homepage - Show Featured Products
SELECT product_name, category, price, rating, reviews_count 
FROM products_catalog 
WHERE is_featured = TRUE 
AND is_available = TRUE 
ORDER BY rating DESC;

-- Scenario 2: Sale Page - All Discounted Items
SELECT 
    product_name, 
    category, 
    original_price, 
    price, 
    discount_percent,
    (original_price - price) AS savings
FROM products_catalog 
WHERE is_on_sale = TRUE 
AND is_available = TRUE;

-- Scenario 3: Customer Search - "affordable laptop"
SELECT product_name, brand, price, rating 
FROM products_catalog 
WHERE subcategory = 'Laptops' 
AND price < 1000 
AND is_available = TRUE 
AND rating >= 4.0;

-- Scenario 4: Inventory Alert - Products Needing Restock
SELECT product_name, category, stock_quantity, min_stock_level 
FROM products_catalog 
WHERE stock_quantity <= min_stock_level 
AND is_available = TRUE;

-- Scenario 5: New Arrivals Page
SELECT product_name, category, price, created_date 
FROM products_catalog 
WHERE is_new_arrival = TRUE 
AND is_available = TRUE;

-- Scenario 6: Category Page - Sports Equipment under $100
SELECT product_name, subcategory, price, rating 
FROM products_catalog 
WHERE category = 'Sports' 
AND price < 100 
AND is_available = TRUE;

-- ============================================
-- BONUS CHALLENGES
-- ============================================

-- Challenge 1: Find the perfect gift under $50
-- Must be highly rated (4.5+), have many reviews (100+), available, any category except Books
SELECT product_name, category, price, rating, reviews_count 
FROM products_catalog 
WHERE price < 50 
AND rating >= 4.5 
AND reviews_count >= 100 
AND is_available = TRUE 
AND category != 'Books';

-- Challenge 2: Smart shopper's choice
-- On sale, good rating (4.0+), popular (200+ reviews), under $200
SELECT product_name, price, original_price, discount_percent, rating, reviews_count 
FROM products_catalog 
WHERE is_on_sale = TRUE 
AND rating >= 4.0 
AND reviews_count >= 200 
AND price < 200 
AND is_available = TRUE;

-- Challenge 3: Build your home gym under $500 total
-- Find Fitness equipment, available, highly rated
SELECT product_name, price, rating, reviews_count 
FROM products_catalog 
WHERE subcategory = 'Fitness' 
AND is_available = TRUE 
AND rating >= 4.0;

-- ============================================
-- SUMMARY: WHAT YOU'VE LEARNED
-- ============================================

/*
Congratulations! You've practiced:

✅ Basic SELECT with WHERE clauses
✅ Comparison operators (=, !=, <, >, <=, >=)
✅ Logical operators (AND, OR, NOT)
✅ Pattern matching with LIKE
✅ Range filtering with BETWEEN
✅ List filtering with IN
✅ NULL value handling
✅ Complex multi-condition queries
✅ Real-world e-commerce scenarios

Next steps:
- Day 4: Sorting results (ORDER BY)
- Day 5: Limiting and pagination
- Day 6: Aggregate functions (COUNT, SUM, AVG, etc.)
*/

