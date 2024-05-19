-- Create the schema
CREATE SCHEMA IF NOT EXISTS `littlelemondb` DEFAULT CHARACTER SET latin1;
USE `littlelemondb`;

-- Drop existing tables to avoid conflicts
DROP TABLE IF EXISTS Menu_Has_Orders;
DROP TABLE IF EXISTS OrderDeliveryStatus;
DROP TABLE IF EXISTS Bookings;
DROP TABLE IF EXISTS MenuItems;
DROP TABLE IF EXISTS Menus;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Staff;
DROP TABLE IF EXISTS StaffRoles;

-- Create Customers table
CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(255)
);

-- Create Orders table
CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT PRIMARY KEY,
    TotalCost DECIMAL(10,2),
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create Menus table
CREATE TABLE IF NOT EXISTS Menus (
    MenuID INT PRIMARY KEY,
    MenuName VARCHAR(255)
);

-- Create MenuItems table
CREATE TABLE IF NOT EXISTS MenuItems (
    MenuItemID INT PRIMARY KEY,
    CourseName VARCHAR(255),
    StarterName VARCHAR(255),
    MenuID INT,
    FOREIGN KEY (MenuID) REFERENCES Menus(MenuID)
);

-- Create Menu_Has_Orders table (junction table for many-to-many relationship)
CREATE TABLE IF NOT EXISTS Menu_Has_Orders (
    MenuID INT,
    OrderID INT,
    MenuItemID INT,
    FOREIGN KEY (MenuID) REFERENCES Menus(MenuID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (MenuItemID) REFERENCES MenuItems(MenuItemID)
);

-- Populate Customers table
INSERT INTO Customers (CustomerID, FullName) VALUES
(1, 'Emma Brown'),
(2, 'Liam Smith'),
(3, 'Olivia Johnson'),
(4, 'Noah Williams');

-- Populate Orders table
INSERT INTO Orders (OrderID, TotalCost, CustomerID) VALUES
(1001, 45.50, 1),
(1002, 160.00, 2),
(1003, 130.25, 3),
(1004, 175.10, 4),
(1005, 200.00, 1),
(1006, 55.75, 2),
(1007, 180.40, 3),
(1008, 155.30, 4);

-- Populate Menus table
INSERT INTO Menus (MenuID, MenuName) VALUES
(1, 'Breakfast Menu'),
(2, 'Lunch Menu'),
(3, 'Dinner Menu');

-- Populate MenuItems table
INSERT INTO MenuItems (MenuItemID, CourseName, StarterName, MenuID) VALUES
(1, 'Pancakes', 'Fruit Salad', 1),
(2, 'Omelette', 'Bread Basket', 1),
(3, 'Steak', 'Caesar Salad', 2),
(4, 'Pasta', 'Garlic Bread', 3);

-- Populate Menu_Has_Orders table
INSERT INTO Menu_Has_Orders (MenuID, OrderID, MenuItemID) VALUES
(1, 1001, 1),
(2, 1002, 3),
(3, 1003, 4),
(1, 1004, 2),
(2, 1005, 3),
(3, 1006, 4),
(1, 1007, 1),
(2, 1008, 2);
