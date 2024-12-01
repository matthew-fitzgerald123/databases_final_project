CREATE VIEW `employee performance` AS
SELECT employeeID, employees_firstName, employees_lastName, orderID, quantity,
ROUND((quantity * (unitPrice - (unitPrice * discount))), 2) AS revenue
FROM project_data