-- Day 1: Creating Your First Database
-- This script demonstrates how to create and use a database

-- Step 1: Create a new database
CREATE DATABASE my_first_database;

-- Step 2: Show all databases to verify creation
SHOW DATABASES;

-- Step 3: Use the database we just created
USE my_first_database;

-- Step 4: Verify we're using the correct database
SELECT DATABASE();

-- Step 5: Show tables in our database (should be empty for now)
SHOW TABLES;
