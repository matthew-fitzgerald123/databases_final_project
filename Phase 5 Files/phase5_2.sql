CREATE DEFINER=`root`@`localhost` TRIGGER `order_details_AFTER_INSERT` AFTER INSERT ON `order_details` FOR EACH ROW BEGIN
IF project_database.orders.orderID = project_database.order_details.orderID AND project_database.order_details.productID = project_database.products.productID
THEN 
UPDATE project_database.products
SET project_database.products.unitsInStock = project_database.products.unitsInStock - project_database.order_details.quantity;
END IF;
END