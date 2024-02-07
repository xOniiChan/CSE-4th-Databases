-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2024 at 07:58 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aihara_library`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `isbn` varchar(100) NOT NULL,
  `Title` varchar(200) DEFAULT NULL,
  `Author` varchar(300) DEFAULT NULL,
  `Publisher` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`isbn`, `Title`, `Author`, `Publisher`) VALUES
('9780061', 'The Great Gatsby', 'F. Scott Fitzgerald', 'Scribner'),
('9780062', '1984', 'George Orwell', 'Harvill Secker'),
('9780142 ', 'To Kill a Mockingbird', 'Harper Lee', 'Harper Perennial Modern Classics'),
('9780316', 'The Catcher in the Rye', 'J.D. Salinger', 'Back Bay Books'),
('9780446', 'Gone with the Wind', 'Margaret Mitchell', 'Grand Central Publishing');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `Emp_no` varchar(11) NOT NULL,
  `Name` varchar(30) DEFAULT NULL,
  `Office` varchar(30) DEFAULT NULL,
  `Age` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`Emp_no`, `Name`, `Office`, `Age`) VALUES
('20170429', 'Joan', 'quality assurance', '22'),
('20171112', 'Daphne', 'production', '32.45'),
('20171113', 'Shovon', 'production', '24.45'),
('20190806', 'Giles', 'quality assurance', '26.50'),
('20190807', 'Gillies', 'quality assurance', '28.50');

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

CREATE TABLE `loan` (
  `emp_no` varchar(11) NOT NULL,
  `ISBN` varchar(20) DEFAULT NULL,
  `Date` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`isbn`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`Emp_no`);

--
-- Indexes for table `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`emp_no`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
