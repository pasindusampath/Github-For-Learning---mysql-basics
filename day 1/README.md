# Day 1: Database Fundamentals

Welcome to your first day of MySQL learning! Today we'll cover the absolute basics of working with databases.

## 🎯 What You'll Learn Today

1. **What is a Database?** - Understanding the concept
2. **Creating Your First Database** - The `CREATE DATABASE` command
3. **Using a Database** - The `USE` command
4. **Creating Your First Table** - The `CREATE TABLE` command
5. **Understanding Data Types** - Different types of data we can store

## 📚 Lesson 1: What is a Database?

A database is like a digital filing cabinet where we store information in an organized way. Think of it like:

- **A Library**: Books (data) are organized by categories, authors, and topics
- **A Phone Book**: Names and numbers are organized alphabetically
- **A School Grade Book**: Student information is organized by classes and subjects

### Why Use a Database?

- **Organization**: Keep related information together
- **Efficiency**: Find information quickly
- **Consistency**: Ensure data follows rules
- **Security**: Control who can access what
- **Backup**: Keep your data safe

## 📚 Lesson 2: Creating Your First Database

### Step 1: Connect to MySQL

First, you need to connect to MySQL. You can use:
- **MySQL Workbench** (Graphical interface - recommended for beginners)
- **Command Line** (Text-based interface)

### Step 2: Create a Database

```sql
CREATE DATABASE my_first_database;
```

**What this does:**
- `CREATE DATABASE` tells MySQL to create a new database
- `my_first_database` is the name we're giving our database
- The semicolon `;` tells MySQL that the command is complete

### Step 3: Verify Your Database Was Created

```sql
SHOW DATABASES;
```

This command shows all databases on your MySQL server.

## 📚 Lesson 3: Using a Database

Before you can create tables or do anything with your database, you need to tell MySQL which database you want to work with.

```sql
USE my_first_database;
```

**What this does:**
- `USE` tells MySQL to switch to the specified database
- All commands after this will work with `my_first_database`
- You can verify you're in the right database with: `SELECT DATABASE();`

## 📚 Lesson 4: Creating Your First Table

Tables are where we actually store our data. Think of a table like a spreadsheet with rows and columns.

### Basic Table Structure

```sql
CREATE TABLE students (
    id INT,
    name VARCHAR(50),
    age INT,
    email VARCHAR(100)
);
```

**Let's break this down:**
- `CREATE TABLE` tells MySQL to create a new table
- `students` is the name of our table
- Inside the parentheses, we define the columns:
  - `id INT` - A column named "id" that stores integers
  - `name VARCHAR(50)` - A column named "name" that stores text up to 50 characters
  - `age INT` - A column named "age" that stores integers
  - `email VARCHAR(100)` - A column named "email" that stores text up to 100 characters

### Verify Your Table Was Created

```sql
SHOW TABLES;
```

This shows all tables in your current database.

## 📚 Lesson 5: Understanding Data Types

MySQL supports many different data types. Here are the most common ones:

### Numeric Types
- `INT` - Whole numbers (1, 2, 3, -5, 1000)
- `FLOAT` - Decimal numbers (3.14, 2.5, 99.99)
- `DECIMAL(5,2)` - Precise decimal numbers (123.45)

### Text Types
- `VARCHAR(50)` - Variable length text up to 50 characters
- `CHAR(10)` - Fixed length text exactly 10 characters
- `TEXT` - Long text (up to 65,535 characters)

### Date and Time Types
- `DATE` - Date only (2024-01-15)
- `TIME` - Time only (14:30:00)
- `DATETIME` - Date and time (2024-01-15 14:30:00)

### Other Types
- `BOOLEAN` - True or False values
- `ENUM('option1', 'option2')` - One of several predefined options

## 🎯 Practice Exercise

Create a table for a simple library system:

```sql
-- Your task: Create a table called 'books' with these columns:
-- id (integer)
-- title (text up to 100 characters)
-- author (text up to 50 characters)
-- published_year (integer)
-- is_available (boolean)
```

**Solution:**
```sql
CREATE TABLE books (
    id INT,
    title VARCHAR(100),
    author VARCHAR(50),
    published_year INT,
    is_available BOOLEAN
);
```

## 🔍 What's Next?

Tomorrow we'll learn how to:
- Insert data into our tables
- View the data we've stored
- Update existing records
- Delete records we no longer need

## 💡 Key Takeaways

1. **Databases** are organized storage systems for data
2. **CREATE DATABASE** creates a new database
3. **USE** selects which database to work with
4. **CREATE TABLE** creates tables with defined columns
5. **Data types** determine what kind of data each column can store

## 🚨 Common Mistakes to Avoid

- Forgetting the semicolon `;` at the end of commands
- Using spaces in database or table names (use underscores instead)
- Not specifying the correct data type for your data
- Forgetting to use `USE database_name;` before creating tables

---

**Congratulations! 🎉 You've created your first database and table!**

*Remember: Practice makes perfect. Try creating different tables with different data types to get comfortable with the syntax.*
