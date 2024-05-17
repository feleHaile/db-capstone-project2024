USE littlelemondb;
-- Step 1: Create the Stored Procedure
-- First, create the CancelOrder stored procedure.

DELIMITER $$

CREATE PROCEDURE CancelOrder(IN order_id INT)
BEGIN
    DELETE FROM Orders WHERE OrderID = order_id;
END$$

DELIMITER ;
-- Step 2: Call the Stored Procedure
-- To use the CancelOrder stored procedure to delete an order, you can invoke it by passing the order ID as an argument.
CALL CancelOrder(1001);  -- Replace 1001 with the actual OrderID you want to delete

--  ==============Complete Example========================
-- Ensure you're using the correct database
USE littlelemondb;

-- Create the CancelOrder stored procedure
DELIMITER $$

CREATE PROCEDURE CancelOrder(IN order_id INT)
BEGIN
    DELETE FROM Orders WHERE OrderID = order_id;
END$$

DELIMITER ;

-- Call the CancelOrder stored procedure to delete an order with OrderID = 1001
CALL CancelOrder(1001);  -- Replace 1001 with the actual OrderID you want to delete
-- ====================Output Result ========================================================
-- When you invoke the CancelOrder stored procedure with a specific OrderID, the corresponding order record will be deleted from the Orders table.

-- Verification
-- To verify that the order has been deleted, you can select from the Orders table:
SELECT * FROM Orders WHERE OrderID = 1001;  -- This should return an empty result set if the order was deleted

-- ======================================The Entire Procedure======================================
-- =================================================================================================
-- Ensure you're using the correct database
USE littlelemondb;

-- Create the CancelOrder stored procedure
DELIMITER $$

CREATE PROCEDURE CancelOrder(IN order_id INT)
BEGIN
    DELETE FROM Orders WHERE OrderID = order_id;
END$$

DELIMITER ;

-- Call the CancelOrder stored procedure to delete an order with OrderID = 1001
CALL CancelOrder(1001);

-- Verify the order has been deleted
SELECT * FROM Orders WHERE OrderID = 1001;  -- This should return an empty result set

