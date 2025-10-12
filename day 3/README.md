# Day 3: Retrieving and Filtering Data

Welcome to Day 3! Now that we know how to create tables and insert data, it's time to learn how to retrieve and filter that data effectively.

## 📚 What You'll Learn Today

### Data Retrieval Basics
- **SELECT Statement**: The foundation of data retrieval
- **Selecting Specific Columns**: Get exactly what you need
- **Selecting All Columns**: The asterisk (*) shortcut
- **Column Aliases**: Making output more readable

### Filtering Data
- **WHERE Clause**: The key to filtering data
- **Comparison Operators**: =, !=, <, >, <=, >=
- **Logical Operators**: AND, OR, NOT
- **Pattern Matching**: LIKE operator with wildcards
- **Range Filtering**: BETWEEN operator
- **List Filtering**: IN operator
- **NULL Handling**: IS NULL and IS NOT NULL

## 📁 Files Overview

### 01_basic_select.sql
Introduction to SELECT statements covering:
- Basic SELECT syntax
- Selecting specific columns
- Selecting all columns
- Column aliases for better readability
- Simple WHERE clauses
- Viewing your data

### 02_filtering_where.sql
Complete guide to filtering data with:
- Comparison operators (=, !=, <, >, <=, >=)
- Logical operators (AND, OR, NOT)
- Pattern matching with LIKE and wildcards
- Range filtering with BETWEEN
- List filtering with IN operator
- Handling NULL values
- Combining multiple conditions

### 03_practice_exercises.sql
Hands-on exercises including:
- Building a product catalog database
- Filtering products by price, category, and availability
- Finding products with specific patterns
- Complex filtering scenarios
- Real-world query examples

### 04_cleanup.sql
Cleanup script to remove all Day 3 tables.

## 🚀 Getting Started

1. **Prerequisites**: Complete Day 1 and Day 2 exercises first
2. **Run the scripts in order**:
   ```sql
   SOURCE day_3/01_basic_select.sql;
   SOURCE day_3/02_filtering_where.sql;
   SOURCE day_3/03_practice_exercises.sql;
   ```

## 💡 Key Concepts

### Basic SELECT Syntax

```sql
-- Select specific columns
SELECT column1, column2 FROM table_name;

-- Select all columns
SELECT * FROM table_name;

-- Select with alias
SELECT column1 AS 'Readable Name' FROM table_name;
```

### WHERE Clause

```sql
-- Basic filter
SELECT * FROM products WHERE price > 50;

-- Multiple conditions
SELECT * FROM products WHERE price > 50 AND category = 'Electronics';

-- Pattern matching
SELECT * FROM products WHERE name LIKE '%phone%';
```

### Comparison Operators

```sql
=     -- Equal to
!=    -- Not equal to (also: <>)
>     -- Greater than
<     -- Less than
>=    -- Greater than or equal to
<=    -- Less than or equal to
```

### Logical Operators

```sql
-- AND: All conditions must be true
SELECT * FROM products 
WHERE price > 50 AND category = 'Electronics';

-- OR: At least one condition must be true
SELECT * FROM products 
WHERE category = 'Electronics' OR category = 'Books';

-- NOT: Negates a condition
SELECT * FROM products 
WHERE NOT category = 'Electronics';
```

### Pattern Matching with LIKE

```sql
-- % matches any sequence of characters
SELECT * FROM products WHERE name LIKE '%phone%';  -- Contains "phone"
SELECT * FROM products WHERE name LIKE 'phone%';   -- Starts with "phone"
SELECT * FROM products WHERE name LIKE '%phone';   -- Ends with "phone"

-- _ matches exactly one character
SELECT * FROM products WHERE name LIKE '_phone';   -- Any single char + "phone"
```

### Range and List Filtering

```sql
-- BETWEEN: Values within a range (inclusive)
SELECT * FROM products WHERE price BETWEEN 50 AND 100;

-- IN: Match against a list of values
SELECT * FROM products WHERE category IN ('Electronics', 'Books', 'Sports');

-- NOT IN: Exclude values from a list
SELECT * FROM products WHERE category NOT IN ('Clothing', 'Home');
```

### NULL Value Handling

```sql
-- Check for NULL values
SELECT * FROM products WHERE description IS NULL;

-- Check for non-NULL values
SELECT * FROM products WHERE description IS NOT NULL;

-- IMPORTANT: Cannot use = or != with NULL
-- WRONG: WHERE description = NULL
-- RIGHT: WHERE description IS NULL
```

## 🎯 Practice Scenarios

The practice exercises include real-world scenarios:

1. **Finding Products by Price Range**: Get products within budget
2. **Category Filtering**: Find products in specific categories
3. **Search Functionality**: Implement search by product name
4. **Availability Checks**: Find in-stock or out-of-stock items
5. **Complex Filters**: Combine multiple conditions for precise results
6. **Feature Flags**: Find featured or on-sale products

## 🔧 Common Patterns

### Finding Products Within Budget

```sql
SELECT product_name, price, category
FROM products
WHERE price <= 100
AND is_available = TRUE;
```

### Search Functionality

```sql
-- Search products by name (case-insensitive)
SELECT * FROM products
WHERE product_name LIKE '%laptop%';
```

### Category Browse

```sql
-- Get all products in Electronics category that are in stock
SELECT product_name, price, stock_quantity
FROM products
WHERE category = 'Electronics'
AND stock_quantity > 0;
```

### Finding Deals

```sql
-- Find featured products under $50
SELECT product_name, price, category
FROM products
WHERE is_featured = TRUE
AND price < 50;
```

## ⚠️ Important Notes

1. **WHERE Clause Position**: Always comes after FROM, before ORDER BY
2. **String Comparison**: String values must be in quotes ('value')
3. **Case Sensitivity**: MySQL string comparisons are case-insensitive by default
4. **NULL Handling**: Use IS NULL or IS NOT NULL, never = NULL
5. **Performance**: Filtering with WHERE is more efficient than retrieving all data

## 🎓 Learning Tips

1. **Start Simple**: Begin with single-column SELECT and simple WHERE clauses
2. **Build Gradually**: Add one filter condition at a time
3. **Test Your Queries**: Always verify your results make sense
4. **Use Comments**: Document complex queries for future reference
5. **Practice**: Try variations of queries to understand behavior

## 🎉 Next Steps

After completing Day 3, you'll be ready for:
- **Day 4**: Sorting and limiting results (ORDER BY, LIMIT)
- **Day 5**: Aggregate functions and grouping (COUNT, SUM, AVG, GROUP BY)
- **Day 6**: Joins and relationships between tables

## 📖 Additional Resources

- [MySQL SELECT Statement](https://dev.mysql.com/doc/refman/8.0/en/select.html)
- [MySQL WHERE Clause](https://dev.mysql.com/doc/refman/8.0/en/where-optimization.html)
- [MySQL Pattern Matching](https://dev.mysql.com/doc/refman/8.0/en/pattern-matching.html)

Happy querying! 🚀

