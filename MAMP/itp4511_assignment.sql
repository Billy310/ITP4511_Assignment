-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 29, 2023 at 05:21 PM
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
  `BookingDate` date NOT NULL,
  `BookingStart` int(2) NOT NULL,
  `BookingEnd` int(2) NOT NULL,
  `CreatedDate` date NOT NULL,
  `PersonInCharge` double(5,2) NOT NULL,
  `Status` int(1) NOT NULL,
  `Priority` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`BookingID`, `UserID`, `VenueID`, `BookingDate`, `BookingStart`, `BookingEnd`, `CreatedDate`, `PersonInCharge`, `Status`, `Priority`) VALUES
('8swksdc79e0fuaPr1KcRGPu4A', 'bUWudGaQbEA3Mt7kYKR0Kww5N', 1, '2023-05-01', 10, 10, '2023-04-29', 80.00, 3, 1),
('JvHsKpGbiWuiYrLeQCaFMYVf4', 'bUWudGaQbEA3Mt7kYKR0Kww5N', 1, '2023-05-01', 8, 8, '2023-04-29', 80.00, 3, 1),
('KfQwvki9PYW4b7t7LQePdrKJR', 'bUWudGaQbEA3Mt7kYKR0Kww5N', 1, '2023-05-01', 9, 9, '2023-04-29', 80.00, 3, 2),
('pK8x5A4WLkaU6p4QdxeKtvNkN', 'bUWudGaQbEA3Mt7kYKR0Kww5N', 1, '2023-04-30', 8, 8, '2023-04-29', 80.00, 3, 3),
('x247iHPfLxkPxP3KLthCsi1CF', 'bUWudGaQbEA3Mt7kYKR0Kww5N', 1, '2023-05-01', 17, 20, '2023-04-29', 80.00, 3, 3),
('Y2MY6P5KLQt4rCkMXwCuAbH75', 'bUWudGaQbEA3Mt7kYKR0Kww5N', 1, '2023-05-01', 11, 13, '2023-04-29', 80.00, 3, 2);

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
('WxbtMMQUVPfGhwpfNUwEWWfjf', '8swksdc79e0fuaPr1KcRGPu4A', '423', '423', '432', '324');

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
('2kEVpxX2p7W2suaffEx32kY6v', 'Billy0310', '2', '3', 1, 1),
('bUWudGaQbEA3Mt7kYKR0Kww5N', 'Admin', 'Admin', 'Admin', 1, 1),
('CQd1p7tdxG6GWNjb9d1xLi53P', 'HowRonaldoStart', 'Ronaldo', 'billy0310.yts@gmail.com', 3, 1),
('iivQf91PxrMdiGMPw0r4FP0iW', 'b', 'b', 'b', 3, 1),
('iVJPt5eFacYHpVpGbaFVRrdWx', '423', '324', '43', 3, 1),
('QM1hpb8kj31CtNMicw0pGGL8c', 'Hello', 'Hello', 'Hello', 3, 1),
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
(1, 2, 3, 'Hong Kong Institute of Vocational Education (Tuen Mun)', 'Venue For the', 1),
(2, 1, 2, 'Hong Kong Institute of Vocational Education (Sha Tin)', 'HotelsHotels', 1),
(3, 1, 3, 'Hong Kong Institute Of Vocational Education (Tsing Yi)', '', 1),
(4, 1, 4, 'Hong Kong Institute of Vocational Education (Lee Wai Lee)', '', 1),
(5, 1, 5, 'Hong Kong Institute of Vocational Education (Chai Wan)', '', 1),
(6, 2, 1, 'sadsdasad', '53', 1);

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
