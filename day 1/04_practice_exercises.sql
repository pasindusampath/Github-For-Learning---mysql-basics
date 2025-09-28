-- Day 1: Practice Exercises
-- Complete these exercises to practice what you've learned

USE my_first_database;

-- Exercise 1: Create a Library System
-- Create a table called 'books' with the following columns:
-- id (integer)
-- title (text up to 100 characters)
-- author (text up to 50 characters)
-- published_year (integer)
-- is_available (boolean)

CREATE TABLE books (
    id INT,
    title VARCHAR(100),
    author VARCHAR(50),
    published_year INT,
    is_available BOOLEAN
);

-- Exercise 2: Create a Restaurant Menu
-- Create a table called 'menu_items' with:
-- id (integer)
-- item_name (text up to 50 characters)
-- description (text up to 200 characters)
-- price (decimal with 2 decimal places)
-- category (one of: 'appetizer', 'main', 'dessert', 'beverage')

CREATE TABLE menu_items (
    id INT,
    item_name VARCHAR(50),
    description VARCHAR(200),
    price DECIMAL(6,2),
    category ENUM('appetizer', 'main', 'dessert', 'beverage')
);

-- Exercise 3: Create a Simple Blog
-- Create a table called 'posts' with:
-- id (integer)
-- title (text up to 100 characters)
-- content (long text)
-- author (text up to 50 characters)
-- created_date (date)
-- is_published (boolean)

CREATE TABLE posts (
    id INT,
    title VARCHAR(100),
    content TEXT,
    author VARCHAR(50),
    created_date DATE,
    is_published BOOLEAN
);

-- Exercise 4: Create a Contact List
-- Create a table called 'contacts' with:
-- id (integer)
-- first_name (text up to 30 characters)
-- last_name (text up to 30 characters)
-- phone (text up to 20 characters)
-- email (text up to 100 characters)
-- address (text up to 200 characters)

CREATE TABLE contacts (
    id INT,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    phone VARCHAR(20),
    email VARCHAR(100),
    address VARCHAR(200)
);

-- Show all tables to verify they were created
SHOW TABLES;

-- Show the structure of each table
DESCRIBE books;
DESCRIBE menu_items;
DESCRIBE posts;
DESCRIBE contacts;
