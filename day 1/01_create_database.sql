-- Day 1: Creating Your First Database
-- This script demonstrates how to create and use a database

-- Step 1: Create a new database
CREATE DATABASE my_first_database;

-- Step 2: Drop the database 
DROP DATABASE my_first_database;

-- Step 3: Create the database again with IF NOT EXISTS
CREATE DATABASE IF NOT EXISTS my_first_database;

-- Step 4: Drop the database again with IF EXISTS
DROP DATABASE IF EXISTS my_first_database;

-- Step 5: Show all databases to verify creation
SHOW DATABASES;

-- Step 6: Use the database we just created
USE my_first_database;

-- Step 7: Verify we're using the correct database
SELECT DATABASE();

-- Step 5: Show tables in our database (should be empty for now)
SHOW TABLES;
