CREATE DEFINER=`root`@`localhost` TRIGGER `stock_reduction` AFTER INSERT ON `order_details` FOR EACH ROW BEGIN
-- Created trigger will update stock quantity in products table
UPDATE products 

-- Set the new stock quantity in products. "NEW" refers to newest row in trigger table
SET unitsInStock = unitsInStock - NEW.quantity 

-- Logic to check what product stock will be updated
WHERE NEW.productID = productID;

-- Trigger complete
END