DELIMITER $$

CREATE PROCEDURE CheckReplenishment()
BEGIN
    -- Select products needing replenishment, excluding discontinued ones
    SELECT 
        productID,
        productName,
        unitsInStock,
        reorderLevel,
        supplierID,
        categoryID
    FROM 
        products
    WHERE 
        unitsInStock < reorderLevel -- Stock below the threshold
        AND discontinued = 0       -- Exclude discontinued products
    ORDER BY 
        reorderLevel - unitsInStock DESC; -- Prioritize products most understocked
END$$

DELIMITER ;
