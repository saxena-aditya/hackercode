-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 11, 2016 at 02:22 PM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `oes`
create database if not exists oes;

use oes;
--

-- --------------------------------------------------------

-- password

-- Table structure for table `users`
--

 CREATE TABLE IF NOT EXISTS `users` (
  `u_id` int  AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) DEFAULT NULL,
  `usertype` varchar(32) DEFAULT 'student',
   primary key(u_id)
 ) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

 INSERT INTO `users` (`u_id`,`username`, `password`,`usertype`) VALUES
 (1,'root', '63a9f0ea7bb98050796b649e85481845','admin'),
 (2,'toor', '63a9f0ea7bb98050796b649e85481845','student');

-- --------------------------------------------------------

--
-- Table structure for table `feedback_question`
--

CREATE TABLE IF NOT EXISTS `feedback_question` (
  `stdid` bigint(20) NOT NULL,
  `testid` bigint(20) NOT NULL,
  `qnid` int(11) NOT NULL,
  `fd` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE IF NOT EXISTS `level` (
  `testid` bigint(20) NOT NULL,
  `level_e` float DEFAULT NULL,
  `level_m` float DEFAULT NULL,
  `level_h` float DEFAULT NULL,
  `n_level_e` float DEFAULT NULL,
  `n_level_m` float DEFAULT NULL,
  `n_level_h` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`testid`, `level_e`, `level_m`, `level_h`, `n_level_e`, `n_level_m`, `n_level_h`) VALUES
(47, 1, 2, 4, 0.33, 0.66, 1.33),
(49, 1, 2, 4, 0.33, 0.66, 1.33);

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE IF NOT EXISTS `question` (
  `testid` bigint(20) NOT NULL DEFAULT '0',
  `qnid` int(11) NOT NULL DEFAULT '0',
  `qnid_s` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`testid`, `qnid`, `qnid_s`) VALUES
(47, 1, 3644),
(47, 2, 3645),
(47, 3, 3646),
(47, 4, 3647),
(47, 6, 3648),
(47, 7, 3649),
(47, 8, 3650),
(47, 9, 3651),
(47, 10, 3652),
(47, 11, 3653),
(47, 12, 3654),
(47, 13, 3655),
(47, 14, 3656),
(47, 15, 3657),
(47, 16, 3658),
(47, 17, 3659),
(47, 18, 3660),
(47, 19, 3661),
(47, 20, 3662),
(47, 22, 3663),
(47, 21, 3664),
(47, 23, 3665),
(47, 24, 3666),
(47, 25, 3667),
(47, 26, 3668),
(47, 27, 3669),
(47, 28, 3670),
(47, 29, 3671),
(47, 30, 3672),
(47, 31, 3673),
(47, 50, 3674),
(47, 32, 3675),
(47, 34, 3676),
(47, 33, 3677),
(47, 35, 3678),
(47, 36, 3679),
(47, 37, 3680),
(47, 38, 3681),
(47, 39, 3682),
(47, 40, 3683),
(47, 41, 3684),
(47, 42, 3685),
(47, 43, 3686),
(47, 44, 3687),
(47, 45, 3688),
(47, 46, 3689),
(47, 47, 3690),
(47, 48, 3691),
(47, 49, 3692),
(47, 5, 3693),
(49, 10, 3694),
(49, 1, 3695),
(49, 2, 3696),
(49, 3, 3697),
(49, 4, 3698),
(49, 5, 3699),
(49, 6, 3700),
(49, 7, 3701),
(49, 8, 3702),
(49, 9, 3703);

-- --------------------------------------------------------

--
-- Table structure for table `sett`
--

CREATE TABLE IF NOT EXISTS `sett` (
  `key` varchar(100) CHARACTER SET latin1 NOT NULL,
  `flag` float DEFAULT NULL,
  `metadata` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sett`
--

INSERT INTO `sett` (`key`, `flag`, `metadata`) VALUES
('stu_reg', 1, ''),
('notice', NULL, 'If you want to PAUSE your Test, then hibernate or sleep your OS, the timer will freeze.\n\nIn Numerical Entry questions if you get your answer as 0(zero) than enter it as 0.00\n\nAll the Best!'),
('batch', 2017, 'GEU'),
('Error_Allowed', 0.03, NULL),
('feedback', -1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `stdid` bigint(20) NOT NULL,
  `stdname` varchar(40) DEFAULT NULL,
  `stdpassword` varchar(40) DEFAULT NULL,
  `contactno` varchar(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `per_10` varchar(10) DEFAULT NULL,
  `per_12` varchar(10) DEFAULT NULL,
  `per_btech` varchar(10) DEFAULT NULL,
  `batch` varchar(25) DEFAULT NULL,
  `year` varchar(6) DEFAULT NULL,
  `section` varchar(20) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=349 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`stdid`, `stdname`, `stdpassword`, `contactno`, `name`, `per_10`, `per_12`, `per_btech`, `batch`, `year`, `section`) VALUES
(1, 'kavyagupta', 'eac5d4ffd9a2a5c446cd1fdcd9661d4d', NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(2, 'sujeet', '7adf6f07e0810003c585a7be97868a90', NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(3, 'Pavas_Handa', '6536a9e079fec5faef25c9a1a885b98b', NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(4, 'shivani', 'ea7fd144f2edb73362f531981ed1d6c8', NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(5, 'Ekta_Saini', 'f25dd0d96ed03bf0d4101f4ccba92afe', NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(6, 'isha', '0fbbff834b18d61b090bfd627f02e707', NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(7, 'HimanshuBaliyan', 'ae2b1fca515949e5d54fb22b8ed95575', NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(8, 'mukeshmodi', 'c8b290b1b5273c48a0856d3d8252c8f0', NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(9, 'gaurav69', '6a2dcf3057ebd584e38278c8de63b341', NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(10, 'anmol', '2d235ace000a3ad85f590e321c89bb99', NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(11, 'Deeksha_Lakhani', 'b141adb140a7067cd4a46fb61ce33a3d', NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(12, 'Ashish_Rawat', '7e1dd9e42abfe38ba5eeca548ec27e3c', NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(13, 'gaurav_bhatt', '81dc9bdb52d04dc20036dbd8313ed055', NULL, NULL, NULL, NULL, NULL, '2016', NULL, NULL),
(14, 'shivangi', 'a5ec90aa19c4b7a70362204a9bfd6b87', NULL, NULL, NULL, NULL, NULL, '2016', NULL, NULL),
(15, 'Sharat', 'd2cb3e7530dd79e4449a01e6ebf50163', NULL, NULL, NULL, NULL, NULL, '2016', NULL, NULL),
(16, 'dhariyalbhaskar', 'ec205dd6f8b0fa8a6754bef8ad81e124', NULL, NULL, NULL, NULL, NULL, '2016', NULL, NULL),
(17, 'rohan2017', '52718aa284b9024839c02270294e7625', NULL, NULL, NULL, NULL, NULL, '2016', NULL, NULL),
(18, 'YASH', 'fcd2306673d5bc51ca68cb6745dd091a', NULL, NULL, NULL, NULL, NULL, '2016', NULL, NULL),
(19, 'tanu_gupta', '0a1ff84857fb5b148c08929b43e121bb', NULL, NULL, NULL, NULL, NULL, '2016', NULL, NULL),
(20, 'gautam', '81dc9bdb52d04dc20036dbd8313ed055', NULL, NULL, NULL, NULL, NULL, '2016', NULL, NULL),
(21, 'ishita', '81b1d4f07cb2b0bb5e322dd8c14cd40e', NULL, NULL, NULL, NULL, NULL, '2016', NULL, NULL),
(22, 'Himanshi', 'f647d80d8adb3522e7476fef878f0f7f', NULL, NULL, NULL, NULL, NULL, '2016', NULL, NULL),
(23, 'test', '81dc9bdb52d04dc20036dbd8313ed055', NULL, NULL, NULL, NULL, NULL, '2016', NULL, NULL),
(24, 'rahul_ranjan', '2acb7811397a5c3bea8cba57b0388b79', NULL, NULL, NULL, NULL, NULL, '2016', NULL, NULL),
(25, 'm_danish', 'b36955673b836cb759436c94f6f6b301', NULL, NULL, NULL, NULL, NULL, '2016', NULL, NULL),
(26, 'kshitij_sharma', '2fb9fb6ea57d27633ae6327d6a0d4b0b', NULL, NULL, NULL, NULL, NULL, '2016', NULL, NULL),
(27, 'mehul_singh', '30c5c5e401f65ed861c1aa9227ad5499', NULL, NULL, NULL, NULL, NULL, '2016', NULL, NULL),
(28, 'aditya_pathak', '60058c21bd322284b9649e696e1b6962', NULL, NULL, NULL, NULL, NULL, '2016', NULL, NULL),
(29, 'singh_mehul', '30c5c5e401f65ed861c1aa9227ad5499', NULL, NULL, NULL, NULL, NULL, '2016', NULL, NULL),
(30, 'aditya', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, NULL, '2016', NULL, NULL),
(31, 'akshay_saxena', '50977d6b4d7d7b056427ae04b90b251d', NULL, NULL, NULL, NULL, NULL, '2016', NULL, NULL),
(32, 'Shubham', '83a3603a77bc3fe1628b449a51c15115', NULL, NULL, NULL, NULL, NULL, '2016', NULL, NULL),
(33, 'tejeshwar', 'fd2abef4ec26ec43bde71585c1e3f7b3', NULL, NULL, NULL, NULL, NULL, '2016', NULL, NULL),
(34, 'shubham_dhiman', '57865318e14ffbeae67fcab7008bc822', NULL, NULL, NULL, NULL, NULL, '2016', NULL, NULL),
(35, 'animesh_kumar', '3fcd69059d7e413237024309193bd0e1', NULL, NULL, NULL, NULL, NULL, '2016', NULL, NULL),
(36, 'anuj_panwar', '5bc07c34f716f6026e43084f5860db19', NULL, NULL, NULL, NULL, NULL, '2016', NULL, NULL),
(37, 'abhishek_kashyap', '69c2675ba41c2d2d52bd89fcf9c06841', NULL, NULL, NULL, NULL, NULL, '2016', NULL, NULL),
(38, 'gaurav_dhameja', '003d3a6f99df0065715efb098ee629d0', NULL, NULL, NULL, NULL, NULL, '2016', NULL, NULL),
(39, 'abhinav_rathor', 'a6b5fc7d0209e5ca9f0864c63661dc11', NULL, NULL, NULL, NULL, NULL, '2016', NULL, NULL),
(40, 'bhargav', '81dc9bdb52d04dc20036dbd8313ed055', NULL, NULL, NULL, NULL, NULL, '2016', NULL, NULL),
(41, 'xyz123', '81dc9bdb52d04dc20036dbd8313ed055', NULL, NULL, NULL, NULL, NULL, '2016', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `studentquestion`
--

CREATE TABLE IF NOT EXISTS `studentquestion` (
  `stdid` bigint(20) NOT NULL DEFAULT '0',
  `testid` bigint(20) NOT NULL DEFAULT '0',
  `qnid` int(11) NOT NULL DEFAULT '0',
  `marks` float DEFAULT '0',
  `stdanswer` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `studentquestion`
--

INSERT INTO `studentquestion` (`stdid`, `testid`, `qnid`, `marks`, `stdanswer`) VALUES
(40, 49, 1, -0.66, 'optionb');

-- --------------------------------------------------------

--
-- Table structure for table `studenttest`
--

CREATE TABLE IF NOT EXISTS `studenttest` (
  `stdid` bigint(20) NOT NULL DEFAULT '0',
  `testid` bigint(20) NOT NULL DEFAULT '0',
  `starttime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `correctlyanswered` int(11) DEFAULT NULL,
  `score` float DEFAULT NULL,
  `status` enum('over','inprogress') DEFAULT NULL,
  `normalized_percentage` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `studenttest`
--

INSERT INTO `studenttest` (`stdid`, `testid`, `starttime`, `correctlyanswered`, `score`, `status`, `normalized_percentage`) VALUES
(40, 49, '2015-04-25 04:31:18', 0, -0.66, 'over', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE IF NOT EXISTS `subject` (
  `subid` int(11) NOT NULL,
  `subname` varchar(40) DEFAULT NULL,
  `subdesc` varchar(100) DEFAULT NULL,
  `tcid` bigint(20) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`subid`, `subname`, `subdesc`, `tcid`) VALUES
(1, 'Test_1_25_04_2015', 'Test 1 April', NULL),
(2, 'Demo', 'Demo Test', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subj_question`
--

CREATE TABLE IF NOT EXISTS `subj_question` (
  `qnid_s` int(11) NOT NULL,
  `subid` int(11) NOT NULL,
  `level` varchar(11) CHARACTER SET latin1 NOT NULL,
  `question` text,
  `figure` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `optiona` text,
  `optionb` text,
  `optionc` text,
  `optiond` text,
  `optione` text,
  `correct` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `type` char(2) NOT NULL DEFAULT 'MC',
  `correct2` varchar(20) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3704 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subj_question`
--

INSERT INTO `subj_question` (`qnid_s`, `subid`, `level`, `question`, `figure`, `optiona`, `optionb`, `optionc`, `optiond`, `optione`, `correct`, `type`, `correct2`) VALUES
(3644, 1, 'level_e', NULL, '1429953440.jpg', NULL, NULL, NULL, NULL, NULL, 'optiond', 'MC', 'optiond'),
(3645, 1, 'level_e', NULL, '1429933833.jpg', NULL, NULL, NULL, NULL, NULL, 'optionc', 'MC', 'optionc'),
(3646, 1, 'level_e', NULL, '1429958846.jpg', NULL, NULL, NULL, NULL, NULL, '400', 'NT', '400'),
(3647, 1, 'level_e', NULL, '1429942479.jpg', NULL, NULL, NULL, NULL, NULL, 'optionc', 'MC', 'optionc'),
(3648, 1, 'level_e', NULL, '1429939724.jpg', NULL, NULL, NULL, NULL, NULL, 'optiond', 'MC', 'optiond'),
(3649, 1, 'level_e', NULL, '1429939973.jpg', NULL, NULL, NULL, NULL, NULL, '11', 'NT', '11'),
(3650, 1, 'level_e', NULL, '1429958410.jpg', NULL, NULL, NULL, NULL, NULL, 'optionb', 'MC', 'optionb'),
(3651, 1, 'level_e', NULL, '1429937963.jpg', NULL, NULL, NULL, NULL, NULL, 'optionc', 'MC', 'optionc'),
(3652, 1, 'level_e', NULL, '1429941048.jpg', NULL, NULL, NULL, NULL, NULL, 'optiond', 'MC', 'optiond'),
(3653, 1, 'level_e', NULL, '1429947073.jpg', NULL, NULL, NULL, NULL, NULL, '36', 'NT', '36'),
(3654, 1, 'level_e', NULL, '1429964310.jpg', NULL, NULL, NULL, NULL, NULL, '16384', 'NT', '16384'),
(3655, 1, 'level_e', NULL, '1429935943.jpg', NULL, NULL, NULL, NULL, NULL, 'option', 'MC', 'option'),
(3656, 1, 'level_e', NULL, '1429952292.jpg', NULL, NULL, NULL, NULL, NULL, 'optiona', 'MC', 'optiona'),
(3657, 1, 'level_e', NULL, '1429954109.jpg', NULL, NULL, NULL, NULL, NULL, 'optiona', 'MC', 'optiona'),
(3658, 1, 'level_e', NULL, '1429963234.jpg', NULL, NULL, NULL, NULL, NULL, 'optiona', 'MC', 'optiona'),
(3659, 1, 'level_e', NULL, '1429959971.jpg', NULL, NULL, NULL, NULL, NULL, 'optionc', 'MC', 'optionc'),
(3660, 1, 'level_e', NULL, '1429951952.jpg', NULL, NULL, NULL, NULL, NULL, 'optionb', 'MC', 'optionb'),
(3661, 1, 'level_e', NULL, '1429943673.jpg', NULL, NULL, NULL, NULL, NULL, 'optionb', 'MC', 'optionb'),
(3662, 1, 'level_e', NULL, '1429958254.jpg', NULL, NULL, NULL, NULL, NULL, '1.62', 'NT', '1.62'),
(3663, 1, 'level_m', NULL, '1429951679.jpg', NULL, NULL, NULL, NULL, NULL, '130', 'NT', '130'),
(3664, 1, 'level_m', NULL, '1429934908.jpg', NULL, NULL, NULL, NULL, NULL, '22', 'NT', '22'),
(3665, 1, 'level_m', NULL, '1429947509.jpg', NULL, NULL, NULL, NULL, NULL, 'optiona', 'MC', 'optiona'),
(3666, 1, 'level_m', NULL, '1429936058.jpg', NULL, NULL, NULL, NULL, NULL, '1358', 'NT', '1358'),
(3667, 1, 'level_m', NULL, '1429934619.jpg', NULL, NULL, NULL, NULL, NULL, 'optionb', 'MC', 'optionb'),
(3668, 1, 'level_m', NULL, '1429945192.jpg', NULL, NULL, NULL, NULL, NULL, '64', 'NT', '64'),
(3669, 1, 'level_m', NULL, '1429948209.jpg', NULL, NULL, NULL, NULL, NULL, 'optiona', 'MC', 'optiona'),
(3670, 1, 'level_m', NULL, '1429965254.jpg', NULL, NULL, NULL, NULL, NULL, 'optionc', 'MC', 'optionc'),
(3671, 1, 'level_m', NULL, '1429948727.jpg', NULL, NULL, NULL, NULL, NULL, 'optiona', 'MC', 'optiona'),
(3672, 1, 'level_m', NULL, '1429944916.jpg', NULL, NULL, NULL, NULL, NULL, '10', 'NT', '10'),
(3673, 1, 'level_m', NULL, '1429944749.jpg', NULL, NULL, NULL, NULL, NULL, '1101', 'NT', '1101'),
(3674, 1, 'level_m', NULL, '1429934226.jpg', NULL, NULL, NULL, NULL, NULL, 'optionc', 'MC', 'optionc'),
(3675, 1, 'level_m', NULL, '1429952019.jpg', NULL, NULL, NULL, NULL, NULL, 'optiona', 'MC', 'optiona'),
(3676, 1, 'level_m', NULL, '1429945345.jpg', NULL, NULL, NULL, NULL, NULL, '5', 'NT', '5'),
(3677, 1, 'level_m', NULL, '1429952490.jpg', NULL, NULL, NULL, NULL, NULL, '2', 'NT', '2'),
(3678, 1, 'level_m', NULL, '1429944351.jpg', NULL, NULL, NULL, NULL, NULL, 'optiond', 'MC', 'optiond'),
(3679, 1, 'level_m', NULL, '1429951664.jpg', NULL, NULL, NULL, NULL, NULL, 'optionc', 'MC', 'optionc'),
(3680, 1, 'level_m', NULL, '1429941357.jpg', NULL, NULL, NULL, NULL, NULL, '88.889', 'NT', '88.889'),
(3681, 1, 'level_m', NULL, '1429937638.jpg', NULL, NULL, NULL, NULL, NULL, 'optionc', 'MC', 'optionc'),
(3682, 1, 'level_m', NULL, '1429949547.jpg', NULL, NULL, NULL, NULL, NULL, 'optiona', 'MC', 'optiona'),
(3683, 1, 'level_m', NULL, '1429938444.jpg', NULL, NULL, NULL, NULL, NULL, '0.0', 'NT', '0.0'),
(3684, 1, 'level_m', NULL, '1429944217.jpg', NULL, NULL, NULL, NULL, NULL, '24', 'NT', '24'),
(3685, 1, 'level_m', NULL, '1429948322.jpg', NULL, NULL, NULL, NULL, NULL, '50', 'NT', '50'),
(3686, 1, 'level_m', NULL, '1429952887.jpg', NULL, NULL, NULL, NULL, NULL, '15', 'NT', '15'),
(3687, 1, 'level_m', NULL, '1429952296.jpg', NULL, NULL, NULL, NULL, NULL, 'optionc', 'MC', 'optionc'),
(3688, 1, 'level_m', NULL, '1429948805.jpg', NULL, NULL, NULL, NULL, NULL, 'optionc', 'MC', 'optionc'),
(3689, 1, 'level_m', NULL, '1429950750.jpg', NULL, NULL, NULL, NULL, NULL, '4', 'NT', '4'),
(3690, 1, 'level_m', NULL, '1429941059.jpg', NULL, NULL, NULL, NULL, NULL, '14', 'NT', '14'),
(3691, 1, 'level_m', NULL, '1429951236.jpg', NULL, NULL, NULL, NULL, NULL, '1', 'NT', '1'),
(3692, 1, 'level_m', NULL, '1429966385.jpg', NULL, NULL, NULL, NULL, NULL, '8', 'NT', '8'),
(3693, 1, 'level_e', NULL, '1429960282.jpg', NULL, NULL, NULL, NULL, NULL, 'optionb', 'MC', 'optionb'),
(3694, 2, 'level_m', NULL, '1429961706.jpg', NULL, NULL, NULL, NULL, NULL, 'optiond', 'MC', 'optiond'),
(3695, 2, 'level_m', NULL, '1429955759.jpg', NULL, NULL, NULL, NULL, NULL, 'optiond', 'MC', 'optiond'),
(3696, 2, 'level_m', NULL, '1429964432.jpg', NULL, NULL, NULL, NULL, NULL, 'optiona', 'MC', 'optiona'),
(3697, 2, 'level_m', NULL, '1429963101.jpg', NULL, NULL, NULL, NULL, NULL, 'optionb', 'MC', 'optionb'),
(3698, 2, 'level_m', NULL, '1429946534.jpg', NULL, NULL, NULL, NULL, NULL, 'optionc', 'MC', 'optionc'),
(3699, 2, 'level_m', NULL, '1429958843.jpg', NULL, NULL, NULL, NULL, NULL, '250', 'NT', '250'),
(3700, 2, 'level_m', NULL, '1429950380.jpg', NULL, NULL, NULL, NULL, NULL, 'optiona', 'MC', 'optiona'),
(3701, 2, 'level_m', NULL, '1429940809.jpg', NULL, NULL, NULL, NULL, NULL, 'optionc', 'MC', 'optionc'),
(3702, 2, 'level_m', NULL, '1429935394.jpg', NULL, NULL, NULL, NULL, NULL, '4.34', 'NT', '4.34'),
(3703, 2, 'level_m', NULL, '1429942663.jpg', NULL, NULL, NULL, NULL, NULL, 'optionb', 'MC', 'optionb');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE IF NOT EXISTS `test` (
  `testid` bigint(20) NOT NULL,
  `testname` varchar(30) NOT NULL,
  `testdesc` varchar(100) DEFAULT NULL,
  `testdate` date DEFAULT NULL,
  `testtime` time DEFAULT NULL,
  `subid` int(11) DEFAULT NULL,
  `testfrom` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `testto` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `duration` int(11) DEFAULT NULL,
  `totalquestions` int(11) DEFAULT NULL,
  `total` bigint(20) DEFAULT NULL,
  `testcode` varchar(40) NOT NULL,
  `tcid` bigint(20) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  `mean` double DEFAULT NULL,
  `variance` double DEFAULT NULL,
  `standard_deviation` double DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`testid`, `testname`, `testdesc`, `testdate`, `testtime`, `subid`, `testfrom`, `testto`, `duration`, `totalquestions`, `total`, `testcode`, `tcid`, `status`, `mean`, `variance`, `standard_deviation`) VALUES
(47, 'Test 1 April', 'Sub: OS, CN, Algo', '2015-04-25', NULL, 1, '2015-04-25 03:48:04', '0000-00-00 00:00:00', 120, 50, NULL, '', NULL, 0, NULL, NULL, NULL),
(49, 'Demo Test', 'Test', '2015-04-25', NULL, 2, '2015-04-25 03:53:47', '0000-00-00 00:00:00', 10, 10, 20, '', NULL, 1, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userName`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD KEY `testid` (`testid`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`testid`,`qnid`), ADD KEY `qnid_s` (`qnid_s`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`stdid`), ADD UNIQUE KEY `stdname` (`stdname`);

--
-- Indexes for table `studentquestion`
--
ALTER TABLE `studentquestion`
  ADD PRIMARY KEY (`stdid`,`testid`,`qnid`), ADD KEY `testid` (`testid`,`qnid`);

--
-- Indexes for table `studenttest`
--
ALTER TABLE `studenttest`
  ADD PRIMARY KEY (`stdid`,`testid`), ADD KEY `testid` (`testid`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subid`), ADD UNIQUE KEY `subname` (`subname`), ADD KEY `subject_fk1` (`tcid`);

--
-- Indexes for table `subj_question`
--
ALTER TABLE `subj_question`
  ADD PRIMARY KEY (`qnid_s`), ADD KEY `subid` (`subid`), ADD KEY `subid_2` (`subid`), ADD KEY `level` (`level`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`testid`), ADD UNIQUE KEY `testname` (`testname`), ADD KEY `test_fk1` (`subid`), ADD KEY `test_fk2` (`tcid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `stdid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=349;
--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `subid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT for table `subj_question`
--
ALTER TABLE `subj_question`
  MODIFY `qnid_s` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3704;
--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `testid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=50;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
