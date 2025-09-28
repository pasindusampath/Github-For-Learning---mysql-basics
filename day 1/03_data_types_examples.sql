-- Day 1: Data Types Examples
-- This script shows examples of different data types in MySQL

USE my_first_database;

-- Example 1: Numeric data types
CREATE TABLE numeric_examples (
    id INT,
    price DECIMAL(10,2),  -- 10 digits total, 2 after decimal point
    percentage FLOAT,
    small_number TINYINT
);

-- Example 2: Text data types
CREATE TABLE text_examples (
    id INT,
    short_text VARCHAR(50),
    long_text TEXT,
    fixed_text CHAR(10)
);

-- Example 3: Date and time types
CREATE TABLE datetime_examples (
    id INT,
    birth_date DATE,
    meeting_time TIME,
    created_at DATETIME,
    updated_at TIMESTAMP
);

-- Example 4: Other useful types
CREATE TABLE other_types (
    id INT,
    is_active BOOLEAN,
    status ENUM('active', 'inactive', 'pending'),
    priority SET('high', 'medium', 'low')
);

-- Show all our tables
SHOW TABLES;

-- Show the structure of each table
DESCRIBE numeric_examples;
DESCRIBE text_examples;
DESCRIBE datetime_examples;
DESCRIBE other_types;
