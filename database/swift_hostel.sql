
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;



-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'admin', '818056dbd7e201243206b9c7cd88481c', '2020-11-03 05:55:30');

-- --------------------------------------------------------

--
-- Table structure for table `tbldepartments`
--

CREATE TABLE `tbldepartments` (
  `id` int(11) NOT NULL,
  `DepartmentName` varchar(150) DEFAULT NULL,
  `DepartmentShortName` varchar(100) NOT NULL,
  `CreationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbldepartments`
--

INSERT INTO `tbldepartments` (`id`, `DepartmentName`, `DepartmentShortName`, `CreationDate`) VALUES
(2, 'Information Technologies', 'ICT', '2022-11-01 07:19:37'),
(3, 'Library and Informatin Sciences', 'LIb', '2022-11-01 08:27:45');

-- --------------------------------------------------------

--
-- Table structure for table `tblemployees`
--

CREATE TABLE `tblemployees` (
  `emp_id` int(11) NOT NULL,
  `FirstName` varchar(150) NOT NULL,
  `LastName` varchar(150) NOT NULL,
  `EmailId` varchar(200) NOT NULL,
  `Password` varchar(180) NOT NULL,
  `Gender` varchar(100) NOT NULL,
  `Dob` varchar(100) NOT NULL,
  `Department` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `swift_hostel` varchar(150) NOT NULL,
  `Phonenumber` char(11) NOT NULL,
  `Status` int(1) NOT NULL,
  `RegDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `role` varchar(30) NOT NULL,
  `location` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblemployees`
--

INSERT INTO `tblemployees` (`emp_id`, `FirstName`, `LastName`, `EmailId`, `Password`, `Gender`, `Dob`, `Department`, `Address`, `swift_hostel`, `Phonenumber`, `Status`, `RegDate`, `role`, `location`) VALUES
(1, 'Student', ' ', 'student@student.unza.zm', '818056dbd7e201243206b9c7cd88481c', 'Female', '3 February, 1990', 'ICT', 'Lusaka', '25', '0248865955', 1, '2017-11-10 11:29:59', 'Student', 'mwaka.png'),
(2, 'Admin', ' ', 'admin@sshms.com', '818056dbd7e201243206b9c7cd88481c', 'Male', '26 December, 1999', 'ICT', 'Lusaka', '24', '8587944255', 1, '2017-11-10 13:40:02', 'Admin', 'denny.png'),
(3, 'Key Custodian', '/Dosa', 'dosa@unza.zm', '818056dbd7e201243206b9c7cd88481c', 'Male', '3 February, 1990', 'ICT', 'Lusaka', '24', '587944255', 1, '2017-11-10 13:40:02', 'key_custodian', 'NO-IMAGE-AVAILABLE.jpg'),
(4, 'Resident Engineer', ' ', 're@unza.zm', '818056dbd7e201243206b9c7cd88481c', 'Male', '3 February, 1990', 'ICT', 'Lusaka', '24', '587944255', 1, '2017-11-10 13:40:02', 'resident_engineer', 'NO-IMAGE-AVAILABLE.jpg'),
(5, 'Superitendent', ' ', 'superitendent@unza.zm', '818056dbd7e201243206b9c7cd88481c', 'Female', '3 February, 1990', 'ICT', 'Lusaka', '24', '587944255', 1, '2017-11-10 13:40:02', 'superitendent', 'NO-IMAGE-AVAILABLE.jpg'),
(6, 'Level Rep', ' ', 'levelrep@student.unza.zm', '818056dbd7e201243206b9c7cd88481c', 'Female', '3 February, 1990', 'ICT', 'Lusaka', '24', '587944255', 1, '2017-11-10 13:40:02', 'level_rep', 'NO-IMAGE-AVAILABLE.jpg'),
(7, 'Staff Member', ' ', 'staff@unza.zm', '818056dbd7e201243206b9c7cd88481c', 'Male', '3 February, 1990', 'ICT', 'Lusaka', '34', '587944255', 1, '2017-11-10 13:40:02', 'staff', 'NO-IMAGE-AVAILABLE.jpg');


-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` int(11) NOT NULL,
  `requestType` varchar(110) NOT NULL,
  `ToDate` varchar(120) NOT NULL,
  `FromDate` varchar(120) NOT NULL,
  `Description` mediumtext NOT NULL,
  `PostingDate` date NOT NULL,
  `AdminRemark` mediumtext,
  `registra_remarks` mediumtext NOT NULL,
  `AdminRemarkDate` varchar(120) DEFAULT NULL,
  `Status` int(1) NOT NULL,
  `admin_status` int(11) NOT NULL DEFAULT '0',
  `IsRead` int(1) NOT NULL,
  `empid` int(11) DEFAULT NULL,
  `num_days` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`id`, `requestType`, `ToDate`, `FromDate`, `Description`, `PostingDate`, `AdminRemark`, `registra_remarks`, `AdminRemarkDate`, `Status`, `admin_status`, `IsRead`, `empid`, `num_days`) VALUES
(13, 'Electrical', '2022-08-02', '2022-08-12', 'I want to request for maintenance.', '2022-08-20', 'Ok', 'ok', '2022-08-24 20:26:19 ', 1, 1, 1, 7, 3),
(14, 'Carpentry', '08-05-2022', '11-05-2022', 'Noted', '0000-00-00', 'Not this time', '', '2022-08-21 0:31:10 ', 0, 0, 1, 6, 4),
(16, 'Plumbing', '02-05-2022', '05-05-2022', 'Alright', '2022-08-20', 'Ok', 'Noted', '2022-08-24 20:42:18 ', 1, 1, 1, 7, 4),
(17, 'Lighting', '11-05-2022', '15-05-2022', 'Just', '2022-08-21', 'Maintenance Request Approved', 'Noted', '2022-08-24 19:56:45 ', 1, 1, 1, 7, 5);

-- --------------------------------------------------------

--
-- Table structure for table `requestType`
--

CREATE TABLE `requestType` (
  `id` int(11) NOT NULL,
  `requestType` varchar(200) DEFAULT NULL,
  `Description` mediumtext,
  `date_from` varchar(200) NOT NULL,
  `date_to` varchar(200) NOT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `requestType`
--

INSERT INTO `requestType` (`id`, `requestType`, `Description`, `date_from`, `date_to`, `CreationDate`) VALUES
(5, 'Electrical', 'Electrical', '2022-08-23', '2022-06-20', '2022-08-19 14:32:03'),
(6, 'Plumbing', 'Plumbing', '2022-08-05', '2022-08-28', '2022-08-19 15:29:05'),
(8, 'Other', 'maintenance all Student', '31-05-2022', '04-06-2022', '2022-08-20 17:17:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbldepartments`
--
ALTER TABLE `tbldepartments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblemployees`
--
ALTER TABLE `tblemployees`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `UserEmail` (`empid`);

--
-- Indexes for table `requestType`
--
ALTER TABLE `requestType`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbldepartments`
--
ALTER TABLE `tbldepartments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblemployees`
--
ALTER TABLE `tblemployees`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `requestType`
--
ALTER TABLE `requestType`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
