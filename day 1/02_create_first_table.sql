-- Day 1: Creating Your First Table
-- This script demonstrates how to create tables with different data types

-- Make sure we're using our database
USE my_first_database;

-- Create a simple students table
CREATE TABLE students (
    id INT,
    name VARCHAR(50),
    age INT,
    email VARCHAR(100),
    grade DECIMAL(3,2)
);

-- Show the table structure
DESCRIBE students;

-- Show all tables in our database
SHOW TABLES;
