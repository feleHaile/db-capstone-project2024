USE littlelemondb;
INSERT INTO littlelemondb.bookings (bookingID, bookingDate, tableNumber)
VALUES (1, '2024-05-01', 5),
       (2, '2024-05-02', 3),
       (3, '2024-05-03', 8),
       (4, '2024-05-04', 2),
       (5, '2024-05-05', 6),
       (6, '2024-05-06', 1),
       (7, '2024-05-07', 4),
       (8, '2024-05-08', 7),
       (9, '2024-05-09', 10),
       (10, '2024-05-10', 9);
       ------------
ALTER TABLE littlelemondb.customerdetails
MODIFY COLUMN customerID INT AUTO_INCREMENT;
INSERT INTO littlelemondb.customerdetails (firstName, lastName, contactNumber) 
VALUES ('John', 'Doe', '123-456-7890'),
       ('Jane', 'Smith', '987-654-3210'),
       ('Michael', 'Johnson', '456-789-0123'),
       ('Emily', 'Brown', '789-012-3456'),
       ('David', 'Wilson', '321-654-9870'),
       ('Sarah', 'Taylor', '654-321-0987'),
       ('Christopher', 'Martinez', '012-345-6789'),
       ('Jessica', 'Anderson', '234-567-8901'),
       ('Andrew', 'Thomas', '567-890-1234'),
       ('Elizabeth', 'Lee', '890-123-4567');

INSERT INTO littlelemondb.menu (menuItemID, category, itemName, price)
VALUES (1, 'Appetizer', 'Garlic Bread', 5.99),
       (2, 'Appetizer', 'Caprese Salad', 8.99),
       (3, 'Main Course', 'Spaghetti Carbonara', 12.99),
       (4, 'Main Course', 'Grilled Salmon', 16.99),
       (5, 'Dessert', 'Tiramisu', 7.99),
       (6, 'Dessert', 'Cheesecake', 6.99),
       (7, 'Beverage', 'Red Wine (Glass)', 9.99),
       (8, 'Beverage', 'White Wine (Glass)', 8.99),
       (9, 'Side Dish', 'Garlic Mashed Potatoes', 4.99),
       (10, 'Side Dish', 'Steamed Vegetables', 3.99);
INSERT INTO menu_has_orders (Menu_menuItemID, Orders_orderID, Orders_bookings_bookingID, Orders_orderdeliverystatus_orderID)
VALUES (1, 1, 1, 1),
       (2, 2, 2, 2),
       (3, 3, 3, 3),
       (4, 4, 4, 4),
       (5, 5, 5, 5),
       (6, 6, 6, 6),
       (7, 7, 7, 7),
       (8, 8, 8, 8),
       (9, 9, 9, 9),
       (10, 10, 10, 10);
INSERT INTO orderdeliverystatus (orderID, deliveryDate, status) 
VALUES 
    (11, DATE(NOW()), 'Pending'),        
    (12, DATE(NOW()), 'Preparing'),        
    (13, DATE(NOW()), 'On Route'),        
    (14, DATE(NOW()), 'Delivered'),        
    (15, DATE(NOW()), 'Completed'),        
    (16, DATE(NOW()), 'Cancelled'),        
    (17, DATE(NOW()), 'Pending'),        
    (18, DATE(NOW()), 'Preparing'),        
    (19, DATE(NOW()), 'On Route'),        
    (20, DATE(NOW()), 'Delivered');
 -- =============Insert bookingID and orderdeliverystatus_orderID columns in orders Table===========================
ALTER TABLE orders
ADD COLUMN bookingID INT,
ADD COLUMN orderdeliverystatus_orderID INT;
-- ===============Define Foreign Key Constraint==================================
ALTER TABLE orders
ADD CONSTRAINT fk_bookingID
FOREIGN KEY (bookingID) REFERENCES bookings(bookingID),
ADD CONSTRAINT fk_orderdeliverystatus_orderID
FOREIGN KEY (orderdeliverystatus_orderID) REFERENCES orderdeliverystatus(orderID);
-- 
DELETE FROM orders WHERE orderID = 1;

INSERT INTO orders (orderID, orderDate, quantity, totalCost, bookingID, orderdeliverystatus_orderID)
VALUES 
(1, STR_TO_DATE('2024-05-01 12:30:00', '%Y-%m-%d %H:%i:%s'), 2, 11.98, 1, 1),
(2, STR_TO_DATE('2024-05-02 18:45:00', '%Y-%m-%d %H:%i:%s'), 1, 8.99, 2, 2),
(3, STR_TO_DATE('2024-05-03 20:00:00', '%Y-%m-%d %H:%i:%s'), 3, 38.97, 3, 3),
(4, STR_TO_DATE('2024-05-04 13:15:00', '%Y-%m-%d %H:%i:%s'), 1, 16.99, 4, 4),
(5, STR_TO_DATE('2024-05-05 19:30:00', '%Y-%m-%d %H:%i:%s'), 2, 15.98, 5, 5),
(6, STR_TO_DATE('2024-05-06 17:45:00', '%Y-%m-%d %H:%i:%s'), 1, 6.99, 6, 6),
(7, STR_TO_DATE('2024-05-07 14:00:00', '%Y-%m-%d %H:%i:%s'), 2, 19.98, 7, 7),
(8, STR_TO_DATE('2024-05-08 21:30:00', '%Y-%m-%d %H:%i:%s'), 1, 8.99, 8, 8),
(9, STR_TO_DATE('2024-05-09 19:45:00', '%Y-%m-%d %H:%i:%s'), 3, 14.97, 9, 9),
(10, STR_TO_DATE('2024-05-10 12:00:00', '%Y-%m-%d %H:%i:%s'), 1, 9.99, 10, 10);

DELETE FROM orders WHERE orderID = 1;
INSERT INTO orders (orderID, orderDate, quantity, totalCost, bookingID, orderdeliverystatus_orderID) 
VALUES  
    (1234, STR_TO_DATE('2024-05-01 12:30:00', '%Y-%m-%d %H:%i:%s'), 2, 11.98, 1, 1),
    (1235, STR_TO_DATE('2024-05-02 18:45:00', '%Y-%m-%d %H:%i:%s'), 1, 8.99, 2, 2),
    (1236, STR_TO_DATE('2024-05-03 20:00:00', '%Y-%m-%d %H:%i:%s'), 3, 38.97, 3, 3),
    (1237, STR_TO_DATE('2024-05-04 13:15:00', '%Y-%m-%d %H:%i:%s'), 1, 16.99, 4, 4),
    (1238, STR_TO_DATE('2024-05-05 19:30:00', '%Y-%m-%d %H:%i:%s'), 2, 15.98, 5, 5),
    (1239, STR_TO_DATE('2024-05-06 17:45:00', '%Y-%m-%d %H:%i:%s'), 1, 6.99, 6, 6),
    (1240, STR_TO_DATE('2024-05-07 14:00:00', '%Y-%m-%d %H:%i:%s'), 2, 19.98, 7, 7),
    (1241, STR_TO_DATE('2024-05-08 21:30:00', '%Y-%m-%d %H:%i:%s'), 1, 8.99, 8, 8),
    (1242, STR_TO_DATE('2024-05-09 19:45:00', '%Y-%m-%d %H:%i:%s'), 3, 14.97, 9, 9),
    (1243, STR_TO_DATE('2024-05-10 12:00:00', '%Y-%m-%d %H:%i:%s'), 1, 9.99, 10, 10);

UPDATE orders 
SET orderID = LPAD(orderID, 4, '0') 
WHERE orderID < 1000;

-- Add new columns in the staffinformation Table
ALTER TABLE staffinformation
ADD COLUMN firstName VARCHAR(255),
ADD COLUMN lastName VARCHAR(255);

INSERT INTO staffinformation (staffID, role, salary, firstName, lastName)
VALUES (1001, 'Chef', 2500.00, 'Michael', 'Smith'),
       (1002, 'Server', 1500.00, 'Emily', 'Johnson'),
       (1003, 'Bartender', 1800.00, 'David', 'Wilson'),
       (1004, 'Chef', 2400.00, 'Sarah', 'Taylor'),
       (1005, 'Server', 1600.00, 'Christopher', 'Martinez'),
       (1006, 'Bartender', 1900.00, 'Jessica', 'Anderson'),
       (1007, 'Chef', 2600.00, 'Andrew', 'Thomas'),
       (1008, 'Server', 1700.00, 'Elizabeth', 'Lee'),
       (1009, 'Bartender', 2000.00, 'John', 'Doe'),
       (1010, 'Server', 1800.00, 'Jane', 'Smith');
-- =========================== Week 2 ==============================================================================
-- =======================Task 1: Creating a virtual table =========================================================
-- ===========================Description: Create a virtual table called OrdersView to focus on OrderID, Quantity, and Cost columns.===========================================
USE littlelemondb; 
-- Create a view named OrdersView
CREATE VIEW OrdersView AS 
SELECT orderID, quantity, totalCost 
FROM Orders 
WHERE quantity > 2;

Select * from OrdersView;

-- Check for Orders Table contents================
SELECT * FROM Orders;
-- ================== update the orderID number in Orders Table
UPDATE Orders
SET orderID = CASE
    WHEN orderID = 2 THEN 1222
    WHEN orderID = 3 THEN 1223
    WHEN orderID = 4 THEN 1224
    WHEN orderID = 5 THEN 1225
    WHEN orderID = 6 THEN 1226
    WHEN orderID = 7 THEN 1227
    WHEN orderID = 8 THEN 1228
    WHEN orderID = 9 THEN 1229
    WHEN orderID = 10 THEN 1210
    ELSE orderID
END;
-- ===========================Task 2 =========================================================================================
-- For your second task, Little Lemon need information from four tables on all customers with orders that cost more than $150. Extract the required information from each of the following tables by using the relevant JOIN clause: 
-- •	Customersdetails table: The customer id and full name.
-- •	Orders table: The order id and cost.
-- •	Menus table: The menus name.
-- •	MenusItems table: course name and starter name./
-- ========================================================================
SELECT
    c.customerID,
    CONCAT(c.firstName, ' ', c.lastName) AS fullName,
    o.orderID,
    o.totalCost AS orderCost,
    m.menuName AS itemName,
    mi.courseName AS category,
    mi.starterName AS price
FROM
    Orders o
JOIN
    Customerdetails c ON o.customerID = c.customerID
JOIN
    Menu m ON o.menuID = m.menuID
JOIN
    MenuItems mi ON o.menuItemID = mi.menuItemID
WHERE
    o.totalCost > 150
ORDER BY
    o.totalCost ASC
LIMIT 0, 1000;
-- show Tables columns
SHOW COLUMNS FROM Customerdetails; -- customerID firstName lastName contactNumber
SHOW COLUMNS FROM Orders; -- orderId orderDate quantity totalCost bookingID orderdeliverystatus_orderID
SHOW COLUMNS FROM Menu; -- menuItemID category, itemName price
--- Create Table 
CREATE TABLE MenuItems (
    menuItemID INT AUTO_INCREMENT PRIMARY KEY,
    courseName VARCHAR(255),
    starterName VARCHAR(255)
);
-- Populate  MenuItems Table with data
INSERT INTO MenuItems (courseName, starterName) VALUES
('Appetizers', 'Caprese Salad'),
('Appetizers', 'Garlic Bread'),
('Main Course', 'Grilled Salmon'),
('Main Course', 'Chicken Alfredo'),
('Desserts', 'Tiramisu'),
('Desserts', 'Chocolate Cake'),
('Appetizers', 'Bruschetta'),
('Main Course', 'Vegetable Stir-Fry'),
('Desserts', 'Cheesecake'),
('Appetizers', 'Shrimp Cocktail');

--               ==========================TASK 2 =============================
SELECT
    cd.customerID,
    CONCAT(cd.firstName, ' ', cd.lastName) AS fullName,
    o.orderID,
    o.totalCost,
    m.itemName,
    mi.courseName,
    mi.starterName
FROM
    Customerdetails cd
JOIN
    Orders o ON cd.customerID = o.customerID
JOIN
    MenuItems mi ON o.menuItemID = mi.menuItemID
JOIN
    Menu m ON mi.menuID = m.menuID
WHERE
    o.totalCost > 150
ORDER BY
    o.totalCost ASC
LIMIT 0, 1000;
-- ====================Describe each Table for the respective Table contents:===================================
USE littlelemondb;
DESCRIBE Customerdetails;
DESCRIBE Orders;
DESCRIBE MenuItems;
DESCRIBE Menu;
DESCRIBE bookings;
DESCRIBE staffinformation;
DESCRIBE orderdeliverystatus;
DESCRIBE menu_has_orders;
-- =======================================
SELECT
    cd.customerID,
    CONCAT(cd.firstName, ' ', cd.lastName) AS fullName,
    o.orderID,
    o.totalCost,
    m.itemName,
    mi.courseName,
    mi.starterName
FROM
    littlelemondb.Customerdetails cd
JOIN
    littlelemondb.Orders o ON cd.customerID = o.customerID
JOIN
    littlelemondb.MenuItems mi ON o.menuItemID = mi.menuItemID
JOIN
    littlelemondb.Menu m ON mi.menuID = m.menuID
WHERE
    o.totalCost > 150
ORDER BY
    o.totalCost ASC
LIMIT 0, 1000;

-- ==============================================Rename Older Tables and Columns--========================================================================
USE littlelemondb;
RENAME TABLE Orders TO OldOrders;

CREATE TABLE Orders (
    orderID INT(11) NOT NULL PRIMARY KEY,
    cost DECIMAL(10,2) NOT NULL,
    menuItemID INT(11),
    courseName VARCHAR(255),
    starterName VARCHAR(255)
);

INSERT INTO Orders (orderID, cost)
SELECT orderID, totalCost
FROM OldOrders;

DROP TABLE OldOrders;

-- menus
USE littlelemondb;

RENAME TABLE Menu TO Menus;

ALTER TABLE Menus
ADD COLUMN menuName VARCHAR(255) NOT NULL PRIMARY KEY;

ALTER TABLE Menus
DROP COLUMN menuItemID, DROP COLUMN category, DROP COLUMN itemName, DROP COLUMN price;

ALTER TABLE Menus
ADD COLUMN menuItemID INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
ADD COLUMN category VARCHAR(200) NOT NULL,
ADD COLUMN itemName VARCHAR(200) NOT NULL,
ADD COLUMN price DECIMAL(10,2) NOT NULL;

DROP TABLE menus;
DROP TABLE customerdetails;
DROP TABLE staffinformation;
DROP TABLE littlelemondatafile;
-- =======================================CREATE TABLES AND COLUMNS==========================================================================
USE littlelemondb;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(255)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    TotalCost DECIMAL(10,2)
);

CREATE TABLE Menus (
    MenuID INT PRIMARY KEY,
    MenuName VARCHAR(255)
);

CREATE TABLE MenuItems (
    MenuItemID INT PRIMARY KEY,
    CourseName VARCHAR(255),
    StarterName VARCHAR(255)
);

CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY,
    BookingDate DATE,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Menu_Has_Orders (
    MenuID INT,
    OrderID INT,
    FOREIGN KEY (MenuID) REFERENCES Menus(MenuID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

CREATE TABLE OrderDeliveryStatus (
    OrderID INT PRIMARY KEY,
    Status VARCHAR(100),
    DeliveryDate DATE,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    Name VARCHAR(255),
    Role VARCHAR(100)
);

DROP VIEW IF EXISTS littlelemondb.ordersview;
 -- Try Creating Tables-----
CREATE DATABASE IF NOT EXISTS littlelemondb;

USE littlelemondb;

CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT PRIMARY KEY,
    TotalCost DECIMAL(10,2)
);

CREATE TABLE IF NOT EXISTS Menus (
    MenuID INT PRIMARY KEY,
    MenuName VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS MenuItems (
    MenuItemID INT PRIMARY KEY,
    CourseName VARCHAR(255),
    StarterName VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Bookings (
    BookingID INT PRIMARY KEY,
    BookingDate DATE,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE IF NOT EXISTS Menu_Has_Orders (
    MenuID INT,
    OrderID INT,
    FOREIGN KEY (MenuID) REFERENCES Menus(MenuID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

CREATE TABLE IF NOT EXISTS OrderDeliveryStatus (
    OrderID INT PRIMARY KEY,
    Status VARCHAR(100),
    DeliveryDate DATE,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Staff Table
CREATE TABLE IF NOT EXISTS Staff (
    StaffID INT PRIMARY KEY,
    Name VARCHAR(255),
    Role VARCHAR(100)
);
  -- CREATE Ordersview --
  -- Create or use the database
CREATE DATABASE IF NOT EXISTS littlelemondb;
USE littlelemondb;

-- Customers Table
CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(255)
);

-- Orders Table
CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT PRIMARY KEY,
    TotalCost DECIMAL(10,2)
);

-- Menus Table
CREATE TABLE IF NOT EXISTS Menus (
    MenuID INT PRIMARY KEY,
    MenuName VARCHAR(255)
);

-- MenuItems Table
CREATE TABLE IF NOT EXISTS MenuItems (
    MenuItemID INT PRIMARY KEY,
    CourseName VARCHAR(255),
    StarterName VARCHAR(255)
);

-- Bookings Table
CREATE TABLE IF NOT EXISTS Bookings (
    BookingID INT PRIMARY KEY,
    BookingDate DATE,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Menu_Has_Orders Table
CREATE TABLE IF NOT EXISTS Menu_Has_Orders (
    MenuID INT,
    OrderID INT,
    FOREIGN KEY (MenuID) REFERENCES Menus(MenuID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- OrderDeliveryStatus Table
CREATE TABLE IF NOT EXISTS OrderDeliveryStatus (
    OrderID INT PRIMARY KEY,
    Status VARCHAR(100),
    DeliveryDate DATE,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Staff Table (Already exists, so no need to recreate it)
-- CREATE TABLE IF NOT EXISTS Staff (
--    StaffID INT PRIMARY KEY,
--    Name VARCHAR(255),
--    Role VARCHAR(100)
-- );

-- Create or Replace View----------------------
-- Create or use the database
CREATE DATABASE IF NOT EXISTS littlelemondb;
USE littlelemondb;

-- Customers Table
CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(255)
);

-- Orders Table
-- Orders Table
CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT PRIMARY KEY,
    TotalCost DECIMAL(10,2),
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Menus Table
CREATE TABLE IF NOT EXISTS Menus (
    MenuID INT PRIMARY KEY,
    MenuName VARCHAR(255)
);

-- MenuItems Table
CREATE TABLE IF NOT EXISTS MenuItems (
    MenuItemID INT PRIMARY KEY,
    CourseName VARCHAR(255),
    StarterName VARCHAR(255)
);

-- Bookings Table
CREATE TABLE IF NOT EXISTS Bookings (
    BookingID INT PRIMARY KEY,
    BookingDate DATE,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Menu_Has_Orders Table
CREATE TABLE IF NOT EXISTS Menu_Has_Orders (
    MenuID INT,
    OrderID INT,
    FOREIGN KEY (MenuID) REFERENCES Menus(MenuID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- OrderDeliveryStatus Table
CREATE TABLE IF NOT EXISTS OrderDeliveryStatus (
    OrderID INT PRIMARY KEY,
    Status VARCHAR(100),
    DeliveryDate DATE,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Staff Table (Already exists, so no need to recreate it)
-- CREATE TABLE IF NOT EXISTS Staff (
--    StaffID INT PRIMARY KEY,
--    Name VARCHAR(255),
--    Role VARCHAR(100)
-- );

-- Create or Replace View
CREATE OR REPLACE VIEW ordersview AS
SELECT 
    o.OrderID,
    o.TotalCost,
    c.FullName AS CustomerName,
    m.MenuName,
    mi.CourseName,
    mi.StarterName,
    b.BookingDate,
    ods.Status,
    ods.DeliveryDate,
    s.Name AS StaffName,
    s.Role
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Bookings b ON o.CustomerID = b.CustomerID
JOIN Menu_Has_Orders mho ON o.OrderID = mho.OrderID
JOIN Menus m ON mho.MenuID = m.MenuID
JOIN MenuItems mi ON mho.MenuID = mi.MenuItemID
JOIN OrderDeliveryStatus ods ON o.OrderID = ods.OrderID
JOIN Staff s ON ods.OrderID = s.StaffID;
-- ============================ SUCCESSFULY CREATED ================================================================================================================================
-- Create or use the database
CREATE DATABASE IF NOT EXISTS littlelemondb;
USE littlelemondb;

-- Customers Table
CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(255)
);

-- Orders Table
-- Ensure Orders Table exists and add CustomerID if it doesn't exist
ALTER TABLE Orders
ADD COLUMN IF NOT EXISTS CustomerID INT,
ADD FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);

-- Menus Table
CREATE TABLE IF NOT EXISTS Menus (
    MenuID INT PRIMARY KEY,
    MenuName VARCHAR(255)
);

-- MenuItems Table
CREATE TABLE IF NOT EXISTS MenuItems (
    MenuItemID INT PRIMARY KEY,
    CourseName VARCHAR(255),
    StarterName VARCHAR(255)
);

-- Bookings Table
CREATE TABLE IF NOT EXISTS Bookings (
    BookingID INT PRIMARY KEY,
    BookingDate DATE,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Menu_Has_Orders Table
CREATE TABLE IF NOT EXISTS Menu_Has_Orders (
    MenuID INT,
    OrderID INT,
    FOREIGN KEY (MenuID) REFERENCES Menus(MenuID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- OrderDeliveryStatus Table
CREATE TABLE IF NOT EXISTS OrderDeliveryStatus (
    OrderID INT PRIMARY KEY,
    Status VARCHAR(100),
    DeliveryDate DATE,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Staff Table (Already exists, so no need to recreate it)
-- CREATE TABLE IF NOT EXISTS Staff (
--    StaffID INT PRIMARY KEY,
--    Name VARCHAR(255),
--    Role VARCHAR(100)
-- );
-- ====================================CREATE ORDERS VIEW------------------------------------------------------------==================================================================================================
CREATE OR REPLACE VIEW ordersview AS
SELECT 
    o.OrderID,
    o.TotalCost,
    c.FullName AS CustomerName,
    m.MenuName,
    mi.CourseName,
    mi.StarterName,
    b.BookingDate,
    ods.Status,
    ods.DeliveryDate,
    s.Name AS StaffName,
    s.Role
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Bookings b ON c.CustomerID = b.CustomerID
JOIN Menu_Has_Orders mho ON o.OrderID = mho.OrderID
JOIN Menus m ON mho.MenuID = m.MenuID
JOIN MenuItems mi ON mho.MenuID = mi.MenuItemID
JOIN OrderDeliveryStatus ods ON o.OrderID = ods.OrderID
JOIN Staff s ON ods.OrderID = s.StaffID;

-- ====== VERIFICATION====================================================================================================================================================================
SELECT * FROM ordersview LIMIT 10;

-- ==========================================================//============================================================================================
-- Create or use the database
CREATE DATABASE IF NOT EXISTS littlelemondb;
USE littlelemondb;

-- Drop existing tables to avoid conflicts
DROP TABLE IF EXISTS OrderDeliveryStatus, Menu_Has_Orders, Bookings, MenuItems, Menus, Orders, Customers;

-- Customers Table
CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(255)
);

-- Orders Table
CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT PRIMARY KEY,
    TotalCost DECIMAL(10,2),
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Menus Table
CREATE TABLE IF NOT EXISTS Menus (
    MenuID INT PRIMARY KEY,
    MenuName VARCHAR(255)
);

-- MenuItems Table
CREATE TABLE IF NOT EXISTS MenuItems (
    MenuItemID INT PRIMARY KEY,
    CourseName VARCHAR(255),
    StarterName VARCHAR(255)
);

-- Bookings Table
CREATE TABLE IF NOT EXISTS Bookings (
    BookingID INT PRIMARY KEY,
    BookingDate DATE,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Menu_Has_Orders Table
CREATE TABLE IF NOT EXISTS Menu_Has_Orders (
    MenuID INT,
    OrderID INT,
    FOREIGN KEY (MenuID) REFERENCES Menus(MenuID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- OrderDeliveryStatus Table
CREATE TABLE IF NOT EXISTS OrderDeliveryStatus (
    OrderID INT PRIMARY KEY,
    Status VARCHAR(100),
    DeliveryDate DATE,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Staff Table (Already exists, so no need to recreate it)
-- CREATE TABLE IF NOT EXISTS Staff (
--    StaffID INT PRIMARY KEY,
--    Name VARCHAR(255),
--    Role VARCHAR(100)
-- );

-- Clear existing data in Customers table
DELETE FROM Customers;

-- Populate Customers Table
INSERT INTO Customers (CustomerID, FullName) VALUES
(1, 'Emma Brown'),
(2, 'Liam Smith'),
(3, 'Olivia Johnson'),
(4, 'Noah Williams');

-- Populate Orders Table with unique OrderID values
INSERT INTO Orders (OrderID, TotalCost, CustomerID) VALUES
(1001, 45.50, 1),
(1002, 60.00, 2),
(1003, 30.25, 3),
(1004, 75.10, 4),
(1005, 90.00, 1),
(1006, 50.75, 2),
(1007, 80.40, 3),
(1008, 55.30, 4);
-- Check existing data in Menus table
SELECT * FROM Menus;

-- Remove existing data if necessary
DELETE FROM Menus;

-- Populate Menus Table
INSERT INTO Menus (MenuID, MenuName) VALUES
(1, 'Breakfast Menu'),
(2, 'Lunch Menu'),
(3, 'Dinner Menu');

-- Populate MenuItems Table
INSERT INTO MenuItems (MenuItemID, CourseName, StarterName) VALUES
(1, 'Pancakes', 'Fruit Salad'),
(2, 'Omelette', 'Bread Basket'),
(3, 'Steak', 'Caesar Salad'),
(4, 'Pasta', 'Garlic Bread');

-- Populate Bookings Table
INSERT INTO Bookings (BookingID, BookingDate, CustomerID) VALUES
(1, '2023-05-01', 1),
(2, '2023-05-02', 2),
(3, '2023-05-03', 3),
(4, '2023-05-04', 4);

-- Populate Menu_Has_Orders Table
INSERT INTO Menu_Has_Orders (MenuID, OrderID) VALUES
(1, 1001),
(2, 1002),
(3, 1003),
(1, 1004),
(2, 1005),
(3, 1006),
(1, 1007),
(2, 1008);

-- Populate OrderDeliveryStatus Table
INSERT INTO OrderDeliveryStatus (OrderID, Status, DeliveryDate) VALUES
(1001, 'Delivered', '2023-05-01'),
(1002, 'Pending', '2023-05-02'),
(1003, 'Delivered', '2023-05-03'),
(1004, 'Delivered', '2023-05-04'),
(1005, 'Pending', '2023-05-05'),
(1006, 'Delivered', '2023-05-06'),
(1007, 'Delivered', '2023-05-07'),
(1008, 'Pending', '2023-05-08');

-- Create the view
CREATE OR REPLACE VIEW ordersview AS
SELECT 
    o.OrderID,
    o.TotalCost,
    c.FullName AS CustomerName,
    m.MenuName,
    mi.CourseName,
    mi.StarterName,
    b.BookingDate,
    ods.Status,
    ods.DeliveryDate,
    s.Name AS StaffName,
    s.Role
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Bookings b ON o.CustomerID = b.CustomerID
JOIN Menu_Has_Orders mho ON o.OrderID = mho.OrderID
JOIN Menus m ON mho.MenuID = m.MenuID
JOIN MenuItems mi ON mho.MenuID = mi.MenuItemID
JOIN OrderDeliveryStatus ods ON o.OrderID = ods.OrderID
JOIN Staff s ON ods.OrderID = s.StaffID;

-- Verification
SELECT * FROM ordersview LIMIT 10;



-- NEW =====================================================================
-- Create or use the database
CREATE DATABASE IF NOT EXISTS littlelemondb;
USE littlelemondb;

-- Drop existing tables to avoid conflicts
DROP TABLE IF EXISTS OrderDeliveryStatus, Menu_Has_Orders, Bookings, MenuItems, Menus, Orders, Customers;

-- Customers Table
CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(255)
);

-- Orders Table
CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT PRIMARY KEY,
    TotalCost DECIMAL(10,2),
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Menus Table
CREATE TABLE IF NOT EXISTS Menus (
    MenuID INT PRIMARY KEY,
    MenuName VARCHAR(255)
);

-- MenuItems Table
CREATE TABLE IF NOT EXISTS MenuItems (
    MenuItemID INT PRIMARY KEY,
    CourseName VARCHAR(255),
    StarterName VARCHAR(255)
);

-- Bookings Table
CREATE TABLE IF NOT EXISTS Bookings (
    BookingID INT PRIMARY KEY,
    BookingDate DATE,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Menu_Has_Orders Table
CREATE TABLE IF NOT EXISTS Menu_Has_Orders (
    MenuID INT,
    OrderID INT,
    FOREIGN KEY (MenuID) REFERENCES Menus(MenuID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- OrderDeliveryStatus Table
CREATE TABLE IF NOT EXISTS OrderDeliveryStatus (
    OrderID INT PRIMARY KEY,
    Status VARCHAR(100),
    DeliveryDate DATE,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Staff Table (Already exists, so no need to recreate it)
-- CREATE TABLE IF NOT EXISTS Staff (
--    StaffID INT PRIMARY KEY,
--    Name VARCHAR(255),
--    Role VARCHAR(100)
-- );

-- Populate Customers Table
INSERT INTO Customers (CustomerID, FullName) VALUES
(1, 'Emma Brown'),
(2, 'Liam Smith'),
(3, 'Olivia Johnson'),
(4, 'Noah Williams');

-- Populate Orders Table with unique OrderID values
INSERT INTO Orders (OrderID, TotalCost, CustomerID) VALUES
(1001, 45.50, 1),
(1002, 60.00, 2),
(1003, 30.25, 3),
(1004, 75.10, 4),
(1005, 90.00, 1),
(1006, 50.75, 2),
(1007, 80.40, 3),
(1008, 55.30, 4);

-- Populate Menus Table
INSERT INTO Menus (MenuID, MenuName) VALUES
(1, 'Breakfast Menu'),
(2, 'Lunch Menu'),
(3, 'Dinner Menu');

-- Populate MenuItems Table
INSERT INTO MenuItems (MenuItemID, CourseName, StarterName) VALUES
(1, 'Pancakes', 'Fruit Salad'),
(2, 'Omelette', 'Bread Basket'),
(3, 'Steak', 'Caesar Salad'),
(4, 'Pasta', 'Garlic Bread');

-- Populate Bookings Table
INSERT INTO Bookings (BookingID, BookingDate, CustomerID) VALUES
(1, '2023-05-01', 1),
(2, '2023-05-02', 2),
(3, '2023-05-03', 3),
(4, '2023-05-04', 4);

-- Populate Menu_Has_Orders Table
INSERT INTO Menu_Has_Orders (MenuID, OrderID) VALUES
(1, 1001),
(2, 1002),
(3, 1003),
(1, 1004),
(2, 1005),
(3, 1006),
(1, 1007),
(2, 1008);

-- Populate OrderDeliveryStatus Table
INSERT INTO OrderDeliveryStatus (OrderID, Status, DeliveryDate) VALUES
(1001, 'Delivered', '2023-05-01'),
(1002, 'Pending', '2023-05-02'),
(1003, 'Delivered', '2023-05-03'),
(1004, 'Delivered', '2023-05-04'),
(1005, 'Pending', '2023-05-05'),
(1006, 'Delivered', '2023-05-06'),
(1007, 'Delivered', '2023-05-07'),
(1008, 'Pending', '2023-05-08');

-- Create the view
CREATE OR REPLACE VIEW ordersview AS
SELECT 
    o.OrderID,
    o.TotalCost,
    c.FullName AS CustomerName,
    m.MenuName,
    mi.CourseName,
    mi.StarterName,
    b.BookingDate,
    ods.Status,
    ods.DeliveryDate,
    s.Name AS StaffName,
    s.Role
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Bookings b ON o.CustomerID = b.CustomerID
JOIN Menu_Has_Orders mho ON o.OrderID = mho.OrderID
JOIN Menus m ON mho.MenuID = m.MenuID
JOIN MenuItems mi ON mho.MenuID = mi.MenuItemID
JOIN OrderDeliveryStatus ods ON o.OrderID = ods.OrderID
JOIN Staff s ON ods.OrderID = s.StaffID;

-- Verification
SELECT * FROM ordersview LIMIT 10;

-- Check existing data in OrderDeliveryStatus table
SELECT * FROM OrderDeliveryStatus;

-- Remove existing data if necessary
DELETE FROM OrderDeliveryStatus;

-- Populate OrderDeliveryStatus Table
INSERT INTO OrderDeliveryStatus (OrderID, Status, DeliveryDate) VALUES
(1001, 'Delivered', '2023-05-01'),
(1002, 'Pending', '2023-05-02'),
(1003, 'Delivered', '2023-05-03'),
(1004, 'Delivered', '2023-05-04'),
(1005, 'Pending', '2023-05-05'),
(1006, 'Delivered', '2023-05-06'),
(1007, 'Delivered', '2023-05-07'),
(1008, 'Pending', '2023-05-08');

-- ===============================Full script TEST----
-- Create or use the database
CREATE DATABASE IF NOT EXISTS littlelemondb;
USE littlelemondb;

-- Drop existing tables to avoid conflicts
DROP TABLE IF EXISTS OrderDeliveryStatus, Menu_Has_Orders, Bookings, MenuItems, Menus, Orders, Customers;

-- Customers Table
CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(255)
);

-- Orders Table
CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT PRIMARY KEY,
    TotalCost DECIMAL(10,2),
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Menus Table
CREATE TABLE IF NOT EXISTS Menus (
    MenuID INT PRIMARY KEY,
    MenuName VARCHAR(255)
);

-- MenuItems Table
CREATE TABLE IF NOT EXISTS MenuItems (
    MenuItemID INT PRIMARY KEY,
    CourseName VARCHAR(255),
    StarterName VARCHAR(255)
);

-- Bookings Table
CREATE TABLE IF NOT EXISTS Bookings (
    BookingID INT PRIMARY KEY,
    BookingDate DATE,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Menu_Has_Orders Table
CREATE TABLE IF NOT EXISTS Menu_Has_Orders (
    MenuID INT,
    OrderID INT,
    FOREIGN KEY (MenuID) REFERENCES Menus(MenuID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- OrderDeliveryStatus Table
CREATE TABLE IF NOT EXISTS OrderDeliveryStatus (
    OrderID INT PRIMARY KEY,
    Status VARCHAR(100),
    DeliveryDate DATE,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Staff Table (Already exists, so no need to recreate it)
-- CREATE TABLE IF NOT EXISTS Staff (
--    StaffID INT PRIMARY KEY,
--    Name VARCHAR(255),
--    Role VARCHAR(100)
-- );

-- Clear existing data in Customers table
DELETE FROM Customers;

-- Clear existing data in Orders table
DELETE FROM Orders;

-- Clear existing data in Menus table
DELETE FROM Menus;

-- Clear existing data in MenuItems table
DELETE FROM MenuItems;

-- Clear existing data in Bookings table
DELETE FROM Bookings;

-- Clear existing data in Menu_Has_Orders table
DELETE FROM Menu_Has_Orders;

-- Clear existing data in OrderDeliveryStatus table
DELETE FROM OrderDeliveryStatus;

-- Populate Customers Table
INSERT INTO Customers (CustomerID, FullName) VALUES
(1, 'Emma Brown'),
(2, 'Liam Smith'),
(3, 'Olivia Johnson'),
(4, 'Noah Williams');

-- Populate Orders Table with unique OrderID values
INSERT INTO Orders (OrderID, TotalCost, CustomerID) VALUES
(1001, 45.50, 1),
(1002, 60.00, 2),
(1003, 30.25, 3),
(1004, 75.10, 4),
(1005, 90.00, 1),
(1006, 50.75, 2),
(1007, 80.40, 3),
(1008, 55.30, 4);

-- Populate Menus Table
INSERT INTO Menus (MenuID, MenuName) VALUES
(1, 'Breakfast Menu'),
(2, 'Lunch Menu'),
(3, 'Dinner Menu');

-- Populate MenuItems Table
INSERT INTO MenuItems (MenuItemID, CourseName, StarterName) VALUES
(1, 'Pancakes', 'Fruit Salad'),
(2, 'Omelette', 'Bread Basket'),
(3, 'Steak', 'Caesar Salad'),
(4, 'Pasta', 'Garlic Bread');

-- Populate Bookings Table
INSERT INTO Bookings (BookingID, BookingDate, CustomerID) VALUES
(1, '2023-05-01', 1),
(2, '2023-05-02', 2),
(3, '2023-05-03', 3),
(4, '2023-05-04', 4);

-- Populate Menu_Has_Orders Table
INSERT INTO Menu_Has_Orders (MenuID, OrderID) VALUES
(1, 1001),
(2, 1002),
(3, 1003),
(1, 1004),
(2, 1005),
(3, 1006),
(1, 1007),
(2, 1008);

-- Populate OrderDeliveryStatus Table
INSERT INTO OrderDeliveryStatus (OrderID, Status, DeliveryDate) VALUES
(1001, 'Delivered', '2023-05-01'),
(1002, 'Pending', '2023-05-02'),
(1003, 'Delivered', '2023-05-03'),
(1004, 'Delivered', '2023-05-04'),
(1005, 'Pending', '2023-05-05'),
(1006, 'Delivered', '2023-05-06'),
(1007, 'Delivered', '2023-05-07'),
(1008, 'Pending', '2023-05-08');

-- Create the view
CREATE OR REPLACE VIEW ordersview AS
SELECT 
    o.OrderID,
    o.TotalCost,
    c.FullName AS CustomerName,
    m.MenuName,
    mi.CourseName,
    mi.StarterName,
    b.BookingDate,
    ods.Status,
    ods.DeliveryDate,
    s.Name AS StaffName,
    s.Role
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Bookings b ON o.CustomerID = b.CustomerID
JOIN Menu_Has_Orders mho ON o.OrderID = mho.OrderID
JOIN Menus m ON mho.MenuID = m.MenuID
JOIN MenuItems mi ON mho.MenuID = mi.MenuItemID
JOIN OrderDeliveryStatus ods ON o.OrderID = ods.OrderID
JOIN Staff s ON ods.OrderID = s.StaffID;

-- Verification
SELECT * FROM ordersview LIMIT 10;

-- Verify data in Customers table
SELECT * FROM Customers;

-- Verify data in Orders table
SELECT * FROM Orders;

-- Verify data in Menus table
SELECT * FROM Menus;

-- Verify data in MenuItems table
SELECT * FROM MenuItems;

-- Verify data in Bookings table
SELECT * FROM Bookings;

-- Verify data in Menu_Has_Orders table
SELECT * FROM Menu_Has_Orders;

-- Verify data in OrderDeliveryStatus table
SELECT * FROM OrderDeliveryStatus;
-- ===============================
-- Verify data in Customers table
SELECT * FROM Customers;

-- Verify data in Orders table
SELECT * FROM Orders;

-- Clear existing data in Bookings table
DELETE FROM Bookings;

-- Populate Bookings Table
INSERT INTO Bookings (BookingID, BookingDate, CustomerID) VALUES
(1, '2023-05-01', 1),
(2, '2023-05-02', 2),
(3, '2023-05-03', 3),
(4, '2023-05-04', 4);

-- Clear existing data in Menu_Has_Orders table
DELETE FROM Menu_Has_Orders;

-- Populate Menu_Has_Orders Table
INSERT INTO Menu_Has_Orders (MenuID, OrderID) VALUES
(1, 1001),
(2, 1002),
(3, 1003),
(1, 1004),
(2, 1005),
(3, 1006),
(1, 1007),
(2, 1008);
-- ====================
-- Create or use the database
CREATE DATABASE IF NOT EXISTS littlelemondb;
USE littlelemondb;

-- Verify data in Customers table
SELECT * FROM Customers;

-- Verify data in Orders table
SELECT * FROM Orders;

-- Clear existing data in Bookings table
DELETE FROM Bookings;

-- Populate Bookings Table
INSERT INTO Bookings (BookingID, BookingDate, CustomerID) VALUES
(1, '2023-05-01', 1),
(2, '2023-05-02', 2),
(3, '2023-05-03', 3),
(4, '2023-05-04', 4);

-- Verify data in Bookings table
SELECT * FROM Bookings;

-- Clear existing data in Menu_Has_Orders table
DELETE FROM Menu_Has_Orders;

-- Populate Menu_Has_Orders Table
INSERT INTO Menu_Has_Orders (MenuID, OrderID) VALUES
(1, 1001),
(2, 1002),
(3, 1003),
(1, 1004),
(2, 1005),
(3, 1006),
(1, 1007),
(2, 1008);

-- Verify data in Menu_Has_Orders table
SELECT * FROM Menu_Has_Orders;

-- Create the view
CREATE OR REPLACE VIEW ordersview AS
SELECT 
    o.OrderID,
    o.TotalCost,
    c.FullName AS CustomerName,
    m.MenuName,
    mi.CourseName,
    mi.StarterName,
    b.BookingDate,
    ods.Status,
    ods.DeliveryDate,
    s.Name AS StaffName,
    s.Role
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Bookings b ON o.CustomerID = b.CustomerID
JOIN Menu_Has_Orders mho ON o.OrderID = mho.OrderID
JOIN Menus m ON mho.MenuID = m.MenuID
JOIN MenuItems mi ON mho.MenuID = mi.MenuItemID
JOIN OrderDeliveryStatus ods ON o.OrderID = ods.OrderID
JOIN Staff s ON ods.OrderID = s.StaffID;

-- Verification
SELECT * FROM ordersview LIMIT 10;


-- =============================================
-- Verify data in Customers table
SELECT * FROM Customers;

-- Verify data in Orders table
SELECT * FROM Orders;

-- Verify data in Menus table
SELECT * FROM Menus;

-- Verify data in MenuItems table
SELECT * FROM MenuItems;

-- Verify data in Bookings table
SELECT * FROM Bookings;

-- Verify data in Menu_Has_Orders table
SELECT * FROM Menu_Has_Orders;

-- Verify data in OrderDeliveryStatus table
SELECT * FROM OrderDeliveryStatus;

-- Create or use the database
CREATE DATABASE IF NOT EXISTS littlelemondb;
USE littlelemondb;

-- Drop existing tables to avoid conflicts
DROP TABLE IF EXISTS OrderDeliveryStatus, Menu_Has_Orders, Bookings, MenuItems, Menus, Orders, Customers;

-- Customers Table
CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(255)
);

-- Orders Table
CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT PRIMARY KEY,
    TotalCost DECIMAL(10,2),
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Menus Table
CREATE TABLE IF NOT EXISTS Menus (
    MenuID INT PRIMARY KEY,
    MenuName VARCHAR(255)
);

-- MenuItems Table
CREATE TABLE IF NOT EXISTS MenuItems (
    MenuItemID INT PRIMARY KEY,
    CourseName VARCHAR(255),
    StarterName VARCHAR(255)
);

-- Bookings Table
CREATE TABLE IF NOT EXISTS Bookings (
    BookingID INT PRIMARY KEY,
    BookingDate DATE,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Menu_Has_Orders Table
CREATE TABLE IF NOT EXISTS Menu_Has_Orders (
    MenuID INT,
    OrderID INT,
    FOREIGN KEY (MenuID) REFERENCES Menus(MenuID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- OrderDeliveryStatus Table
CREATE TABLE IF NOT EXISTS OrderDeliveryStatus (
    OrderID INT PRIMARY KEY,
    Status VARCHAR(100),
    DeliveryDate DATE,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Staff Table (Already exists, so no need to recreate it)
-- CREATE TABLE IF NOT EXISTS Staff (
--    StaffID INT PRIMARY KEY,
--    Name VARCHAR(255),
--    Role VARCHAR(100)
-- );

-- Populate Customers Table
INSERT INTO Customers (CustomerID, FullName) VALUES
(1, 'Emma Brown'),
(2, 'Liam Smith'),
(3, 'Olivia Johnson'),
(4, 'Noah Williams');

-- Populate Orders Table with unique OrderID values
INSERT INTO Orders (OrderID, TotalCost, CustomerID) VALUES
(1001, 45.50, 1),
(1002, 60.00, 2),
(1003, 30.25, 3),
(1004, 75.10, 4),
(1005, 90.00, 1),
(1006, 50.75, 2),
(1007, 80.40, 3),
(1008, 55.30, 4);

-- Populate Menus Table
INSERT INTO Menus (MenuID, MenuName) VALUES
(1, 'Breakfast Menu'),
(2, 'Lunch Menu'),
(3, 'Dinner Menu');

-- Populate MenuItems Table
INSERT INTO MenuItems (MenuItemID, CourseName, StarterName) VALUES
(1, 'Pancakes', 'Fruit Salad'),
(2, 'Omelette', 'Bread Basket'),
(3, 'Steak', 'Caesar Salad'),
(4, 'Pasta', 'Garlic Bread');

-- Populate Bookings Table
INSERT INTO Bookings (BookingID, BookingDate, CustomerID) VALUES
(1, '2023-05-01', 1),
(2, '2023-05-02', 2),
(3, '2023-05-03', 3),
(4, '2023-05-04', 4);

-- Populate Menu_Has_Orders Table
INSERT INTO Menu_Has_Orders (MenuID, OrderID) VALUES
(1, 1001),
(2, 1002),
(3, 1003),
(1, 1004),
(2, 1005),
(3, 1006),
(1, 1007),
(2, 1008);

-- Populate OrderDeliveryStatus Table
INSERT INTO OrderDeliveryStatus (OrderID, Status, DeliveryDate) VALUES
(1001, 'Delivered', '2023-05-01'),
(1002, 'Pending', '2023-05-02'),
(1003, 'Delivered', '2023-05-03'),
(1004, 'Delivered', '2023-05-04'),
(1005, 'Pending', '2023-05-05'),
(1006, 'Delivered', '2023-05-06'),
(1007, 'Delivered', '2023-05-07'),
(1008, 'Pending', '2023-05-08');

-- Create the view
CREATE OR REPLACE VIEW ordersview AS
SELECT 
    o.OrderID,
    o.TotalCost,
    c.FullName AS CustomerName,
    m.MenuName,
    mi.CourseName,
    mi.StarterName,
    b.BookingDate,
    ods.Status,
    ods.DeliveryDate,
    s.Name AS StaffName,
    s.Role
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Bookings b ON o.CustomerID = b.CustomerID
JOIN Menu_Has_Orders mho ON o.OrderID = mho.OrderID
JOIN Menus m ON mho.MenuID = m.MenuID
JOIN MenuItems mi ON mho.MenuID = mi.MenuItemID
JOIN OrderDeliveryStatus ods ON o.OrderID = ods.OrderID
JOIN Staff s ON ods.OrderID = s.StaffID;

-- Verification
SELECT * FROM ordersview LIMIT 10;

-- Verify data in Customers table
SELECT * FROM Customers;

-- Verify data in Orders table
SELECT * FROM Orders;

-- Verify data in Menus table
SELECT * FROM Menus;

-- Verify data in MenuItems table
SELECT * FROM MenuItems;

-- Verify data in Bookings table
SELECT * FROM Bookings;

-- Verify data in Menu_Has_Orders table
SELECT * FROM Menu_Has_Orders;

-- Verify data in OrderDeliveryStatus table
SELECT * FROM OrderDeliveryStatus;
-- ==================================Step 1: Check CustomerID in Bookings against Customers======================================================
-- Step-by-Step Instructions
-- Check CustomerID in Bookings against Customers
-- Check OrderID in Menu_Has_Orders and OrderDeliveryStatus against Orders
-- Check MenuID in Menu_Has_Orders against Menus
-- Identify mismatches in CustomerID between Bookings and Customers
SELECT b.CustomerID
FROM Bookings b
LEFT JOIN Customers c ON b.CustomerID = c.CustomerID
WHERE c.CustomerID IS NULL;


SELECT mho.OrderID
FROM Menu_Has_Orders mho
LEFT JOIN Orders o ON mho.OrderID = o.OrderID
WHERE o.OrderID IS NULL;

SELECT ods.OrderID
FROM OrderDeliveryStatus ods
LEFT JOIN Orders o ON ods.OrderID = o.OrderID
WHERE o.OrderID IS NULL;

SELECT mho.MenuID
FROM Menu_Has_Orders mho
LEFT JOIN Menus m ON mho.MenuID = m.MenuID
WHERE m.MenuID IS NULL;

-- Create the view
CREATE OR REPLACE VIEW ordersview AS
SELECT 
    o.OrderID,
    o.TotalCost,
    c.FullName AS CustomerName,
    m.MenuName,
    mi.CourseName,
    mi.StarterName,
    b.BookingDate,
    ods.Status,
    ods.DeliveryDate,
    s.Name AS StaffName,
    s.Role
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Bookings b ON o.CustomerID = b.CustomerID
JOIN Menu_Has_Orders mho ON o.OrderID = mho.OrderID
JOIN Menus m ON mho.MenuID = m.MenuID
JOIN MenuItems mi ON mho.MenuID = mi.MenuItemID
JOIN OrderDeliveryStatus ods ON o.OrderID = ods.OrderID
JOIN Staff s ON ods.OrderID = s.StaffID;

-- Verification
SELECT * FROM ordersview LIMIT 10;

-- ==============// ==================================================
-- Create or use the database
CREATE DATABASE IF NOT EXISTS littlelemondb;
USE littlelemondb;

-- Drop existing tables to avoid conflicts
DROP TABLE IF EXISTS OrderDeliveryStatus, Menu_Has_Orders, Bookings, MenuItems, Menus, Orders, Customers;

-- Customers Table
CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(255)
);

-- Orders Table
CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT PRIMARY KEY,
    TotalCost DECIMAL(10,2),
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Menus Table
CREATE TABLE IF NOT EXISTS Menus (
    MenuID INT PRIMARY KEY,
    MenuName VARCHAR(255)
);

-- MenuItems Table
CREATE TABLE IF NOT EXISTS MenuItems (
    MenuItemID INT PRIMARY KEY,
    CourseName VARCHAR(255),
    StarterName VARCHAR(255)
);

-- Bookings Table
CREATE TABLE IF NOT EXISTS Bookings (
    BookingID INT PRIMARY KEY,
    BookingDate DATE,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Menu_Has_Orders Table
CREATE TABLE IF NOT EXISTS Menu_Has_Orders (
    MenuID INT,
    OrderID INT,
    FOREIGN KEY (MenuID) REFERENCES Menus(MenuID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- OrderDeliveryStatus Table
CREATE TABLE IF NOT EXISTS OrderDeliveryStatus (
    OrderID INT PRIMARY KEY,
    Status VARCHAR(100),
    DeliveryDate DATE,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Staff Table (Already exists, so no need to recreate it)
-- CREATE TABLE IF NOT EXISTS Staff (
--    StaffID INT PRIMARY KEY,
--    Name VARCHAR(255),
--    Role VARCHAR(100)
-- );

-- Populate Customers Table
INSERT INTO Customers (CustomerID, FullName) VALUES
(1, 'Emma Brown'),
(2, 'Liam Smith'),
(3, 'Olivia Johnson'),
(4, 'Noah Williams');

-- Populate Orders Table with unique OrderID values
INSERT INTO Orders (OrderID, TotalCost, CustomerID) VALUES
(1001, 45.50, 1),
(1002, 60.00, 2),
(1003, 30.25, 3),
(1004, 75.10, 4),
(1005, 90.00, 1),
(1006, 50.75, 2),
(1007, 80.40, 3),
(1008, 55.30, 4);

-- Populate Menus Table
INSERT INTO Menus (MenuID, MenuName) VALUES
(1, 'Breakfast Menu'),
(2, 'Lunch Menu'),
(3, 'Dinner Menu');

-- Populate MenuItems Table
INSERT INTO MenuItems (MenuItemID, CourseName, StarterName) VALUES
(1, 'Pancakes', 'Fruit Salad'),
(2, 'Omelette', 'Bread Basket'),
(3, 'Steak', 'Caesar Salad'),
(4, 'Pasta', 'Garlic Bread');

-- Populate Bookings Table
INSERT INTO Bookings (BookingID, BookingDate, CustomerID) VALUES
(1, '2023-05-01', 1),
(2, '2023-05-02', 2),
(3, '2023-05-03', 3),
(4, '2023-05-04', 4);

-- Populate Menu_Has_Orders Table
INSERT INTO Menu_Has_Orders (MenuID, OrderID) VALUES
(1, 1001),
(2, 1002),
(3, 1003),
(1, 1004),
(2, 1005),
(3, 1006),
(1, 1007),
(2, 1008);

-- Populate OrderDeliveryStatus Table
INSERT INTO OrderDeliveryStatus (OrderID, Status, DeliveryDate) VALUES
(1001, 'Delivered', '2023-05-01'),
(1002, 'Pending', '2023-05-02'),
(1003, 'Delivered', '2023-05-03'),
(1004, 'Delivered', '2023-05-04'),
(1005, 'Pending', '2023-05-05'),
(1006, 'Delivered', '2023-05-06'),
(1007, 'Delivered', '2023-05-07'),
(1008, 'Pending', '2023-05-08');

-- Create the view
CREATE OR REPLACE VIEW ordersview AS
SELECT 
    o.OrderID,
    o.TotalCost,
    c.FullName AS CustomerName,
    m.MenuName,
    mi.CourseName,
    mi.StarterName,
    b.BookingDate,
    ods.Status,
    ods.DeliveryDate,
    s.Name AS StaffName,
    s.Role
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Bookings b ON o.CustomerID = b.CustomerID
JOIN Menu_Has_Orders mho ON o.OrderID = mho.OrderID
JOIN Menus m ON mho.MenuID = m.MenuID
JOIN MenuItems mi ON mho.MenuID = mi.MenuItemID
JOIN OrderDeliveryStatus ods ON o.OrderID = ods.OrderID
JOIN Staff s ON ods.OrderID = s.StaffID;

-- Verification
SELECT * FROM ordersview LIMIT 10;
-- =============================================================================
USE littlelemondb;
-- Clear existing data in OrderDeliveryStatus table
DELETE FROM OrderDeliveryStatus;

-- Populate OrderDeliveryStatus Table
INSERT INTO OrderDeliveryStatus (OrderID, Status, DeliveryDate) VALUES
(1001, 'Delivered', '2023-05-01'),
(1002, 'Pending', '2023-05-02'),
(1003, 'Delivered', '2023-05-03'),
(1004, 'Delivered', '2023-05-04'),
(1005, 'Pending', '2023-05-05'),
(1006, 'Delivered', '2023-05-06'),
(1007, 'Delivered', '2023-05-07'),
(1008, 'Pending', '2023-05-08');

-- Update existing data in OrderDeliveryStatus table
UPDATE OrderDeliveryStatus SET Status = 'Delivered', DeliveryDate = '2023-05-01' WHERE OrderID = 1001;
UPDATE OrderDeliveryStatus SET Status = 'Pending', DeliveryDate = '2023-05-02' WHERE OrderID = 1002;
UPDATE OrderDeliveryStatus SET Status = 'Delivered', DeliveryDate = '2023-05-03' WHERE OrderID = 1003;
UPDATE OrderDeliveryStatus SET Status = 'Delivered', DeliveryDate = '2023-05-04' WHERE OrderID = 1004;
UPDATE OrderDeliveryStatus SET Status = 'Pending', DeliveryDate = '2023-05-05' WHERE OrderID = 1005;
UPDATE OrderDeliveryStatus SET Status = 'Delivered', DeliveryDate = '2023-05-06' WHERE OrderID = 1006;
UPDATE OrderDeliveryStatus SET Status = 'Delivered', DeliveryDate = '2023-05-07' WHERE OrderID = 1007;
UPDATE OrderDeliveryStatus SET Status = 'Pending', DeliveryDate = '2023-05-08' WHERE OrderID = 1008;

-- Create or use the database
CREATE DATABASE IF NOT EXISTS littlelemondb;
USE littlelemondb;

-- Drop existing tables to avoid conflicts
DROP TABLE IF EXISTS OrderDeliveryStatus, Menu_Has_Orders, Bookings, MenuItems, Menus, Orders, Customers;

-- Customers Table
CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(255)
);

-- Orders Table
CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT PRIMARY KEY,
    TotalCost DECIMAL(10,2),
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Menus Table
CREATE TABLE IF NOT EXISTS Menus (
    MenuID INT PRIMARY KEY,
    MenuName VARCHAR(255)
);

-- MenuItems Table
CREATE TABLE IF NOT EXISTS MenuItems (
    MenuItemID INT PRIMARY KEY,
    CourseName VARCHAR(255),
    StarterName VARCHAR(255)
);

-- Bookings Table
CREATE TABLE IF NOT EXISTS Bookings (
    BookingID INT PRIMARY KEY,
    BookingDate DATE,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Menu_Has_Orders Table
CREATE TABLE IF NOT EXISTS Menu_Has_Orders (
    MenuID INT,
    OrderID INT,
    FOREIGN KEY (MenuID) REFERENCES Menus(MenuID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- OrderDeliveryStatus Table
CREATE TABLE IF NOT EXISTS OrderDeliveryStatus (
    OrderID INT PRIMARY KEY,
    Status VARCHAR(100),
    DeliveryDate DATE,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Staff Table (Already exists, so no need to recreate it)
-- CREATE TABLE IF NOT EXISTS Staff (
--    StaffID INT PRIMARY KEY,
--    Name VARCHAR(255),
--    Role VARCHAR(100)
-- );

-- Clear existing data in Customers table
DELETE FROM Customers;

-- Clear existing data in Orders table
DELETE FROM Orders;

-- Clear existing data in Menus table
DELETE FROM Menus;

-- Clear existing data in MenuItems table
DELETE FROM MenuItems;

-- Clear existing data in Bookings table
DELETE FROM Bookings;

-- Clear existing data in Menu_Has_Orders table
DELETE FROM Menu_Has_Orders;

-- Clear existing data in OrderDeliveryStatus table
DELETE FROM OrderDeliveryStatus;

-- Populate Customers Table
INSERT INTO Customers (CustomerID, FullName) VALUES
(1, 'Emma Brown'),
(2, 'Liam Smith'),
(3, 'Olivia Johnson'),
(4, 'Noah Williams');

-- Populate Orders Table with unique OrderID values
INSERT INTO Orders (OrderID, TotalCost, CustomerID) VALUES
(1001, 45.50, 1),
(1002, 60.00, 2),
(1003, 30.25, 3),
(1004, 75.10, 4),
(1005, 90.00, 1),
(1006, 50.75, 2),
(1007, 80.40, 3),
(1008, 55.30, 4);

-- Populate Menus Table
INSERT INTO Menus (MenuID, MenuName) VALUES
(1, 'Breakfast Menu'),
(2, 'Lunch Menu'),
(3, 'Dinner Menu');

-- Populate MenuItems Table
INSERT INTO MenuItems (MenuItemID, CourseName, StarterName) VALUES
(1, 'Pancakes', 'Fruit Salad'),
(2, 'Omelette', 'Bread Basket'),
(3, 'Steak', 'Caesar Salad'),
(4, 'Pasta', 'Garlic Bread');

-- Populate Bookings Table
INSERT INTO Bookings (BookingID, BookingDate, CustomerID) VALUES
(1, '2023-05-01', 1),
(2, '2023-05-02', 2),
(3, '2023-05-03', 3),
(4, '2023-05-04', 4);

-- Populate Menu_Has_Orders Table
INSERT INTO Menu_Has_Orders (MenuID, OrderID) VALUES
(1, 1001),
(2, 1002),
(3, 1003),
(1, 1004),
(2, 1005),
(3, 1006),
(1, 1007),
(2, 1008);

-- Populate OrderDeliveryStatus Table
INSERT INTO OrderDeliveryStatus (OrderID, Status, DeliveryDate) VALUES
(1001, 'Delivered', '2023-05-01'),
(1002, 'Pending', '2023-05-02'),
(1003, 'Delivered', '2023-05-03'),
(1004, 'Delivered', '2023-05-04'),
(1005, 'Pending', '2023-05-05'),
(1006, 'Delivered', '2023-05-06'),
(1007, 'Delivered', '2023-05-07'),
(1008, 'Pending', '2023-05-08');

-- Create the view
CREATE OR REPLACE VIEW ordersview AS
SELECT 
    o.OrderID,
    o.TotalCost,
    c.FullName AS CustomerName,
    m.MenuName,
    mi.CourseName,
    mi.StarterName,
    b.BookingDate,
    ods.Status,
    ods.DeliveryDate,
    s.Name AS StaffName,
    s.Role
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Bookings b ON o.CustomerID = b.CustomerID
JOIN Menu_Has_Orders mho ON o.OrderID = mho.OrderID
JOIN Menus m ON mho.MenuID = m.MenuID
JOIN MenuItems mi ON mho.MenuID = mi.MenuItemID
JOIN OrderDeliveryStatus ods ON o.OrderID = ods.OrderID
JOIN Staff s ON ods.OrderID = s.StaffID;

-- Verification
SELECT * FROM ordersview LIMIT 10;
DESCRIBE staff;

-- ===============staff Table data populated ===========================================================================================
-- Step 1: Use the database
USE littlelemondb;

-- Step 2: Drop existing tables to avoid conflicts
DROP TABLE IF EXISTS OrderDeliveryStatus;
DROP TABLE IF EXISTS Menu_Has_Orders;
DROP TABLE IF EXISTS Bookings;
DROP TABLE IF EXISTS MenuItems;
DROP TABLE IF EXISTS Menus;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Staff;

-- Step 3: Create Tables
-- Customers Table
CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(255)
);

-- Orders Table
CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT PRIMARY KEY,
    TotalCost DECIMAL(10,2),
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Menus Table
CREATE TABLE IF NOT EXISTS Menus (
    MenuID INT PRIMARY KEY,
    MenuName VARCHAR(255)
);

-- MenuItems Table
CREATE TABLE IF NOT EXISTS MenuItems (
    MenuItemID INT PRIMARY KEY,
    CourseName VARCHAR(255),
    StarterName VARCHAR(255)
);

-- Bookings Table
CREATE TABLE IF NOT EXISTS Bookings (
    BookingID INT PRIMARY KEY,
    BookingDate DATE,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Menu_Has_Orders Table
CREATE TABLE IF NOT EXISTS Menu_Has_Orders (
    MenuID INT,
    OrderID INT,
    FOREIGN KEY (MenuID) REFERENCES Menus(MenuID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- OrderDeliveryStatus Table
CREATE TABLE IF NOT EXISTS OrderDeliveryStatus (
    OrderID INT PRIMARY KEY,
    Status VARCHAR(100),
    DeliveryDate DATE,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Staff Table
CREATE TABLE IF NOT EXISTS Staff (
    StaffID INT PRIMARY KEY,
    Name VARCHAR(255),
    Role VARCHAR(100)
);

-- Step 4: Populate Tables
-- Populate Customers Table
INSERT INTO Customers (CustomerID, FullName) VALUES
(1, 'Emma Brown'),
(2, 'Liam Smith'),
(3, 'Olivia Johnson'),
(4, 'Noah Williams'),
(5, 'Sophia Martinez'),
(6, 'Mason Garcia');

-- Populate Orders Table with unique OrderID values
INSERT INTO Orders (OrderID, TotalCost, CustomerID) VALUES
(1001, 45.50, 1),
(1002, 60.00, 2),
(1003, 30.25, 3),
(1004, 75.10, 4),
(1005, 90.00, 1),
(1006, 50.75, 2),
(1007, 80.40, 3),
(1008, 55.30, 4),
(1009, 70.25, 5),
(1010, 65.50, 6);

-- Populate Menus Table
INSERT INTO Menus (MenuID, MenuName) VALUES
(1, 'Breakfast Menu'),
(2, 'Lunch Menu'),
(3, 'Dinner Menu');

-- Populate MenuItems Table
INSERT INTO MenuItems (MenuItemID, CourseName, StarterName) VALUES
(1, 'Pancakes', 'Fruit Salad'),
(2, 'Omelette', 'Bread Basket'),
(3, 'Steak', 'Caesar Salad'),
(4, 'Pasta', 'Garlic Bread');

-- Populate Bookings Table
INSERT INTO Bookings (BookingID, BookingDate, CustomerID) VALUES
(1, '2023-05-01', 1),
(2, '2023-05-02', 2),
(3, '2023-05-03', 3),
(4, '2023-05-04', 4),
(5, '2023-05-05', 5),
(6, '2023-05-06', 6);

-- Populate Menu_Has_Orders Table
INSERT INTO Menu_Has_Orders (MenuID, OrderID) VALUES
(1, 1001),
(2, 1002),
(3, 1003),
(1, 1004),
(2, 1005),
(3, 1006),
(1, 1007),
(2, 1008),
(1, 1009),
(2, 1010);

-- Populate OrderDeliveryStatus Table
INSERT INTO OrderDeliveryStatus (OrderID, Status, DeliveryDate) VALUES
(1001, 'Delivered', '2023-05-01'),
(1002, 'Pending', '2023-05-02'),
(1003, 'Delivered', '2023-05-03'),
(1004, 'Delivered', '2023-05-04'),
(1005, 'Pending', '2023-05-05'),
(1006, 'Delivered', '2023-05-06'),
(1007, 'Delivered', '2023-05-07'),
(1008, 'Pending', '2023-05-08'),
(1009, 'Delivered', '2023-05-09'),
(1010, 'Pending', '2023-05-10');

-- Populate Staff Table
INSERT INTO Staff (StaffID, Name, Role) VALUES
(1, 'John Doe', 'Manager'),
(2, 'Jane Smith', 'Chef'),
(3, 'Emily Davis', 'Waiter'),
(4, 'Michael Johnson', 'Bartender');

-- Step 5: Create the view
CREATE OR REPLACE VIEW ordersview AS
SELECT 
    o.OrderID,
    o.TotalCost,
    c.FullName AS CustomerName,
    m.MenuName,
    mi.CourseName,
    mi.StarterName,
    b.BookingDate,
    ods.Status,
    ods.DeliveryDate,
    s.Name AS StaffName,
    s.Role
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Bookings b ON o.CustomerID = b.CustomerID
JOIN Menu_Has_Orders mho ON o.OrderID = mho.OrderID
JOIN Menus m ON mho.MenuID = m.MenuID
JOIN MenuItems mi ON mho.MenuID = mi.MenuItemID
JOIN OrderDeliveryStatus ods ON o.OrderID = ods.OrderID
JOIN Staff s ON ods.OrderID = s.StaffID;

-- Step 6: Verification
SELECT * FROM ordersview LIMIT 10;




