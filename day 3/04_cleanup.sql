-- Day 3: Cleanup Script
-- Run this script to remove all tables created during Day 3 exercises

USE my_first_database;

-- ============================================
-- DROP TABLES FROM DAY 3
-- ============================================

-- Drop tables if they exist (in reverse order of creation)
DROP TABLE IF EXISTS products_catalog;
DROP TABLE IF EXISTS store_products;
DROP TABLE IF EXISTS products;

-- ============================================
-- VERIFY CLEANUP
-- ============================================

-- Show remaining tables in the database
SHOW TABLES;

-- ============================================
-- INFORMATION
-- ============================================

/*
This script removes the following tables:
1. products - From 01_basic_select.sql
2. store_products - From 02_filtering_where.sql
3. products_catalog - From 03_practice_exercises.sql

If you want to practice again, simply re-run the Day 3 scripts:
- SOURCE day_3/01_basic_select.sql;
- SOURCE day_3/02_filtering_where.sql;
- SOURCE day_3/03_practice_exercises.sql;

Note: This will NOT delete the database itself, only the tables.
*/

SELECT 'Day 3 cleanup completed!' AS Status;

