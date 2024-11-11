-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2024 at 03:36 AM
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
-- Database: `checklist1`
--

-- --------------------------------------------------------

--
-- Table structure for table `firstyear`
--

CREATE TABLE `firstyear` (
  `course_code` varchar(30) NOT NULL,
  `course_title` varchar(70) NOT NULL,
  `credit_unit_lec` int(11) NOT NULL,
  `credit_unit_lab` int(11) DEFAULT NULL,
  `contact_hrs_lec` int(11) DEFAULT NULL,
  `contact_hrs_lab` int(11) DEFAULT NULL,
  `prerequisite` varchar(30) DEFAULT NULL,
  `semester` varchar(30) NOT NULL,
  `year_taken` date DEFAULT NULL,
  `final_grade` varchar(30) NOT NULL,
  `instructor` varchar(50) DEFAULT NULL,
  `student_number` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `firstyear`
--

INSERT INTO `firstyear` (`course_code`, `course_title`, `credit_unit_lec`, `credit_unit_lab`, `contact_hrs_lec`, `contact_hrs_lab`, `prerequisite`, `semester`, `year_taken`, `final_grade`, `instructor`, `student_number`) VALUES
('COSC 50', 'Discrete Structure 1', 3, NULL, 3, NULL, NULL, 'First Sem', NULL, '2.00', 'Ms. Pensan', '202211863'),
('CvSU 101', 'Institutional Orientation', 1, NULL, 1, NULL, NULL, 'First Sem', NULL, 'S', 'Mr. Veltruz', '202211863'),
('DCIT 21', 'Introduction to Computing', 2, 1, 2, 3, NULL, 'First Sem', NULL, '1.00', 'Mr. Rosal', '202211863'),
('DCIT 22', 'Computer Programming 1', 1, 2, 1, 6, NULL, 'First Sem', NULL, '1.00', 'Mr. Belgica', '202211863'),
('DCIT 23', 'Computer Programming 2 ', 1, 2, 1, 6, 'DCIT 22', 'Second Sem', NULL, '2.00', 'Mr. Roy', '202211863'),
('FITT 1', 'Movement Enhancement', 2, NULL, 2, NULL, NULL, 'First Sem', NULL, '1.25', 'Mr. Jamito', '202211863'),
('FITT 2', 'Fitness Exercises', 2, NULL, 2, NULL, 'FITT 1', 'Second Sem', NULL, '1.25', 'Ms. Tatad', '202211863'),
('GNED 01', 'Art Appreciation', 3, NULL, 3, NULL, NULL, 'Second Sem', NULL, '2.00', 'Mr. Perlado', '202211863'),
('GNED 02', 'Ethics', 3, NULL, 3, NULL, NULL, 'First Sem', NULL, '1.50', 'Mr. Agundo', '202211863'),
('GNED 03', 'Mathematics in the Modern World', 3, NULL, 3, NULL, NULL, 'Second Sem', NULL, '2.25', 'Mr. Manozo', '202211863'),
('GNED 05', 'Purposive Communication', 3, NULL, 3, NULL, NULL, 'First Sem', NULL, '2.25', 'Mrs. Pica', '202211863'),
('GNED 06', 'Science Technology and Society', 3, NULL, 3, NULL, NULL, 'Second Sem', NULL, '1.25', 'Mr. Montesar', '202211863'),
('GNED 11', 'Kontekstwalisadong Komnikasyon sa Filipino', 3, NULL, 3, NULL, NULL, 'First Sem', NULL, '1.25', 'Mr. Castillo', '202211863'),
('GNED 12', 'Dalumat ng/sa Filipino', 3, NULL, 3, NULL, 'GNED 11', 'Second Sem', NULL, '1.25', 'Mr. Castillo', '202211863'),
('ITEC 50', 'Web Systems and Technology', 2, 1, 2, 3, 'DCIT 21', 'Second Sem', NULL, '2.25', 'Mr. Gianan', '202211863'),
('NSTP 1', 'National Service Training Program 1', 3, NULL, 3, NULL, NULL, 'First Sem', NULL, '1.25', 'Mr. Mitra', '202211863'),
('NSTP 2', 'National Service Training Program 2', 3, NULL, 3, NULL, 'NSTP 1', 'Second Sem', NULL, '1.50', 'Mr. Aldea', '202211863');

-- --------------------------------------------------------

--
-- Stand-in structure for view `firstyear_first`
-- (See below for the actual view)
--
CREATE TABLE `firstyear_first` (
`course_code` varchar(30)
,`course_title` varchar(70)
,`credit_unit_lec` int(11)
,`credit_unit_lab` int(11)
,`contact_hrs_lec` int(11)
,`contact_hrs_lab` int(11)
,`prerequisite` varchar(30)
,`semester` varchar(30)
,`year_taken` date
,`final_grade` varchar(30)
,`instructor` varchar(50)
,`student_number` varchar(60)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `firstyear_firstsem`
-- (See below for the actual view)
--
CREATE TABLE `firstyear_firstsem` (
`course_code` varchar(30)
,`course_title` varchar(70)
,`credit_unit_lec` int(11)
,`credit_unit_lab` int(11)
,`contact_hrs_lec` int(11)
,`contact_hrs_lab` int(11)
,`prerequisite` varchar(30)
,`semester` varchar(30)
,`year_taken` date
,`final_grade` varchar(30)
,`instructor` varchar(50)
,`student_number` varchar(60)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `firstyear_secondsem`
-- (See below for the actual view)
--
CREATE TABLE `firstyear_secondsem` (
`course_code` varchar(30)
,`course_title` varchar(70)
,`credit_unit_lec` int(11)
,`credit_unit_lab` int(11)
,`contact_hrs_lec` int(11)
,`contact_hrs_lab` int(11)
,`prerequisite` varchar(30)
,`semester` varchar(30)
,`year_taken` date
,`final_grade` varchar(30)
,`instructor` varchar(50)
,`student_number` varchar(60)
);

-- --------------------------------------------------------

--
-- Table structure for table `fourthyear`
--

CREATE TABLE `fourthyear` (
  `course_code` varchar(30) NOT NULL,
  `course_title` varchar(70) NOT NULL,
  `credit_unit_lec` int(11) NOT NULL,
  `credit_unit_lab` int(11) DEFAULT NULL,
  `contact_hrs_lec` int(11) DEFAULT NULL,
  `contact_hrs_lab` int(11) DEFAULT NULL,
  `prerequisite` varchar(30) DEFAULT NULL,
  `semester` varchar(30) NOT NULL,
  `year_taken` date DEFAULT NULL,
  `final_grade` varchar(30) DEFAULT NULL,
  `instructor` varchar(50) DEFAULT NULL,
  `student_number` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fourthyear`
--

INSERT INTO `fourthyear` (`course_code`, `course_title`, `credit_unit_lec`, `credit_unit_lab`, `contact_hrs_lec`, `contact_hrs_lab`, `prerequisite`, `semester`, `year_taken`, `final_grade`, `instructor`, `student_number`) VALUES
('COSC 100', 'Automata Theory and Formal Languages', 3, NULL, 3, NULL, 'COSC 90', 'first sem', NULL, '', NULL, '202211863'),
('COSC 105', 'Intelligent Systems', 2, 1, 2, 3, 'MATH 04, COSC 55, DCIT 50', 'first sem', NULL, '', NULL, '202211863'),
('COSC 110', 'Numerical and Symbolic Computation', 2, 1, 2, 3, 'DCIT 60', 'second sem', NULL, '', NULL, '202211863'),
('COSC 111', 'Internet of Things', 2, 1, 2, 3, 'COSC 60', 'first sem', NULL, '', NULL, '202211863'),
('COSC 200A', 'Undergraduate Thesis 1', 2, 1, 2, 3, '4th yr. Standing', 'first sem', NULL, '', NULL, '202211863'),
('COSC 200B', 'Undergraduate Thesis II', 3, NULL, 1, NULL, 'COSC 200A', 'second sem', NULL, '', NULL, '202211863'),
('GNED 07', 'The Contemporary World', 3, NULL, 3, NULL, NULL, 'second sem', NULL, '', NULL, '202211863'),
('GNED 10', 'Gender and Society', 3, NULL, 3, NULL, NULL, 'second sem', NULL, '', NULL, '202211863'),
('ITEC 80', 'Human Computer Interaction', 1, NULL, 3, NULL, 'ITEC 85', 'first sem', NULL, '', NULL, '202211863');

-- --------------------------------------------------------

--
-- Stand-in structure for view `fourthyear_firstsem`
-- (See below for the actual view)
--
CREATE TABLE `fourthyear_firstsem` (
`course_code` varchar(30)
,`course_title` varchar(70)
,`credit_unit_lec` int(11)
,`credit_unit_lab` int(11)
,`contact_hrs_lec` int(11)
,`contact_hrs_lab` int(11)
,`prerequisite` varchar(30)
,`semester` varchar(30)
,`year_taken` date
,`final_grade` varchar(30)
,`instructor` varchar(50)
,`student_number` varchar(60)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `fourthyear_secondsem`
-- (See below for the actual view)
--
CREATE TABLE `fourthyear_secondsem` (
`course_code` varchar(30)
,`course_title` varchar(70)
,`credit_unit_lec` int(11)
,`credit_unit_lab` int(11)
,`contact_hrs_lec` int(11)
,`contact_hrs_lab` int(11)
,`prerequisite` varchar(30)
,`semester` varchar(30)
,`year_taken` date
,`final_grade` varchar(30)
,`instructor` varchar(50)
,`student_number` varchar(60)
);

-- --------------------------------------------------------

--
-- Table structure for table `secondyear`
--

CREATE TABLE `secondyear` (
  `course_code` varchar(30) NOT NULL,
  `course_title` varchar(70) NOT NULL,
  `credit_unit_lec` int(11) NOT NULL,
  `credit_unit_lab` int(11) DEFAULT NULL,
  `contact_hrs_lec` int(11) DEFAULT NULL,
  `contact_hrs_lab` int(11) DEFAULT NULL,
  `prerequisite` varchar(30) DEFAULT NULL,
  `semester` varchar(30) NOT NULL,
  `year_taken` date DEFAULT NULL,
  `final_grade` varchar(30) DEFAULT NULL,
  `instructor` varchar(50) DEFAULT NULL,
  `student_number` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `secondyear`
--

INSERT INTO `secondyear` (`course_code`, `course_title`, `credit_unit_lec`, `credit_unit_lab`, `contact_hrs_lec`, `contact_hrs_lab`, `prerequisite`, `semester`, `year_taken`, `final_grade`, `instructor`, `student_number`) VALUES
('COSC 55', 'Discrete Structure II', 3, NULL, 3, NULL, 'COSC 50', 'first sem', NULL, '1.75', 'Mr. Manozo', '202211863'),
('COSC 65', 'Architecture and Organization', 2, 1, 2, 3, 'COSC 60', 'second sem', NULL, '', 'Mr. Rostrollo', '202211863'),
('COSC 70', 'Software Engineering I', 3, NULL, 3, NULL, 'DCIT 50 & 24', 'second sem', NULL, '', 'Mr. Moreno', '202211863'),
('COSCO 60', 'Digital Logic Design', 2, 1, 2, 3, 'COSC 50', 'first sem', NULL, '1.25', 'Mr. Nati', '202211863'),
('DCIT 24', 'Information Management', 2, 1, 2, 3, 'DCIT 23', 'first sem', NULL, '1.75', 'Mr. Decipulo', '202211863'),
('DCIT 25', 'Data Structures and Algorithms', 2, 1, 2, 3, 'DCIT 23', 'second sem', NULL, '', 'Mr. Tacata', '202211863'),
('DCIT 50', 'Object Oriented Programming', 2, 1, 2, 3, 'DCIT 23', 'first sem', NULL, '2.00', 'Mr. Belgica', '202211863'),
('DCIT 55', 'Advanced Database Management System', 2, 1, 2, 3, 'DCIT 24', 'second sem', NULL, '', 'Mr. Belgica', '202211863'),
('FITT 3', 'Physical Activities towards Health and Fitness 1', 2, NULL, 2, NULL, 'FITT 1', 'first sem', NULL, '1.75', 'Mr. Jamito', '202211863'),
('FITT 4', 'Physical Activities towards Health and Fitness 2', 2, NULL, 2, NULL, 'FITT 1', 'second sem', NULL, '', 'Mr. Gabionza', '202211863'),
('GNED 04', 'Mga Babasahin Hinggil Sa Kasaysayan ng Pilipinas', 3, NULL, 3, NULL, NULL, 'first sem', '0000-00-00', '1.75', 'Ms. Sambrano', '202211863'),
('GNED 08', 'Understanding the Self', 3, NULL, 3, NULL, NULL, 'second sem', NULL, '', 'Mr. Francisco', '202211863'),
('GNED 14', 'Panitikang Panlipunan', 3, NULL, 3, NULL, NULL, 'second sem', NULL, '', 'Mr. Jimenez', '202211863'),
('INSY 50', 'Fundamentals of Information Systems', 3, NULL, 3, NULL, 'DCIT 21', 'first sem', NULL, '1.75', 'Mr. Rosete', '202211863'),
('MATH 01', 'Analytic Geometry', 3, NULL, 3, NULL, 'GNED 03', 'first sem', NULL, '2.50', 'Ms. Castillo', '202211863'),
('MATH 02', 'Calculus', 3, NULL, 3, NULL, 'MATH 01', 'second sem', NULL, '', 'Mr. Castillo', '202211863');

-- --------------------------------------------------------

--
-- Stand-in structure for view `secondyear_firstsem`
-- (See below for the actual view)
--
CREATE TABLE `secondyear_firstsem` (
`course_code` varchar(30)
,`course_title` varchar(70)
,`credit_unit_lec` int(11)
,`credit_unit_lab` int(11)
,`contact_hrs_lec` int(11)
,`contact_hrs_lab` int(11)
,`prerequisite` varchar(30)
,`semester` varchar(30)
,`year_taken` date
,`final_grade` varchar(30)
,`instructor` varchar(50)
,`student_number` varchar(60)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `secondyear_secondsem`
-- (See below for the actual view)
--
CREATE TABLE `secondyear_secondsem` (
`course_code` varchar(30)
,`course_title` varchar(70)
,`credit_unit_lec` int(11)
,`credit_unit_lab` int(11)
,`contact_hrs_lec` int(11)
,`contact_hrs_lab` int(11)
,`prerequisite` varchar(30)
,`semester` varchar(30)
,`year_taken` date
,`final_grade` varchar(30)
,`instructor` varchar(50)
,`student_number` varchar(60)
);

-- --------------------------------------------------------

--
-- Table structure for table `thirdyear`
--

CREATE TABLE `thirdyear` (
  `course_code` varchar(30) NOT NULL,
  `course_title` varchar(70) NOT NULL,
  `credit_unit_lec` int(11) NOT NULL,
  `credit_unit_lab` int(11) DEFAULT NULL,
  `contact_hrs_lec` int(11) DEFAULT NULL,
  `contact_hrs_lab` int(11) DEFAULT NULL,
  `prerequisite` varchar(30) DEFAULT NULL,
  `semester` varchar(30) NOT NULL,
  `year_taken` date DEFAULT NULL,
  `final_grade` varchar(30) DEFAULT NULL,
  `instructor` varchar(50) DEFAULT NULL,
  `student_number` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `thirdyear`
--

INSERT INTO `thirdyear` (`course_code`, `course_title`, `credit_unit_lec`, `credit_unit_lab`, `contact_hrs_lec`, `contact_hrs_lab`, `prerequisite`, `semester`, `year_taken`, `final_grade`, `instructor`, `student_number`) VALUES
('COSC 101', 'Computer Graphics and Virtual Computing', 2, 1, 2, 3, 'DCIT 23', 'first sem', NULL, NULL, NULL, '202211863'),
('COSC 106', 'Introduction to Game Development', 2, 1, 2, 3, 'MATH 03 & COSC 101', 'second sem', NULL, NULL, NULL, '202211863'),
('COSC 199', 'Practicum', 3, NULL, 3, NULL, 'Incoming 4th yr.', 'mid year', NULL, NULL, NULL, '202211863'),
('COSC 75', 'Software Engineering II', 2, 1, 2, 3, 'COSC 70', 'first sem', NULL, NULL, NULL, '202211863'),
('COSC 80', 'Operating Systems', 2, 1, 2, 3, 'DCIT 25', 'first sem', NULL, NULL, NULL, '202211863'),
('COSC 85', 'Networks and Communication', 2, 1, 2, 3, 'ITEC 50', 'first sem', NULL, NULL, NULL, '202211863'),
('COSC 90', 'Design and Analysis of Algorithm', 3, NULL, 3, NULL, 'DCIT 25', 'second sem', NULL, NULL, NULL, '202211863'),
('COSC 95', 'Programming Languages', 3, NULL, 3, NULL, 'DCIT 25', 'second sem', NULL, NULL, NULL, '202211863'),
('DCIT 26', 'Application Development and Emerging Technologies', 2, 1, 2, 3, 'ITEC 50', 'first sem', NULL, NULL, NULL, '202211863'),
('DCIT 60', 'Method and Research', 3, NULL, 3, NULL, '3rd yr. Standing', 'second sem', NULL, NULL, NULL, '202211863'),
('DCIT 65', 'Social and Professional Issues', 3, NULL, 3, NULL, 'DCIT 21', 'first sem', NULL, NULL, NULL, '202211863'),
('GNED 09', 'Life and Works of Rizal', 3, NULL, 3, NULL, 'GNED 04', 'second sem', NULL, NULL, NULL, '202211863'),
('ITEC 85', 'Information Assurance and Security', 3, NULL, 3, NULL, 'DCIT 24', 'second sem', NULL, NULL, NULL, '202211863'),
('MATH 03', 'Linear Algebra', 3, NULL, 3, NULL, 'MATH 02', 'first sem', NULL, NULL, NULL, '202211863'),
('MATH 04', 'Experimental Statistics', 2, 1, 2, 3, 'MATH 02', 'second sem', NULL, NULL, NULL, '202211863');

-- --------------------------------------------------------

--
-- Stand-in structure for view `thirdyear_firstsem`
-- (See below for the actual view)
--
CREATE TABLE `thirdyear_firstsem` (
`course_code` varchar(30)
,`course_title` varchar(70)
,`credit_unit_lec` int(11)
,`credit_unit_lab` int(11)
,`contact_hrs_lec` int(11)
,`contact_hrs_lab` int(11)
,`prerequisite` varchar(30)
,`semester` varchar(30)
,`year_taken` date
,`final_grade` varchar(30)
,`instructor` varchar(50)
,`student_number` varchar(60)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `thirdyear_secondsem`
-- (See below for the actual view)
--
CREATE TABLE `thirdyear_secondsem` (
`course_code` varchar(30)
,`course_title` varchar(70)
,`credit_unit_lec` int(11)
,`credit_unit_lab` int(11)
,`contact_hrs_lec` int(11)
,`contact_hrs_lab` int(11)
,`prerequisite` varchar(30)
,`semester` varchar(30)
,`year_taken` date
,`final_grade` varchar(30)
,`instructor` varchar(50)
,`student_number` varchar(60)
);

-- --------------------------------------------------------

--
-- Table structure for table `users_student`
--

CREATE TABLE `users_student` (
  `student_number` varchar(60) NOT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `last_logout` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_student`
--

INSERT INTO `users_student` (`student_number`, `first_name`, `last_name`, `email`, `password`, `last_login`, `last_logout`) VALUES
('11111', 'dave', 'gang', 'dave.trampe@yahoo.com', '$2y$10$BYIVXu.At6fq5EGhKB0Qb.ZUpnPg9VbVyN54j5bfCo1MQi4hQh0lW', '2024-04-25 04:09:14', NULL),
('12345', '12345', '12345', 'dave.trampe@yahoo.com', '$2y$10$k7MvoMbf.glJ8TP5NQTIgO6jPCejc020JvfQhnIUGkiZ9Igj63q9S', '2024-04-26 13:50:50', NULL),
('202211863', 'dave', 'trampe', 'dave.trampe@yahoo.com', '$2y$10$vLDlRbGVcdSiqw96N5inGOmzyO3yX2be1PNQtmLIuPNzm0DdkUa.K', '2024-05-07 16:56:27', NULL);

-- --------------------------------------------------------

--
-- Structure for view `firstyear_first`
--
DROP TABLE IF EXISTS `firstyear_first`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `firstyear_first`  AS SELECT `firstyear`.`course_code` AS `course_code`, `firstyear`.`course_title` AS `course_title`, `firstyear`.`credit_unit_lec` AS `credit_unit_lec`, `firstyear`.`credit_unit_lab` AS `credit_unit_lab`, `firstyear`.`contact_hrs_lec` AS `contact_hrs_lec`, `firstyear`.`contact_hrs_lab` AS `contact_hrs_lab`, `firstyear`.`prerequisite` AS `prerequisite`, `firstyear`.`semester` AS `semester`, `firstyear`.`year_taken` AS `year_taken`, `firstyear`.`final_grade` AS `final_grade`, `firstyear`.`instructor` AS `instructor`, `firstyear`.`student_number` AS `student_number` FROM `firstyear` WHERE `firstyear`.`semester` = 'first sem\'first sem' ;

-- --------------------------------------------------------

--
-- Structure for view `firstyear_firstsem`
--
DROP TABLE IF EXISTS `firstyear_firstsem`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `firstyear_firstsem`  AS SELECT `firstyear`.`course_code` AS `course_code`, `firstyear`.`course_title` AS `course_title`, `firstyear`.`credit_unit_lec` AS `credit_unit_lec`, `firstyear`.`credit_unit_lab` AS `credit_unit_lab`, `firstyear`.`contact_hrs_lec` AS `contact_hrs_lec`, `firstyear`.`contact_hrs_lab` AS `contact_hrs_lab`, `firstyear`.`prerequisite` AS `prerequisite`, `firstyear`.`semester` AS `semester`, `firstyear`.`year_taken` AS `year_taken`, `firstyear`.`final_grade` AS `final_grade`, `firstyear`.`instructor` AS `instructor`, `firstyear`.`student_number` AS `student_number` FROM `firstyear` WHERE `firstyear`.`semester` = 'first sem' ;

-- --------------------------------------------------------

--
-- Structure for view `firstyear_secondsem`
--
DROP TABLE IF EXISTS `firstyear_secondsem`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `firstyear_secondsem`  AS SELECT `firstyear`.`course_code` AS `course_code`, `firstyear`.`course_title` AS `course_title`, `firstyear`.`credit_unit_lec` AS `credit_unit_lec`, `firstyear`.`credit_unit_lab` AS `credit_unit_lab`, `firstyear`.`contact_hrs_lec` AS `contact_hrs_lec`, `firstyear`.`contact_hrs_lab` AS `contact_hrs_lab`, `firstyear`.`prerequisite` AS `prerequisite`, `firstyear`.`semester` AS `semester`, `firstyear`.`year_taken` AS `year_taken`, `firstyear`.`final_grade` AS `final_grade`, `firstyear`.`instructor` AS `instructor`, `firstyear`.`student_number` AS `student_number` FROM `firstyear` WHERE `firstyear`.`semester` = 'second sem' ;

-- --------------------------------------------------------

--
-- Structure for view `fourthyear_firstsem`
--
DROP TABLE IF EXISTS `fourthyear_firstsem`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `fourthyear_firstsem`  AS SELECT `fourthyear`.`course_code` AS `course_code`, `fourthyear`.`course_title` AS `course_title`, `fourthyear`.`credit_unit_lec` AS `credit_unit_lec`, `fourthyear`.`credit_unit_lab` AS `credit_unit_lab`, `fourthyear`.`contact_hrs_lec` AS `contact_hrs_lec`, `fourthyear`.`contact_hrs_lab` AS `contact_hrs_lab`, `fourthyear`.`prerequisite` AS `prerequisite`, `fourthyear`.`semester` AS `semester`, `fourthyear`.`year_taken` AS `year_taken`, `fourthyear`.`final_grade` AS `final_grade`, `fourthyear`.`instructor` AS `instructor`, `fourthyear`.`student_number` AS `student_number` FROM `fourthyear` WHERE `fourthyear`.`semester` = 'first sem' ;

-- --------------------------------------------------------

--
-- Structure for view `fourthyear_secondsem`
--
DROP TABLE IF EXISTS `fourthyear_secondsem`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `fourthyear_secondsem`  AS SELECT `fourthyear`.`course_code` AS `course_code`, `fourthyear`.`course_title` AS `course_title`, `fourthyear`.`credit_unit_lec` AS `credit_unit_lec`, `fourthyear`.`credit_unit_lab` AS `credit_unit_lab`, `fourthyear`.`contact_hrs_lec` AS `contact_hrs_lec`, `fourthyear`.`contact_hrs_lab` AS `contact_hrs_lab`, `fourthyear`.`prerequisite` AS `prerequisite`, `fourthyear`.`semester` AS `semester`, `fourthyear`.`year_taken` AS `year_taken`, `fourthyear`.`final_grade` AS `final_grade`, `fourthyear`.`instructor` AS `instructor`, `fourthyear`.`student_number` AS `student_number` FROM `fourthyear` WHERE `fourthyear`.`semester` = 'second sem' ;

-- --------------------------------------------------------

--
-- Structure for view `secondyear_firstsem`
--
DROP TABLE IF EXISTS `secondyear_firstsem`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `secondyear_firstsem`  AS SELECT `secondyear`.`course_code` AS `course_code`, `secondyear`.`course_title` AS `course_title`, `secondyear`.`credit_unit_lec` AS `credit_unit_lec`, `secondyear`.`credit_unit_lab` AS `credit_unit_lab`, `secondyear`.`contact_hrs_lec` AS `contact_hrs_lec`, `secondyear`.`contact_hrs_lab` AS `contact_hrs_lab`, `secondyear`.`prerequisite` AS `prerequisite`, `secondyear`.`semester` AS `semester`, `secondyear`.`year_taken` AS `year_taken`, `secondyear`.`final_grade` AS `final_grade`, `secondyear`.`instructor` AS `instructor`, `secondyear`.`student_number` AS `student_number` FROM `secondyear` WHERE `secondyear`.`semester` = 'first sem' ;

-- --------------------------------------------------------

--
-- Structure for view `secondyear_secondsem`
--
DROP TABLE IF EXISTS `secondyear_secondsem`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `secondyear_secondsem`  AS SELECT `secondyear`.`course_code` AS `course_code`, `secondyear`.`course_title` AS `course_title`, `secondyear`.`credit_unit_lec` AS `credit_unit_lec`, `secondyear`.`credit_unit_lab` AS `credit_unit_lab`, `secondyear`.`contact_hrs_lec` AS `contact_hrs_lec`, `secondyear`.`contact_hrs_lab` AS `contact_hrs_lab`, `secondyear`.`prerequisite` AS `prerequisite`, `secondyear`.`semester` AS `semester`, `secondyear`.`year_taken` AS `year_taken`, `secondyear`.`final_grade` AS `final_grade`, `secondyear`.`instructor` AS `instructor`, `secondyear`.`student_number` AS `student_number` FROM `secondyear` WHERE `secondyear`.`semester` = 'second sem' ;

-- --------------------------------------------------------

--
-- Structure for view `thirdyear_firstsem`
--
DROP TABLE IF EXISTS `thirdyear_firstsem`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `thirdyear_firstsem`  AS SELECT `thirdyear`.`course_code` AS `course_code`, `thirdyear`.`course_title` AS `course_title`, `thirdyear`.`credit_unit_lec` AS `credit_unit_lec`, `thirdyear`.`credit_unit_lab` AS `credit_unit_lab`, `thirdyear`.`contact_hrs_lec` AS `contact_hrs_lec`, `thirdyear`.`contact_hrs_lab` AS `contact_hrs_lab`, `thirdyear`.`prerequisite` AS `prerequisite`, `thirdyear`.`semester` AS `semester`, `thirdyear`.`year_taken` AS `year_taken`, `thirdyear`.`final_grade` AS `final_grade`, `thirdyear`.`instructor` AS `instructor`, `thirdyear`.`student_number` AS `student_number` FROM `thirdyear` WHERE `thirdyear`.`semester` = 'first sem' ;

-- --------------------------------------------------------

--
-- Structure for view `thirdyear_secondsem`
--
DROP TABLE IF EXISTS `thirdyear_secondsem`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `thirdyear_secondsem`  AS SELECT `thirdyear`.`course_code` AS `course_code`, `thirdyear`.`course_title` AS `course_title`, `thirdyear`.`credit_unit_lec` AS `credit_unit_lec`, `thirdyear`.`credit_unit_lab` AS `credit_unit_lab`, `thirdyear`.`contact_hrs_lec` AS `contact_hrs_lec`, `thirdyear`.`contact_hrs_lab` AS `contact_hrs_lab`, `thirdyear`.`prerequisite` AS `prerequisite`, `thirdyear`.`semester` AS `semester`, `thirdyear`.`year_taken` AS `year_taken`, `thirdyear`.`final_grade` AS `final_grade`, `thirdyear`.`instructor` AS `instructor`, `thirdyear`.`student_number` AS `student_number` FROM `thirdyear` WHERE `thirdyear`.`semester` = 'second sem' ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `firstyear`
--
ALTER TABLE `firstyear`
  ADD PRIMARY KEY (`course_code`),
  ADD KEY `fk_student_number` (`student_number`);

--
-- Indexes for table `fourthyear`
--
ALTER TABLE `fourthyear`
  ADD PRIMARY KEY (`course_code`),
  ADD KEY `fk_student3_number` (`student_number`);

--
-- Indexes for table `secondyear`
--
ALTER TABLE `secondyear`
  ADD PRIMARY KEY (`course_code`),
  ADD KEY `fk_student1_number` (`student_number`);

--
-- Indexes for table `thirdyear`
--
ALTER TABLE `thirdyear`
  ADD PRIMARY KEY (`course_code`),
  ADD KEY `fk_student2_number` (`student_number`);

--
-- Indexes for table `users_student`
--
ALTER TABLE `users_student`
  ADD PRIMARY KEY (`student_number`),
  ADD UNIQUE KEY `uc_student_number` (`student_number`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `firstyear`
--
ALTER TABLE `firstyear`
  ADD CONSTRAINT `fk_student_number` FOREIGN KEY (`student_number`) REFERENCES `users_student` (`student_number`);

--
-- Constraints for table `fourthyear`
--
ALTER TABLE `fourthyear`
  ADD CONSTRAINT `fk_student3_number` FOREIGN KEY (`student_number`) REFERENCES `users_student` (`student_number`);

--
-- Constraints for table `secondyear`
--
ALTER TABLE `secondyear`
  ADD CONSTRAINT `fk_student1_number` FOREIGN KEY (`student_number`) REFERENCES `users_student` (`student_number`);

--
-- Constraints for table `thirdyear`
--
ALTER TABLE `thirdyear`
  ADD CONSTRAINT `fk_student2_number` FOREIGN KEY (`student_number`) REFERENCES `users_student` (`student_number`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
