# Day 2: Advanced Data Types and Data Insertion

Welcome to Day 2 of your MySQL learning journey! Today we'll explore advanced data types and various techniques for inserting data into your database tables.

## 📚 What You'll Learn Today

### Advanced Data Types
- **Numeric Types**: INT, BIGINT, DECIMAL, FLOAT, DOUBLE with unsigned variants
- **Text Types**: VARCHAR, TEXT, MEDIUMTEXT, LONGTEXT, CHAR, BINARY
- **Date/Time Types**: DATETIME, TIMESTAMP, DATE, TIME, YEAR with precision
- **Special Types**: ENUM, SET, JSON, BIT fields
- **Constraints**: PRIMARY KEY, FOREIGN KEY, UNIQUE, NOT NULL, DEFAULT, CHECK

### Data Insertion Techniques
- **Basic INSERT**: Single row and multiple row insertions
- **Advanced INSERT**: INSERT IGNORE, ON DUPLICATE KEY UPDATE
- **Bulk Operations**: INSERT FROM SELECT, bulk data loading
- **Functions in INSERT**: Using MySQL functions like CURDATE(), CONCAT()
- **Data Validation**: Handling constraints and error scenarios

## 📁 Files Overview

### 01_advanced_data_types.sql
Comprehensive examples of advanced MySQL data types including:
- Advanced numeric types (SMALLINT, MEDIUMINT, BIGINT, UNSIGNED variants)
- Text and binary data types (TEXT, MEDIUMTEXT, LONGTEXT, BINARY)
- Advanced date/time types with precision
- ENUM and SET types for controlled values
- JSON data type for flexible data storage
- Constraints and indexes for data integrity

### 02_data_insertion.sql
Complete guide to data insertion covering:
- Basic INSERT statements with column specifications
- Multiple row insertions
- Inserting with different data types
- Using MySQL functions in INSERT statements
- INSERT IGNORE and ON DUPLICATE KEY UPDATE
- INSERT FROM SELECT for data copying
- Handling NULL values and defaults
- Bulk import preparation

### 03_practice_exercises.sql
Hands-on exercises to practice:
- Creating an e-commerce database with advanced data types
- Inserting complex data with JSON fields
- Using various insertion techniques
- Implementing constraints and validation
- Bulk operations and error handling

### 04_cleanup.sql
Cleanup script to remove all Day 2 tables and start fresh.

## 🚀 Getting Started

1. **Prerequisites**: Complete Day 1 exercises first
2. **Run the scripts in order**:
   ```sql
   SOURCE day_2/01_advanced_data_types.sql;
   SOURCE day_2/02_data_insertion.sql;
   SOURCE day_2/03_practice_exercises.sql;
   ```

## 💡 Key Concepts

### Advanced Data Types

#### Numeric Types
```sql
-- Different integer sizes
SMALLINT          -- -32,768 to 32,767
MEDIUMINT         -- -8,388,608 to 8,388,607
INT               -- -2,147,483,648 to 2,147,483,647
BIGINT            -- Very large integers

-- Unsigned variants (positive only)
SMALLINT UNSIGNED -- 0 to 65,535
INT UNSIGNED      -- 0 to 4,294,967,295

-- Decimal precision
DECIMAL(10,2)     -- 10 digits total, 2 after decimal
```

#### Text Types
```sql
VARCHAR(255)      -- Variable length, up to 255 chars
TEXT              -- Up to 65,535 characters
MEDIUMTEXT        -- Up to 16,777,215 characters
LONGTEXT          -- Up to 4,294,967,295 characters
CHAR(10)          -- Fixed length, always 10 chars
```

#### Special Types
```sql
ENUM('a','b','c') -- Choose one value
SET('x','y','z')  -- Choose multiple values
JSON              -- Store JSON documents
BIT(8)            -- 8-bit field for flags
```

### Data Insertion Techniques

#### Basic Insert
```sql
-- Recommended way with column names
INSERT INTO table_name (col1, col2, col3)
VALUES ('value1', 'value2', 'value3');

-- Multiple rows
INSERT INTO table_name (col1, col2)
VALUES 
    ('row1_col1', 'row1_col2'),
    ('row2_col1', 'row2_col2');
```

#### Advanced Insert
```sql
-- Ignore duplicates
INSERT IGNORE INTO table_name (col1, col2)
VALUES ('value1', 'value2');

-- Update on duplicate
INSERT INTO table_name (col1, col2)
VALUES ('value1', 'value2')
ON DUPLICATE KEY UPDATE col2 = VALUES(col2);
```

## 🎯 Practice Exercises

The practice exercises include:
1. **E-commerce Database**: Create a comprehensive online store database
2. **Data Insertion**: Practice various insertion techniques
3. **Advanced Techniques**: Use functions, calculations, and bulk operations
4. **Data Validation**: Implement constraints and handle errors

## 🔧 Common Patterns

### JSON Data Storage
```sql
-- Store complex address data
address JSON  -- {"street": "123 Main St", "city": "New York", "state": "NY"}

-- Insert JSON data
INSERT INTO table_name (address)
VALUES ('{"street": "123 Main St", "city": "New York", "state": "NY"}');
```

### ENUM and SET Usage
```sql
-- ENUM: Single choice
status ENUM('draft', 'published', 'archived')

-- SET: Multiple choices
tags SET('featured', 'sale', 'new', 'limited')
```

### Auto-increment and Defaults
```sql
-- Auto-increment primary key
id INT AUTO_INCREMENT PRIMARY KEY

-- Default values
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
status ENUM('active', 'inactive') DEFAULT 'active'
```

## ⚠️ Important Notes

1. **Data Type Selection**: Choose appropriate data types for your data size and precision needs
2. **Constraints**: Use constraints to maintain data integrity
3. **Performance**: Consider indexes for frequently queried columns
4. **Validation**: Always validate data before insertion
5. **Error Handling**: Use INSERT IGNORE or ON DUPLICATE KEY UPDATE for robust applications

## 🎉 Next Steps

After completing Day 2, you'll be ready for:
- **Day 3**: Data retrieval and querying (SELECT statements)
- **Day 4**: Data modification (UPDATE and DELETE)
- **Day 5**: Advanced querying techniques

## 📖 Additional Resources

- [MySQL Data Types Documentation](https://dev.mysql.com/doc/refman/8.0/en/data-types.html)
- [MySQL INSERT Statement Reference](https://dev.mysql.com/doc/refman/8.0/en/insert.html)
- [MySQL Constraints Documentation](https://dev.mysql.com/doc/refman/8.0/en/constraints.html)

Happy learning! 🚀
