-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 10, 2023 at 05:10 PM
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
  `BookingTime` time NOT NULL,
  `CreatedDate` date NOT NULL,
  `PersonInCharge` double(5,2) NOT NULL,
  `Status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`BookingID`, `UserID`, `VenueID`, `GuessListID`, `BookingDate`, `BookingTime`, `CreatedDate`, `PersonInCharge`, `Status`) VALUES
('hv2AJxWKcUbQhd8GhfkVjL7Vp', 'null', 2, 'WeU9dwuULNuj18f3f23pfCi2d', '2023-05-01', '13:45:00', '2023-04-11', 80.00, 3),
('QdpP9av2sJ17CFrK7YsAxYFvb', 'null', 1, '8kQW93hFKE9cdc1M0FLVvbMHx', '2023-05-01', '13:45:00', '2023-04-11', 80.00, 3),
('s0UCuwY5FENvKXdhGtsXC5E3r', 'null', 2, 'GEURGAYs53d5Rj1GNvKC2tAL0', '2023-05-01', '13:45:00', '2023-04-11', 80.00, 3),
('vbx0fxPPR7WhhM5Gf2piGHchi', 'null', 1, 'PAX0r4s5aN2rpHiLduc4srXaJ', '2023-05-01', '13:45:00', '2023-04-11', 80.00, 3),
('vpV7KFC5eHv1xM5fjRbjx7YVH', 'null', 1, 'rR6VJcKtJpj5rwQP5XkttLL6d', '2023-05-01', '13:45:00', '2023-04-11', 80.00, 3),
('vRuERN5Ebbias3iaVkLbj6v2W', 'null', 1, '0854FJ8ih4svrGw6ebj2bHvCH', '2023-05-01', '13:45:00', '2023-04-10', 80.00, 3),
('W0E20wvhFw4ANxhrpURRMifdJ', 'null', 1, 'RX7CAG65AG8v45jCarWbYbPQ9', '2023-05-01', '13:45:00', '2023-04-11', 80.00, 3),
('Yu53NbCpfsjdPkc9dJFcdd39x', 'null', 1, 'ed1hGNVuGELw7HdfhrX1PwN6W', '2023-05-01', '13:45:00', '2023-04-11', 80.00, 3);

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
('CQd1p7tdxG6GWNjb9d1xLi53P', 'HowRonaldoStart', 'Messi', 'billy0310.yts@gmail.com', 3, 1),
('JEujVPf1vYedNhwfwtAaPVLpX', 'Billy0310', '8964', '432', 3, 1);

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
