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
-- Database: `call_center_ems`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(55) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `fullname`, `email`, `updationDate`) VALUES
(45, 'Rajat', '5f4dcc3b5aa765d61d8327deb882cf99', 'Rajat', 'rajat@gmail.com', '2024-03-13 12:50:19'),
(46, 'admin', '5f4dcc3b5aa765d61d8327deb882cf99', 'admin', 'admin@gmail.com', '2024-03-13 12:53:45'),
(47, 'shreyas', '08fa0a7e19b1eaaa7655d54fabf8ec61', 'Shreyas H S', 'shreyas@gmail.com', '2024-03-13 12:55:33');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `DepartmentName` varchar(150) DEFAULT NULL,
  `DepartmentShortName` varchar(100) NOT NULL,
  `DepartmentCode` varchar(50) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
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

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `EmpId` varchar(100) NOT NULL,
  `FirstName` varchar(150) NOT NULL,
  `LastName` varchar(150) NOT NULL,
  `EmailId` varchar(200) NOT NULL,
  `Password` varchar(180) NOT NULL,
  `Gender` varchar(100) NOT NULL,
  `Dob` varchar(100) NOT NULL,
  `Department` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `City` varchar(200) NOT NULL,
  `Country` varchar(150) NOT NULL,
  `Phonenumber` char(11) NOT NULL,
  `Status` int(1) NOT NULL,
  `RegDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `EmpId`, `FirstName`, `LastName`, `EmailId`, `Password`, `Gender`, `Dob`, `Department`, `Address`, `City`, `Country`, `Phonenumber`, `Status`, `RegDate`) VALUES
(1, '4SF21CY011', 'Arjun', 'Shetty', 'arjun@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'Male', '2003-06-12', 'Technical Support', 'Pumpwell', 'Mangalore', 'India', '980987778', 1, '2024-03-01 11:29:59'),
(9, '4SF21CY050', 'Sushath', 'S', 'sushanth@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'Male', '2003-04-17', 'IT Support', 'Nantoor', 'Mangalore', 'India', '9038592844', 1, '2024-03-14 04:10:30');

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

CREATE TABLE `leaves` (
  `id` int(11) NOT NULL,
  `LeaveType` varchar(110) NOT NULL,
  `ToDate` varchar(120) NOT NULL,
  `FromDate` varchar(120) NOT NULL,
  `Description` mediumtext NOT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `AdminRemark` mediumtext DEFAULT NULL,
  `AdminRemarkDate` varchar(120) DEFAULT NULL,
  `Status` int(1) NOT NULL,
  `IsRead` int(1) NOT NULL,
  `empid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `leaves`
--

INSERT INTO `leaves` (`id`, `LeaveType`, `ToDate`, `FromDate`, `Description`, `PostingDate`, `AdminRemark`, `AdminRemarkDate`, `Status`, `IsRead`, `empid`) VALUES
(7, 'Casual Leave', '30/11/2023', '29/10/2023', 'Test Test Demo Test Test Demo Test Test Demo', '2023-11-19 13:11:21', 'A demo Admin Remarks for Testing!', '2023-12-02 23:26:27 ', 2, 1, 1),
(12, 'Self-Quarantine Leave', '2023-02-21', '2023-02-18', 'This is just a demo condition for testing purpose!!', '2023-02-10 16:05:30', 'No comments!!', '2023-02-10 21:37:15 ', 1, 1, 8),
(22, 'Casual Leave', '2024-03-14', '2024-03-07', 'Party Time', '2024-03-14 04:11:42', 'granted', '2024-03-14 9:42:27 ', 1, 1, 9),
(28, 'Personal Time Off', '2024-03-14', '2024-03-15', 'not fell well', '2024-03-14 10:36:52', NULL, NULL, 0, 0, 9),
(36, 'Restricted Holiday', '2024-03-23', '2024-03-16', '-', '2024-03-14 10:45:42', NULL, NULL, 0, 0, 9);

--
-- Triggers `leaves`
--
DELIMITER $$
CREATE TRIGGER `BeforeLeaveInsertUpdate` BEFORE INSERT ON `leaves` FOR EACH ROW BEGIN
    IF STR_TO_DATE(NEW.FromDate, '%Y/%m/%d') > STR_TO_DATE(NEW.ToDate, '%Y/%m/%d') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FromDate must be before or equal to ToDate.';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `leavetype`
--

CREATE TABLE `leavetype` (
  `id` int(11) NOT NULL,
  `LeaveType` varchar(200) DEFAULT NULL,
  `Description` mediumtext DEFAULT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `UserEmail` (`empid`);

--
-- Indexes for table `leavetype`
--
ALTER TABLE `leavetype`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `leavetype`
--
ALTER TABLE `leavetype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

-- Trigger to check leave dates before insertion or update
DELIMITER //

CREATE TRIGGER BeforeLeaveInsertUpdate
BEFORE INSERT ON leaves
FOR EACH ROW
BEGIN
    IF STR_TO_DATE(NEW.FromDate, '%Y/%m/%d') > STR_TO_DATE(NEW.ToDate, '%Y/%m/%d') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FromDate must be before or equal to ToDate.';
    END IF;
END;
//

DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
