-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 10, 2023 at 07:39 PM
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
('0dktiNNhw2P4LYk5X4U13rQjU', 'iivQf91PxrMdiGMPw0r4FP0iW', 1, '2023-05-17', 15, 18, '2023-05-17', '2023-05-17 13:49:08', 0, 1, 200.00, 80.00, '', '', 3),
('0xcCP1k2PexKK3iGkU6pPH69u', 'iivQf91PxrMdiGMPw0r4FP0iW', 1, '2023-05-03', 8, 9, '2023-05-03', '2023-05-03 13:40:56', 1, 1, 200.00, 80.00, '', '', 3),
('1HtfXtN8usL1ePGtMArUX0Fh6', 'QM1hpb8kj31CtNMicw0pGGL8c', 1, '2023-05-12', 8, 11, '2023-05-11', '2023-05-11 03:33:25', 3, 1, 200.00, 100.00, '', '', 3),
('1pXPPbX6c8kVjtFFWWV3cVLWR', 'iivQf91PxrMdiGMPw0r4FP0iW', 1, '2023-01-28', 8, 11, '2023-01-28', '2023-01-28 13:50:58', 1, 1, 200.00, 80.00, '', '', 4),
('1QvH08JaarC3QesW6F22MF5Fj', 'j8Ku3J2Axue78aahwFsAJFwt2', 1, '2023-05-11', 8, 11, '2023-05-10', '2023-05-10 15:53:04', 2, 2, 200.00, 80.00, '', '', 3),
('22esAktfHQ5i47pubFRCYGVAV', 'XXY3a5MApKtj9U0eaRx1EN5p1', 1, '2023-05-11', 9, 10, '2023-05-10', '2023-05-10 16:53:43', 2, 1, 200.00, 80.00, '', '', 3),
('24X1hVs9PNX2NUbbpMLtUw4b6', 'j8Ku3J2Axue78aahwFsAJFwt2', 1, '2023-05-15', 8, 11, '2023-05-11', '2023-05-11 03:16:49', 3, 2, 200.00, 80.00, '', '', 3),
('2RthARixd6jCdPGsXfii2QJPh', 'j8Ku3J2Axue78aahwFsAJFwt2', 1, '2023-05-14', 14, 17, '2023-05-11', '2023-05-11 03:16:49', 3, 3, 200.00, 80.00, '', '', 3),
('33G1a25YMVYddNwQvwFxALV2w', 'XXY3a5MApKtj9U0eaRx1EN5p1', 1, '2023-05-11', 13, 14, '2023-05-10', '2023-05-10 16:53:43', 0, 2, 200.00, 80.00, '', '', 3),
('4diHk30XcfhQwsAk9Le9fks9R', '2LHJ5urEfWL90e8W6sdQ2JtWQ', 1, '2023-05-11', 9, 10, '2023-05-10', '2023-05-10 16:20:46', 2, 2, 200.00, 80.00, '', '', 3),
('4ecpEuLfxbY25CWU2Rte4j3FH', 'YrEQPAtesPh9Fs7C9Ytx4jkLU', 1, '2023-05-11', 9, 9, '2023-05-12', '2023-05-12 14:13:35', 2, 2, 200.00, 80.00, '', '', 3),
('6Jc845xYepP4U7hcWWPr2MiGp', 'iivQf91PxrMdiGMPw0r4FP0iW', 1, '2023-03-01', 12, 15, '2023-03-01', '2023-03-01 13:48:14', 1, 1, 200.00, 80.00, '', '', 3),
('6UYFdRMNpa2YU8ueHju8dJt8N', 'YrEQPAtesPh9Fs7C9Ytx4jkLU', 1, '2023-05-09', 8, 8, '2023-05-09', '2023-05-09 14:13:35', 1, 1, 200.00, 80.00, 'Finish', '', 4),
('8WsEv6AP88cVYM0VUsuX5ahb8', 'PtPuGxNNGLLxKwPGvYMd0JkGi', 2, '2023-05-02', 8, 8, '2023-05-02', '2023-05-02 13:32:59', 1, 1, 200.00, 80.00, '', '', 3),
('92c8YsePtV6XVrb76Qt8CYEXe', 'PtPuGxNNGLLxKwPGvYMd0JkGi', 3, '2023-05-30', 11, 14, '2023-05-30', '2023-05-30 13:35:01', 1, 1, 200.00, 80.00, '', '', 3),
('9r2X446f96P1uucrP975r0EPY', 'iivQf91PxrMdiGMPw0r4FP0iW', 1, '2023-02-12', 10, 13, '2023-02-12', '2023-02-12 13:47:07', 1, 1, 200.00, 80.00, '', '', 4),
('A8ax4bQxQKJfA6PYprXQE4GLR', 'PtPuGxNNGLLxKwPGvYMd0JkGi', 3, '2023-05-21', 15, 18, '2023-05-10', '2023-05-10 13:39:41', 1, 1, 200.00, 80.00, '', '', 3),
('bEtfGudEFv7Xw9reRJHHpd0f9', 'P7uaF1FVARLchbeYuxtjj6cx4', 1, '2023-05-11', 13, 14, '2023-05-10', '2023-05-10 16:53:05', 2, 2, 200.00, 80.00, '', '', 3),
('bf9U1X1A4JUNc3L1e7CFv5H84', 'P7uaF1FVARLchbeYuxtjj6cx4', 1, '2023-05-11', 9, 10, '2023-05-10', '2023-05-10 16:53:05', 0, 1, 200.00, 80.00, '', '', 3),
('bV3iAuYM1s2GU9Xkf70QU7x5W', 'iivQf91PxrMdiGMPw0r4FP0iW', 1, '2023-05-09', 8, 10, '2023-05-09', '2023-05-09 13:43:02', 2, 1, 200.00, 80.00, 'Similar Result', '', 3),
('cJ90GQe3faUxY1LrGH40d5ciR', 'iivQf91PxrMdiGMPw0r4FP0iW', 1, '2023-01-10', 12, 15, '2023-01-10', '2023-01-10 13:50:04', 1, 1, 200.00, 80.00, '', '', 4),
('CsjxckUYiNihi56feru2FKRAj', 'PtPuGxNNGLLxKwPGvYMd0JkGi', 3, '2023-05-06', 8, 11, '2023-05-06', '2023-05-06 13:38:01', 1, 1, 200.00, 80.00, '', '', 3),
('diaKxGcedAW6PV29vfM2JRLeK', '2LHJ5urEfWL90e8W6sdQ2JtWQ', 1, '2023-05-11', 9, 12, '2023-05-10', '2023-05-10 16:20:46', 2, 1, 200.00, 80.00, '', '', 3),
('e2P8W0t8pbv7jvRHdQhYA24LW', 'PtPuGxNNGLLxKwPGvYMd0JkGi', 2, '2023-05-14', 8, 10, '2023-05-14', '2023-05-14 13:36:53', 1, 1, 200.00, 80.00, '', '', 3),
('e9HevvEWFEW2ecAfiYQ1NQtfa', 'PtPuGxNNGLLxKwPGvYMd0JkGi', 5, '2023-05-25', 14, 17, '2023-05-07', '2023-05-07 13:34:07', 1, 1, 200.00, 80.00, '', '', 3),
('edHW78ierEHutLEHYFGk0PfXH', 'PtPuGxNNGLLxKwPGvYMd0JkGi', 2, '2023-05-11', 8, 8, '2023-05-01', '2023-05-01 13:33:06', 1, 1, 200.00, 80.00, '', 'ddd', 3),
('EGRMjkQaYG7GNQc9GbKbC4P3H', 'PtPuGxNNGLLxKwPGvYMd0JkGi', 4, '2023-05-16', 8, 10, '2023-05-05', '2023-05-05 13:33:28', 1, 1, 200.00, 80.00, '', '', 3),
('ERP3LL877bru92bpdPwAfufY8', 'j8Ku3J2Axue78aahwFsAJFwt2', 1, '2023-05-11', 11, 12, '2023-05-10', '2023-05-10 15:53:04', 0, 3, 200.00, 80.00, '', '', 3),
('exchiEJPpQXdjMM89k39fRXdP', 'PtPuGxNNGLLxKwPGvYMd0JkGi', 4, '2023-05-28', 11, 14, '2023-05-28', '2023-05-28 13:39:24', 1, 1, 200.00, 80.00, '', '', 3),
('F8v9GCrFbXRNYFG2E8eR5FXuj', 'iivQf91PxrMdiGMPw0r4FP0iW', 1, '2023-03-23', 16, 19, '2023-03-23', '2023-03-23 13:49:28', 1, 1, 200.00, 80.00, '', '', 4),
('FE2eFbE592dfNJi3NxVL0rCM0', 'j8Ku3J2Axue78aahwFsAJFwt2', 1, '2023-05-15', 8, 10, '2023-05-11', '2023-05-11 03:16:49', 3, 1, 200.00, 80.00, '', '', 3),
('fJ8CxURJts0G7wdF8uUEiEWr8', 'PtPuGxNNGLLxKwPGvYMd0JkGi', 5, '2023-05-09', 11, 14, '2023-05-09', '2023-05-09 13:38:46', 1, 1, 200.00, 80.00, '', '', 3),
('fJb43Fj2Ww9hsEd6f68r58iLL', 'j8Ku3J2Axue78aahwFsAJFwt2', 1, '2023-05-11', 9, 10, '2023-05-10', '2023-05-10 15:53:04', 2, 1, 200.00, 80.00, '', '', 3),
('GAxK4w0QQWk3ktEA5091QFapJ', 'PtPuGxNNGLLxKwPGvYMd0JkGi', 4, '2023-05-08', 15, 18, '2023-05-08', '2023-05-08 13:38:26', 1, 1, 200.00, 80.00, '', '', 3),
('H2fxWMceLjXFJJQb0uXwaGaQF', 'PtPuGxNNGLLxKwPGvYMd0JkGi', 1, '2023-05-29', 10, 13, '2023-05-29', '2023-05-29 13:36:34', 1, 1, 200.00, 80.00, '', '', 3),
('iWAGWEf4dVwraGQr29rAP4usx', 'iivQf91PxrMdiGMPw0r4FP0iW', 1, '2023-02-08', 8, 11, '2023-02-10', '2023-02-10 13:47:38', 1, 1, 200.00, 80.00, '', '', 4),
('JAbYYfbuu3kRKRMG1pKRsW31w', 'iivQf91PxrMdiGMPw0r4FP0iW', 1, '2023-04-10', 12, 15, '2023-04-10', '2023-04-10 13:52:45', 1, 1, 200.00, 80.00, '', '', 3),
('K3Lt7GpHJekYNd5u6PdxRYE9a', 'PtPuGxNNGLLxKwPGvYMd0JkGi', 4, '2023-05-23', 13, 16, '2023-05-23', '2023-05-23 13:39:07', 1, 1, 200.00, 80.00, '', '', 3),
('K7CKw3b819ckFXaiwFwbcYb8Y', 'iivQf91PxrMdiGMPw0r4FP0iW', 1, '2023-05-02', 9, 12, '2023-05-10', '2023-05-10 13:40:43', 1, 1, 200.00, 80.00, '', '', 3),
('KjQuNkxQVshYk1R23JG34KfvP', 'PtPuGxNNGLLxKwPGvYMd0JkGi', 4, '2023-05-26', 14, 17, '2023-05-08', '2023-05-08 13:33:45', 1, 1, 200.00, 80.00, '', '', 3),
('KVHELfNcub7bRtYc4UujdpaW8', 'PtPuGxNNGLLxKwPGvYMd0JkGi', 1, '2023-05-27', 16, 19, '2023-05-27', '2023-05-27 13:37:38', 1, 1, 200.00, 80.00, '', '', 3),
('KXXbvpKib81cNwGh72J7vjR64', 'P7uaF1FVARLchbeYuxtjj6cx4', 1, '2023-05-11', 19, 20, '2023-05-10', '2023-05-10 16:53:05', 2, 3, 200.00, 80.00, '', '', 3),
('LaAacW9k8xFsHWw5cPHs0ebQH', 'iivQf91PxrMdiGMPw0r4FP0iW', 1, '2023-05-07', 8, 11, '2023-05-07', '2023-05-07 13:42:30', 1, 1, 200.00, 80.00, '', '', 3),
('Lsd4XL3p4RXHMuvCu99aRpvNa', 'iivQf91PxrMdiGMPw0r4FP0iW', 1, '2023-02-12', 12, 15, '2023-02-12', '2023-02-12 13:46:22', 3, 1, 200.00, 80.00, '', '', 4),
('MG2XpE51H8N9kta4stF316wM2', 'PtPuGxNNGLLxKwPGvYMd0JkGi', 3, '2023-05-14', 14, 17, '2023-05-14', '2023-05-14 13:34:28', 1, 1, 200.00, 80.00, '', '', 3),
('P8JAcdYhAsEaGvEF5dHK3AHXK', 'PtPuGxNNGLLxKwPGvYMd0JkGi', 5, '2023-05-22', 14, 17, '2023-05-22', '2023-05-22 13:37:17', 1, 1, 200.00, 80.00, '', '', 3),
('pAXpQ9jR17wNvfVLEE1bPRbce', 'iivQf91PxrMdiGMPw0r4FP0iW', 1, '2023-03-10', 13, 16, '2023-03-10', '2023-03-10 13:49:46', 1, 1, 200.00, 80.00, '', '', 4),
('pjEN87eKVUJ11EA2KKMfpQp2Y', 'QM1hpb8kj31CtNMicw0pGGL8c', 1, '2023-05-13', 8, 9, '2023-05-11', '2023-05-11 03:33:25', 3, 2, 200.00, 100.00, '', '', 3),
('Qk40Qsx3icKP6fRRub99dsbd9', '2LHJ5urEfWL90e8W6sdQ2JtWQ', 1, '2023-05-11', 9, 11, '2023-05-10', '2023-05-10 16:20:46', 2, 3, 200.00, 80.00, '', '', 3),
('r9QPYJsWUC6MEcb6aaGrrfCre', 'iivQf91PxrMdiGMPw0r4FP0iW', 1, '2023-04-09', 14, 17, '2023-04-09', '2023-04-09 13:53:00', 1, 1, 200.00, 80.00, '', '', 4),
('rCMQ4PjJe7AXWpE0w695A6E6d', 'iivQf91PxrMdiGMPw0r4FP0iW', 1, '2023-05-05', 12, 15, '2023-05-05', '2023-05-05 13:41:42', 1, 1, 200.00, 80.00, '', '', 4),
('RHUCYrVC5CaRJ8jbW8UcpjRjp', 'PtPuGxNNGLLxKwPGvYMd0JkGi', 1, '2023-05-01', 8, 8, '2023-05-04', '2023-05-04 13:32:36', 1, 1, 200.00, 80.00, '', '', 4),
('RusjpUwp8QX47QsKtuC4ka6h3', 'YrEQPAtesPh9Fs7C9Ytx4jkLU', 1, '2023-05-11', 10, 10, '2023-05-12', '2023-05-12 14:13:35', 2, 3, 200.00, 80.00, '', '', 3),
('txrXe8j1LfVEx2e2sUu4MWduP', 'PtPuGxNNGLLxKwPGvYMd0JkGi', 1, '2023-05-11', 8, 8, '2023-05-03', '2023-05-03 13:32:50', 1, 1, 200.00, 80.00, '', '', 4),
('UG1A2hW3WLxJQrfFFxcQ5sVfk', 'iivQf91PxrMdiGMPw0r4FP0iW', 1, '2023-05-06', 8, 11, '2023-05-06', '2023-05-06 13:42:10', 1, 1, 200.00, 80.00, '', '', 3),
('uMM1jAiasaURwcXc1UExf314A', 'iivQf91PxrMdiGMPw0r4FP0iW', 1, '2023-01-25', 8, 11, '2023-01-25', '2023-01-25 13:50:40', 1, 1, 200.00, 80.00, '', '', 4),
('uxGEG7ujwNWvss6LGhNbp269Q', 'iivQf91PxrMdiGMPw0r4FP0iW', 1, '2023-05-04', 8, 10, '2023-05-04', '2023-05-04 13:41:16', 1, 1, 200.00, 80.00, '', '', 3),
('vPhWiHFPuwLrepEVFEaFNrYsx', 'iivQf91PxrMdiGMPw0r4FP0iW', 1, '2023-01-10', 8, 10, '2023-01-10', '2023-01-10 13:50:22', 1, 1, 200.00, 80.00, '', '', 4),
('VWssx0jkFVceMfHFXfbhXfkYu', 'iivQf91PxrMdiGMPw0r4FP0iW', 1, '2023-03-02', 14, 17, '2023-03-02', '2023-03-02 13:48:50', 1, 1, 200.00, 80.00, '', '', 3),
('wHQpU11Ciji7x3E3ActJpQ17r', 'iivQf91PxrMdiGMPw0r4FP0iW', 1, '2023-02-10', 11, 14, '2023-02-10', '2023-02-10 13:45:24', 1, 1, 200.00, 80.00, '', '', 4),
('WUpxGeV1xRRFL77LWNuCskFv7', 'QM1hpb8kj31CtNMicw0pGGL8c', 5, '2023-05-14', 8, 11, '2023-05-11', '2023-05-11 03:33:25', 3, 3, 200.00, 50.00, '', '', 3),
('WxaCjKpssRXH9WcYMht2sp08b', 'iivQf91PxrMdiGMPw0r4FP0iW', 1, '2023-02-10', 13, 16, '2023-02-10', '2023-02-10 13:45:51', 1, 1, 200.00, 80.00, '', '', 4),
('YQs46LxECK0k0aj1PNu6uj8pd', 'PtPuGxNNGLLxKwPGvYMd0JkGi', 2, '2023-05-21', 11, 14, '2023-05-21', '2023-05-21 13:36:06', 1, 1, 200.00, 80.00, '', '', 3);

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
('AsHC54QprJRtK9EudAt9LMEQ3', 'ERP3LL877bru92bpdPwAfufY8', 'Tom', 'Caniey', 'billy1@onionmail.org', '324432'),
('G8xG214UhbQjw6U8djAxkhA3s', 'MUuvL529hJ7YPiKEYhdwV4s9p', 'Tom', 'Caniey', 'billy1@onionmail.org', '324432'),
('jwVhsjjXx8UrfJPvCvFxCKKw8', 'firRQ9HCuUMN0Y867J6Wi6QQ4', 'Billy', 'Yuen Tat Shing', 'billy0310.yts@gmail.com', '54206873'),
('LsWA7N982J50MJMdsLiCdwpNR', 'firRQ9HCuUMN0Y867J6Wi6QQ4', '&#36948;&#35488;', '&#38446;', 'billy_0310@hotmail.com', '54206873'),
('QJVhiWuE2f39M1RHeNM37vEbs', 'ERP3LL877bru92bpdPwAfufY8', '&#32626;&#32626;&#27700;&#30000;', '&#27833;ae&#27833;&#26194;&#26368;', 'billy0310.yts@gmail.com', ''),
('rj8YVUrj2cvdscP7caw6UsM0M', 'ERP3LL877bru92bpdPwAfufY8', 'Billy', 'Yuen Tat Shing', 'billy0310.yts@gmail.com', '54206873'),
('s9b6xVhHir7hi10Fx5pWWE1bv', 'MUuvL529hJ7YPiKEYhdwV4s9p', 'Billy', 'Yuen Tat Shing', 'billy0310.yts@gmail.com', '54206873'),
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
('4GaxYXh9M7jP5HVuiXrp2XJba', 'q', 'q', 'q', 3, 1),
('bUWudGaQbEA3Mt7kYKR0Kww5N', 'Admin', 'Admin', 'Admin', 1, 1),
('hHedAuE2Ft75vp7CvLMfrXhFU', 'B1lly', 'B1lly', 'B1lly', 3, 1),
('iivQf91PxrMdiGMPw0r4FP0iW', 'b', 'B', 'b', 3, 1),
('iVJPt5eFacYHpVpGbaFVRrdWx', '423', '324', '43', 3, 1),
('j8Ku3J2Axue78aahwFsAJFwt2', 'Billy', 'Billy', 'Billy_0310@hotmail.com', 3, 1),
('P7uaF1FVARLchbeYuxtjj6cx4', 'Billy03100310', 'Billy03100310', 'Billy03100310', 3, 1),
('PtPuGxNNGLLxKwPGvYMd0JkGi', 'C', 'c', 'c', 3, 1),
('QM1hpb8kj31CtNMicw0pGGL8c', 'Hello', 'Hello', 'Hello', 3, 1),
('tbK4tpibkfuPGQVe5vW1QRYR0', 'dsa', 'sads', 'adsd', 2, 1),
('UCNRfU19VH4hkFrNvNtE42YMu', 'Staff', 'Staff', 'Staff', 2, 1),
('XXY3a5MApKtj9U0eaRx1EN5p1', 'Bi', 'Bi', 'Bi', 3, 1),
('YrEQPAtesPh9Fs7C9Ytx4jkLU', 'd', 'd', 'dsasda', 3, 1);

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
  `venueName` varchar(100) NOT NULL,
  `venueDescription` varchar(500) NOT NULL,
  `Enable` tinyint(1) NOT NULL DEFAULT '1',
  `PersonInCharge` double(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `venue`
--

INSERT INTO `venue` (`venueID`, `venueTypeID`, `venueLocationID`, `venueName`, `venueDescription`, `Enable`, `PersonInCharge`) VALUES
(1, 2, 1, 'Event Point Centre (Tuen Mun)', 'Located on a 2.4-hectare site adjacent to the Tuen Mun Town Centre, Event Point Centre (Tuen Mun) is equipped with facilities to provide simulated working environment', 1, 100.00),
(2, 1, 2, 'Event Point Centre  (Sha Tin)', 'Event Point Centre (Sha Tin) is known for its spacious, nurturing and creative learning environment with its harmonious design.', 1, 150.00),
(3, 1, 3, 'Event Point Centre  (Tsing Yi)', 'Event Point Centre (Tsing Yi) has a splendid architectural design which offers students a green, modern and spacious learning environment.', 1, 60.00),
(4, 1, 4, 'Event Point Centre  (Lee Wai Lee)', 'Event Point Centre  (Lee Wai Lee) is equipped with specialised teaching and learning facilities including Interactive Media Studio.', 1, 40.00),
(5, 1, 5, 'Event Point Centre  (Chai Wan)', 'Event Point Centre  (Chai Wan) is a dynamic and welcoming campus, fostering active learning for our students’ long-term development.', 1, 50.00);

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
