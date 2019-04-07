-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2019 at 07:38 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.2.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hackercode`
--

-- --------------------------------------------------------

--
-- Table structure for table `hc_programs`
--

CREATE TABLE `hc_programs` (
  `p_id` int(11) NOT NULL,
  `p_name` varchar(255) NOT NULL,
  `p_code` varchar(255) DEFAULT NULL,
  `p_student_count` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hc_questions`
--

CREATE TABLE `hc_questions` (
  `q_id` int(11) NOT NULL,
  `q_test_id` int(11) NOT NULL,
  `q_set_id` varchar(11) NOT NULL,
  `q_tag` varchar(100) NOT NULL,
  `q_type` enum('TEXT','IMAGE','HYBRID') NOT NULL DEFAULT 'TEXT',
  `q_content` longtext NOT NULL,
  `q_max_marks` int(11) NOT NULL DEFAULT '0',
  `q_negative_marks` int(11) NOT NULL DEFAULT '0',
  `q_options` text NOT NULL,
  `q_ans` varchar(500) NOT NULL,
  `q_scope` enum('PUBLIC','PRIVATE','DEMO','PRACTICE') DEFAULT 'PUBLIC'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hc_questions`
--

INSERT INTO `hc_questions` (`q_id`, `q_test_id`, `q_set_id`, `q_tag`, `q_type`, `q_content`, `q_max_marks`, `q_negative_marks`, `q_options`, `q_ans`, `q_scope`) VALUES
(1, 3, 'SET-1', 'APPTITUDE', 'TEXT', 'if A+B = 4 and B = 7 then A=?', 5, 1, '1,2,3,4', '3', 'PUBLIC'),
(2, 3, 'SET-2', 'APPTITUDE', 'TEXT', 'Excluding stoppages, the speed of a bus is 54 kmph and including stoppages, it is 45 kmph. For how many minutes does the bus stop per hour?\"', 5, 1, '9,10,12,20', '10', 'PUBLIC'),
(3, 3, 'SET-1', 'LOGIC', 'TEXT', 'The average speed of a train in the onward journey is 25% more than that in the return journey. The train halts for one hour on reaching the destination. The total time taken for the complete to and from journey is 17 hours, covering a distance of 800 km. The speed of the train in the onward journey is:', 4, 1, '2,56,7,2', '56', 'PUBLIC'),
(4, 3, 'SET-2', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC'),
(5, 3, 'SET-3', 'REASONING', 'TEXT', 'Three persons are walking from a place A to another place B. Their speeds are in the ratio of 4 : 3 : 5. The time ratio to reach B by these persons will be :', 5, 2, '23,44,22,67,32', '44', 'PUBLIC'),
(6, 4, 'SET-1', 'APPTITUDE', 'TEXT', 'if A+B = 4 and B = 7 then A=?', 5, 1, '1,2,3,4', '3', 'PUBLIC'),
(7, 4, 'SET-2', 'APPTITUDE', 'TEXT', 'Excluding stoppages, the speed of a bus is 54 kmph and including stoppages, it is 45 kmph. For how many minutes does the bus stop per hour?\"', 5, 1, '9,10,12,20', '10', 'PUBLIC'),
(8, 4, 'SET-1', 'LOGIC', 'TEXT', 'The average speed of a train in the onward journey is 25% more than that in the return journey. The train halts for one hour on reaching the destination. The total time taken for the complete to and from journey is 17 hours, covering a distance of 800 km. The speed of the train in the onward journey is:', 4, 1, '2,56,7,2', '56', 'PUBLIC'),
(9, 4, 'SET-2', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC'),
(10, 4, 'SET-3', 'REASONING', 'TEXT', 'Three persons are walking from a place A to another place B. Their speeds are in the ratio of 4 : 3 : 5. The time ratio to reach B by these persons will be :', 5, 2, '23,44,22,67,32', '44', 'PUBLIC'),
(11, 5, 'SET-1', 'APPTITUDE', 'TEXT', 'if A+B = 4 and B = 7 then A=?', 5, 1, '1,2,3,4', '3', 'PUBLIC'),
(12, 5, 'SET-2', 'APPTITUDE', 'TEXT', 'Excluding stoppages, the speed of a bus is 54 kmph and including stoppages, it is 45 kmph. For how many minutes does the bus stop per hour?\"', 5, 1, '9,10,12,20', '10', 'PUBLIC'),
(13, 5, 'SET-1', 'LOGIC', 'TEXT', 'The average speed of a train in the onward journey is 25% more than that in the return journey. The train halts for one hour on reaching the destination. The total time taken for the complete to and from journey is 17 hours, covering a distance of 800 km. The speed of the train in the onward journey is:', 4, 1, '2,56,7,2', '56', 'PUBLIC'),
(14, 5, 'SET-2', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC'),
(15, 5, 'SET-3', 'REASONING', 'TEXT', 'Three persons are walking from a place A to another place B. Their speeds are in the ratio of 4 : 3 : 5. The time ratio to reach B by these persons will be :', 5, 2, '23,44,22,67,32', '44', 'PUBLIC'),
(16, 6, 'SET-1', 'APPTITUDE', 'TEXT', 'if A+B = 4 and B = 7 then A=?', 5, 1, '1,2,3,4', '3', 'PUBLIC'),
(17, 6, 'SET-2', 'APPTITUDE', 'TEXT', 'Excluding stoppages, the speed of a bus is 54 kmph and including stoppages, it is 45 kmph. For how many minutes does the bus stop per hour?\"', 5, 1, '9,10,12,20', '10', 'PUBLIC'),
(18, 6, 'SET-1', 'LOGIC', 'TEXT', 'The average speed of a train in the onward journey is 25% more than that in the return journey. The train halts for one hour on reaching the destination. The total time taken for the complete to and from journey is 17 hours, covering a distance of 800 km. The speed of the train in the onward journey is:', 4, 1, '2,56,7,2', '56', 'PUBLIC'),
(19, 6, 'SET-2', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC'),
(20, 6, 'SET-3', 'REASONING', 'TEXT', 'Three persons are walking from a place A to another place B. Their speeds are in the ratio of 4 : 3 : 5. The time ratio to reach B by these persons will be :', 5, 2, '23,44,22,67,32', '44', 'PUBLIC'),
(21, 7, 'SET-1', 'APPTITUDE', 'TEXT', 'if A+B = 4 and B = 7 then A=?', 5, 1, '1,2,3,4', '3', 'PUBLIC'),
(22, 7, 'SET-2', 'APPTITUDE', 'TEXT', 'Excluding stoppages, the speed of a bus is 54 kmph and including stoppages, it is 45 kmph. For how many minutes does the bus stop per hour?\"', 5, 1, '9,10,12,20', '10', 'PUBLIC'),
(23, 7, 'SET-1', 'LOGIC', 'TEXT', 'The average speed of a train in the onward journey is 25% more than that in the return journey. The train halts for one hour on reaching the destination. The total time taken for the complete to and from journey is 17 hours, covering a distance of 800 km. The speed of the train in the onward journey is:', 4, 1, '2,56,7,2', '56', 'PUBLIC'),
(24, 7, 'SET-2', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC'),
(25, 7, 'SET-3', 'REASONING', 'TEXT', 'Three persons are walking from a place A to another place B. Their speeds are in the ratio of 4 : 3 : 5. The time ratio to reach B by these persons will be :', 5, 2, '23,44,22,67,32', '44', 'PUBLIC'),
(26, 9, 'SET-1', 'APPTITUDE', 'TEXT', 'if A+B = 4 and B = 7 then A=?', 5, 1, '1,2,3,4', '3', 'PUBLIC'),
(27, 9, 'SET-2', 'APPTITUDE', 'TEXT', 'Excluding stoppages, the speed of a bus is 54 kmph and including stoppages, it is 45 kmph. For how many minutes does the bus stop per hour?\"', 5, 1, '9,10,12,20', '10', 'PUBLIC'),
(28, 9, 'SET-1', 'LOGIC', 'TEXT', 'The average speed of a train in the onward journey is 25% more than that in the return journey. The train halts for one hour on reaching the destination. The total time taken for the complete to and from journey is 17 hours, covering a distance of 800 km. The speed of the train in the onward journey is:', 4, 1, '2,56,7,2', '56', 'PUBLIC'),
(29, 9, 'SET-2', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC'),
(30, 9, 'SET-3', 'REASONING', 'TEXT', 'Three persons are walking from a place A to another place B. Their speeds are in the ratio of 4 : 3 : 5. The time ratio to reach B by these persons will be :', 5, 2, '23,44,22,67,32', '44', 'PUBLIC'),
(31, 10, 'SET-1', 'APPTITUDE', 'TEXT', 'if A+B = 4 and B = 7 then A=?', 5, 1, '1,2,3,4', '3', 'PUBLIC'),
(32, 10, 'SET-2', 'APPTITUDE', 'TEXT', 'Excluding stoppages, the speed of a bus is 54 kmph and including stoppages, it is 45 kmph. For how many minutes does the bus stop per hour?\"', 5, 1, '9,10,12,20', '10', 'PUBLIC'),
(33, 10, 'SET-1', 'LOGIC', 'TEXT', 'The average speed of a train in the onward journey is 25% more than that in the return journey. The train halts for one hour on reaching the destination. The total time taken for the complete to and from journey is 17 hours, covering a distance of 800 km. The speed of the train in the onward journey is:', 4, 1, '2,56,7,2', '56', 'PUBLIC'),
(34, 10, 'SET-2', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC'),
(35, 10, 'SET-3', 'REASONING', 'TEXT', 'Three persons are walking from a place A to another place B. Their speeds are in the ratio of 4 : 3 : 5. The time ratio to reach B by these persons will be :', 5, 2, '23,44,22,67,32', '44', 'PUBLIC'),
(36, 12, 'SET-1', 'APPTITUDE', 'TEXT', 'if A+B = 4 and B = 7 then A=?', 5, 1, '1,2,3,4', '3', 'PUBLIC'),
(37, 12, 'SET-2', 'APPTITUDE', 'TEXT', 'Excluding stoppages, the speed of a bus is 54 kmph and including stoppages, it is 45 kmph. For how many minutes does the bus stop per hour?\"', 5, 1, '9,10,12,20', '10', 'PUBLIC'),
(38, 12, 'SET-1', 'LOGIC', 'TEXT', 'The average speed of a train in the onward journey is 25% more than that in the return journey. The train halts for one hour on reaching the destination. The total time taken for the complete to and from journey is 17 hours, covering a distance of 800 km. The speed of the train in the onward journey is:', 4, 1, '2,56,7,2', '56', 'PUBLIC'),
(39, 12, 'SET-2', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC'),
(40, 12, 'SET-3', 'REASONING', 'TEXT', 'Three persons are walking from a place A to another place B. Their speeds are in the ratio of 4 : 3 : 5. The time ratio to reach B by these persons will be :', 5, 2, '23,44,22,67,32', '44', 'PUBLIC'),
(41, 13, 'SET-1', 'APPTITUDE', 'TEXT', 'if A+B = 4 and B = 7 then A=?', 5, 1, '1,2,3,4', '3', 'PUBLIC'),
(42, 13, 'SET-2', 'APPTITUDE', 'TEXT', 'Excluding stoppages, the speed of a bus is 54 kmph and including stoppages, it is 45 kmph. For how many minutes does the bus stop per hour?\"', 5, 1, '9,10,12,20', '10', 'PUBLIC'),
(43, 13, 'SET-1', 'LOGIC', 'TEXT', 'The average speed of a train in the onward journey is 25% more than that in the return journey. The train halts for one hour on reaching the destination. The total time taken for the complete to and from journey is 17 hours, covering a distance of 800 km. The speed of the train in the onward journey is:', 4, 1, '2,56,7,2', '56', 'PUBLIC'),
(44, 13, 'SET-2', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC'),
(45, 13, 'SET-3', 'REASONING', 'TEXT', 'Three persons are walking from a place A to another place B. Their speeds are in the ratio of 4 : 3 : 5. The time ratio to reach B by these persons will be :', 5, 2, '23,44,22,67,32', '44', 'PUBLIC'),
(46, 14, 'SET-1', 'APPTITUDE', 'TEXT', 'if A+B = 4 and B = 7 then A=?', 5, 1, '1,2,3,4', '3', 'PUBLIC'),
(47, 14, 'SET-2', 'APPTITUDE', 'TEXT', 'Excluding stoppages, the speed of a bus is 54 kmph and including stoppages, it is 45 kmph. For how many minutes does the bus stop per hour?\"', 5, 1, '9,10,12,20', '10', 'PUBLIC'),
(48, 14, 'SET-1', 'LOGIC', 'TEXT', 'The average speed of a train in the onward journey is 25% more than that in the return journey. The train halts for one hour on reaching the destination. The total time taken for the complete to and from journey is 17 hours, covering a distance of 800 km. The speed of the train in the onward journey is:', 4, 1, '2,56,7,2', '56', 'PUBLIC'),
(49, 14, 'SET-2', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC'),
(50, 14, 'SET-3', 'REASONING', 'TEXT', 'Three persons are walking from a place A to another place B. Their speeds are in the ratio of 4 : 3 : 5. The time ratio to reach B by these persons will be :', 5, 2, '23,44,22,67,32', '44', 'PUBLIC'),
(51, 15, 'SET-1', 'APPTITUDE', 'TEXT', 'if A+B = 4 and B = 7 then A=?', 5, 1, '1,2,3,4', '3', 'PUBLIC'),
(52, 15, 'SET-2', 'APPTITUDE', 'TEXT', 'Excluding stoppages, the speed of a bus is 54 kmph and including stoppages, it is 45 kmph. For how many minutes does the bus stop per hour?\"', 5, 1, '9,10,12,20', '10', 'PUBLIC'),
(53, 15, 'SET-1', 'LOGIC', 'TEXT', 'The average speed of a train in the onward journey is 25% more than that in the return journey. The train halts for one hour on reaching the destination. The total time taken for the complete to and from journey is 17 hours, covering a distance of 800 km. The speed of the train in the onward journey is:', 4, 1, '2,56,7,2', '56', 'PUBLIC'),
(54, 15, 'SET-2', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC'),
(55, 15, 'SET-3', 'REASONING', 'TEXT', 'Three persons are walking from a place A to another place B. Their speeds are in the ratio of 4 : 3 : 5. The time ratio to reach B by these persons will be :', 5, 2, '23,44,22,67,32', '44', 'PUBLIC'),
(56, 16, 'SET-1', 'APPTITUDE', 'TEXT', 'if A+B = 4 and B = 7 then A=?', 5, 1, '1,2,3,4', '3', 'PUBLIC'),
(57, 16, 'SET-2', 'APPTITUDE', 'TEXT', 'Excluding stoppages, the speed of a bus is 54 kmph and including stoppages, it is 45 kmph. For how many minutes does the bus stop per hour?\"', 5, 1, '9,10,12,20', '10', 'PUBLIC'),
(58, 16, 'SET-1', 'LOGIC', 'TEXT', 'The average speed of a train in the onward journey is 25% more than that in the return journey. The train halts for one hour on reaching the destination. The total time taken for the complete to and from journey is 17 hours, covering a distance of 800 km. The speed of the train in the onward journey is:', 4, 1, '2,56,7,2', '56', 'PUBLIC'),
(59, 16, 'SET-2', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC'),
(60, 16, 'SET-3', 'REASONING', 'TEXT', 'Three persons are walking from a place A to another place B. Their speeds are in the ratio of 4 : 3 : 5. The time ratio to reach B by these persons will be :', 5, 2, '23,44,22,67,32', '44', 'PUBLIC'),
(61, 18, 'SET-1', 'APPTITUDE', 'TEXT', 'if A+B = 4 and B = 7 then A=?', 5, 1, '1,2,3,4', '3', 'PUBLIC'),
(62, 18, 'SET-2', 'APPTITUDE', 'TEXT', 'Excluding stoppages, the speed of a bus is 54 kmph and including stoppages, it is 45 kmph. For how many minutes does the bus stop per hour?\"', 5, 1, '9,10,12,20', '10', 'PUBLIC'),
(63, 18, 'SET-1', 'LOGIC', 'TEXT', 'The average speed of a train in the onward journey is 25% more than that in the return journey. The train halts for one hour on reaching the destination. The total time taken for the complete to and from journey is 17 hours, covering a distance of 800 km. The speed of the train in the onward journey is:', 4, 1, '2,56,7,2', '56', 'PUBLIC'),
(64, 18, 'SET-2', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC'),
(65, 18, 'SET-3', 'REASONING', 'TEXT', 'Three persons are walking from a place A to another place B. Their speeds are in the ratio of 4 : 3 : 5. The time ratio to reach B by these persons will be :', 5, 2, '23,44,22,67,32', '44', 'PUBLIC'),
(66, 19, 'SET-1', 'APPTITUDE', 'TEXT', 'if A+B = 4 and B = 7 then A=?', 5, 1, '1,2,3,4', '3', 'PUBLIC'),
(67, 19, 'SET-2', 'APPTITUDE', 'TEXT', 'Excluding stoppages, the speed of a bus is 54 kmph and including stoppages, it is 45 kmph. For how many minutes does the bus stop per hour?\"', 5, 1, '9,10,12,20', '10', 'PUBLIC'),
(68, 19, 'SET-1', 'LOGIC', 'TEXT', 'The average speed of a train in the onward journey is 25% more than that in the return journey. The train halts for one hour on reaching the destination. The total time taken for the complete to and from journey is 17 hours, covering a distance of 800 km. The speed of the train in the onward journey is:', 4, 1, '2,56,7,2', '56', 'PUBLIC'),
(69, 19, 'SET-2', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC'),
(70, 19, 'SET-3', 'REASONING', 'TEXT', 'Three persons are walking from a place A to another place B. Their speeds are in the ratio of 4 : 3 : 5. The time ratio to reach B by these persons will be :', 5, 2, '23,44,22,67,32', '44', 'PUBLIC'),
(71, 21, 'SET-1', 'APPTITUDE', 'TEXT', 'if A+B = 4 and B = 7 then A=?', 5, 1, '1,2,3,4', '3', 'PUBLIC'),
(72, 21, 'SET-2', 'APPTITUDE', 'TEXT', 'Excluding stoppages, the speed of a bus is 54 kmph and including stoppages, it is 45 kmph. For how many minutes does the bus stop per hour?\"', 5, 1, '9,10,12,20', '10', 'PUBLIC'),
(73, 21, 'SET-1', 'LOGIC', 'TEXT', 'The average speed of a train in the onward journey is 25% more than that in the return journey. The train halts for one hour on reaching the destination. The total time taken for the complete to and from journey is 17 hours, covering a distance of 800 km. The speed of the train in the onward journey is:', 4, 1, '2,56,7,2', '56', 'PUBLIC'),
(74, 21, 'SET-2', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC'),
(75, 21, 'SET-3', 'REASONING', 'TEXT', 'Three persons are walking from a place A to another place B. Their speeds are in the ratio of 4 : 3 : 5. The time ratio to reach B by these persons will be :', 5, 2, '23,44,22,67,32', '44', 'PUBLIC'),
(76, 22, 'SET-1', 'APPTITUDE', 'TEXT', 'if A+B = 4 and B = 7 then A=?', 5, 1, '1,2,3,4', '3', 'PUBLIC'),
(77, 22, 'SET-2', 'APPTITUDE', 'TEXT', 'Excluding stoppages, the speed of a bus is 54 kmph and including stoppages, it is 45 kmph. For how many minutes does the bus stop per hour?\"', 5, 1, '9,10,12,20', '10', 'PUBLIC'),
(78, 22, 'SET-1', 'LOGIC', 'TEXT', 'The average speed of a train in the onward journey is 25% more than that in the return journey. The train halts for one hour on reaching the destination. The total time taken for the complete to and from journey is 17 hours, covering a distance of 800 km. The speed of the train in the onward journey is:', 4, 1, '2,56,7,2', '56', 'PUBLIC'),
(79, 22, 'SET-2', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC'),
(80, 22, 'SET-3', 'REASONING', 'TEXT', 'Three persons are walking from a place A to another place B. Their speeds are in the ratio of 4 : 3 : 5. The time ratio to reach B by these persons will be :', 5, 2, '23,44,22,67,32', '44', 'PUBLIC'),
(81, 23, 'SET-1', 'APPTITUDE', 'TEXT', 'if A+B = 4 and B = 7 then A=?', 5, 1, '1,2,3,4', '3', 'PUBLIC'),
(82, 23, 'SET-2', 'APPTITUDE', 'TEXT', 'Excluding stoppages, the speed of a bus is 54 kmph and including stoppages, it is 45 kmph. For how many minutes does the bus stop per hour?\"', 5, 1, '9,10,12,20', '10', 'PUBLIC'),
(83, 23, 'SET-1', 'LOGIC', 'TEXT', 'The average speed of a train in the onward journey is 25% more than that in the return journey. The train halts for one hour on reaching the destination. The total time taken for the complete to and from journey is 17 hours, covering a distance of 800 km. The speed of the train in the onward journey is:', 4, 1, '2,56,7,2', '56', 'PUBLIC'),
(84, 23, 'SET-2', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC'),
(85, 23, 'SET-3', 'REASONING', 'TEXT', 'Three persons are walking from a place A to another place B. Their speeds are in the ratio of 4 : 3 : 5. The time ratio to reach B by these persons will be :', 5, 2, '23,44,22,67,32', '44', 'PUBLIC'),
(86, 24, 'SET-1', 'APPTITUDE', 'TEXT', 'if A+B = 4 and B = 7 then A=?', 5, 1, '1,2,3,4', '3', 'PUBLIC'),
(87, 24, 'SET-2', 'APPTITUDE', 'TEXT', 'Excluding stoppages, the speed of a bus is 54 kmph and including stoppages, it is 45 kmph. For how many minutes does the bus stop per hour?\"', 5, 1, '9,10,12,20', '10', 'PUBLIC'),
(88, 24, 'SET-1', 'LOGIC', 'TEXT', 'The average speed of a train in the onward journey is 25% more than that in the return journey. The train halts for one hour on reaching the destination. The total time taken for the complete to and from journey is 17 hours, covering a distance of 800 km. The speed of the train in the onward journey is:', 4, 1, '2,56,7,2', '56', 'PUBLIC'),
(89, 24, 'SET-2', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC'),
(90, 24, 'SET-3', 'REASONING', 'TEXT', 'Three persons are walking from a place A to another place B. Their speeds are in the ratio of 4 : 3 : 5. The time ratio to reach B by these persons will be :', 5, 2, '23,44,22,67,32', '44', 'PUBLIC'),
(91, 27, 'SET-1', 'APPTITUDE', 'TEXT', 'if A+B = 4 and B = 7 then A=?', 5, 1, '1,2,3,4', '3', 'PUBLIC'),
(92, 27, 'SET-2', 'APPTITUDE', 'TEXT', 'Excluding stoppages, the speed of a bus is 54 kmph and including stoppages, it is 45 kmph. For how many minutes does the bus stop per hour?\"', 5, 1, '9,10,12,20', '10', 'PUBLIC'),
(93, 27, 'SET-1', 'LOGIC', 'TEXT', 'The average speed of a train in the onward journey is 25% more than that in the return journey. The train halts for one hour on reaching the destination. The total time taken for the complete to and from journey is 17 hours, covering a distance of 800 km. The speed of the train in the onward journey is:', 4, 1, '2,56,7,2', '56', 'PUBLIC'),
(94, 27, 'SET-2', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC'),
(95, 27, 'SET-3', 'REASONING', 'TEXT', 'Three persons are walking from a place A to another place B. Their speeds are in the ratio of 4 : 3 : 5. The time ratio to reach B by these persons will be :', 5, 2, '23,44,22,67,32', '44', 'PUBLIC'),
(96, 28, 'SET-1', 'APPTITUDE', 'TEXT', 'if A+B = 4 and B = 7 then A=?', 5, 1, '1,2,3,4', '3', 'PUBLIC'),
(97, 28, 'SET-2', 'APPTITUDE', 'TEXT', 'Excluding stoppages, the speed of a bus is 54 kmph and including stoppages, it is 45 kmph. For how many minutes does the bus stop per hour?\"', 5, 1, '9,10,12,20', '10', 'PUBLIC'),
(98, 28, 'SET-1', 'LOGIC', 'TEXT', 'The average speed of a train in the onward journey is 25% more than that in the return journey. The train halts for one hour on reaching the destination. The total time taken for the complete to and from journey is 17 hours, covering a distance of 800 km. The speed of the train in the onward journey is:', 4, 1, '2,56,7,2', '56', 'PUBLIC'),
(99, 28, 'SET-2', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC'),
(100, 28, 'SET-1', 'LOGIC', 'TEXT', 'The average speed of a train in the onward journey is 25% more than that in the return journey. The train halts for one hour on reaching the destination. The total time taken for the complete to and from journey is 17 hours, covering a distance of 800 km. The speed of the train in the onward journey is:', 4, 1, '2,56,7,2', '56', 'PUBLIC'),
(101, 28, 'SET-1', 'LOGIC', 'TEXT', 'The average speed of a train in the onward journey is 25% more than that in the return journey. The train halts for one hour on reaching the destination. The total time taken for the complete to and from journey is 17 hours, covering a distance of 800 km. The speed of the train in the onward journey is:', 4, 1, '2,56,7,2', '56', 'PUBLIC'),
(102, 28, 'SET-2', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC'),
(103, 28, 'SET-3', 'REASONING', 'TEXT', 'Three persons are walking from a place A to another place B. Their speeds are in the ratio of 4 : 3 : 5. The time ratio to reach B by these persons will be :', 5, 2, '23,44,22,67,32', '44', 'PUBLIC'),
(104, 28, 'SET-3', 'REASONING', 'TEXT', 'Three persons are walking from a place A to another place B. Their speeds are in the ratio of 4 : 3 : 5. The time ratio to reach B by these persons will be :', 5, 2, '23,44,22,67,32', '44', 'PUBLIC'),
(105, 28, 'SET-3', 'REASONING', 'TEXT', 'Three persons are walking from a place A to another place B. Their speeds are in the ratio of 4 : 3 : 5. The time ratio to reach B by these persons will be :', 5, 2, '23,44,22,67,32', '44', 'PUBLIC'),
(106, 28, 'SET-2', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC'),
(107, 28, 'SET-2', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC'),
(108, 29, 'SET-1', 'APPTITUDE', 'TEXT', 'if A+B = 4 and B = 7 then A=?', 5, 1, '1,2,3,4', '3', 'PUBLIC'),
(109, 29, 'SET-2', 'APPTITUDE', 'TEXT', 'Excluding stoppages, the speed of a bus is 54 kmph and including stoppages, it is 45 kmph. For how many minutes does the bus stop per hour?\"', 5, 1, '9,10,12,20', '10', 'PUBLIC'),
(110, 29, 'SET-1', 'LOGIC', 'TEXT', 'The average speed of a train in the onward journey is 25% more than that in the return journey. The train halts for one hour on reaching the destination. The total time taken for the complete to and from journey is 17 hours, covering a distance of 800 km. The speed of the train in the onward journey is:', 4, 1, '2,56,7,2', '56', 'PUBLIC'),
(111, 29, 'SET-2', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC'),
(112, 29, 'SET-1', 'LOGIC', 'TEXT', 'The average speed of a train in the onward journey is 25% more than that in the return journey. The train halts for one hour on reaching the destination. The total time taken for the complete to and from journey is 17 hours, covering a distance of 800 km. The speed of the train in the onward journey is:', 4, 1, '2,56,7,2', '56', 'PUBLIC'),
(113, 29, 'SET-1', 'LOGIC', 'TEXT', 'The average speed of a train in the onward journey is 25% more than that in the return journey. The train halts for one hour on reaching the destination. The total time taken for the complete to and from journey is 17 hours, covering a distance of 800 km. The speed of the train in the onward journey is:', 4, 1, '2,56,7,2', '56', 'PUBLIC'),
(114, 29, 'SET-2', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC'),
(115, 29, 'SET-3', 'REASONING', 'TEXT', 'Three persons are walking from a place A to another place B. Their speeds are in the ratio of 4 : 3 : 5. The time ratio to reach B by these persons will be :', 5, 2, '23,44,22,67,32', '44', 'PUBLIC'),
(116, 29, 'SET-3', 'REASONING', 'TEXT', 'Three persons are walking from a place A to another place B. Their speeds are in the ratio of 4 : 3 : 5. The time ratio to reach B by these persons will be :', 5, 2, '23,44,22,67,32', '44', 'PUBLIC'),
(117, 29, 'SET-3', 'REASONING', 'TEXT', 'Three persons are walking from a place A to another place B. Their speeds are in the ratio of 4 : 3 : 5. The time ratio to reach B by these persons will be :', 5, 2, '23,44,22,67,32', '44', 'PUBLIC'),
(118, 29, 'SET-2', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC'),
(119, 29, 'SET-2', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC'),
(120, 30, 'Aptitude', 'Aptitude', 'TEXT', 'if A+B = 4 and B = 7 then A=?', 5, 1, '1,2,3,4', '3', 'PUBLIC'),
(121, 30, 'Logical', 'Aptitude', 'TEXT', 'Excluding stoppages, the speed of a bus is 54 kmph and including stoppages, it is 45 kmph. For how many minutes does the bus stop per hour?\"', 5, 1, '9,10,12,20', '10', 'PUBLIC'),
(122, 30, 'Aptitude', 'LOGIC', 'TEXT', 'The average speed of a train in the onward journey is 25% more than that in the return journey. The train halts for one hour on reaching the destination. The total time taken for the complete to and from journey is 17 hours, covering a distance of 800 km. The speed of the train in the onward journey is:', 4, 1, '2,56,7,2', '56', 'PUBLIC'),
(123, 30, 'Logical', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC'),
(124, 30, 'Aptitude', 'LOGIC', 'TEXT', 'The average speed of a train in the onward journey is 25% more than that in the return journey. The train halts for one hour on reaching the destination. The total time taken for the complete to and from journey is 17 hours, covering a distance of 800 km. The speed of the train in the onward journey is:', 4, 1, '2,56,7,2', '56', 'PUBLIC'),
(125, 30, 'Aptitude', 'LOGIC', 'TEXT', 'The average speed of a train in the onward journey is 25% more than that in the return journey. The train halts for one hour on reaching the destination. The total time taken for the complete to and from journey is 17 hours, covering a distance of 800 km. The speed of the train in the onward journey is:', 4, 1, '2,56,7,2', '56', 'PUBLIC'),
(126, 30, 'Logical', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC'),
(127, 30, 'Reasoning', 'REASONING', 'TEXT', 'Three persons are walking from a place A to another place B. Their speeds are in the ratio of 4 : 3 : 5. The time ratio to reach B by these persons will be :', 5, 2, '23,44,22,67,32', '44', 'PUBLIC'),
(128, 30, 'Reasoning', 'REASONING', 'TEXT', 'Three persons are walking from a place A to another place B. Their speeds are in the ratio of 4 : 3 : 5. The time ratio to reach B by these persons will be :', 5, 2, '23,44,22,67,32', '44', 'PUBLIC'),
(129, 30, 'Reasoning', 'REASONING', 'TEXT', 'Three persons are walking from a place A to another place B. Their speeds are in the ratio of 4 : 3 : 5. The time ratio to reach B by these persons will be :', 5, 2, '23,44,22,67,32', '44', 'PUBLIC'),
(130, 30, 'Logical', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC'),
(131, 30, 'Logical', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC');

-- --------------------------------------------------------

--
-- Table structure for table `hc_sets`
--

CREATE TABLE `hc_sets` (
  `s_id` int(11) NOT NULL,
  `s_test_id` int(11) NOT NULL,
  `s_name` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hc_tags`
--

CREATE TABLE `hc_tags` (
  `tg_id` int(11) NOT NULL,
  `tg_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hc_temp_test`
--

CREATE TABLE `hc_temp_test` (
  `id` int(11) NOT NULL,
  `tt_user_id` varchar(100) NOT NULL,
  `tt_test_id` varchar(100) NOT NULL,
  `tt_time_remaining` varchar(10) NOT NULL,
  `tt_ans_object` longtext NOT NULL,
  `marks` int(11) NOT NULL,
  `isFinished` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hc_temp_test`
--

INSERT INTO `hc_temp_test` (`id`, `tt_user_id`, `tt_test_id`, `tt_time_remaining`, `tt_ans_object`, `marks`, `isFinished`) VALUES
(4, '1', '30', '236000', '{\"120\":{\"answer\":\"2\",\"status\":\"answered-to-review\",\"answered\":true},\"121\":{\"status\":\"not-answered\",\"answered\":false},\"122\":{\"status\":\"not-answered\",\"answered\":false},\"123\":{\"status\":\"normal\",\"answered\":false},\"124\":{\"status\":\"not-answered\",\"answered\":false},\"125\":{\"status\":\"to-review\",\"answered\":false},\"126\":{\"status\":\"to-review\",\"answered\":false},\"127\":{\"status\":\"not-answered\",\"answered\":false},\"128\":{\"status\":\"not-answered\",\"answered\":false},\"129\":{\"status\":\"not-answered\",\"answered\":false},\"130\":{\"status\":\"normal\",\"answered\":false},\"131\":{\"status\":\"normal\",\"answered\":false}}', 0, 0),
(5, '1', '331', '', '{est:heello}', 1, 0),
(6, '1', '331', '', '{est:heello}', 2, 1),
(7, '1', '331', '', '{est:heello}', 3, 0),
(8, '1', '331', '', '{est:heello}', 4, 1),
(9, '1', '331', '', '{est:heello}', 5, 0),
(10, '1', '331', '', '{est:heello}', 6, 1),
(11, '1', '331', '', '{est:heello}', 7, 0),
(12, '1', '331', '', '{est:heello}', 8, 1),
(13, '1', '331', '', '{est:heello}', 9, 1),
(14, '1', '331', '', '{est:heello}', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hc_tests`
--

CREATE TABLE `hc_tests` (
  `t_id` int(11) NOT NULL,
  `t_name` varchar(500) NOT NULL,
  `t_user_id` varchar(500) NOT NULL,
  `t_test_code` varchar(500) NOT NULL,
  `t_test_password` varchar(500) NOT NULL,
  `t_start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `t_end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `t_total_time` int(11) NOT NULL,
  `t_is_time_strict` enum('0','1') NOT NULL DEFAULT '0',
  `t_is_ans_shuffle` enum('0','1') NOT NULL DEFAULT '0',
  `t_file_path` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hc_tests`
--

INSERT INTO `hc_tests` (`t_id`, `t_name`, `t_user_id`, `t_test_code`, `t_test_password`, `t_start_time`, `t_end_time`, `t_total_time`, `t_is_time_strict`, `t_is_ans_shuffle`, `t_file_path`) VALUES
(3, 'CEC Test', 't@t.com', 'TESTCEC', 'aditya', '2019-03-14 14:36:50', '2018-12-31 19:30:00', 1, '0', '1', NULL),
(4, 'Test Demo 2', 't@t.com', 'TESTDEMO', 'aditya', '2019-03-14 14:36:54', '2019-02-02 07:30:00', 3, '1', '1', NULL),
(5, 'TESTDEMO-3', 't@t.com', 'TESTDEMOXX', 'aditya', '2019-03-14 14:36:58', '2019-01-02 07:32:00', 3, '1', '1', NULL),
(6, 'TESTDEMO-45', 't@t.com', 'TESTRFG', 'ADITYA', '2019-03-14 14:37:04', '2018-12-31 20:30:00', 3, '1', '1', NULL),
(7, 'TESTCCYY', 't@t.com', 'DIOMPT67', 'aditya', '2019-03-14 14:37:07', '2020-01-01 09:31:00', 13, '1', '1', NULL),
(8, 'TESTDQ1', 't@t.com', 'AHASF', 'aasd', '2019-03-14 14:37:11', '2019-12-31 19:30:00', 1, '1', '0', NULL),
(9, 'TESTSHADG', 't@t.com', 'ASDGASH', 'ASJHDGAJSG', '2019-03-14 14:37:14', '2021-03-03 22:32:00', 3, '1', '1', NULL),
(10, 'dgadsadhkdk', 't@t.com', 'jsahgdjasgdjg', 'dgsajhgdjasgd', '2019-03-14 14:37:18', '2019-01-31 19:30:00', 1, '0', '0', NULL),
(11, 'dgadsadhkdk', 't@t.com', 'jsahgdjasgdjg', 'dgsajhgdjasgd', '2019-03-14 14:37:21', '2019-01-31 19:30:00', 1, '0', '0', NULL),
(12, 'MY NEW TEST', 'ATZ9FAK4BD5JATVSH', 'AKDJAD', 'ASDAHD', '2019-01-01 20:30:00', '2019-01-02 07:30:00', 1, '0', '1', NULL),
(13, 'NEW TEST ', 'SRI9WR6JROBHSOBFH', 'ASLJHASKDHK', 'JHASKHDAKSDHK', '2019-03-01 20:30:00', '2019-01-31 19:31:00', 1, '0', '0', NULL),
(14, 'asfjhakfhu', 'A7CGE7QB250HFLCQM', 'uiuiuy', 'iuiuyi', '2021-03-02 22:33:00', '2021-03-03 22:33:00', 3, '1', '1', NULL),
(15, 'asdjashdkh', 'SBIDIZHYRAUBUH3IC', 'haskhdkjashdk', 'kjdhakshdkhask', '2021-03-02 21:33:00', '2021-04-03 10:32:00', 3, '1', '1', NULL),
(16, 'aksdasdjg', 'F4AE9GGANGVRCS9AV', 'gasjhgdjsgdgad', 'gashdgjg', '2021-02-05 09:33:00', '2021-03-03 22:33:00', 4, '1', '1', NULL),
(17, 'aksdasdjg', 'F4AE9GGANGVRCS9AV', 'gasjhgdjsgdgad', 'gashdgjg', '2021-02-05 09:33:00', '2021-03-03 22:33:00', 4, '1', '1', NULL),
(18, 'ASDMSADJHG', 'XLEQHHSTA68MKM8E7', 'GHGASSGDJG', 'GGJGJ', '2021-02-03 22:32:00', '2021-03-04 09:32:00', 3, '1', '1', NULL),
(19, 'Physics Test - Chapter 8', 't@t.com', 'PHYCH8', 'PYHB', '2019-03-14 14:37:41', '2018-03-03 09:32:00', 3, '0', '1', NULL),
(20, 'Physics Test - Chapter 8', 't@t.com', 'PHYCH8', 'PYHB', '2019-03-14 14:37:45', '2018-03-03 09:32:00', 3, '0', '1', NULL),
(21, 'TESTDEMO-1', 'HZDJQOZAEUQQ0EVJB', 'TEDGF', 'ADITYA', '2021-02-02 08:31:00', '2020-03-01 07:31:00', 3, '1', '0', NULL),
(22, 'First Admin Test Test', 'admin', 'ADMIN101', 'ADMIN101', '2021-03-03 10:32:00', '2022-04-01 21:31:00', 4, '1', '1', NULL),
(23, 'My New Correct Test ', 'admin', 'CRTEST', 'aditya', '2019-03-15 09:56:51', '2019-04-30 19:30:00', 100000, '1', '1', NULL),
(24, 'TASFDLJK', 'admin', 'HGJHK', 'HKKKHG', '2020-12-31 21:32:00', '2022-03-02 21:32:00', 1, '1', '1', NULL),
(25, 'COCUBE 2019 PRACTICE - GEU', 'admin', '2091', 'GEU19', '2018-12-31 19:30:00', '2019-02-02 19:30:00', 1, '1', '1', NULL),
(26, 'COCUBE 2019 PRACTICE - GEU', 'admin', '2091', 'GEU19', '2018-12-31 19:30:00', '2019-02-02 19:30:00', 1, '1', '1', NULL),
(27, 'AS', 'admin', 'AS', 'AS', '2020-02-02 21:32:00', '2021-03-02 22:32:00', 1, '1', '1', NULL),
(28, 'Demo Test 1', 'admin', 'DSE1', 'DSE1', '2021-03-01 20:31:00', '2021-03-01 20:31:00', 1000000, '1', '1', NULL),
(29, 'Demo Test 2', 'admin', 'DSE2', 'DSE1', '2021-03-01 20:31:00', '2021-03-01 20:31:00', 1000000, '1', '1', NULL),
(30, 'Demo Test 3', 'admin', 'DSE3', 'DSE1', '2021-03-01 20:31:00', '2021-03-01 20:31:00', 1000000, '1', '1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hc_user`
--

CREATE TABLE `hc_user` (
  `u_id` int(11) NOT NULL,
  `u_username` varchar(500) NOT NULL,
  `u_password` varchar(5000) NOT NULL,
  `u_role` varchar(5) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hc_user`
--

INSERT INTO `hc_user` (`u_id`, `u_username`, `u_password`, `u_role`) VALUES
(1, 'student', 'cd73502828457d15655bbd7a63fb0bc8', '0'),
(2, 'admin', '21232f297a57a5a743894a0e4a801fc3', '1'),
(3, 'sudo199', '8d3b82f990a1e59cc4ea3505d8ec0238', '0');

-- --------------------------------------------------------

--
-- Table structure for table `hc_user_details`
--

CREATE TABLE `hc_user_details` (
  `ud_id` int(11) NOT NULL,
  `ud_username` varchar(500) NOT NULL,
  `ud_firstname` varchar(100) NOT NULL,
  `ud_lastname` varchar(100) NOT NULL,
  `ud_institute` varchar(500) DEFAULT NULL,
  `ud_email` varchar(1000) NOT NULL,
  `ud_role` varchar(5) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hc_user_details`
--

INSERT INTO `hc_user_details` (`ud_id`, `ud_username`, `ud_firstname`, `ud_lastname`, `ud_institute`, `ud_email`, `ud_role`) VALUES
(1, 'student', 'Aditya', 'Saxena', 'Graphic Era University', 't@t.com', '0'),
(2, 'admin', 'Aman', 'Saxena', 'Graphic Era Hill University', 'admin', '1'),
(4, 'sudo199', 'sudipt', 'dabral', NULL, 'sudipt@gmail.com', '0');

-- --------------------------------------------------------

--
-- Table structure for table `hc_user_program`
--

CREATE TABLE `hc_user_program` (
  `u_id` int(11) NOT NULL,
  `u_email` varchar(30) NOT NULL,
  `p_id` int(11) NOT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hc_programs`
--
ALTER TABLE `hc_programs`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `hc_questions`
--
ALTER TABLE `hc_questions`
  ADD PRIMARY KEY (`q_id`),
  ADD KEY `q_test_id` (`q_test_id`),
  ADD KEY `q_set_id` (`q_set_id`),
  ADD KEY `q_tag` (`q_tag`);

--
-- Indexes for table `hc_sets`
--
ALTER TABLE `hc_sets`
  ADD PRIMARY KEY (`s_id`),
  ADD KEY `s_test_id` (`s_test_id`);

--
-- Indexes for table `hc_tags`
--
ALTER TABLE `hc_tags`
  ADD PRIMARY KEY (`tg_id`);

--
-- Indexes for table `hc_temp_test`
--
ALTER TABLE `hc_temp_test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hc_tests`
--
ALTER TABLE `hc_tests`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `hc_user`
--
ALTER TABLE `hc_user`
  ADD PRIMARY KEY (`u_id`),
  ADD UNIQUE KEY `username` (`u_username`);

--
-- Indexes for table `hc_user_details`
--
ALTER TABLE `hc_user_details`
  ADD PRIMARY KEY (`ud_id`),
  ADD UNIQUE KEY `ud_username` (`ud_username`);

--
-- Indexes for table `hc_user_program`
--
ALTER TABLE `hc_user_program`
  ADD PRIMARY KEY (`u_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hc_programs`
--
ALTER TABLE `hc_programs`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hc_questions`
--
ALTER TABLE `hc_questions`
  MODIFY `q_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `hc_sets`
--
ALTER TABLE `hc_sets`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hc_tags`
--
ALTER TABLE `hc_tags`
  MODIFY `tg_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hc_temp_test`
--
ALTER TABLE `hc_temp_test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `hc_tests`
--
ALTER TABLE `hc_tests`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `hc_user`
--
ALTER TABLE `hc_user`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hc_user_details`
--
ALTER TABLE `hc_user_details`
  MODIFY `ud_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hc_questions`
--
ALTER TABLE `hc_questions`
  ADD CONSTRAINT `hc_questions_ibfk_1` FOREIGN KEY (`q_test_id`) REFERENCES `hc_tests` (`t_id`);

--
-- Constraints for table `hc_sets`
--
ALTER TABLE `hc_sets`
  ADD CONSTRAINT `hc_sets_ibfk_1` FOREIGN KEY (`s_test_id`) REFERENCES `hc_tests` (`t_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
