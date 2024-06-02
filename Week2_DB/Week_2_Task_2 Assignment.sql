-- ==================================================================WEEK 2 TASK 2 ===================================================================================
-- ==================================================================MAY 16 2024======================================================================================
-- ==================================================================This code Succeded ==============================================================================
-- Drop existing tables to avoid conflicts
DROP TABLE IF EXISTS OrderDeliveryStatus, Menu_Has_Orders, Bookings, MenuItems, Menus, Orders, Customers, Staff;

-- Customers Table
CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(255) NOT NULL
);

-- Staff Table
CREATE TABLE IF NOT EXISTS Staff (
    StaffID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Role VARCHAR(100) NOT NULL
);

-- Orders Table
CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    TotalCost DECIMAL(10,2) NOT NULL,
    CustomerID INT,
    StaffID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

-- Menus Table
CREATE TABLE IF NOT EXISTS Menus (
    MenuID INT AUTO_INCREMENT PRIMARY KEY,
    MenuName VARCHAR(255) NOT NULL
);

-- MenuItems Table
CREATE TABLE IF NOT EXISTS MenuItems (
    MenuItemID INT AUTO_INCREMENT PRIMARY KEY,
    CourseName VARCHAR(255) NOT NULL,
    StarterName VARCHAR(255) NOT NULL,
    MenuID INT,
    FOREIGN KEY (MenuID) REFERENCES Menus(MenuID)
);

-- Menu_Has_Orders Table
CREATE TABLE IF NOT EXISTS Menu_Has_Orders (
    MenuID INT,
    OrderID INT,
    MenuItemID INT,
    FOREIGN KEY (MenuID) REFERENCES Menus(MenuID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (MenuItemID) REFERENCES MenuItems(MenuItemID)
);

-- OrderDeliveryStatus Table
CREATE TABLE IF NOT EXISTS OrderDeliveryStatus (
    OrderID INT PRIMARY KEY,
    Status VARCHAR(100),
    DeliveryDate DATE,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);


-- Populate Customers Table
INSERT INTO Customers (FullName) VALUES
('Emma Brown'),
('Liam Smith'),
('Olivia Johnson'),
('Noah Williams');

-- Populate Staff Table
INSERT INTO Staff (Name, Role) VALUES
('John Doe', 'Waiter'),
('Jane Smith', 'Chef'),
('Emily Davis', 'Manager'),
('Michael Johnson', 'Waiter');

-- Populate Orders Table with unique OrderID values
INSERT INTO Orders (TotalCost, CustomerID, StaffID) VALUES
(45.50, 1, 1),
(160.00, 2, 2),
(130.25, 3, 3),
(175.10, 4, 4),
(200.00, 1, 1),
(55.75, 2, 2),
(180.40, 3, 3),
(155.30, 4, 4);

-- Populate Menus Table
INSERT INTO Menus (MenuName) VALUES
('Breakfast Menu'),
('Lunch Menu'),
('Dinner Menu');

-- Populate MenuItems Table
INSERT INTO MenuItems (CourseName, StarterName, MenuID) VALUES
('Pancakes', 'Fruit Salad', 1),
('Omelette', 'Bread Basket', 1),
('Steak', 'Caesar Salad', 2),
('Pasta', 'Garlic Bread', 3);

-- Populate Menu_Has_Orders Table
INSERT INTO Menu_Has_Orders (MenuID, OrderID, MenuItemID) VALUES
(1, 1, 1),
(2, 2, 3),
(3, 3, 4),
(1, 4, 2),
(2, 5, 3),
(3, 6, 4),
(1, 7, 1),
(2, 8, 2);

-- Populate OrderDeliveryStatus Table
INSERT INTO OrderDeliveryStatus (OrderID, Status, DeliveryDate) VALUES
(1, 'Delivered', '2023-05-01'),
(2, 'Pending', '2023-05-02'),
(3, 'Delivered', '2023-05-03'),
(4, 'Delivered', '2023-05-04'),
(5, 'Pending', '2023-05-05'),
(6, 'Delivered', '2023-05-06'),
(7, 'Delivered', '2023-05-07'),
(8, 'Pending', '2023-05-08');

-- Query to extract required information
SELECT 
    c.CustomerID,
    c.FullName,
    o.OrderID,
    o.TotalCost,
    m.MenuName,
    mi.CourseName,
    mi.StarterName,
    s.Name AS StaffName,
    s.Role AS StaffRole
FROM 
    Orders o
JOIN 
    Customers c ON o.CustomerID = c.CustomerID
JOIN 
    Menu_Has_Orders mho ON o.OrderID = mho.OrderID
JOIN 
    Menus m ON mho.MenuID = m.MenuID
JOIN 
    MenuItems mi ON mho.MenuItemID = mi.MenuItemID
JOIN 
    Staff s ON o.StaffID = s.StaffID
WHERE 
    o.TotalCost > 150
ORDER BY 
    o.TotalCost ASC;
