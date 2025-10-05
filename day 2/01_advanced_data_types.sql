-- Day 2: Advanced Data Types and Constraints
-- This script demonstrates advanced data types and constraints in MySQL

-- Make sure we're using our database
USE my_first_database;

-- ============================================
-- ADVANCED NUMERIC DATA TYPES
-- ============================================

-- Create table with advanced numeric types
CREATE TABLE advanced_numeric (
    id INT AUTO_INCREMENT PRIMARY KEY,
    
    -- Integer types with different ranges
    small_id SMALLINT,           -- -32,768 to 32,767
    medium_id MEDIUMINT,         -- -8,388,608 to 8,388,607
    regular_id INT,              -- -2,147,483,648 to 2,147,483,647
    big_id BIGINT,               -- Very large integers
    
    -- Unsigned integers (only positive values)
    unsigned_small SMALLINT UNSIGNED,    -- 0 to 65,535
    unsigned_medium MEDIUMINT UNSIGNED,  -- 0 to 16,777,215
    unsigned_int INT UNSIGNED,           -- 0 to 4,294,967,295
    unsigned_big BIGINT UNSIGNED,        -- 0 to 18,446,744,073,709,551,615
    
    -- Floating point types
    float_value FLOAT,           -- Single precision (4 bytes)
    double_value DOUBLE,         -- Double precision (8 bytes)
    
    -- Fixed-point decimal (recommended for money)
    salary DECIMAL(10,2),        -- 10 digits total, 2 after decimal
    percentage DECIMAL(5,4),     -- For percentages like 99.9999%
    
    -- Bit field for flags
    permissions BIT(8)           -- 8-bit field for permissions
);

-- ============================================
-- ADVANCED TEXT DATA TYPES
-- ============================================

CREATE TABLE advanced_text (
    id INT AUTO_INCREMENT PRIMARY KEY,
    
    -- Variable length strings
    short_text VARCHAR(255),     -- Up to 255 characters
    long_text VARCHAR(1000),     -- Longer variable text
    
    -- Fixed length strings
    fixed_code CHAR(10),         -- Always 10 characters, padded with spaces
    
    -- Large text types
    description TEXT,            -- Up to 65,535 characters
    long_description MEDIUMTEXT, -- Up to 16,777,215 characters
    huge_description LONGTEXT,   -- Up to 4,294,967,295 characters
    
    -- Binary data types
    binary_data BINARY(16),      -- Fixed-length binary data
    varbinary_data VARBINARY(255), -- Variable-length binary data
    
    -- JSON data type (MySQL 5.7+)
    metadata JSON                -- Store JSON documents
);

-- ============================================
-- ADVANCED DATE AND TIME TYPES
-- ============================================

CREATE TABLE advanced_datetime (
    id INT AUTO_INCREMENT PRIMARY KEY,
    
    -- Date and time combinations
    created_at DATETIME,         -- 'YYYY-MM-DD HH:MM:SS'
    updated_at DATETIME(6),      -- With microseconds
    
    -- Timestamp (auto-updating)
    last_login TIMESTAMP,        -- Auto-updates on row changes
    expires_at TIMESTAMP,        -- Can be NULL
    
    -- Date and time separately
    event_date DATE,             -- 'YYYY-MM-DD'
    event_time TIME,             -- 'HH:MM:SS'
    
    -- Year type
    birth_year YEAR,             -- 1901 to 2155
    
    -- Timezone aware (MySQL 8.0+)
    -- created_with_tz TIMESTAMP WITH TIME ZONE  -- MySQL 8.0+
);

-- ============================================
-- ENUM AND SET TYPES
-- ============================================

CREATE TABLE advanced_enums_sets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    
    -- ENUM: Choose one value from a list
    status ENUM('draft', 'published', 'archived', 'deleted'),
    priority ENUM('low', 'medium', 'high', 'critical'),
    grade ENUM('A+', 'A', 'B+', 'B', 'C+', 'C', 'D', 'F'),
    
    -- SET: Choose multiple values from a list
    skills SET('HTML', 'CSS', 'JavaScript', 'Python', 'Java', 'SQL'),
    interests SET('reading', 'gaming', 'sports', 'music', 'travel'),
    permissions SET('read', 'write', 'execute', 'delete', 'admin')
);

-- ============================================
-- CONSTRAINTS AND MODIFIERS
-- ============================================

CREATE TABLE constraints_example (
    -- Primary key with auto increment
    id INT AUTO_INCREMENT PRIMARY KEY,
    
    -- NOT NULL constraint
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    
    -- UNIQUE constraint
    username VARCHAR(50) UNIQUE,
    
    -- DEFAULT values
    status ENUM('active', 'inactive') DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    score DECIMAL(5,2) DEFAULT 0.00,
    
    -- CHECK constraint (MySQL 8.0.16+)
    age INT CHECK (age >= 0 AND age <= 150),
    
    -- Foreign key will be covered in relationships
    -- FOREIGN KEY (user_id) REFERENCES users(id)
);

-- ============================================
-- INDEXES FOR PERFORMANCE
-- ============================================

-- Create indexes for better performance
CREATE INDEX idx_name ON advanced_text(short_text);
CREATE INDEX idx_created ON advanced_datetime(created_at);
CREATE INDEX idx_status ON constraints_example(status);

-- Composite index (multiple columns)
CREATE INDEX idx_name_email ON constraints_example(name, email);

-- ============================================
-- SHOW TABLE STRUCTURES
-- ============================================

-- Show all tables
SHOW TABLES;

-- Show structure of each table
DESCRIBE advanced_numeric;
DESCRIBE advanced_text;
DESCRIBE advanced_datetime;
DESCRIBE advanced_enums_sets;
DESCRIBE constraints_example;

-- Show indexes for a table
SHOW INDEX FROM constraints_example;
