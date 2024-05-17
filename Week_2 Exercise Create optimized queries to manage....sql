USE littlelemondb;
-- Step 1: Check the Structure of the Orders Table
-- Step 2: Create the Stored Procedure
DELIMITER $$

CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(Quantity) AS MaxQuantity FROM Orders;
END$$

DELIMITER ;
-- Step 3: Call the Stored Procedure
-- After creating the stored procedure, you can call it to get the maximum quantity ordered.
CALL GetMaxQuantity();
-- Compelete Example=======================================
-- Ensure you're using the correct database
USE littlelemondb;

-- Create the GetMaxQuantity procedure
DELIMITER $$

CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(Quantity) AS MaxQuantity FROM Orders;
END$$

DELIMITER ;

-- Call the GetMaxQuantity procedure
CALL GetMaxQuantity();

CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    TotalCost DECIMAL(10, 2),
    CustomerID INT,
    Quantity INT, -- Ensure this column exists
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(255) NOT NULL
);

CREATE TABLE Menus (
    MenuID INT AUTO_INCREMENT PRIMARY KEY,
    MenuName VARCHAR(255) NOT NULL
);

CREATE TABLE MenuItems (
    MenuItemID INT AUTO_INCREMENT PRIMARY KEY,
    CourseName VARCHAR(255) NOT NULL,
    StarterName VARCHAR(255) NOT NULL,
    MenuID INT,
    FOREIGN KEY (MenuID) REFERENCES Menus(MenuID)
);
-- =======================================
DESCRIBE Orders;

-- Step 2: Modify the Orders Table to Add Quantity Column (If Necessary)
ALTER TABLE Orders ADD COLUMN Quantity INT;
-- Step 3: Populate the Quantity Column (If Necessary)
UPDATE Orders SET Quantity = FLOOR(1 + (RAND() * 10)); -- Example of setting random quantities between 1 and 10
-- Step 4: Drop the Existing Stored Procedure (If Necessary)
DROP PROCEDURE IF EXISTS GetMaxQuantity;
-- Step 5: Create the Stored Procedure
DELIMITER $$

CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(Quantity) AS MaxQuantity FROM Orders;
END$$

DELIMITER ;
-- Step 6: Call the Stored Procedure
CALL GetMaxQuantity();

-- ======================================================Below the Compelete Example ===============================================================
-- =================================================================================================================================================
-- Ensure you're using the correct database
USE littlelemondb;

-- Check the structure of the Orders table
DESCRIBE Orders;

-- If the Quantity column doesn't exist, add it
ALTER TABLE Orders ADD COLUMN Quantity INT;

-- Optionally, populate the Quantity column with sample data
UPDATE Orders SET Quantity = FLOOR(1 + (RAND() * 10)); -- Random quantities for demonstration

-- Drop the existing GetMaxQuantity procedure if it exists
DROP PROCEDURE IF EXISTS GetMaxQuantity;

-- Create the GetMaxQuantity procedure
DELIMITER $$

CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(Quantity) AS MaxQuantity FROM Orders;
END$$

DELIMITER ;

-- Call the GetMaxQuantity procedure
CALL GetMaxQuantity();
