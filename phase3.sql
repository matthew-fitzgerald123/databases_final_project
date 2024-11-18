DROP TABLE IF EXISTS `order_details`;
DROP TABLE IF EXISTS `orders`;
DROP TABLE IF EXISTS `products`;
DROP TABLE IF EXISTS `categories`;
DROP TABLE IF EXISTS `employees`;
DROP TABLE IF EXISTS `customers`;

CREATE DATABASE IF NOT EXISTS `project_database`;
USE `project_database`;

-- Table: Categories
CREATE TABLE `categories` (
  `categoryID` INT AUTO_INCREMENT PRIMARY KEY,
  `categoryName` VARCHAR(100),
  `description` TEXT
);

-- Table: Customers
CREATE TABLE `customers` (
  `customerID` VARCHAR(10) PRIMARY KEY,
  `companyName` VARCHAR(100) NOT NULL,
  `contactName` VARCHAR(40),
  `contactTitle` VARCHAR(40)
);

-- Table: Employees
CREATE TABLE `employees` (
  `employeeID` INT AUTO_INCREMENT PRIMARY KEY,
  `lastName` VARCHAR(50),
  `firstName` VARCHAR(50),
  `title` VARCHAR(50)
);

-- Table: Orders
CREATE TABLE `orders` (
  `orderID` INT AUTO_INCREMENT PRIMARY KEY,
  `customerID` VARCHAR(10),
  `employeeID` INT,
  `orderDate` DATE,
  `requiredDate` DATE,
  `shippedDate` DATE,
  `shipVia` INT,
  `freight` DECIMAL(8,2),
  FOREIGN KEY (`customerID`) REFERENCES `customers`(`customerID`),
  FOREIGN KEY (`employeeID`) REFERENCES `employees`(`employeeID`)
);

-- Table: Products
CREATE TABLE `products` (
  `productID` INT AUTO_INCREMENT PRIMARY KEY,
  `productName` VARCHAR(100),
  `categoryID` INT,
  `unitPrice` DECIMAL(6,2),
  `unitsInStock` INT,
  FOREIGN KEY (`categoryID`) REFERENCES `categories`(`categoryID`)
);

-- Table: Order Details
CREATE TABLE `order_details` (
  `orderDetailID` INT AUTO_INCREMENT PRIMARY KEY,
  `orderID` INT,
  `productID` INT,
  `quantity` INT,
  `unitPrice` DECIMAL(6,2),
  `discount` DECIMAL(4,2),
  FOREIGN KEY (`orderID`) REFERENCES `orders`(`orderID`),
  FOREIGN KEY (`productID`) REFERENCES `products`(`productID`)
);