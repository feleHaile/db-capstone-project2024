USE littlelemondb;
CREATE TABLE Orders (
    DeliveryDate DATE,
    CustomerID INT,
    CustomerName VARCHAR(255),
    City VARCHAR(255),
    Country VARCHAR(255),
    PostalCode VARCHAR(10),
    CountryCode VARCHAR(5),
    Cost DECIMAL(10, 2),
    Sales DECIMAL(10, 2),
    Quantity INT,
    Discount DECIMAL(5, 2),
    DeliveryCost DECIMAL(10, 2),
    CourseName VARCHAR(255),
    CuisineName VARCHAR(255),
    StarterName VARCHAR(255),
    DesertName VARCHAR(255),
    Drink VARCHAR(255),
    Sides VARCHAR(255)
);
-- the above Orders Table exists but we would like UPDATE columns:
ALTER TABLE Orders
ADD COLUMN DeliveryDate DATE,
ADD COLUMN CustomerID INT,
ADD COLUMN CustomerName VARCHAR(255),
ADD COLUMN City VARCHAR(255),
ADD COLUMN Country VARCHAR(255),
ADD COLUMN PostalCode VARCHAR(10),
ADD COLUMN CountryCode VARCHAR(5),
ADD COLUMN Cost DECIMAL(10, 2),
ADD COLUMN Sales DECIMAL(10, 2),
ADD COLUMN Discount DECIMAL(5, 2),
ADD COLUMN DeliveryCost DECIMAL(10, 2),
ADD COLUMN CourseName VARCHAR(255),
ADD COLUMN CuisineName VARCHAR(255),
ADD COLUMN StarterName VARCHAR(255),
ADD COLUMN DesertName VARCHAR(255),
ADD COLUMN Drink VARCHAR(255),
ADD COLUMN Sides VARCHAR(255);

-- ============Load the data====================
USE littlelemondb;

LOAD DATA INFILE 'C:/Users/Owner/Documents/Meta Database Engineer Course/Week 2/LittleLemondatafile.csv' INTO TABLE Orders FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 ROWS (DeliveryDate, CustomerID, CustomerName, City, Country, PostalCode, CountryCode, Cost, Sales, Quantity, Discount, DeliveryCost, CourseName, CuisineName, StarterName, DesertName, Drink, Sides);

-- Grant permission============
SELECT user, host FROM mysql.user;
GRANT FILE ON *.* TO 'root'@'127.0.0.1';
GRANT FILE ON *.* TO 'root'@'::1';
GRANT FILE ON *.* TO 'root'@'desktop-1dmqekt';

SELECT
    c.customerID,
    CONCAT(c.firstName, ' ', c.lastName) AS fullName,
    o.orderID,
    o.totalCost,
    m.itemName AS menuName,
    mi.courseName,
    mi.starterName
FROM
    Customerdetails c
JOIN
    Orders o ON c.customerID = o.customerID
JOIN
    MenuItems mi ON o.menuItemID = mi.menuItemID
JOIN
    Menu m ON mi.menuID = m.menuID
WHERE
    o.totalCost > 150
ORDER BY
    o.totalCost ASC;
-- Identify Username: 
SELECT USER();
SELECT CURRENT_USER();
-- ====
mysqldump -u ['root@localhost'] -p [littlelemondb] > backup.sql
use mysql;
update user set authentication_string=password('[theGis@123]') where user='root';
flush privileges;
