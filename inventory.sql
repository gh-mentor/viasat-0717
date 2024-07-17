/*
This file contains a script of Transact SQL (T-SQL) command to interact with a database named 'Inventory'.
Requirements:
- SQL Server 2022 is installed and running
- database 'Inventory' already exists.
Steps:
- Check that the database exists, if not display an error message 'Database not found' and exit
- Sets the default database to 'Inventory'.
- Creates a 'categories' table and related 'products' table if they do not already exist.
- Remove all rows from the 'products' table.
- Remove all rows from the 'categories' table.
- Populates the 'Categories' table with sample data.
- Populates the 'Products' table with sample data.
- Creates stored procedures to get all categories.
- Creates a stored procedure to get all products in a specific category.
- Creates a stored procudure to get all products in a specific price range sorted by price in ascending order.
*/

-- Check if the database exists
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'Inventory')
BEGIN
    PRINT 'Database not found';
    RETURN;
END

-- Set the default database to 'Inventory'
USE Inventory;

-- Create the 'Categories' table if it does not exist
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Categories')
BEGIN
    CREATE TABLE Categories (
        CategoryID INT PRIMARY KEY,
        CategoryName NVARCHAR(50) NOT NULL,
        -- add a text 'Description' column
        Description NVARCHAR(256)
    );
END

-- Create the 'Products' table if it does not exist
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Products')
BEGIN
    CREATE TABLE Products (
        ProductID INT PRIMARY KEY,
        ProductName NVARCHAR(50) NOT NULL,
        CategoryID INT NOT NULL,
        Price DECIMAL(10, 2) NOT NULL,
        -- add a timestamp 'CreatedDate' column
        CreatedDate DATETIME DEFAULT GETDATE(),
        -- add an updated timestamp 'UpdatedDate' column
        UpdatedDate DATETIME DEFAULT GETDATE(),
        FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
    );
END

-- Remove all rows from the 'Products' table
TRUNCATE TABLE Products;

-- Remove all rows from the 'Categories' table
TRUNCATE TABLE Categories;




