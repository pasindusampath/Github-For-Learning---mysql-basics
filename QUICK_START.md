# Quick Start Guide

Welcome to MySQL learning! This guide will get you up and running in just a few minutes.

## 🚀 Step 1: Install MySQL

### Windows
1. Download MySQL Installer from [mysql.com](https://dev.mysql.com/downloads/installer/)
2. Run the installer and follow the setup wizard
3. Remember your root password!

### Mac
```bash
# Using Homebrew (recommended)
brew install mysql
brew services start mysql

# Or download from mysql.com
```

### Linux (Ubuntu/Debian)
```bash
sudo apt update
sudo apt install mysql-server
sudo mysql_secure_installation
```

## 🚀 Step 2: Connect to MySQL

### Option 1: MySQL Workbench (Recommended for Beginners)
1. Open MySQL Workbench
2. Click the "+" to create a new connection
3. Enter connection details:
   - Connection Name: `Local MySQL`
   - Hostname: `localhost`
   - Port: `3306`
   - Username: `root`
   - Password: (your root password)
4. Click "Test Connection" then "OK"

### Option 2: Command Line
```bash
# Connect to MySQL
mysql -u root -p

# Enter your password when prompted
```

## 🚀 Step 3: Run Your First Commands

Copy and paste these commands one by one:

```sql
-- Create your first database
CREATE DATABASE my_first_database;

-- Use the database
USE my_first_database;

-- Create your first table
CREATE TABLE students (
    id INT,
    name VARCHAR(50),
    age INT
);

-- Check if everything worked
SHOW TABLES;
```

## 🚀 Step 4: Start Learning

1. **Begin with Day 1** - Read the `Day 1/README.md` file
2. **Follow the SQL scripts** - Run them in order:
   - `01_create_database.sql`
   - `02_create_first_table.sql`
   - `03_data_types_examples.sql`
   - `04_practice_exercises.sql`
3. **Practice** - Try the exercises and experiment!

## 🆘 Troubleshooting

### "Access denied" error
- Make sure you're using the correct username and password
- Try: `mysql -u root -p` and enter your password

### "Database already exists" error
- This is normal! The database was already created
- You can continue with the next steps

### "Table already exists" error
- This is normal! The table was already created
- You can continue with the next steps

### Can't find MySQL Workbench
- Make sure you installed the full MySQL package
- Try downloading MySQL Workbench separately from mysql.com

## 📞 Need Help?

- Check the FAQ in each day's README
- Open an issue on GitHub
- Ask questions in the discussions

---

**You're ready to start learning MySQL! 🎉**

*Remember: Take your time, practice regularly, and don't be afraid to experiment!*
