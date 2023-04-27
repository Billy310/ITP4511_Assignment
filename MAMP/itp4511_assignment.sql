-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 27, 2023 at 03:40 PM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `itp4511_assignment`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `BookingID` varchar(25) NOT NULL,
  `UserID` varchar(25) NOT NULL,
  `VenueID` int(1) NOT NULL,
  `GuessListID` varchar(25) DEFAULT NULL,
  `BookingDate` date NOT NULL,
  `BookingStart` int(2) NOT NULL,
  `BookingEnd` int(2) NOT NULL,
  `CreatedDate` date NOT NULL,
  `PersonInCharge` double(5,2) NOT NULL,
  `Status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`BookingID`, `UserID`, `VenueID`, `GuessListID`, `BookingDate`, `BookingStart`, `BookingEnd`, `CreatedDate`, `PersonInCharge`, `Status`) VALUES
('akw0HsG2E4LWafPd5LwEk9hNw', '2kEVpxX2p7W2suaffEx32kY6v', 4, 'wH2AfRxhJrMrdLJKYuNcQMVdP', '2023-05-01', 9, 9, '2023-04-23', 80.00, 3),
('CLNsGYWw4659QFFQYadbdrKeY', 'null', 1, 'vfKErk40apQr73Q1artx67Mf5', '2023-04-27', 8, 8, '2023-04-27', 80.00, 3),
('fkMLHRNJHRRM2C73LHs2spRfQ', 'null', 3, 'aQV6uMWGdYxuKfVeV6jF5F2QH', '2023-05-01', 8, 8, '2023-04-23', 80.00, 3),
('iKNxcRb34sRC4JaWpwEdQcPup', '2kEVpxX2p7W2suaffEx32kY6v', 1, '7bckhrLFQ198vHE8bLWNVt7x7', '2023-05-04', 8, 8, '2023-04-23', 80.00, 3),
('JE7MG2iwpxwYC79HxAbUJx2f5', '2kEVpxX2p7W2suaffEx32kY6v', 2, 'iNX2c1LWHbkcP1v7W80C0Q00e', '2023-05-01', 8, 8, '2023-04-23', 80.00, 3),
('JEAQRpCdjWNGfxiw6sjQbkQvG', '2kEVpxX2p7W2suaffEx32kY6v', 1, 'LNkQhLv2he9xHpvahKuvXXijf', '2023-05-01', 8, 9, '2023-04-22', 80.00, 3),
('Xa1W05EK1sVCMFCJGp5UGak7E', 'null', 4, '6JXGfpc3xh2w3pjpQujV35pxt', '2023-05-01', 8, 8, '2023-04-23', 80.00, 3),
('XV8AF2HA2VEtjiij4a82tL0k2', '2kEVpxX2p7W2suaffEx32kY6v', 5, 'iYiaxcYeMwCacbQL9GCx6r6hb', '2023-05-01', 8, 8, '2023-04-23', 80.00, 3);

-- --------------------------------------------------------

--
-- Table structure for table `guess`
--

CREATE TABLE `guess` (
  `GuessID` varchar(25) NOT NULL,
  `GuessListID` varchar(25) NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `PhoneNumber` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `guess`
--

INSERT INTO `guess` (`GuessID`, `GuessListID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`) VALUES
('3HeRf7RX19w79ujkswM4sfu2X', 'GYCt9k68FrrL9fEdsuvhQUaeb', '234', '432', '243', '432'),
('8rNjsK88shJHwR03JpaA50VPs', 'GYCt9k68FrrL9fEdsuvhQUaeb', '432', '324423', '324', '423'),
('FW9fdjXih30XbX1x8kiM34dxY', 'iYiaxcYeMwCacbQL9GCx6r6hb', '32432', '324342', '432432', '234'),
('tstc6G00QGe7bppF0pi462WLA', 'H3710145aWRYGKdvWpA09Y93Q', 'Billy ', 'Yuen Tat Shing', 'billy0310.yts@gmail.com', '54206873');

-- --------------------------------------------------------

--
-- Table structure for table `guesslist`
--

CREATE TABLE `guesslist` (
  `GuessListID` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `Role` int(1) NOT NULL,
  `Enable` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `username`, `password`, `email`, `Role`, `Enable`) VALUES
('2kEVpxX2p7W2suaffEx32kY6v', 'Billy0310', '2', '3', 3, 1),
('CQd1p7tdxG6GWNjb9d1xLi53P', 'HowRonaldoStart', 'Ronaldo', 'billy0310.yts@gmail.com', 3, 1),
('iVJPt5eFacYHpVpGbaFVRrdWx', '423', '324', '43', 3, 1),
('JEujVPf1vYedNhwfwtAaPVLpX', 'Billy0310', '8964', '432', 3, 1),
('UWx2JpXR54QG0wURGpAL2v0KH', '423523532', 'r32', '43', 3, 1),
('wiLEGtG6XuQjr7rthxXfd1A6L', '55434', '543345534', '43543534', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `usertype`
--

CREATE TABLE `usertype` (
  `UserTypeID` int(3) NOT NULL,
  `UserTypeName` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usertype`
--

INSERT INTO `usertype` (`UserTypeID`, `UserTypeName`) VALUES
(1, 'Admin'),
(2, 'Senior Manager'),
(3, 'Member');

-- --------------------------------------------------------

--
-- Table structure for table `venue`
--

CREATE TABLE `venue` (
  `venueID` int(1) NOT NULL,
  `venueTypeID` int(1) NOT NULL,
  `venueLocationID` int(1) NOT NULL,
  `venueName` varchar(75) NOT NULL,
  `venueDescription` varchar(100) NOT NULL,
  `Enable` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `venue`
--

INSERT INTO `venue` (`venueID`, `venueTypeID`, `venueLocationID`, `venueName`, `venueDescription`, `Enable`) VALUES
(1, 2, 1, 'Hong Kong Institute of Vocational Education (Tuen Mun)', 'ResortsResortsResorts', 1),
(2, 1, 2, 'Hong Kong Institute of Vocational Education (Sha Tin)', 'HotelsHotelsHotels', 1),
(3, 1, 3, 'Hong Kong Institute Of Vocational Education (Tsing Yi)', '', 1),
(4, 1, 4, 'Hong Kong Institute of Vocational Education (Lee Wai Lee)', '', 1),
(5, 1, 5, 'Hong Kong Institute of Vocational Education (Chai Wan)', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `venuelocation`
--

CREATE TABLE `venuelocation` (
  `VenueLocationID` int(1) NOT NULL,
  `VenueLocationName` varchar(45) NOT NULL,
  `VenueLocation_X` double(10,5) NOT NULL,
  `VenueLocation_Y` double(10,5) NOT NULL,
  `Enable` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `venuelocation`
--

INSERT INTO `venuelocation` (`VenueLocationID`, `VenueLocationName`, `VenueLocation_X`, `VenueLocation_Y`, `Enable`) VALUES
(1, 'Tuen Mun', 22.39325, 113.96594, 1),
(2, 'Sha Tin', 22.39051, 114.19775, 1),
(3, 'Tsing Yi', 22.34245, 114.10599, 1),
(4, 'Lee Wai Lee', 22.30643, 114.25420, 1),
(5, 'Chai Wan', 22.27174, 114.23966, 1);

-- --------------------------------------------------------

--
-- Table structure for table `venuetype`
--

CREATE TABLE `venuetype` (
  `VenueTypeID` int(1) NOT NULL,
  `VenueTypeName` varchar(45) NOT NULL,
  `Enable` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `venuetype`
--

INSERT INTO `venuetype` (`VenueTypeID`, `VenueTypeName`, `Enable`) VALUES
(1, 'Resort', 1),
(2, 'Art Galleries', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`BookingID`);

--
-- Indexes for table `guess`
--
ALTER TABLE `guess`
  ADD PRIMARY KEY (`GuessID`);

--
-- Indexes for table `guesslist`
--
ALTER TABLE `guesslist`
  ADD PRIMARY KEY (`GuessListID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`);

--
-- Indexes for table `usertype`
--
ALTER TABLE `usertype`
  ADD PRIMARY KEY (`UserTypeID`);

--
-- Indexes for table `venue`
--
ALTER TABLE `venue`
  ADD PRIMARY KEY (`venueID`);

--
-- Indexes for table `venuelocation`
--
ALTER TABLE `venuelocation`
  ADD PRIMARY KEY (`VenueLocationID`);

--
-- Indexes for table `venuetype`
--
ALTER TABLE `venuetype`
  ADD PRIMARY KEY (`VenueTypeID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
