USE littlelemondb;
-- Task 3: Find all menu items for which more than 2 orders have been placed
SELECT 
    m.MenuName
FROM 
    Menus m
WHERE 
    m.MenuID IN (
        SELECT 
            mho.MenuID
        FROM 
            Menu_Has_Orders mho
        GROUP BY 
            mho.MenuID
        HAVING 
            COUNT(mho.OrderID) > 2
    );
    -- ===== This query returned the names of the menus for which more than 2 orders have been placed.