-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 02, 2023 at 10:37 AM
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
  `BookingRequestID` varchar(25) NOT NULL,
  `VenueID` int(1) NOT NULL,
  `Enable` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`BookingID`, `UserID`, `BookingRequestID`, `VenueID`, `Enable`) VALUES
('1', '2xQ5XXW390PxG5ujkrJCYHhc1', '1', 1, 1),
('2', '2xQ5XXW390PxG5ujkrJCYHhc1', '2', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `Enable` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `username`, `password`, `email`, `Enable`) VALUES
('2xQ5XXW390PxG5ujkrJCYHhc1', 'HowRonaldoStart', 'Ronaldo', 'Ronaldo', 1),
('A4QjMY4a93AeVhLdsPxQV8kR0', 'billy0310', '232', '3232', 1),
('h6AJQPLuH7HPiehpWRE2LCQta', 'ronaldo', 'SIU', 'Ronaldo@gmail.com', 1),
('pPWu72AwQ4UCrKedL9AbRhxtY', 'billy0310', '', 'Ronaldo@gmail.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `venue`
--

CREATE TABLE `venue` (
  `venueID` int(1) NOT NULL,
  `venueTypeID` int(1) NOT NULL,
  `venueLocationID` int(1) NOT NULL,
  `venueName` varchar(25) NOT NULL,
  `venueDescription` varchar(100) NOT NULL,
  `Enable` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `venue`
--

INSERT INTO `venue` (`venueID`, `venueTypeID`, `venueLocationID`, `venueName`, `venueDescription`, `Enable`) VALUES
(1, 1, 1, 'Resort', 'ResortsResortsResorts', 1),
(2, 1, 1, 'Hotels', 'HotelsHotelsHotels', 1);

-- --------------------------------------------------------

--
-- Table structure for table `venuelocation`
--

CREATE TABLE `venuelocation` (
  `VenueLocationID` int(1) NOT NULL,
  `VenueLocationName` varchar(45) NOT NULL,
  `Enable` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `venuelocation`
--

INSERT INTO `venuelocation` (`VenueLocationID`, `VenueLocationName`, `Enable`) VALUES
(1, 'Tuen Mun', 1),
(2, 'Sha Tin', 1),
(3, 'Tsing Yi', 1),
(4, 'Lee Wai Lee', 1),
(5, 'Chai Wan', 1);

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
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`BookingID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`);

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
