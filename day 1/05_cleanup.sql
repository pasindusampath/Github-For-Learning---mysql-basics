-- Day 1: Cleanup Script
-- This script shows how to drop (delete) databases and tables

-- WARNING: These commands will permanently delete your data!
-- Only run these if you want to start over

-- To drop (delete) a table:
-- DROP TABLE table_name;

-- Example: Delete the students table
-- DROP TABLE students;

-- To drop (delete) a database:
-- DROP DATABASE database_name;

-- Example: Delete the entire database
-- DROP DATABASE my_first_database;

-- To drop multiple tables at once:
-- DROP TABLE table1, table2, table3;

-- Example: Delete all practice tables
-- DROP TABLE books, menu_items, posts, contacts;

-- IMPORTANT NOTES:
-- 1. DROP commands cannot be undone!
-- 2. Always backup your data before using DROP
-- 3. Be very careful with DROP DATABASE - it deletes everything!
-- 4. Make sure you're in the right database before dropping tables

-- Safe alternative: Rename tables instead of dropping them
-- ALTER TABLE old_name RENAME TO new_name;

-- Example: Rename students table to students_backup
-- ALTER TABLE students RENAME TO students_backup;
