-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2020 at 07:46 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs230`
--

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `pid` int(11) NOT NULL,
  `title` varchar(60) NOT NULL,
  `descript` text NOT NULL,
  `picpath` varchar(80) NOT NULL,
  `upload_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `rating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`pid`, `title`, `descript`, `picpath`, `upload_date`, `rating`) VALUES
(1, 'Mothman', 'Cryptid originating from Point Pleasant, West Virginia.  Described to be a \"Man-Sized Bird... Creature... Something...\" in Point Pleasant Register.', '5fa34a9cd19ab7.87356237.jpg', '2020-11-04', NULL),
(2, 'Loch Ness Monster', 'Long necked creature in habiting Loch Ness in the Scottish Highlands.  Regarded as a baseless phenomenon in the scientific community.', '5fa34bafcba9b2.46538666.jpg', '2020-11-04', NULL),
(3, 'Chupracabra', 'A creature of folklore in parts of the Americas.  First sighted in Puerto Rico.  It was reported to suck the blood of goats.', '5fa34c5c505bc3.60726443.jpg', '2020-11-04', NULL),
(4, 'Jersey Devil', 'Originating from New Jersey, the Jersey Devil is said to be the 13th child of Jane Leeds, who had shifted into a goat-like creature after being born due to its mother cursing it.', '5fb409c7cd7a76.26154227.jpg', '2020-11-17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `uname` varchar(30) NOT NULL,
  `picpath` varchar(50) NOT NULL DEFAULT 'uploads/anon.png',
  `bio` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`uname`, `picpath`, `bio`) VALUES
('Kags9', '../uploads/5fa2fa22461090.40500902.jpg', NULL),
('schemingcaptain', '../uploads/5fa358be253690.20379704.jpg', NULL),
('Akaashi_K', 'uploads/anon.png', NULL),
('test', '../uploads/5fb4044fcfe578.72514568.png', NULL),
('flop', '../uploads/5fb41836629723.39229429.jpg', 'Doesb\'t work\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `rev_id` int(11) NOT NULL COMMENT 'review id',
  `item_id` int(11) NOT NULL COMMENT 'item id to be reviewed',
  `uname` varchar(80) CHARACTER SET utf8mb4 NOT NULL COMMENT 'user who will review it',
  `title` varchar(60) CHARACTER SET utf8mb4 NOT NULL,
  `review_text` text CHARACTER SET utf8mb4 NOT NULL,
  `rev_date` datetime NOT NULL,
  `rating_num` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT 'is there at least one review'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`rev_id`, `item_id`, `uname`, `title`, `review_text`, `rev_date`, `rating_num`, `status`) VALUES
(1, 3, 'Kags9', 'Neat', 'I saw it in a Scooby Doo movie once which was pretty alright.  At least I assume so, I remember nothing about it.', '2020-11-05 01:07:04', 4, 1),
(2, 3, 'schemingcaptain', 'no <3', 'He looks like a scoundrel and a thief.  Stealing those poor goats\' blood.  He probably hangs out with Spiderman who we all know is a menace.', '2020-11-04 22:41:07', 2, 1),
(3, 2, 'schemingcaptain', 'Literally the Best Girl on the Planet', 'As a man of science, I am absolutely appalled that my fellow PEERS would say such a thing about this absolute beaute.  On behalf of the human race, I personally apologize for their ignorance.  Nessie, you are seen, you are valid, and you are loved.', '2020-11-05 02:29:35', 5, 1),
(4, 2, 'test', 'Nessie >> Everything', 'She really do be the best though.', '2020-11-17 17:13:55', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `uid` int(11) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `email` varchar(80) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `lname`, `fname`, `email`, `uname`, `password`) VALUES
(1, 'Kageyama', 'Tobio', 'bananamilk@haikyuu.com', 'Kags9', '$2y$10$QIOXDbEOjp/60fVIWwwsg.JKNQecwd94WuH4HvBNXLBFpBwfzpaJC'),
(2, 'Kuroo', 'Tetsuro', 'tetsu17@haikyuu.com', 'schemingcaptain', '$2y$10$4zi5Tgqv/ZM2D10w6crZueIzlfM6gDDvNWabFOAdo9GQN2kQeMQzO'),
(3, 'Keiji', 'Akaashi', 'Akaashik@haikyuu.com', 'Akaashi_K', '$2y$10$1eXTD/9SW4KSuVTRonJMD.HBswzTwbZZuaRMLByEJhPWHm4lUaUea'),
(4, 'Testlast', 'Test', 'test@test.com', 'test', '$2y$10$n78CV7ervhlcoOKue9UXceaZJrvz5xJs72o07nxS7fgZ.I6gux40O');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`rev_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `rev_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'review id', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
