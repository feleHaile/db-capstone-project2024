USE littlelemondb;
DESCRIBE Customers;
-- ========ADD ContactNumber==========
ALTER TABLE Customers ADD ContactNumber VARCHAR(15);
-- ====Update
UPDATE Customers SET ContactNumber = '1234567890' WHERE CustomerID = 1;

SELECT 
    c.FullName,
    c.ContactNumber,  
    o.TotalCost
FROM 
    Orders o
JOIN 
    Customers c ON o.CustomerID = c.CustomerID
WHERE 
    o.TotalCost > 60;


