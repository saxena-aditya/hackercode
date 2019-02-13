-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 13, 2019 at 12:57 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
(11, 1, 'SET-1', 'APPTITUDE', 'TEXT', 'if A+B = 4 and B = 7 then A=?', 5, 1, '1,2,3,4', '3', 'PUBLIC'),
(12, 1, 'SET-2', 'APPTITUDE', 'TEXT', 'Excluding stoppages, the speed of a bus is 54 kmph and including stoppages, it is 45 kmph. For how many minutes does the bus stop per hour?"', 5, 1, '9,10,12,20', '10', 'PUBLIC'),
(13, 1, 'SET-1', 'LOGIC', 'TEXT', 'The average speed of a train in the onward journey is 25% more than that in the return journey. The train halts for one hour on reaching the destination. The total time taken for the complete to and from journey is 17 hours, covering a distance of 800 km. The speed of the train in the onward journey is:', 4, 1, '2,56,7,2', '56', 'PUBLIC'),
(14, 1, 'SET-2', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC'),
(15, 1, 'SET-3', 'REASONING', 'TEXT', 'Three persons are walking from a place A to another place B. Their speeds are in the ratio of 4 : 3 : 5. The time ratio to reach B by these persons will be :', 5, 2, '23,44,22,67,32', '44', 'PUBLIC');

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
-- Table structure for table `hc_tests`
--

CREATE TABLE `hc_tests` (
  `t_id` int(11) NOT NULL,
  `t_name` varchar(500) NOT NULL,
  `t_user_id` varchar(500) NOT NULL,
  `t_test_code` varchar(500) NOT NULL,
  `t_test_password` varchar(500) NOT NULL,
  `t_start_time` datetime NOT NULL,
  `t_end_time` datetime NOT NULL,
  `t_total_time` int(11) NOT NULL,
  `t_is_time_strict` enum('0','1') NOT NULL DEFAULT '0',
  `t_is_ans_shuffle` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hc_tests`
--

INSERT INTO `hc_tests` (`t_id`, `t_name`, `t_user_id`, `t_test_code`, `t_test_password`, `t_start_time`, `t_end_time`, `t_total_time`, `t_is_time_strict`, `t_is_ans_shuffle`) VALUES
(1, 'Demo-Test-1', '240991', 'xcr56oop', 'xcr56oop', '2019-02-12 23:55:58', '2019-02-12 23:55:58', 3, '0', '0');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `hc_tests`
--
ALTER TABLE `hc_tests`
  ADD PRIMARY KEY (`t_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hc_questions`
--
ALTER TABLE `hc_questions`
  MODIFY `q_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
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
-- AUTO_INCREMENT for table `hc_tests`
--
ALTER TABLE `hc_tests`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
