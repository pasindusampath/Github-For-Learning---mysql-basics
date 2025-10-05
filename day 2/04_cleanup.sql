-- Day 2: Cleanup Script
-- This script removes all tables created during Day 2 exercises

USE my_first_database;

-- ============================================
-- DROP DAY 2 TABLES (in reverse dependency order)
-- ============================================

-- Drop tables with foreign key dependencies first
DROP TABLE IF EXISTS product_reviews;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;

-- Drop other Day 2 tables
DROP TABLE IF EXISTS constraints_example;
DROP TABLE IF EXISTS advanced_enums_sets;
DROP TABLE IF EXISTS advanced_datetime;
DROP TABLE IF EXISTS advanced_text;
DROP TABLE IF EXISTS advanced_numeric;

-- Drop tables from data insertion examples
DROP TABLE IF EXISTS customers_backup;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS product_catalog;
DROP TABLE IF EXISTS employees_backup;
DROP TABLE IF EXISTS employees;

-- ============================================
-- VERIFY CLEANUP
-- ============================================

-- Show remaining tables (should only show Day 1 tables)
SHOW TABLES;

-- Show databases to confirm we're in the right database
SELECT DATABASE();

-- ============================================
-- OPTIONAL: DROP ENTIRE DATABASE
-- ============================================
-- Uncomment the following lines if you want to completely remove the database
-- and start fresh

-- DROP DATABASE IF EXISTS my_first_database;
-- CREATE DATABASE my_first_database;
-- USE my_first_database;
