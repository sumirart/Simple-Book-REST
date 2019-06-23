-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 23, 2019 at 07:03 PM
-- Server version: 5.7.26-0ubuntu0.18.04.1
-- PHP Version: 7.2.19-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `book_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `name`, `author`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'ReactJS and Native For Dummy #2', 'Mark Zuckerberg', 'Specialized for Dummy, Very Dummy, Very Very', 1, '2019-05-11 00:00:00', '2019-05-13 07:51:11'),
(2, 'Golang Cookbook', 'Arham Abiyan', 'Suitable for beginner', 1, '2019-05-12 02:25:52', '2019-05-12 02:25:52'),
(3, 'Python Recipe', 'Arham Abiyan', 'Learn Python in a fancy manner', 1, '2019-05-12 02:28:29', '2019-05-12 02:28:29'),
(4, 'Mastering Node JS', 'Arham Abiyan', 'Learn Node JS in a fancy manne', 0, '2019-05-12 05:15:07', '2019-05-12 08:14:22'),
(10, 'C++ Mastermind', 'Arham Abiyan', 'Get better at C++', 1, '2019-05-13 07:00:30', '2019-05-13 07:00:30'),
(11, 'Memasak Ayam', 'Arham Abiyan', 'Memasak Ayam Enak', 0, '2019-05-13 07:01:25', '2019-05-13 08:01:48'),
(12, 'Memasak Sapi', 'Arham Abiyan', 'Memasak Sapi Enak', 1, '2019-06-16 10:24:34', '2019-06-16 10:24:34'),
(13, 'Memasak Kambing', 'Arham Abiyan', 'Memasak Kambing Enak', 1, '2019-06-16 10:44:41', '2019-06-16 10:44:41');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Memasak Ayam', 'arham.abiyan@gmail.com', 'Memasak Ayam Enak', 1, '2019-05-22 09:26:21', '2019-05-22 09:26:21'),
(12, 'Memasak Ayam', 'arham.abiyan1@gmail.com', '8b6ea576ee008313120bb4e853554b564b5bd5f1ec351540679efd10de7c6c37', 1, '2019-05-22 09:45:33', '2019-05-22 09:45:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
