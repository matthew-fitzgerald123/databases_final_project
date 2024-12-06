
-- Create a view for employee performance
-- Select all affected items for calculation
-- Do calculation (Note: calculation does not include freight)
CREATE VIEW `employee performance` AS 
SELECT employeeID, employees_firstName, employees_lastName, orderID, quantity,
ROUND((quantity * (unitPrice - (unitPrice * discount))), 2) AS revenue
FROM project_data
ORDER BY employeeID 

