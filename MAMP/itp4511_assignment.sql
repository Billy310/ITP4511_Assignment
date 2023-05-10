-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 10, 2023 at 02:40 AM
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
  `CreatedTime` datetime NOT NULL,
  `Status` int(1) NOT NULL,
  `Priority` int(1) NOT NULL,
  `BookingFee` double(6,2) NOT NULL,
  `PersonInCharge` double(6,2) NOT NULL,
  `Remark` varchar(100) NOT NULL,
  `Comment` varchar(100) NOT NULL,
  `CheckStatus` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`BookingID`, `UserID`, `VenueID`, `BookingDate`, `BookingStart`, `BookingEnd`, `CreatedDate`, `CreatedTime`, `Status`, `Priority`, `BookingFee`, `PersonInCharge`, `Remark`, `Comment`, `CheckStatus`) VALUES
('3hiHLsaK4A5Rb0hd8Ncphvehc', '2LHJ5urEfWL90e8W6sdQ2JtWQ', 1, '2023-05-11', 12, 14, '2023-05-10', '2023-05-10 02:22:13', 3, 2, 200.00, 80.00, '', '', 3),
('6Y762d63efRHwQvWNs06QxhjL', '2LHJ5urEfWL90e8W6sdQ2JtWQ', 2, '2023-05-11', 8, 10, '2023-05-10', '2023-05-10 02:22:13', 3, 3, 200.00, 80.00, '', '', 3),
('aVJci4rK4fjkGRAaXP0W1F0Xj', '2LHJ5urEfWL90e8W6sdQ2JtWQ', 1, '2023-05-11', 8, 11, '2023-05-10', '2023-05-10 02:22:13', 3, 1, 200.00, 80.00, '', '', 3);

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
('4Fu4epWEXhWRJpRuiWfiQ2jA2', 'Y5dX7sPFKVkitruYcEHJJjVM0', 'Tom', 'Caniey', 'billy1@onionmail.org', '324432'),
('jwVhsjjXx8UrfJPvCvFxCKKw8', 'firRQ9HCuUMN0Y867J6Wi6QQ4', 'Billy', 'Yuen Tat Shing', 'billy0310.yts@gmail.com', '54206873'),
('LsWA7N982J50MJMdsLiCdwpNR', 'firRQ9HCuUMN0Y867J6Wi6QQ4', '&#36948;&#35488;', '&#38446;', 'billy_0310@hotmail.com', '54206873'),
('uKFexPbp4EwhetYd7rb95Uk8w', 'Y5dX7sPFKVkitruYcEHJJjVM0', 'Billy', 'Yuen Tat Shing', 'billy0310.yts@gmail.com', '54206873');

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
('2kEVpxX2p7W2suaffEx32kY6v', 'Billy0310', 'Billy0310', '3', 1, 1),
('2LHJ5urEfWL90e8W6sdQ2JtWQ', 'a', 'a', 'a', 3, 1),
('bUWudGaQbEA3Mt7kYKR0Kww5N', 'Admin', 'Admin', 'Admin', 1, 1),
('hHedAuE2Ft75vp7CvLMfrXhFU', 'B1lly', 'B1lly', 'B1lly', 3, 1),
('iivQf91PxrMdiGMPw0r4FP0iW', 'b', 'B', 'b', 3, 1),
('iVJPt5eFacYHpVpGbaFVRrdWx', '423', '324', '43', 3, 1),
('PtPuGxNNGLLxKwPGvYMd0JkGi', 'C', 'c', 'c', 3, 1),
('QM1hpb8kj31CtNMicw0pGGL8c', 'Hello', 'Hello', 'Hello', 3, 1),
('tbK4tpibkfuPGQVe5vW1QRYR0', 'dsa', 'sads', 'adsd', 2, 1),
('UCNRfU19VH4hkFrNvNtE42YMu', 'Senior', 'Senior', 'Senior', 2, 1);

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
(3, 'Member'),
(4, 'FF'),
(5, 'FF');

-- --------------------------------------------------------

--
-- Table structure for table `venue`
--

CREATE TABLE `venue` (
  `venueID` int(1) NOT NULL,
  `venueTypeID` int(1) NOT NULL,
  `venueLocationID` int(1) NOT NULL,
  `venueName` varchar(100) NOT NULL,
  `venueDescription` varchar(100) NOT NULL,
  `Enable` tinyint(1) NOT NULL DEFAULT '1',
  `PersonInCharge` double(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `venue`
--

INSERT INTO `venue` (`venueID`, `venueTypeID`, `venueLocationID`, `venueName`, `venueDescription`, `Enable`, `PersonInCharge`) VALUES
(1, 2, 1, 'Hong Kong Institute of Vocational Education (Tuen Mun)', 'Venue For the', 1, 80.00),
(2, 1, 2, 'Hong Kong Institute of Vocational Education (Sha Tin)', 'HotelsHotels', 1, 80.00),
(3, 1, 3, 'Hong Kong Institute Of Vocational Education (Tsing Yi)', '', 1, 80.00),
(4, 1, 4, 'Hong Kong Institute of Vocational Education (Lee Wai Lee)', '', 1, 80.00),
(5, 1, 5, 'Hong Kong Institute of Vocational Education (Chai Wan)', '', 1, 80.00);

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
