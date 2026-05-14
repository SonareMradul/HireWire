-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2026 at 05:38 PM
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
-- Database: `hirewire`
--

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `id` int(11) NOT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`id`, `user_email`, `job_id`, `status`) VALUES
(1, 'mradul@gmail.com', 1, 'Rejected'),
(2, 'mradul@gmail.com', 1, 'Rejected');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `salary` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `title`, `company`, `location`, `salary`, `description`) VALUES
(1, 'Frontend Developer', 'Google', 'Bhopal', '5,00,000', 'looking for enthusiastic candidates'),
(2, 'SDE- ||', 'Meta', 'Bangalore', '80,000-,90,000', 'Excellent Coomunication Skills'),
(3, 'Senior Branch Manager', 'ICICI', ' Jalandhar, Punjab', '90,000 - 95,000', 'We are looking for a highly capable and experienced\r\nSenior Branch Manager\r\nto take complete charge of our real estate branch operations.'),
(4, 'Sales Team Leader', 'Battery Smart', 'Jalandhar, Punjab', '35,000 INR', 'The candidate should have completed Graduate degree and people who have 5 to 31 years are eligible to apply for this job. ');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `resume` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `resume`) VALUES
(2, NULL, NULL, NULL, NULL, NULL),
(3, 'tashu', 'tashu@gmail.com', 'tashu', 'jobseeker', NULL),
(7, 'tashu', 'mradul@gmail.com', 'tashu', 'jobseeker', 'Forward Learning Workbook (Updated).pdf'),
(8, 'ujjwala', 'ujjwala@gmail.com', 'ujjwala', 'recruiter', NULL),
(9, 'isha', 'isha@gmail.com', 'iashiash', 'jobseeker', NULL),
(10, 'Mradul', 'tashutech410@gmail.com', 'sndfksdklf', 'recruiter', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
