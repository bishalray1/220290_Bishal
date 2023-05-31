-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2023 at 07:17 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `frist_nm`
--

-- --------------------------------------------------------

--
-- Table structure for table `1nm`
--

CREATE TABLE `1nm` (
  `frist_name` varchar(255) DEFAULT NULL,
  `lat_name` varchar(255) DEFAULT NULL,
  `physical_address` varchar(255) DEFAULT NULL,
  `movies_rented` varchar(255) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `1nm`
--

INSERT INTO `1nm` (`frist_name`, `lat_name`, `physical_address`, `movies_rented`, `salutation`) VALUES
('janet', 'jones', 'frist street plot No 4', 'Pirates of the Caribban', 'Ms'),
('Janet', 'jones', 'frist street plot No 4', 'Clash of the titans', 'Ms'),
('Robert', 'Phill', '3rd street 34', 'Forgetting sarah marshul', 'Mr'),
('Robert', 'Phill', '3rd street 34', 'Daddy\'s Little Girls', 'Mr'),
('Robert', 'Phill', '3rd street 34', 'Clash of the titans', 'Mr');

-- --------------------------------------------------------

--
-- Table structure for table `2nf`
--

CREATE TABLE `2nf` (
  `membership_id` int(11) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `physical_address` varchar(255) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `2nf`
--

INSERT INTO `2nf` (`membership_id`, `full_name`, `physical_address`, `salutation`) VALUES
(1, 'Jane Jones', 'First Street Plot No 4', 'Ms'),
(2, 'Robert Phill', '3rd Street 34', 'Mr'),
(3, 'Robert Phill', '5th Avenue', 'Mr');

-- --------------------------------------------------------

--
-- Table structure for table `3nf_customer`
--

CREATE TABLE `3nf_customer` (
  `Membership_id` int(11) NOT NULL,
  `FullName` varchar(255) NOT NULL,
  `PhysicalAddress` varchar(255) NOT NULL,
  `Salutation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `3nf_movie`
--

CREATE TABLE `3nf_movie` (
  `Membership_id` int(11) NOT NULL,
  `MovieRented` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `3nf_salutation`
--

CREATE TABLE `3nf_salutation` (
  `salutation_id` int(11) NOT NULL,
  `Salutation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `Membership_id` int(11) DEFAULT NULL,
  `MovieRented` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`Membership_id`, `MovieRented`) VALUES
(1, 'Pirates of the Carriben'),
(1, 'Clash of Titans'),
(2, 'Forgetting Sarah'),
(2, 'Daddy\'s Little Girl'),
(3, 'Clash of Titans');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `2nf`
--
ALTER TABLE `2nf`
  ADD PRIMARY KEY (`membership_id`);

--
-- Indexes for table `3nf_customer`
--
ALTER TABLE `3nf_customer`
  ADD PRIMARY KEY (`Membership_id`),
  ADD KEY `Salutation` (`Salutation`);

--
-- Indexes for table `3nf_movie`
--
ALTER TABLE `3nf_movie`
  ADD KEY `Membership_id` (`Membership_id`);

--
-- Indexes for table `3nf_salutation`
--
ALTER TABLE `3nf_salutation`
  ADD PRIMARY KEY (`salutation_id`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD KEY `Membership_id` (`Membership_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `3nf_customer`
--
ALTER TABLE `3nf_customer`
  ADD CONSTRAINT `3nf_customer_ibfk_1` FOREIGN KEY (`Salutation`) REFERENCES `3nf_salutation` (`salutation_id`) ON DELETE CASCADE;

--
-- Constraints for table `3nf_movie`
--
ALTER TABLE `3nf_movie`
  ADD CONSTRAINT `3nf_movie_ibfk_1` FOREIGN KEY (`Membership_id`) REFERENCES `3nf_customer` (`Membership_id`) ON DELETE CASCADE;

--
-- Constraints for table `movie`
--
ALTER TABLE `movie`
  ADD CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`Membership_id`) REFERENCES `2nf` (`membership_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
