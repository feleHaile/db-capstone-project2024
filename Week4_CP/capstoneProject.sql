-- Database Schema
-- Use the existing database
USE littlelemondb;
-- ====================Drop Existing Tables (if needed)============================
DROP TABLE IF EXISTS Order_MenuItems;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS MenuItems;
DROP TABLE IF EXISTS Customers;

-- Use the existing database
USE littlelemondb;

-- Create Customers Table
CREATE TABLE IF NOT EXISTS Customers (
    CustomerID VARCHAR(20) PRIMARY KEY,
    CustomerName VARCHAR(255),
    City VARCHAR(255),
    Country VARCHAR(255),
    PostalCode VARCHAR(20),
    CountryCode VARCHAR(10)
);


-- Create Orders Table
CREATE TABLE IF NOT EXISTS Orders (
    OrderID VARCHAR(20) PRIMARY KEY,
    OrderDate DATE,
    DeliveryDate DATE,
    CustomerID VARCHAR(20),
    TotalCost DECIMAL(10, 2),
    Sales DECIMAL(10, 2),
    Quantity INT,
    Discount DECIMAL(5, 2),
    DeliveryCost DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


-- Create MenuItems Table
CREATE TABLE IF NOT EXISTS MenuItems (
    MenuItemID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(255),
    CuisineName VARCHAR(255),
    StarterName VARCHAR(255),
    DesertName VARCHAR(255),
    Drink VARCHAR(255),
    Sides VARCHAR(255)
);

-- Create Order_MenuItems Table
CREATE TABLE IF NOT EXISTS Order_MenuItems (
    OrderID VARCHAR(20),
    MenuItemID INT,
    PRIMARY KEY (OrderID, MenuItemID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (MenuItemID) REFERENCES MenuItems(MenuItemID)
);

-- ===================Verify Table Creation================================================
SHOW TABLES;
SHOW CREATE TABLE Orders;
SHOW CREATE TABLE MenuItems;
SHOW CREATE TABLE Order_MenuItems;

-- ================Troubleshooting Foreign Key Constraints=====================================
SHOW ENGINE INNODB STATUS;

