-- Create New Database
CREATE DATABASE LittleLemonDBCP;
-- Use the existing database
USE LittleLemonDBCP;

-- Drop the child table first
-- DROP TABLE IF EXISTS Order_MenuItems;

-- Drop the parent tables
-- DROP TABLE IF EXISTS Orders;
-- DROP TABLE IF EXISTS MenuItems;
-- DROP TABLE IF EXISTS Customers;
-- ==========================================Create Customers Table==============================================================
CREATE TABLE IF NOT EXISTS Customers (
    customerID VARCHAR(20) PRIMARY KEY,
    customerName VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL,
    postalCode VARCHAR(20) NOT NULL,
    countryCode VARCHAR(10) NOT NULL
);

-- ==========================Create Orders Table==================================================================================
CREATE TABLE IF NOT EXISTS Orders (
    orderID VARCHAR(20) PRIMARY KEY,
    orderDate DATE NOT NULL,
    deliveryDate DATE NOT NULL,
    customerID VARCHAR(20) NOT NULL,
    totalCost DECIMAL(10, 2) NOT NULL,
    sales DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL,
    discount DECIMAL(5, 2) NOT NULL,
    deliveryCost DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customerID) REFERENCES Customers(customerID)
);
-- ==============================Create OrderItems Table==============================================================================
CREATE TABLE IF NOT EXISTS OrderItems (
    orderItemID INT PRIMARY KEY AUTO_INCREMENT,
    orderID VARCHAR(20) NOT NULL,
    courseName VARCHAR(255) NOT NULL,
    cuisineName VARCHAR(255) NOT NULL,
    starterName VARCHAR(255) NOT NULL,
    desertName VARCHAR(255) NOT NULL,
    drink VARCHAR(255) NOT NULL,
    sides VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    cost DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (orderID) REFERENCES Orders(orderID)
);

-- ==================================Create MenuItems Table====================================================
CREATE TABLE IF NOT EXISTS MenuItems (
    menuItemID INT PRIMARY KEY AUTO_INCREMENT,
    courseName VARCHAR(255) NOT NULL,
    cuisineName VARCHAR(255) NOT NULL,
    starterName VARCHAR(255) NOT NULL,
    desertName VARCHAR(255) NOT NULL,
    drink VARCHAR(255) NOT NULL,
    sides VARCHAR(255) NOT NULL
);

-- ======================================Create Order_MenuItems Table=======================================================
CREATE TABLE IF NOT EXISTS Order_MenuItems (
    orderID VARCHAR(20) NOT NULL,
    menuItemID INT NOT NULL,
    PRIMARY KEY (orderID, menuItemID),
    FOREIGN KEY (orderID) REFERENCES Orders(orderID),
    FOREIGN KEY (menuItemID) REFERENCES MenuItems(menuItemID)
);
-- =========================================Create Bookings Table========================================================
CREATE TABLE IF NOT EXISTS Bookings (
    bookingID INT PRIMARY KEY AUTO_INCREMENT,
    bookingDate DATE NOT NULL,
    customerID VARCHAR(20) NOT NULL,
    FOREIGN KEY (customerID) REFERENCES Customers(customerID)
);
-- ===========================================Create OrderDeliveryStatus ================================================
CREATE TABLE IF NOT EXISTS OrderDeliveryStatus (
    orderID VARCHAR(20) PRIMARY KEY,
    status VARCHAR(100) NOT NULL,
    deliveryDate DATE NOT NULL,
    FOREIGN KEY (orderID) REFERENCES Orders(orderID)
);

-- ===================Verify Table Creation================================================
SHOW TABLES;
SHOW CREATE TABLE Orders;
SHOW CREATE TABLE MenuItems;
SHOW CREATE TABLE Order_MenuItems;

-- ================Troubleshooting Foreign Key Constraints=====================================
SHOW ENGINE INNODB STATUS;

-- ====================================Verify each Table=======================================
-- ===============================================================================================
-- Count the number of rows in Customers table
SELECT COUNT(*) FROM Customers;

-- View some sample data from Customers table
SELECT * FROM Customers LIMIT 10;

-- Count the number of rows in Orders table
SELECT COUNT(*) FROM Orders;

-- View some sample data from Orders table
SELECT * FROM Orders LIMIT 10;
-- Count the number of rows in OrderItems table
SELECT COUNT(*) FROM OrderItems;

-- View some sample data from OrderItems table
SELECT * FROM OrderItems LIMIT 10;
-- Count the number of rows in MenuItems table
SELECT COUNT(*) FROM MenuItems;

-- View some sample data from MenuItems table
SELECT * FROM MenuItems LIMIT 10;
-- Count the number of rows in Order_MenuItems table
SELECT COUNT(*) FROM Order_MenuItems;

-- View some sample data from Order_MenuItems table
SELECT * FROM Order_MenuItems LIMIT 10;
-- Count the number of rows in Bookings table
SELECT COUNT(*) FROM Bookings;

-- View some sample data from Bookings table
SELECT * FROM Bookings LIMIT 10;
-- Count the number of rows in OrderDeliveryStatus table
SELECT COUNT(*) FROM OrderDeliveryStatus;

-- View some sample data from OrderDeliveryStatus table
SELECT * FROM OrderDeliveryStatus LIMIT 10;

-- Create Additional 'Staff Table'
-- Use the new database
USE LittleLemonDBCP;

-- Create Staff Table
CREATE TABLE IF NOT EXISTS Staff (
    staffID VARCHAR(10) PRIMARY KEY,
    staffName VARCHAR(255) NOT NULL,
    role VARCHAR(100) NOT NULL,
    department VARCHAR(100) NOT NULL,
    hireDate DATE NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
);
-- ============================================Verify the Insertion in Staff Table===================================================================================
-- To verify that the data has been inserted into the Staff table, use the following SQL queries:
-- -- Count the number of rows in Staff table
SELECT COUNT(*) FROM Staff;

-- View some sample data from Staff table
SELECT * FROM Staff LIMIT 10;
-- ======================================For the time being I don't need Staff Table=======================================================================
-- Use the LittleLemonDBCP database
USE LittleLemonDBCP;

-- Drop the Staff table if it exists
DROP TABLE IF EXISTS Staff;
-- =======Implement Proceedures for the Capstone Project--=============================
-- ====================================================================================
USE LittleLemonDBCP;
-- Step 1: Creating the GetMaxQuantity Procedure
-- Task 1: -- GetMaxQuantity Procedure----------------
DELIMITER //
CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(quantity) AS max_quantity FROM Orders;
END //
DELIMITER ;
-- Step 2: Implementing and Testing the GetMaxQuantity Procedure
CALL GetMaxQuantity();

-- =============Task 2: ========= -- ManageBooking Procedure (Placeholder - Define the specific operations I need)=====================
DELIMITER //

CREATE PROCEDURE ManageBooking(IN bookingID INT)
BEGIN
    -- Retrieve booking information
    SELECT * FROM Bookings WHERE BookingID = bookingID;
END //

DELIMITER ;
CALL ManageBooking(1);

-- =============Task 3:-- Create Procedure: UpdateBooking Procedure =========================================================
-- Verify existing bookings
SELECT * FROM Bookings;

-- Direct update to see if it affects any rows
UPDATE Bookings
SET BookingDate = '2023-01-01'
WHERE BookingID = 2;

-- Drop and recreate the procedure to ensure it's correctly defined
DELIMITER //

DROP PROCEDURE IF EXISTS UpdateBooking;

CREATE PROCEDURE UpdateBooking(IN bookingID INT, IN newDate DATE)
BEGIN
    UPDATE Bookings
    SET BookingDate = newDate
    WHERE BookingID = bookingID;
END //

DELIMITER ;

-- Call the procedure to update the booking
CALL UpdateBooking(2, '2023-01-01');

-- Verify the update
SELECT * FROM Bookings WHERE BookingID = 2;

-- -- Verify the structure of the Bookings table
DESCRIBE Bookings;
-- =====================================Task 4: CancelBooking====================================================
-- Drop the existing procedure if it exists
DROP PROCEDURE IF EXISTS CancelBooking;

-- Create the CancelBooking procedure
DELIMITER //

CREATE PROCEDURE CancelBooking(IN bookingID INT)
BEGIN
    DELETE FROM Bookings
    WHERE BookingID = bookingID;
END //

DELIMITER ;

-- Call the procedure to cancel a booking
CALL CancelBooking(2);

-- Verify the booking has been cancelled
SELECT * FROM Bookings;
-- ========================= Alternative =================================================
-- 1: CancelBooking 
DROP PROCEDURE IF EXISTS CancelBooking;
-- 2: Create the CancelBooking Procedure:
DELIMITER //

CREATE PROCEDURE CancelBooking(IN bookingID INT)
BEGIN
    DELETE FROM Bookings
    WHERE BookingID = bookingID;
END //

DELIMITER ;
-- 3: Call the CancelBooking Procedure to cancel a booking with BookingID = 22:
CALL CancelBooking(22);
-- 4: Verify the Booking has been Cancelled:
SELECT * FROM Bookings;
SELECT * FROM Bookings WHERE bookingID = 22;
-- ============================Check for sample data--===============================

-- ============================================CancelBooking Procedure Implmentation================================================
-- ==================================================================================================================================
CREATE TABLE IF NOT EXISTS Bookings (
    bookingID INT PRIMARY KEY AUTO_INCREMENT,
    bookingDate DATE NOT NULL,
    customerID VARCHAR(20) NOT NULL,
    FOREIGN KEY (customerID) REFERENCES Customers(customerID)
);
-- ==========================CancelBooking Procedure ===============================================================================
-- Step 1: Drop the existing procedure if it exists
DROP PROCEDURE IF EXISTS CancelBooking;

-- Step 2: Create the CancelBooking procedure
DELIMITER //

CREATE PROCEDURE CancelBooking(IN bookingID INT)
BEGIN
    DELETE FROM Bookings WHERE bookingID = bookingID;
END //

DELIMITER ;

-- Step 3: Call the CancelBooking procedure to cancel the booking with bookingID = 22
CALL CancelBooking(22);
-- Step 4: Verify the Booking has been Cancelled:
SELECT * FROM Bookings;
SELECT * FROM Bookings WHERE bookingID = 22;

-- ================FINALLY SUCCESSFUL CODE for CancelBooking wit BookingID = 22*************************************
-- =====================================CancelBooking wit BookingID = 22============================================================================
-- =================================================================================================================
-- STEP 1:  Drop the existing CancelBooking procedure:
DROP PROCEDURE IF EXISTS CancelBooking;

-- STEP 2: Create the updated CancelBooking procedure:

DELIMITER //
CREATE PROCEDURE CancelBooking(IN p_bookingID INT)
BEGIN
    DELETE FROM Bookings WHERE bookingID = p_bookingID;
END //
DELIMITER ;

-- STEP 3: Call the CancelBooking procedure to cancel the booking with bookingID = 22:
CALL CancelBooking(22);

-- STEP 4: Verify that the booking was canceled:
SELECT * FROM Bookings WHERE bookingID = 22;
-- Verification Output:
-- After executing these steps, the output should indicate that only one row is affected, and 
-- the SELECT * FROM Bookings WHERE bookingID = 22 statement should return no rows, confirming that the booking was successfully deleted.

