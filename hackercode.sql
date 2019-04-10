-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2019 at 05:13 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

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

--
-- Dumping data for table `hc_programs`
--

INSERT INTO `hc_programs` (`p_id`, `p_name`, `p_code`, `p_student_count`) VALUES
(1, 'GATE', 'GTE101', 0),
(2, 'COCUBES', 'CO101', 0),
(3, 'SIMPLE', 'SMP101', 0);

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
(228, 55, 'Aptitude', 'Aptitude', 'TEXT', 'if A+B = 4 and B = 7 then A=?', 5, 1, '1,2,3,4', '3', 'PUBLIC'),
(229, 55, 'Logical', 'Aptitude', 'TEXT', 'Excluding stoppages, the speed of a bus is 54 kmph and including stoppages, it is 45 kmph. For how many minutes does the bus stop per hour?\"', 5, 1, '9,10,12,20', '10', 'PUBLIC'),
(230, 55, 'Aptitude', 'LOGIC', 'TEXT', 'The average speed of a train in the onward journey is 25% more than that in the return journey. The train halts for one hour on reaching the destination. The total time taken for the complete to and from journey is 17 hours, covering a distance of 800 km. The speed of the train in the onward journey is:', 4, 1, '2,56,7,2', '56', 'PUBLIC'),
(231, 55, 'Logical', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC'),
(232, 55, 'Aptitude', 'LOGIC', 'TEXT', 'The average speed of a train in the onward journey is 25% more than that in the return journey. The train halts for one hour on reaching the destination. The total time taken for the complete to and from journey is 17 hours, covering a distance of 800 km. The speed of the train in the onward journey is:', 4, 1, '2,56,7,2', '56', 'PUBLIC'),
(233, 55, 'Aptitude', 'LOGIC', 'TEXT', 'The average speed of a train in the onward journey is 25% more than that in the return journey. The train halts for one hour on reaching the destination. The total time taken for the complete to and from journey is 17 hours, covering a distance of 800 km. The speed of the train in the onward journey is:', 4, 1, '2,56,7,2', '56', 'PUBLIC'),
(234, 55, 'Logical', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC'),
(235, 55, 'Reasoning', 'REASONING', 'TEXT', 'Three persons are walking from a place A to another place B. Their speeds are in the ratio of 4 : 3 : 5. The time ratio to reach B by these persons will be :', 5, 2, '23,44,22,67,32', '44', 'PUBLIC'),
(236, 55, 'Reasoning', 'REASONING', 'TEXT', 'Three persons are walking from a place A to another place B. Their speeds are in the ratio of 4 : 3 : 5. The time ratio to reach B by these persons will be :', 5, 2, '23,44,22,67,32', '44', 'PUBLIC'),
(237, 55, 'Reasoning', 'REASONING', 'TEXT', 'Three persons are walking from a place A to another place B. Their speeds are in the ratio of 4 : 3 : 5. The time ratio to reach B by these persons will be :', 5, 2, '23,44,22,67,32', '44', 'PUBLIC'),
(238, 55, 'Logical', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC'),
(239, 55, 'Logical', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC'),
(240, 56, 'Aptitude', 'Aptitude', 'TEXT', 'if A+B = 4 and B = 7 then A=?', 5, 1, '1,2,3,4', '3', 'PUBLIC'),
(241, 56, 'Logical', 'Aptitude', 'TEXT', 'Excluding stoppages, the speed of a bus is 54 kmph and including stoppages, it is 45 kmph. For how many minutes does the bus stop per hour?\"', 5, 1, '9,10,12,20', '10', 'PUBLIC'),
(242, 56, 'Aptitude', 'LOGIC', 'TEXT', 'The average speed of a train in the onward journey is 25% more than that in the return journey. The train halts for one hour on reaching the destination. The total time taken for the complete to and from journey is 17 hours, covering a distance of 800 km. The speed of the train in the onward journey is:', 4, 1, '2,56,7,2', '56', 'PUBLIC'),
(243, 56, 'Logical', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC'),
(244, 56, 'Aptitude', 'LOGIC', 'TEXT', 'The average speed of a train in the onward journey is 25% more than that in the return journey. The train halts for one hour on reaching the destination. The total time taken for the complete to and from journey is 17 hours, covering a distance of 800 km. The speed of the train in the onward journey is:', 4, 1, '2,56,7,2', '56', 'PUBLIC'),
(245, 56, 'Aptitude', 'LOGIC', 'TEXT', 'The average speed of a train in the onward journey is 25% more than that in the return journey. The train halts for one hour on reaching the destination. The total time taken for the complete to and from journey is 17 hours, covering a distance of 800 km. The speed of the train in the onward journey is:', 4, 1, '2,56,7,2', '56', 'PUBLIC'),
(246, 56, 'Logical', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC'),
(247, 56, 'Reasoning', 'REASONING', 'TEXT', 'Three persons are walking from a place A to another place B. Their speeds are in the ratio of 4 : 3 : 5. The time ratio to reach B by these persons will be :', 5, 2, '23,44,22,67,32', '44', 'PUBLIC'),
(248, 56, 'Reasoning', 'REASONING', 'TEXT', 'Three persons are walking from a place A to another place B. Their speeds are in the ratio of 4 : 3 : 5. The time ratio to reach B by these persons will be :', 5, 2, '23,44,22,67,32', '44', 'PUBLIC'),
(249, 56, 'Reasoning', 'REASONING', 'TEXT', 'Three persons are walking from a place A to another place B. Their speeds are in the ratio of 4 : 3 : 5. The time ratio to reach B by these persons will be :', 5, 2, '23,44,22,67,32', '44', 'PUBLIC'),
(250, 56, 'Logical', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC'),
(251, 56, 'Logical', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC');

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
  `t_associated_program` varchar(100) DEFAULT NULL,
  `t_user_id` varchar(500) NOT NULL,
  `t_test_code` varchar(500) NOT NULL,
  `t_test_password` varchar(500) NOT NULL,
  `t_start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `t_end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `t_total_time` int(15) NOT NULL,
  `t_is_time_strict` enum('0','1') NOT NULL DEFAULT '0',
  `t_is_ans_shuffle` enum('0','1') NOT NULL DEFAULT '0',
  `t_file_path` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hc_tests`
--

INSERT INTO `hc_tests` (`t_id`, `t_name`, `t_associated_program`, `t_user_id`, `t_test_code`, `t_test_password`, `t_start_time`, `t_end_time`, `t_total_time`, `t_is_time_strict`, `t_is_ans_shuffle`, `t_file_path`) VALUES
(55, 'MYNEWTEST', 'GTE101', 'admin', 'MYNEWTEST', 'AAS', '2019-02-01 19:30:00', '2019-02-02 21:31:00', 4500000, '1', '1', NULL),
(56, 'DEMOTEST2', 'CO101', 'admin', 'DFGH', 'DFGHJ', '2018-12-31 18:30:00', '2019-01-01 18:30:00', 3660000, '1', '1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hc_user`
--

CREATE TABLE `hc_user` (
  `u_id` int(11) NOT NULL,
  `u_username` varchar(500) NOT NULL,
  `u_password` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hc_user`
--

INSERT INTO `hc_user` (`u_id`, `u_username`, `u_password`) VALUES
(1, 'student', 'cd73502828457d15655bbd7a63fb0bc8'),
(2, 'admin', '21232f297a57a5a743894a0e4a801fc3'),
(3, 'sudo199', '8d3b82f990a1e59cc4ea3505d8ec0238'),
(4, 'sudo19933', '8d3b82f990a1e59cc4ea3505d8ec0238'),
(5, 'test12', '8d3b82f990a1e59cc4ea3505d8ec0238'),
(12, 'sudo2323232', '25d55ad283aa400af464c76d713c07ad'),
(13, '123user', '25d55ad283aa400af464c76d713c07ad'),
(15, 'adityasaxena602@gmail.com', '92ad11a510da635d3e8c8759e92705bb');

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
(4, 'sudo199', 'sudipt', 'dabral', NULL, 'sudipt@gmail.com', '0'),
(10, 'sudo19933', 'sudipt', 'dabral', NULL, 'sudipt121@gmail.com', '0'),
(13, 'test12', 'sudipt', 'dabral', NULL, 'sudipt122@gmail.com', '0'),
(20, 'sudo2323232', 'Sudipt', 'Dabral', NULL, 'sudiptwork1999@gmail.com', '0'),
(21, '123user', 'test', 'user', NULL, 'sakdjaklsj@gmail.com', '0'),
(23, 'adityasaxena602@gmail.com', 'Aditya ', 'Saxena', NULL, 'adityasaxena602@gmail.com', '0');

-- --------------------------------------------------------

--
-- Table structure for table `hc_user_program`
--

CREATE TABLE `hc_user_program` (
  `up_id` int(11) NOT NULL,
  `up_username` varchar(500) NOT NULL,
  `up_code` varchar(20) NOT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hc_user_program`
--

INSERT INTO `hc_user_program` (`up_id`, `up_username`, `up_code`, `is_paid`) VALUES
(1, 'sudiptwork1999@gmail.com', '1', 0),
(2, 'sakdjaklsj@gmail.com', '1', 0),
(4, 'adityasaxena602@gmail.com', 'GTE101', 0),
(6, 'adityasaxena602@gmail.com', 'CO101', 0);

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
  ADD PRIMARY KEY (`up_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hc_programs`
--
ALTER TABLE `hc_programs`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hc_questions`
--
ALTER TABLE `hc_questions`
  MODIFY `q_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;

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
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `hc_user`
--
ALTER TABLE `hc_user`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `hc_user_details`
--
ALTER TABLE `hc_user_details`
  MODIFY `ud_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `hc_user_program`
--
ALTER TABLE `hc_user_program`
  MODIFY `up_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
