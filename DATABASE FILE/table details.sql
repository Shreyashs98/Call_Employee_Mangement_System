-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2024 at 02:09 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `call_center_ems_test`
--

-- ---------------------------------------------------------- Create tables

-- Table for admin
CREATE TABLE `admin` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `UserName` VARCHAR(100) NOT NULL,
  `Password` VARCHAR(100) NOT NULL,
  `fullname` VARCHAR(255) NOT NULL,
  `email` VARCHAR(55) NOT NULL,
  `updationDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);

-- Table for departments
CREATE TABLE `departments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `DepartmentName` VARCHAR(150) NOT NULL,
  `DepartmentShortName` VARCHAR(100) NOT NULL,
  `DepartmentCode` VARCHAR(50),
  `CreationDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);

-- Table for employees
CREATE TABLE `employees` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `EmpId` VARCHAR(100) NOT NULL,
  `FirstName` VARCHAR(150) NOT NULL,
  `LastName` VARCHAR(150) NOT NULL,
  `EmailId` VARCHAR(200) NOT NULL,
  `Password` VARCHAR(180) NOT NULL,
  `Gender` VARCHAR(100) NOT NULL,
  `Dob` DATE NOT NULL,
  `Department` INT,
  `Address` VARCHAR(255) NOT NULL,
  `City` VARCHAR(200) NOT NULL,
  `Country` VARCHAR(150) NOT NULL,
  `Phonenumber` CHAR(11) NOT NULL,
  `Status` INT NOT NULL,
  `RegDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`Department`) REFERENCES `departments`(`id`)
);

-- Table for leaves
CREATE TABLE `leaves` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `LeaveType` VARCHAR(110) NOT NULL,
  `ToDate` DATE NOT NULL,
  `FromDate` DATE NOT NULL,
  `Description` MEDIUMTEXT NOT NULL,
  `PostingDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `AdminRemark` MEDIUMTEXT,
  `AdminRemarkDate` DATE,
  `Status` INT NOT NULL,
  `IsRead` INT NOT NULL,
  `empid` INT,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`empid`) REFERENCES `employees`(`id`)
);

-- Table for leavetype
CREATE TABLE `leavetype` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `LeaveType` VARCHAR(200) NOT NULL,
  `Description` MEDIUMTEXT,
  `CreationDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);

-- 
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `fullname`, `email`, `updationDate`) VALUES
(45, 'Rajat', '5f4dcc3b5aa765d61d8327deb882cf99', 'Rajat', 'rajat@gmail.com', '2024-03-13 12:50:19'),
(46, 'admin', '5f4dcc3b5aa765d61d8327deb882cf99', 'admin', 'admin@gmail.com', '2024-03-13 12:53:45'),
(47, 'shreyas', '08fa0a7e19b1eaaa7655d54fabf8ec61', 'Shreyas H S', 'shreyas@gmail.com', '2024-03-13 12:55:33');

-- --------------------------------------------------------

-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `DepartmentName`, `DepartmentShortName`, `DepartmentCode`, `CreationDate`) VALUES
(1, 'Customer Service', 'CS', 'CS161', '2024-03-13 12:00:00'),
(2, 'Technical Support', 'TS', 'TS162', '2024-03-13 12:00:00'),
(3, 'Quality Assurance', 'QA', 'QA164', '2024-03-13 12:00:00'),
(4, 'Training and Development', 'T&D', 'TD165', '2024-03-13 12:00:00'),
(5, 'IT Support', 'IT', 'IT166', '2024-03-13 12:00:00'),
(6, 'Operations', 'Ops', 'O167', '2024-03-13 12:00:00'),
(7, 'Finance and Billing', 'Finance', 'FB168', '2024-03-13 12:00:00'),
(8, 'Facilities Management', 'FM', 'FM169', '2024-03-13 12:00:00');

-- --------------------------------------------------------

-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `EmpId`, `FirstName`, `LastName`, `EmailId`, `Password`, `Gender`, `Dob`, `Department`, `Address`, `City`, `Country`, `Phonenumber`, `Status`, `RegDate`) VALUES
(1, '4SF21CY011', 'Arjun', 'Shetty', 'arjun@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'Male', '2003-06-12', 'Technical Support', 'Pumpwell', 'Mangalore', 'India', '980987778', 1, '2024-03-01 11:29:59'),
(9, '4SF21CY050', 'Sushath', 'S', 'sushanth@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'Male', '2003-04-17', 'IT Support', 'Nantoor', 'Mangalore', 'India', '9038592844', 1, '2024-03-14 04:10:30');

-- --------------------------------------------------------

-- Dumping data for table `leaves`
--

INSERT INTO `leaves` (`id`, `LeaveType`, `ToDate`, `FromDate`, `Description`, `PostingDate`, `AdminRemark`, `AdminRemarkDate`, `Status`, `IsRead`, `empid`) VALUES
(7, 'Casual Leave', '30/11/2023', '29/10/2023', 'Test Test Demo Test Test Demo Test Test Demo', '2023-11-19 13:11:21', 'A demo Admin Remarks for Testing!', '2023-12-02 23:26:27 ', 2, 1, 1),
(12, 'Self-Quarantine Leave', '2023-02-21', '2023-02-18', 'This is just a demo condition for testing purpose!!', '2023-02-10 16:05:30', 'No comments!!', '2023-02-10 21:37:15 ', 1, 1, 8),
(22, 'Casual Leave', '2024-03-14', '2024-03-07', 'Party Time', '2024-03-14 04:11:42', 'granted', '2024-03-14 9:42:27 ', 1, 1, 9),
(28, 'Personal Time Off', '2024-03-14', '2024-03-15', 'not fell well', '2024-03-14 10:36:52', NULL, NULL, 0, 0, 9),
(36, 'Restricted Holiday', '2024-03-23', '2024-03-16', '-', '2024-03-14 10:45:42', NULL, NULL, 0, 0, 9);

-- 

-- Dumping data for table `leavetype`
--

INSERT INTO `leavetype` (`id`, `LeaveType`, `Description`, `CreationDate`) VALUES
(1, 'Casual Leave', 'Provided for urgent or unforeseen matters to the employees.', '2023-11-01 12:07:56'),
(2, 'Medical Leave', 'Related to Health Problems of Employee', '2023-11-06 13:16:09'),
(3, 'Restricted Holiday', 'Holiday that is optional', '2023-11-06 13:16:38'),
(5, 'Paternity Leave', 'To take care of newborns', '2023-09-03 10:46:31'),
(6, 'Bereavement Leave', 'Grieve their loss of losing loved ones', '2023-09-03 10:47:48'),
(7, 'Compensatory Leave', 'For Overtime workers', '2023-10-03 10:48:37'),
(13, 'Personal Time Off', 'To manage some private matters', '2023-11-23 13:21:10');


-- Triggers for all the tables

-- Trigger for the 'departments' table
DELIMITER //
CREATE TRIGGER before_departments_insert_update
BEFORE INSERT ON departments
FOR EACH ROW
BEGIN
    -- condition to check if DepartmentName is not null
    IF NEW.DepartmentName IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'DepartmentName cannot be null';
    END IF;
END;
//
DELIMITER ;

-- Trigger for the 'employees' table
DELIMITER //
CREATE TRIGGER before_employees_insert_update
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    -- condition to check if EmailId is unique
    IF (SELECT COUNT(*) FROM employees WHERE EmailId = NEW.EmailId) > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'EmailId must be unique';
    END IF;
END;
//
DELIMITER ;

-- Trigger for the 'admin' table
DELIMITER //
CREATE TRIGGER before_admin_insert_update
BEFORE INSERT ON admin
FOR EACH ROW
BEGIN
    -- condition to check if UserName is unique
    IF (SELECT COUNT(*) FROM admin WHERE UserName = NEW.UserName) > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'UserName must be unique';
    END IF;
END;
//
DELIMITER ;

-- Trigger to check leave dates before insertion or update
DELIMITER //
CREATE TRIGGER BeforeLeaveInsertUpdate
BEFORE INSERT ON leaves
FOR EACH ROW
BEGIN
    IF NEW.FromDate > NEW.ToDate THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'FromDate must be before or equal to ToDate.';
    END IF;
END;
//
DELIMITER ;
-- 

-- Trigger for the 'leavetype' table
DELIMITER //
CREATE TRIGGER before_leavetype_insert_update
BEFORE INSERT ON leavetype
FOR EACH ROW
BEGIN
    -- condition to check if LeaveType is not null
    IF NEW.LeaveType IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'LeaveType cannot be null';
    END IF;
END;
//
DELIMITER ;
-- 

-- Views for all the tables

-- View for 'departments' table
CREATE VIEW departments_view AS
SELECT id, DepartmentName, DepartmentShortName, DepartmentCode, CreationDate
FROM departments;

-- View for 'employees' table
CREATE VIEW employees_view AS
SELECT id, EmpId, FirstName, LastName, EmailId, Gender, Dob, Department, Address, City, Country, Phonenumber, Status, RegDate
FROM employees;

-- View for 'admin' table
CREATE VIEW admin_view AS
SELECT id, UserName, fullname, email, updationDate
FROM admin;

-- View for 'leaves' table
CREATE VIEW leaves_view AS
SELECT id, LeaveType, ToDate, FromDate, Description, PostingDate, AdminRemark, AdminRemarkDate, Status, IsRead, empid
FROM leaves;

-- View for 'leavetype' table
CREATE VIEW leavetype_view AS
SELECT id, LeaveType, Description, CreationDate
FROM leavetype;

-- To Display all the views

-- SELECT * FROM departments_view;
-- SELECT * FROM employees_view;
-- SELECT * FROM admin_view;
-- SELECT * FROM leaves_view;
-- SELECT * FROM leavetype_view;

-- 




-- Entities:

-- admin: Attributes include id (Primary Key), UserName, Password, fullname, email, and updationDate.
-- departments: Attributes include id (Primary Key), DepartmentName, DepartmentShortName, DepartmentCode, and CreationDate.
-- employees: Attributes include id (Primary Key), EmpId, FirstName, LastName, EmailId, Password, Gender, Dob, DepartmentId (Foreign Key referencing departments), Address, City, Country, Phonenumber, Status, and RegDate.
-- leaves: Attributes include id (Primary Key), LeaveType, ToDate, FromDate, Description, PostingDate, AdminRemark, AdminRemarkDate, Status, IsRead, and empid (Foreign Key referencing employees).
-- leavetype: Attributes include id (Primary Key), LeaveType, Description, and CreationDate.
-- Relationships:

-- One-to-Many relationship between departments and employees (One department can have many employees).
-- One-to-Many relationship between employees and leaves (One employee can have many leaves).
-- Many-to-One relationship between departments and employees (Many employees can belong to one department).
-- Many-to-One relationship between employees and leavetype (Many leaves can have one leave type).



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
