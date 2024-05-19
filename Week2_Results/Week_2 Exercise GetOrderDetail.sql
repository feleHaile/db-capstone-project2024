USE littlelemondb;
-- Step 1: Create the Prepared Statement
PREPARE GetOrderDetail FROM 
'SELECT OrderID, Quantity, TotalCost 
 FROM Orders 
 WHERE CustomerID = ?';
-- Step 2: Create a Variable and Assign a Value
-- Create a variable to hold the CustomerID value.
SET @id = 1;
-- Step 3: Execute the Prepared Statement
EXECUTE GetOrderDetail USING @id;

-- ===================================Step 4: Complete Example==============================================================
-- Ensure you're using the correct database
USE littlelemondb;

-- Prepare the GetOrderDetail statement
PREPARE GetOrderDetail FROM 
'SELECT OrderID, Quantity, TotalCost 
 FROM Orders 
 WHERE CustomerID = ?';

-- Set the variable for CustomerID
SET @id = 1;

-- Execute the prepared statement using the variable
EXECUTE GetOrderDetail USING @id;
-- Step 5: Clean Up (Optional)
DEALLOCATE PREPARE GetOrderDetail;
-- Ensure you're using the correct database
USE littlelemondb;

-- Prepare the GetOrderDetail statement
PREPARE GetOrderDetail FROM 
'SELECT OrderID, Quantity, TotalCost 
 FROM Orders 
 WHERE CustomerID = ?';

-- Set the variable for CustomerID
SET @id = 1;

-- Execute the prepared statement using the variable
EXECUTE GetOrderDetail USING @id;

-- Deallocate the prepared statement
DEALLOCATE PREPARE GetOrderDetail;
