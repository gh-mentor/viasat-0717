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
- Creates a stored procedure 'GetProductsOrderedByPrice' to get all products sorted by price in ascending order.
- Creates a stored procedure 'GetAllCategories' to get all categories.
- Creates a stored procedure 'GetProductsByPriceRange' to return all products that are priced within a specific range.
- Creates a stored procedure 'GetProductsByCategory' to get all products in a specific category.

*/

-- Check if the database exists
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'Inventory')
BEGIN
    PRINT 'Database not found';
    RETURN;
END
GO
-- Set the default database to 'Inventory'
USE Inventory;
GO

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

-- Populate the 'Categories' table with sample data
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES
(1, 'Electronics', 'Electronic devices and accessories'),
(2, 'Clothing', 'Apparel and fashion accessories'),
(3, 'Home Goods', 'Furniture, decor, and household items');

-- Populate the 'Products' table with sample data
INSERT INTO Products (ProductID, ProductName, CategoryID, Price) VALUES
(1, 'Laptop', 1, 999.99),
(2, 'Smartphone', 1, 699.99),
(3, 'Headphones', 1, 99.99),
(4, 'T-shirt', 2, 19.99),
(5, 'Jeans', 2, 39.99),
(6, 'Sweater', 2, 49.99),
(7, 'Sofa', 3, 499.99),
(8, 'Coffee Table', 3, 199.99),
(9, 'Lamp', 3, 29.99);

-- Create a stored procedure to get all products sorted by price in ascending order
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'GetProductsOrderedByPrice')
BEGIN
    DROP PROCEDURE GetProductsOrderedByPrice;
END

CREATE PROCEDURE GetProductsOrderedByPrice
AS
BEGIN
    SELECT * FROM Products ORDER BY Price ASC;
END

-- Create a stored procedure to get all categories
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'GetAllCategories')
BEGIN
    DROP PROCEDURE GetAllCategories;
END

CREATE PROCEDURE GetAllCategories
AS
BEGIN
    SELECT * FROM Categories;
END

-- Create a stored procedure to return all products that are priced within a specific range
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'GetProductsByPriceRange')
BEGIN
    DROP PROCEDURE GetProductsByPriceRange;
END

-- Create a stored procedure to get all products in a specific category
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'GetProductsByCategory')
BEGIN
    DROP PROCEDURE GetProductsByCategory;
END

CREATE PROCEDURE GetProductsByCategory
    @CategoryID INT
AS
BEGIN
    SELECT * FROM Products WHERE CategoryID = @Category
END







