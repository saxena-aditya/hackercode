-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2019 at 02:13 PM
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
-- Table structure for table `hc_chapters`
--

CREATE TABLE `hc_chapters` (
  `id` int(11) NOT NULL,
  `ch_c_code` varchar(1000) NOT NULL,
  `ch_code` varchar(700) NOT NULL,
  `ch_name` text NOT NULL,
  `ch_is_active` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hc_chapters`
--

INSERT INTO `hc_chapters` (`id`, `ch_c_code`, `ch_code`, `ch_name`, `ch_is_active`) VALUES
(20, 'NNFWGP', 'KADDTV4', 'Introduction ', 1),
(21, 'AXXDZK', 'WPAS2Z5', 'What are Dockers', 1),
(22, 'G666BU', 'I9OLJ6R', 'Intro ', 1),
(23, 'QE2OIU', 'VVJK7LW', 'Intro ', 1),
(24, 'EHJOOP', '8T42QEH', 'Intro ', 1),
(25, '0XQD4I', 'FR319S3', 'asdasdsad', 1),
(26, '5IFWY7', 'NGK2SFT', 'asdasdsad', 1),
(27, '9L6HEX', '0HZOKEP', 'asdasdsad', 1),
(28, '9L6HEX', '46JJ6R5', 'dsadad', 1),
(29, 'HLR5VQ', 'ZI85J9M', 'asdasd', 1),
(30, 'ANI8XO', 'I30XKCU', '', 1),
(31, 'JX0CCA', 'ZE1JK80', 'cHAPTER -1 ', 1),
(32, 'VZEHI0', 'F9OQVYE', 'sadg', 1),
(33, 'V2AF2V', '86TRWZG', 'Sample Chapter', 1),
(34, 'I65O5F', 'LNMNQIU', 'NEW CHAPTER', 1),
(35, 'G005LG', 'U6VLHE0', 'new Course CHAPTER', 1),
(36, 'G005LG', 'TROVB85', 'NEW CHAPTER', 1),
(37, 'OM1PMB', 'ZVF7DD7', 'chapter - 2', 1),
(38, 'OM1PMB', 'AT2LAF7', 'chapter - 4', 1),
(39, 'OMK27Z', 'A6BB0J1', 'chapter - 2', 1),
(40, 'OMK27Z', 'X2K1RRD', 'chapter - 4', 1),
(41, 'N3PDIT', 'A50PZ74', 'my new lesson -11', 1),
(42, 'N3PDIT', 'TXXHCVB', 'mu new chapter 2', 1),
(43, 'GX0EDV', 'KCWY441', 'my new lesson -1', 1),
(44, 'GX0EDV', '5Y3AR7O', 'mu new chapter 2', 1),
(45, 'JTE1MP', 'UEI13WP', 'my new lesson -1', 1),
(46, 'JTE1MP', '5CE15CD', 'mu new chapter 2', 1),
(47, '84UE5Q', 'I9ZW9RH', 'my new chapter 2', 1),
(48, 'PBVXOY', 'ZZUH26O', 'new chapter ', 1),
(49, 'WAD71Q', '64RBTJI', 'new chapter ', 1),
(50, '12ATW4', 'TARFP32', 'sdas', 1),
(51, '583NWV', '1PBJ8VM', 'asdasd', 1),
(52, 'CD31ZO', '17RSH60', 'asdasdas', 1),
(53, '8LFH1F', 'NAV5VIJ', 'asdasdsadsad', 1),
(54, '8LFH1F', '2SV5CWW', 'adssadsad', 1),
(55, 'NC2ORW', 'EBPNYZN', '213214 sdsd', 1),
(56, 'NC2ORW', '4OZ3CRT', '32sadfsdf', 1),
(57, 'XSF4IM', 'V6M3FFA', '32sadfsdf', 1),
(58, 'Q1QIDD', '7DGR2B7', 'asdsa322', 1),
(59, 'Q1QIDD', '47MRWM8', 'sad ', 1),
(60, 'AKC158', 'UO5K388', 'adsad23e', 1),
(61, 'AKC158', '1W5O1LV', 'asd213', 1),
(62, '7C79KF', 'KA5VGHQ', 'adsad23eewrwer', 1),
(63, '7C79KF', 'X1989RK', 'asd213ewrwer', 1),
(64, 'P6EH0Q', 'O2GLY25', 'adsad23eewrwer234', 1),
(65, 'P6EH0Q', 'PAHLWPI', 'asd213ewrwer234', 1),
(66, 'XNXKOG', 'G0CU3VE', 'ds3', 1),
(67, 'XNXKOG', 'XKCG8SZ', 'asdasd234', 1),
(68, 'HO6P5A', 'QMMG26R', 'MY FIRST CHAPTER ', 1),
(69, 'HO6P5A', 'OYF87QC', 'MY SECOND CHAPTER', 1),
(70, 'T9MFC0', 'WO8ZYK3', 'Testing Chapter -1 - edit', 1),
(71, '4QUF2R', '09VHFQT', 'Chapter - 1', 1),
(72, '4QUF2R', 'OC5I6ND', 'New Chapter - 2', 1),
(73, '4QUF2R', '09VHFQT', 'Chapter - 1', 1),
(74, '4QUF2R', 'OC5I6ND', 'New Chapter - 2', 1),
(75, '4QUF2R', '09VHFQT', 'Chapter - 1', 1),
(76, '4QUF2R', '09VHFQT', 'Chapter - 1', 1),
(77, '4QUF2R', 'OC5I6ND', 'New Chapter - 2', 1),
(78, '4QUF2R', 'OC5I6ND', 'New Chapter - 2', 1),
(79, '4QUF2R', '09VHFQT', 'Chapter - 1', 1),
(80, '4QUF2R', 'OC5I6ND', 'New Chapter - 2', 1),
(81, '4QUF2R', '09VHFQT', 'Chapter - 1', 1),
(82, '4QUF2R', '09VHFQT', 'Chapter - 1', 1),
(83, '4QUF2R', '09VHFQT', 'Chapter - 1', 1),
(84, '4QUF2R', 'OC5I6ND', 'New Chapter - 2', 1),
(85, '4QUF2R', 'OC5I6ND', 'New Chapter - 2', 1),
(86, '4QUF2R', 'OC5I6ND', 'New Chapter - 2', 1),
(87, 'T9MFC0', 'SFAEHO', 'nW CHAASDF', 1),
(88, 'T9MFC0', '57EgIU', 'mY NEW CHAPTER', 1),
(89, 'T9MFC0', '+boTCzs', 'sfdafseaf', 1),
(90, 'T9MFC0', '+boTCzs', 'sfdafseaf', 1),
(91, 'T9MFC0', '+KXmVJo', 'asdfsgf ewrafweSDAFASDFSDAFSAF', 1),
(92, 'T9MFC0', '+boTCzs', 'sfdafseaf', 1),
(93, 'T9MFC0', '+boTCzs', 'sfdafseaf', 1),
(94, 'T9MFC0', '+KXmVJo', 'asdfsgf ewrafweSDAFASDFSDAFSAF', 1),
(95, 'V2AF2V', '+0TRc5T', 'New chapter  -234', 1),
(96, 'V2AF2V', '+0TRc5T', 'New chapter  -234', 1),
(97, 'V2AF2V', '+4IotDv', 'sfasfd', 1),
(98, 'V2AF2V', '+Q76EwU', 'sadf3242354', 1),
(99, 'V2AF2V', '+SY79tE', 'FOR THE f SAKES', 1),
(100, 'V2AF2V', '+SY79tE', 'FOR THE f SAKES', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hc_counter`
--

CREATE TABLE `hc_counter` (
  `id` int(11) NOT NULL,
  `counter` int(11) NOT NULL DEFAULT '2091'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hc_counter`
--

INSERT INTO `hc_counter` (`id`, `counter`) VALUES
(1, 2117);

-- --------------------------------------------------------

--
-- Table structure for table `hc_courses`
--

CREATE TABLE `hc_courses` (
  `id` int(11) NOT NULL,
  `c_code` text NOT NULL,
  `c_name` text NOT NULL,
  `c_price` int(5) NOT NULL DEFAULT '500',
  `c_total_days` int(11) NOT NULL DEFAULT '10',
  `c_desc` mediumtext,
  `c_tags` varchar(500) NOT NULL DEFAULT 'Demo ',
  `c_mrp` int(5) NOT NULL DEFAULT '0',
  `c_sub_desc` text,
  `c_is_paid` int(11) NOT NULL DEFAULT '1',
  `c_is_active` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hc_courses`
--

INSERT INTO `hc_courses` (`id`, `c_code`, `c_name`, `c_price`, `c_total_days`, `c_desc`, `c_tags`, `c_mrp`, `c_sub_desc`, `c_is_paid`, `c_is_active`) VALUES
(38, 'V2AF2V', 'Sample Course', 1500, 90, 'this is a sample course', 'sample', 2000, 'this is a sample course', 1, 1),
(42, 'OMK27Z', 'New Course - 1', 1500, 60, 'this is a sample course', 'sample', 5000, 'this is a sample course', 1, 1),
(43, 'N3PDIT', 'My new course', 0, 0, '', '', 0, '', 1, 1),
(44, 'GX0EDV', 'My new course - 0', 0, 0, '', '', 0, '', 1, 1),
(45, 'JTE1MP', 'My new course - 1', 0, 0, '', '', 0, '', 1, 1),
(46, '84UE5Q', 'My new course - X', 0, 0, '', '', 0, '', 1, 1),
(47, 'PBVXOY', 'New Course - V1', 0, 0, '', '', 0, '', 1, 1),
(48, 'WAD71Q', 'New Course - V176458', 0, 0, '', '', 0, '', 1, 1),
(49, '12ATW4', 'Hackwithinfy', 0, 0, '', '', 0, '', 1, 1),
(50, '583NWV', 'asdsadasd', 0, 0, '', '', 0, '', 1, 1),
(51, 'CD31ZO', 'asdsadsadasd', 0, 0, '', '', 0, '', 1, 1),
(52, '8LFH1F', 'asdsadsadasdas23213', 0, 0, '', '', 0, '', 1, 1),
(53, 'NC2ORW', 'asdasdasdsa22', 0, 0, '', '', 0, '', 1, 1),
(54, 'XSF4IM', 'asdasdasdsa221', 0, 0, '', '', 0, '', 1, 1),
(55, 'Q1QIDD', 'Newst Course', 0, 0, '', '', 0, '', 1, 1),
(56, 'AKC158', 'sadasdsadasdasd', 0, 0, '', '', 0, '', 1, 1),
(57, '7C79KF', 'sadasdsadasdasdewrwer', 0, 0, '', '', 0, '', 1, 1),
(58, 'P6EH0Q', 'sadasdsadasdasdewrwer324', 0, 0, '', '', 0, '', 1, 1),
(59, 'XNXKOG', 'Delete Support ', 0, 0, '', '', 0, '', 1, 1),
(60, 'HO6P5A', 'Delete Support 3', 0, 0, '', '', 0, '', 1, 1),
(61, 'T9MFC0', 'My New Course For Testing ', 0, 0, '', '', 0, '', 1, 1),
(62, '4QUF2R', 'My brand new course', 1500, 90, 'This course is helpful in preparing the students of <b>B.Tech & MCA for placement opportunities through HackWithInfy</b> competition.\nHackWithInfy is a hackathon organised by Infosys started in 2018 through which candidates have opportunity to get hired for 2 roles\n<ol>\n<li>System Programmer Specialist: Package 8LPA</li>\n<li>Power Programmer: Package 5LPA</li>\n</ol>\nThrough HackWithInfy candidate have opportinity to appear in 3 rounds for hiring as below:\n<ul>\n<li>Round-1: Take from home coding test having 3 questions</li>\n<li>Round-2: Take from home coding test of advanced level having 3 questions again</li>\n<li>Round-3: Face-to-Face Interviews</li>\n</ul>\nThis course consists of the following:\n<ol>\n<li>All concepts required for solving the programming questions</li>\n<li>Previous year HackWithInfy programming questions</li>      \n<li>Online mock interview preparation</li>\n</ol>     ', 'Web Development ', 2000, 'This course is helpful in preparing the students of <b>B.Tech & MCA for placement opportunities through HackWithInfy</b> competition.\nHackWithInfy is a hackathon organised by Infosys started in 2018 through which candidates have opportunity to get hired for 2 roles', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hc_lessons`
--

CREATE TABLE `hc_lessons` (
  `id` int(11) NOT NULL,
  `l_code` varchar(100) NOT NULL,
  `l_c_code` varchar(1000) NOT NULL,
  `l_ch_code` text NOT NULL,
  `l_name` text NOT NULL,
  `l_resource` text NOT NULL,
  `l_duration` varchar(100) NOT NULL DEFAULT '10',
  `l_is_active` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hc_lessons`
--

INSERT INTO `hc_lessons` (`id`, `l_code`, `l_c_code`, `l_ch_code`, `l_name`, `l_resource`, `l_duration`, `l_is_active`) VALUES
(1, 'B9L7UO1', 'N3PDIT', 'A50PZ74', 'My new chapter - 2', 'https://do4k6lnx3y4m9.cloudfront.net/1559245490512_Annotation-2019-05-11-170417.png', '', 1),
(2, 'PUROLNQ', 'N3PDIT', 'TXXHCVB', 'exe', 'https://do4k6lnx3y4m9.cloudfront.net/1559245490513_Inspiron_7472_7572_1.1.9.exe', '', 1),
(3, 'TT9HCPM', 'N3PDIT', 'TXXHCVB', 'exe', 'https://do4k6lnx3y4m9.cloudfront.net/1559245490513_lie-to-me-major-project-2019.zip', '', 1),
(4, '8F24B9M', 'GX0EDV', 'KCWY441', 'My new chapter - 2', 'https://do4k6lnx3y4m9.cloudfront.net/1559245637260_Annotation-2019-05-11-170417.png', '', 1),
(5, '54ZHEJ8', 'GX0EDV', '5Y3AR7O', 'exe', 'https://do4k6lnx3y4m9.cloudfront.net/1559245637261_Inspiron_7472_7572_1.1.9.exe', '', 1),
(6, 'X0XLMS0', 'JTE1MP', 'UEI13WP', 'My new chapter - 2', 'https://do4k6lnx3y4m9.cloudfront.net/1559245707739_Annotation-2019-05-11-170417.png', '', 1),
(7, 'BZND9H9', 'JTE1MP', 'UEI13WP', 'My new chapter - 2', 'https://do4k6lnx3y4m9.cloudfront.net/1559245707739_lie-to-me-major-project-2019.zip', '', 1),
(8, 'UTILQVC', 'JTE1MP', '5CE15CD', 'exe', 'https://do4k6lnx3y4m9.cloudfront.net/1559245707739_Inspiron_7472_7572_1.1.9.exe', '', 1),
(9, 'T8MSXLP', '84UE5Q', 'I9ZW9RH', 'New lesson ', 'https://do4k6lnx3y4m9.cloudfront.net/1559245964963_lie-to-me-major-project-2019.zip', '', 1),
(10, 'SYF0IKR', '84UE5Q', 'I9ZW9RH', 'New lesson ', 'https://do4k6lnx3y4m9.cloudfront.net/1559245995713_lie-to-me-major-project-2019.zip', '', 1),
(11, '88W0X5E', '84UE5Q', 'I9ZW9RH', 'New lesson ', 'https://do4k6lnx3y4m9.cloudfront.net/1559245999731_lie-to-me-major-project-2019.zip', '', 1),
(12, 'JP7FGI7', '84UE5Q', 'I9ZW9RH', 'New lesson ', 'https://do4k6lnx3y4m9.cloudfront.net/1559246001671_lie-to-me-major-project-2019.zip', '', 1),
(13, 'CE6PIVT', 'PBVXOY', 'ZZUH26O', 'new lesson', 'https://do4k6lnx3y4m9.cloudfront.net/1559246298007_lie-to-me-major-project-2019.zip', '', 1),
(14, 'PWAW6KN', 'WAD71Q', '64RBTJI', 'new lesson', 'https://do4k6lnx3y4m9.cloudfront.net/1559246325157_lie-to-me-major-project-2019.zip', '', 1),
(15, 'FHBF7HW', '12ATW4', 'TARFP32', 'asd', 'https://do4k6lnx3y4m9.cloudfront.net/1559246504423_Introduction_HackWithInfy.mp4', '', 1),
(16, 'WIUP5TD', 'CD31ZO', '17RSH60', 'sadsadsadasd', 'https://do4k6lnx3y4m9.cloudfront.net/1559398992971_SampleVideo_1280x720_2mb.mp4', '13.0', 1),
(17, 'QSH1OLT', 'CD31ZO', '17RSH60', 'sadsadsadasd', 'https://do4k6lnx3y4m9.cloudfront.net/1559399908579_SampleVideo_1280x720_2mb.mp4', '13.0', 1),
(18, '69ZHR2Z', 'NC2ORW', 'EBPNYZN', 'sdasd234', 'https://do4k6lnx3y4m9.cloudfront.net/1559400238682_SampleVideo_1280x720_2mb.mp4', '13.0', 1),
(19, '41UW03Z', 'NC2ORW', '4OZ3CRT', 'frddfssr', 'https://do4k6lnx3y4m9.cloudfront.net/1559400238683_video-demo.mp4', '13.0', 1),
(20, 'CBY3IQD', 'Q1QIDD', '7DGR2B7', '324234sd', 'https://do4k6lnx3y4m9.cloudfront.net/1559400599967_video-demo.mp4', '13.0', 1),
(21, 'V2BFVHM', 'Q1QIDD', '47MRWM8', 'asd', 'https://do4k6lnx3y4m9.cloudfront.net/1559400599967_SampleVideo_1280x720_2mb.mp4', '13.0', 1),
(22, 'F76BB1M', 'AKC158', 'UO5K388', '234324', 'https://do4k6lnx3y4m9.cloudfront.net/1559401000812_SampleVideo_1280x720_2mb.mp4', '13.0', 1),
(23, '7BHG8WI', 'AKC158', '1W5O1LV', '21323eas', 'https://do4k6lnx3y4m9.cloudfront.net/1559401000813_video-demo.mp4', '13.0', 1),
(24, 'N7OKQLU', 'AKC158', 'UO5K388', '234324', 'https://do4k6lnx3y4m9.cloudfront.net/1559401000812_SampleVideo_1280x720_2mb.mp4', '13.0', 1),
(25, '8DDR8OJ', 'AKC158', '1W5O1LV', '21323eas', 'https://do4k6lnx3y4m9.cloudfront.net/1559401000813_video-demo.mp4', '13.0', 1),
(26, 'SA9F6AZ', '7C79KF', 'KA5VGHQ', '234324ewrwer', 'https://do4k6lnx3y4m9.cloudfront.net/1559402080017_SampleVideo_1280x720_2mb.mp4', '13.0', 1),
(27, 'DWACNUW', '7C79KF', 'X1989RK', '21323easewrewr', 'https://do4k6lnx3y4m9.cloudfront.net/1559402080018_video-demo.mp4', '13.0', 1),
(28, 'MD3K59W', 'P6EH0Q', 'O2GLY25', '234324ewrwer324', 'https://do4k6lnx3y4m9.cloudfront.net/1559402463687_SampleVideo_1280x720_2mb.mp4', '13.0', 1),
(29, 'O88NCU8', 'P6EH0Q', 'PAHLWPI', '21323easewrewr234', 'https://do4k6lnx3y4m9.cloudfront.net/1559402463688_video-demo.mp4', '13.0', 1),
(30, 'IB3DKVP', 'XNXKOG', 'G0CU3VE', '3d', 'https://do4k6lnx3y4m9.cloudfront.net/1559402979619_video-demo.mp4', '13.0', 1),
(31, 'YU2WT19', 'XNXKOG', 'XKCG8SZ', '324234324', 'https://do4k6lnx3y4m9.cloudfront.net/1559402979620_video-demo---Copy-(4).mp4', '13.0', 1),
(32, 'XG8XHBI', 'XNXKOG', 'G0CU3VE', '3d', 'https://do4k6lnx3y4m9.cloudfront.net/1559402979619_video-demo.mp4', '13.0', 1),
(33, 'F5S303N', 'XNXKOG', 'XKCG8SZ', '324234324', 'https://do4k6lnx3y4m9.cloudfront.net/1559402979620_video-demo---Copy-(4).mp4', '13.0', 1),
(34, 'CXG24WJ', 'HO6P5A', 'QMMG26R', 'MY FIRST LESSON', 'https://do4k6lnx3y4m9.cloudfront.net/1559403141788_video-demo.mp4', '13.0', 1),
(35, '8MV4IBX', 'HO6P5A', 'OYF87QC', 'MY FIRST LESSON', 'https://do4k6lnx3y4m9.cloudfront.net/1559403141789_video-demo---Copy-(4).mp4', '13.0', 1),
(36, 'Q59TIFG', 'T9MFC0', 'WO8ZYK3', 'Testing lesson -1 edit', 'https://do4k6lnx3y4m9.cloudfront.net/1559654007994_video-demo.mp4', '13.0', 1),
(37, '0XIU94R', 'T9MFC0', 'WO8ZYK3', 'Testing Lesson -2', 'https://do4k6lnx3y4m9.cloudfront.net/1559654007996_video-demo---Copy-(4).mp4', '13.0', 1),
(38, 'OFNJTLO', '4QUF2R', '09VHFQT', 'Lesson -1 ', 'https://do4k6lnx3y4m9.cloudfront.net/1559816924068_video-demo.mp4', '13.0', 1),
(39, 'SCS7KJI', '4QUF2R', '09VHFQT', 'Lesson -2', 'https://do4k6lnx3y4m9.cloudfront.net/1559816924068_video-demo---Copy.mp4', '13.0', 1),
(40, 'BV1UQXY', '4QUF2R', 'OC5I6ND', 'Chapter 2 Lesson 1', 'https://do4k6lnx3y4m9.cloudfront.net/1559816924068_video-demo---Copy-(3).mp4', '13.0', 1),
(41, 'Y9PBABT', '4QUF2R', 'OC5I6ND', 'Chapter 2 lesson 2', 'https://do4k6lnx3y4m9.cloudfront.net/1559816924069_video-demo---Copy-(2).mp4', '13.0', 1),
(42, 'JXQ9NG9', 'T9MFC0', 'WO8ZYK3', 'nE WLRASJP', '1559835337522_video-demo---Copy-(3).mp4', '13.0', 1),
(43, 'MrhYDqh', 'T9MFC0', 'SFAEHO', 'SDFSAFR', '1559835611004_video-demo---Copy-(3).mp4', '13.0', 1),
(44, 'G8p4Qaa', 'T9MFC0', '57EgIU', 'sasad', '1559835787775_video-demo---Copy-(3).mp4', '13.0', 1),
(45, 'JYfjlsB', 'T9MFC0', '4ischD', 'sad wr;kjhwgqufdgwairfudyh', '1559835818034_video-demo---Copy-(3).mp4', '13.0', 1),
(46, 'CzG3h5D', 'T9MFC0', '45tUYM', 'asdASD', '1559835999701_video-demo---Copy-(3).mp4', '13.0', 1),
(47, '63vAuBj', 'T9MFC0', '57EgIU', 'ASDASDSAD', '1559836045743_video-demo---Copy-(2).mp4', '13.0', 1),
(48, 'Qe8nJHs', 'T9MFC0', 'AI6bcc', 'ASDASD', '1559836157941_video-demo---Copy-(3).mp4', '13.0', 1),
(49, 'J1Wzg0b', 'T9MFC0', 'xmITS7', 'adasdasd', '1559836253188_video-demo---Copy-(3).mp4', '13.0', 1),
(50, '+7FUgjhZ', 'T9MFC0', '+KXmVJo', 'sdf34r543WERWRWERWERWERWER', '1559836853838_video-demo---Copy-(2).mp4', '13.0', 1),
(51, '+hsVFmBi', 'T9MFC0', '+KXmVJo', 'dfsadfsdf', '1559836853838_video-demo---Copy-(4).mp4', '13.0', 1),
(52, '+n8q6EOw', 'T9MFC0', '+boTCzs', 'saf 123', '1559836884948_video-demo---Copy-(3).mp4', '13.0', 1),
(53, '+gtOBacI', 'V2AF2V', '86TRWZG', 'new lesson ', '1559836975355_video-demo---Copy-(3).mp4', '13.0', 1),
(54, '+7EbZt59', 'V2AF2V', '+0TRc5T', 'New Lesson New Lesson', '1559837004260_video-demo---Copy-(4).mp4', '13.0', 1),
(55, '+j2EacAN', 'V2AF2V', '+4IotDv', 'sdfasdf', '1559837519921_video-demo---Copy-(2).mp4', '13.0', 1),
(56, '+xAFfJjH', 'V2AF2V', '+Q76EwU', '2341324we', '1559837547622_video-demo---Copy.mp4', '13.0', 1),
(57, '+h8vCVYa', 'V2AF2V', '+Q76EwU', 'New LESSON ', '1559837623044_video-demo---Copy-(4).mp4', '13.0', 1),
(58, '+h8vCVYa', 'V2AF2V', '+Q76EwU', 'New LESSON ', '1559837658686_video-demo---Copy-(4).mp4', '13.0', 1),
(59, '+qzcHAro', 'V2AF2V', '+SY79tE', 'f DAKES', '1559837658686_video-demo---Copy-(2).mp4', '13.0', 1),
(60, '+qzcHAro', 'V2AF2V', '+SY79tE', 'f DAKES', '1559837686700_video-demo---Copy-(2).mp4', '13.0', 1),
(61, '+h8vCVYa', 'V2AF2V', '+Q76EwU', 'New LESSON ', '1559837686700_video-demo---Copy-(4).mp4', '13.0', 1),
(62, '+qaeXpNy', 'V2AF2V', '+SY79tE', 'SFSF', '1559837686700_video-demo.mp4', '13.0', 1),
(63, '+FXQPSyX', 'V2AF2V', '+SY79tE', 'R4EYT45', '1559837686700_video-demo---Copy-(2).mp4', '13.0', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hc_lesson_track`
--

CREATE TABLE `hc_lesson_track` (
  `lt_id` int(11) NOT NULL,
  `lt_username` varchar(500) NOT NULL,
  `lt_ch_code` varchar(10) NOT NULL,
  `lt_ln_code` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hc_lesson_track`
--

INSERT INTO `hc_lesson_track` (`lt_id`, `lt_username`, `lt_ch_code`, `lt_ln_code`) VALUES
(1, 'adityasaxena602@gmail.com', '', 'F2TZTI3'),
(2, 'adityasaxena602@gmail.com', 'EHJOOP', 'F2TZTI3'),
(3, 'adityasaxena602@gmail.com', '9L6HEX', 'W16GHY9');

-- --------------------------------------------------------

--
-- Table structure for table `hc_programs`
--

CREATE TABLE `hc_programs` (
  `p_id` int(11) NOT NULL,
  `p_name` varchar(255) NOT NULL,
  `p_code` varchar(255) DEFAULT NULL,
  `p_student_count` int(11) DEFAULT '0',
  `p_is_active` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hc_programs`
--

INSERT INTO `hc_programs` (`p_id`, `p_name`, `p_code`, `p_student_count`, `p_is_active`) VALUES
(1, 'GATE', 'GTE101', 0, 1),
(2, 'COCUBES', 'CO101', 0, 1),
(3, 'SIMPLE', 'SMP101', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hc_questions`
--

CREATE TABLE `hc_questions` (
  `q_question_id` int(11) NOT NULL,
  `q_set_id` varchar(50) DEFAULT NULL,
  `q_tag` varchar(100) DEFAULT NULL,
  `q_type` varchar(100) DEFAULT NULL,
  `q_content` longtext NOT NULL,
  `q_max_marks` int(11) NOT NULL,
  `q_negative_marks` int(11) NOT NULL,
  `q_options` text,
  `q_ans` text NOT NULL,
  `q_scope` enum('PUBLIC','PRIVATE','DEMO','PRACTICE') DEFAULT 'PUBLIC'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hc_questions`
--

INSERT INTO `hc_questions` (`q_question_id`, `q_set_id`, `q_tag`, `q_type`, `q_content`, `q_max_marks`, `q_negative_marks`, `q_options`, `q_ans`, `q_scope`) VALUES
(52, 'Aptitude', 'Aptitude', 'TEXT', 'if A+B = 4 and B = 7 then A=?', 5, 1, '1,2,3,4', '3', 'PUBLIC'),
(53, 'Logical', 'Aptitude', 'TEXT', 'Excluding stoppages, the speed of a bus is 54 kmph and including stoppages, it is 45 kmph. For how many minutes does the bus stop per hour?\"', 5, 1, '9,10,12,20', '10', 'PUBLIC'),
(54, 'Aptitude', 'Aptitude', NULL, '<p>The average speed of a train in the onward journey is 25% more than that in the return journey. The train halts for one hour on reaching the destination. The total time taken for the complete to and from journey is 17 hours, covering a distance of 800 km. The speed of the train in the onward journey is:<br></p>', 4, 0, '2,56,7,2', '56', 'PUBLIC'),
(55, 'Logical', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC'),
(56, 'Aptitude', 'LOGIC', 'TEXT', 'The average speed of a train in the onward journey is 25% more than that in the return journey. The train halts for one hour on reaching the destination. The total time taken for the complete to and from journey is 17 hours, covering a distance of 800 km. The speed of the train in the onward journey is:', 4, 1, '2,56,7,2', '56', 'PUBLIC'),
(57, 'Aptitude', 'LOGIC', 'TEXT', 'The average speed of a train in the onward journey is 25% more than that in the return journey. The train halts for one hour on reaching the destination. The total time taken for the complete to and from journey is 17 hours, covering a distance of 800 km. The speed of the train in the onward journey is:', 4, 1, '2,56,7,2', '56', 'PUBLIC'),
(58, 'Logical', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC'),
(59, 'Reasoning', 'REASONING', 'TEXT', 'Three persons are walking from a place A to another place B. Their speeds are in the ratio of 4 : 3 : 5. The time ratio to reach B by these persons will be :', 5, 2, '23,44,22,67,32', '44', 'PUBLIC'),
(60, 'Reasoning', 'REASONING', 'TEXT', 'Three persons are walking from a place A to another place B. Their speeds are in the ratio of 4 : 3 : 5. The time ratio to reach B by these persons will be :', 5, 2, '23,44,22,67,32', '44', 'PUBLIC'),
(61, 'Reasoning', 'REASONING', 'TEXT', 'Three persons are walking from a place A to another place B. Their speeds are in the ratio of 4 : 3 : 5. The time ratio to reach B by these persons will be :', 5, 2, '23,44,22,67,32', '44', 'PUBLIC'),
(62, 'Logical', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC'),
(63, 'Logical', 'NUMERIC', 'TEXT', 'Walking (6/7) th of his usual speed, a man is 12 minutes too late. The usual time taken by him to cover that distance is:', 5, 3, '4,5,6,7', '5', 'PUBLIC'),
(64, 'Quantitative Aptitude', 'Logical', 'TEXT', 'If simple interest on a certain sum of money for 8 years at 4% per annum is same as the simple interest on Rs. 560 for 8 years at the rate of 12% per annum then the sum of money is', 3, 1, 'Rs.1820,Rs.1040,Rs.1120,Rs.1680', 'Rs.1680', 'PUBLIC'),
(65, 'Quantitative Aptitude', 'Mathematical Aptitude', 'TEXT', 'A certain sum in invested for T years. It amounts to Rs. 400 at 10% per annum. But when invested at 4% per annum, it amounts to Rs. 200. Find the time (T) in years.', 3, 1, '45,60,40,50', '50', 'PUBLIC'),
(66, 'Quantitative Aptitude', 'Reasoning', 'TEXT', 'A sum of Rs. 1550 was lent partly at 5% and partly at 8% p.a. simple interest. The total interest received after 3 years was Rs. 300. The ratio of the money lent at 5% to that lent at 8% is:', 3, 1, '16:15,15:16,15:8,8:15', '16:15', 'PUBLIC'),
(67, 'Quantitative Aptitude', 'Logical', 'TEXT', 'The effective annual rate of interest corresponding to a nominal rate of 6% per annum payable half-yearly is:', 3, 1, '6.07%,6.08%,6.06%,6.09%', '6.09%', 'PUBLIC'),
(68, 'Quantitative Aptitude', 'Logical', 'TEXT', 'The difference between simple interest and compound interest in rupees on Rs. 2400 for one year at 10% per annum reckoned half-yearly is:', 3, 1, '4,6,3,2', '6', 'PUBLIC'),
(69, 'Quantitative Aptitude', 'Reasoning', 'TEXT', 'On a certain sum of money, the simple interest for 2 years is Rs. 200 at the rate of 7% per annum. Find the difference in C.I. and S.I.', 3, 1, '9,10,11,None of these.', '10', 'PUBLIC'),
(70, 'Quantitative Aptitude', 'Mathematical Aptitude', 'TEXT', 'P can do a piece of work in 15 days and Q can do the same work in 20 days. If they can work together for 4 days, what is the fraction of work left?', 3, 1, '8/15,7/15,11/15,2/11', '8/15', 'PUBLIC'),
(71, 'Quantitative Aptitude', 'Logical', 'TEXT', 'P can lay railway track between two stations in 16 days. Q can do the same job in 12 days. With the help of R, they complete the job in 4 days. How much days does it take for R alone to complete the work?', 3, 1, '9(3/5),9(1/5),9(2/5),10', '9(3/5)', 'PUBLIC'),
(72, 'Quantitative Aptitude', 'Reasoning', 'TEXT', 'A can do a particular work in 6 days . B can do the same work in 8 days. A and B signed to do it for Rs. 3200. They completed the work in 3 days with the help of C. How much is to be paid to C?', 3, 1, '380,600,420,400', '400', 'PUBLIC'),
(73, 'Quantitative Aptitude', 'Mathematical Aptitude', 'TEXT', 'Machine P can print one lakh books in 8 hours. Machine Q can print the same number of books in 10 hours while machine R can print the same in 12 hours. All the machines started printing at 9 A.M. Machine P is stopped at 11 A.M. and the remaining two machines complete work. Approximately at what time will the printing of one lakh books be completed?', 3, 1, '3:00PM,2:00PM,1:00PM,11:00AM', '1:00PM', 'PUBLIC'),
(74, 'Computer Science', 'Technical', 'TEXT', 'Which data structure is required for Breadth First Traversal on a graph?', 3, 1, 'Stack,Array,Queue,Tree', 'Queue', 'PUBLIC'),
(75, 'Computer Science', 'Technical', 'TEXT', 'What data structure would you mostly likely see in a non recursive implementation of a recursive algorithm?', 3, 1, 'Linked List,Stack,Queue,Tree', 'Stack', 'PUBLIC'),
(76, 'Computer Science', 'Technical', 'TEXT', 'Assume that the operators +, -, × are left associative and ^ is right associative. The order of precedence (from highest to lowest) is ^, x , +, -. The postfix expression corresponding to the infix expression a + b× c - d ^ e ^ f is', 3, 1, 'abc× + def ^ ^ -,abc× + de ^ f ^ -,ab + c× d - e ^ f ^,- + a× bc ^ ^ def', 'abc× + def ^ ^ -', 'PUBLIC'),
(77, 'Computer Science', 'Technical', 'TEXT', 'In a circular queue, how do you increment the rear end of the queue?', 3, 1, 'rear++,(rear+1) % CAPACITY,(rear % CAPACITY)+1,rear--\n', '(rear+1) % CAPACITY', 'PUBLIC'),
(78, 'Computer Science', 'Technical', 'TEXT', 'Minimum number of queues to implement stack is ______.', 3, 1, '3,4,1,2', '2', 'PUBLIC');

-- --------------------------------------------------------

--
-- Table structure for table `hc_resources`
--

CREATE TABLE `hc_resources` (
  `id` int(11) NOT NULL,
  `r_name` varchar(500) NOT NULL,
  `r_source` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `marks` int(11) DEFAULT NULL,
  `isFinished` tinyint(1) NOT NULL DEFAULT '0',
  `tt_maxMarks` bigint(255) DEFAULT '0',
  `tt_date` varchar(50) DEFAULT 'CURRENT_TIMESTAMP'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hc_temp_test`
--

INSERT INTO `hc_temp_test` (`id`, `tt_user_id`, `tt_test_id`, `tt_time_remaining`, `tt_ans_object`, `marks`, `isFinished`, `tt_maxMarks`, `tt_date`) VALUES
(24, '23', '83', '9048000', '{\"52\":{\"answer\":\"3\",\"status\":\"visited\",\"answered\":true},\"53\":{\"answer\":\"12\",\"status\":\"visited\",\"answered\":true},\"54\":{\"answer\":\"56\",\"status\":\"visited\",\"answered\":true},\"55\":{\"answer\":\"7\",\"status\":\"visited\",\"answered\":true},\"56\":{\"answer\":\"7\",\"status\":\"visited\",\"answered\":true},\"57\":{\"status\":\"visited\",\"answered\":true,\"answer\":\"56\"},\"58\":{\"answer\":\"4\",\"status\":\"visited\",\"answered\":true},\"59\":{\"answer\":\"44\",\"status\":\"visited\",\"answered\":true},\"60\":{\"answer\":\"22\",\"status\":\"visited\",\"answered\":true},\"61\":{\"status\":\"normal\",\"answered\":false},\"62\":{\"answer\":\"5\",\"status\":\"visited\",\"answered\":true},\"63\":{\"status\":\"visited\",\"answered\":true,\"answer\":\"5\"}}', 18, 1, 57, '2019-11-12'),
(25, '42', '83', '10746000', '{\"52\":{\"answer\":\"2\",\"status\":\"visited\",\"answered\":true},\"53\":{\"answer\":\"10\",\"status\":\"visited\",\"answered\":true},\"54\":{\"answer\":\"56\",\"status\":\"visited\",\"answered\":true},\"55\":{\"answer\":\"5\",\"status\":\"visited\",\"answered\":true},\"56\":{\"answer\":\"56\",\"status\":\"visited\",\"answered\":true},\"57\":{\"status\":\"normal\",\"answered\":false},\"58\":{\"answer\":\"6\",\"status\":\"visited\",\"answered\":true},\"59\":{\"answer\":\"23\",\"status\":\"visited\",\"answered\":true},\"60\":{\"answer\":\"44\",\"status\":\"visited\",\"answered\":true},\"61\":{\"status\":\"normal\",\"answered\":false},\"62\":{\"answer\":\"6\",\"status\":\"visited\",\"answered\":true},\"63\":{\"status\":\"normal\",\"answered\":false}}', 5, 1, 57, '2019-54-22');

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
  `t_file_path` varchar(1000) DEFAULT NULL,
  `t_is_active` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hc_tests`
--

INSERT INTO `hc_tests` (`t_id`, `t_name`, `t_associated_program`, `t_user_id`, `t_test_code`, `t_test_password`, `t_start_time`, `t_end_time`, `t_total_time`, `t_is_time_strict`, `t_is_ans_shuffle`, `t_file_path`, `t_is_active`) VALUES
(83, 'NEW TEST ', 'V2AF2V', 'admin@admin.com', 'BISHOP', 'bishop', '2019-05-21 19:57:22', '2019-01-01 18:30:00', 10800000, '1', '1', NULL, 1),
(84, 'New Test', '4QUF2R', 'admin@admin.com', 'TCS4567', '9090', '2019-01-01 18:30:00', '2019-01-31 18:31:00', 11400000, '1', '1', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hc_test_questions`
--

CREATE TABLE `hc_test_questions` (
  `tq_id` int(11) NOT NULL,
  `tq_test_id` varchar(100) NOT NULL,
  `tq_question_id` varchar(100) NOT NULL,
  `tq_is_active` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hc_test_questions`
--

INSERT INTO `hc_test_questions` (`tq_id`, `tq_test_id`, `tq_question_id`, `tq_is_active`) VALUES
(1, '60', '14', 1),
(2, '60', '15', 1),
(3, '60', '16', 1),
(4, '60', '17', 1),
(5, '60', '18', 1),
(6, '60', '19', 1),
(7, '60', '20', 1),
(8, '60', '21', 1),
(9, '60', '22', 1),
(10, '60', '23', 1),
(11, '60', '24', 1),
(12, '60', '25', 1),
(14, '61', '27', 1),
(15, '61', '28', 1),
(16, '61', '29', 1),
(17, '61', '30', 1),
(18, '61', '31', 1),
(19, '61', '32', 1),
(20, '61', '33', 1),
(21, '61', '34', 1),
(22, '61', '35', 1),
(23, '61', '36', 1),
(24, '61', '37', 1),
(25, '61', '38', 1),
(26, '61', '39', 1),
(27, '62', '40', 1),
(28, '62', '41', 1),
(29, '62', '42', 1),
(30, '62', '43', 1),
(31, '62', '44', 1),
(32, '62', '45', 1),
(33, '62', '46', 1),
(34, '62', '47', 1),
(35, '62', '48', 1),
(36, '62', '49', 1),
(37, '62', '50', 1),
(38, '62', '51', 1),
(39, '83', '52', 1),
(40, '83', '53', 1),
(41, '83', '54', 1),
(42, '83', '55', 1),
(43, '83', '56', 1),
(44, '83', '57', 1),
(45, '83', '58', 1),
(46, '83', '59', 1),
(47, '83', '60', 1),
(48, '83', '61', 1),
(49, '83', '62', 1),
(50, '83', '63', 1),
(51, '84', '64', 1),
(52, '84', '65', 1),
(53, '84', '66', 1),
(54, '84', '67', 1),
(55, '84', '68', 1),
(56, '84', '69', 1),
(57, '84', '70', 1),
(58, '84', '71', 1),
(59, '84', '72', 1),
(60, '84', '73', 1),
(61, '84', '74', 1),
(62, '84', '75', 1),
(63, '84', '76', 1),
(64, '84', '77', 1),
(65, '84', '78', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hc_transactions`
--

CREATE TABLE `hc_transactions` (
  `id` int(11) NOT NULL,
  `t_username` varchar(500) NOT NULL,
  `course_code` varchar(10) NOT NULL,
  `bank_name` varchar(500) DEFAULT NULL,
  `bank_txn_id` varchar(500) DEFAULT NULL,
  `currency` varchar(100) DEFAULT NULL,
  `gateway_name` varchar(500) DEFAULT NULL,
  `mid` varchar(500) DEFAULT NULL,
  `order_id` varchar(500) DEFAULT NULL,
  `payment_mode` varchar(500) DEFAULT NULL,
  `resp_code` varchar(5) DEFAULT NULL,
  `resp_msg` varchar(500) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `txn_amount` varchar(10) DEFAULT NULL,
  `txn_date` varchar(500) DEFAULT NULL,
  `txn_id` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hc_transactions`
--

INSERT INTO `hc_transactions` (`id`, `t_username`, `course_code`, `bank_name`, `bank_txn_id`, `currency`, `gateway_name`, `mid`, `order_id`, `payment_mode`, `resp_code`, `resp_msg`, `status`, `txn_amount`, `txn_date`, `txn_id`) VALUES
(1, 'adityasaxena602@gmail.com', 'courseCode', NULL, NULL, NULL, NULL, NULL, 'ORDER_FJBGPC8XS9', NULL, NULL, NULL, NULL, NULL, '', NULL),
(2, 'admin', 'courseCode', NULL, NULL, NULL, NULL, NULL, 'ORDER_ZRGXBCNYK9', NULL, NULL, NULL, NULL, NULL, '', NULL),
(3, 'admin', 'courseCode', NULL, NULL, NULL, NULL, NULL, 'ORDER_PRC3L7P34B', NULL, NULL, NULL, NULL, NULL, '', NULL),
(4, 'admin', 'courseCode', 'WALLET', '6845901', 'INR', 'WALLET', 'uytcBp59542228260983', 'ORDER_WGDEVELLGR', NULL, '01', 'Txn Success', 'TXN_SUCCESS', '500.00', '2019-05-07 17:13:29.0', '20190507111212800110168022500475061'),
(5, 'adityasaxena602@gmail.com', '3EC6LS', 'WALLET', '6846033', 'INR', 'WALLET', 'uytcBp59542228260983', 'ORDER_XSQGIFA5DL', NULL, '01', 'Txn Success', 'TXN_SUCCESS', '600.00', '2019-05-07 17:21:16.0', '20190507111212800110168831500469280'),
(6, 'adityasaxena602@gmail.com', '9FE2RB', 'WALLET', '6846248', 'INR', 'WALLET', 'uytcBp59542228260983', 'ORDER_FAM4BM7KIY', 'PPI', '01', 'Txn Success', 'TXN_SUCCESS', '600.00', '2019-05-07 17:42:18.0', '20190507111212800110168364500469717'),
(7, 'adityasaxena602@gmail.com', 'QUGXNO', 'WALLET', '6846382', 'INR', 'WALLET', 'uytcBp59542228260983', 'ORDER_FOQSCNKZ9F', 'PPI', '01', 'Txn Success', 'TXN_SUCCESS', '500.00', '2019-05-07 17:51:30.0', '20190507111212800110168675000478872'),
(8, 'adityasaxena602@gmail.com', '3EC6LS', NULL, NULL, NULL, NULL, NULL, 'ORDER_45HOPTN14L', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'adityasaxena602@gmail.com', '3EC6LS', NULL, NULL, NULL, NULL, NULL, 'ORDER_KNILVTXN5J', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'adityasaxena602@gmail.com', '5ZFHMZ', NULL, NULL, NULL, NULL, NULL, 'ORDER_KJUUTRVIU5', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'adityasaxena602@gmail.com', 'NC3F9A', 'WALLET', '6848235', 'INR', 'WALLET', 'uytcBp59542228260983', 'ORDER_L3XYFT0KS1', 'PPI', '01', 'Txn Success', 'TXN_SUCCESS', '600.00', '2019-05-07 22:35:03.0', '20190507111212800110168500100479284'),
(12, 'adityasaxena602@gmail.com', '9FE2RB', 'WALLET', '6848404', 'INR', 'WALLET', 'uytcBp59542228260983', 'ORDER_Z6YKWPSQAC', 'PPI', '01', 'Txn Success', 'TXN_SUCCESS', '600.00', '2019-05-07 23:18:11.0', '20190507111212800110168702600476381'),
(13, 'adityasaxena602@gmail.com', '5ZFHMZ', 'WALLET', '6853494', 'INR', 'WALLET', 'uytcBp59542228260983', 'ORDER_CEXCOILAWN', 'PPI', '01', 'Txn Success', 'TXN_SUCCESS', '500.00', '2019-05-08 13:35:55.0', '20190508111212800110168464300476415'),
(14, 'adityasaxena602@gmail.com', 'PNIEVH', NULL, NULL, NULL, NULL, NULL, 'ORDER_JMJHS5FFER', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'adityasaxena602@gmail.com', 'PNIEVH', 'WALLET', '6865657', 'INR', 'WALLET', 'uytcBp59542228260983', 'ORDER_9VBMOLHIO9', 'PPI', '01', 'Txn Success', 'TXN_SUCCESS', '500.00', '2019-05-09 10:08:48.0', '20190509111212800110168352900472632'),
(16, 'adityasaxena602@gmail.com', '5ZFHMZ', NULL, NULL, NULL, NULL, NULL, 'ORDER_M6KNX7AA6Z', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 'adityasaxena602@gmail.com', '9FE2RB', NULL, NULL, NULL, NULL, NULL, 'ORDER_WTZHWSZKOZ', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'adityasaxena602@gmail.com', '9LHKDY', NULL, NULL, NULL, NULL, NULL, 'ORDER_8J9SBCKVIY', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 'adityasaxena602@gmail.com', '9LHKDY', NULL, NULL, NULL, NULL, NULL, 'ORDER_VXN559NLQC', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 'adityasaxena602@gmail.com', '9LHKDY', NULL, NULL, NULL, NULL, NULL, 'ORDER_3F5Q3OOEU3', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 'adityasaxena602@gmail.com', '9LHKDY', NULL, NULL, NULL, NULL, NULL, 'ORDER_XTX9VESJX0', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 'adityasaxena602@gmail.com', '9LHKDY', NULL, NULL, NULL, NULL, NULL, 'ORDER_VUYCB5V7PG', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 'adityasaxena602@gmail.com', '9LHKDY', NULL, NULL, NULL, NULL, NULL, 'ORDER_R0QKFIP3UI', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 'adityasaxena602@gmail.com', '9LHKDY', NULL, NULL, NULL, NULL, NULL, 'ORDER_2JPT8007IA', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 'adityasaxena602@gmail.com', '9LHKDY', NULL, NULL, NULL, NULL, NULL, 'ORDER_W8ROQX04OU', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 'adityasaxena602@gmail.com', '9LHKDY', NULL, NULL, NULL, NULL, NULL, 'ORDER_KBUSHIAPV9', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 'adityasaxena602@gmail.com', '9LHKDY', NULL, NULL, NULL, NULL, NULL, 'ORDER_C86A099UDO', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 'adityasaxena602@gmail.com', '9LHKDY', NULL, NULL, NULL, NULL, NULL, 'ORDER_EA61C5YFX7', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 'adityasaxena602@gmail.com', '9LHKDY', NULL, NULL, NULL, NULL, NULL, 'ORDER_20309J3C2R', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 'adityasaxena602@gmail.com', '9LHKDY', NULL, NULL, NULL, NULL, NULL, 'ORDER_OE7D2VVNOT', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 'adityasaxena602@gmail.com', '9LHKDY', 'WALLET', '6881161', 'INR', 'WALLET', 'uytcBp59542228260983', 'ORDER_GE7JA8TZAQ', 'PPI', '01', 'Txn Success', 'TXN_SUCCESS', '2999.00', '2019-05-10 16:23:55.0', '20190510111212800110168978600486045'),
(32, 'adityasaxena602@gmail.com', '9LHKDY', NULL, NULL, NULL, NULL, NULL, 'ORDER_QRNC6CW5KG', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 'adityasaxena602@gmail.com', '9LHKDY', NULL, NULL, NULL, NULL, NULL, 'ORDER_X18EKF17SG', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 'adityasaxena602@gmail.com', '9LHKDY', 'WALLET', '6881386', 'INR', 'WALLET', 'uytcBp59542228260983', 'ORDER_RLZSKEWL65', 'PPI', '01', 'Txn Success', 'TXN_SUCCESS', '2999.00', '2019-05-10 16:35:03.0', '20190510111212800110168403900482597'),
(35, 'adityasaxena602@gmail.com', '9LHKDY', 'WALLET', '6883134', 'INR', 'WALLET', 'uytcBp59542228260983', 'ORDER_WH099ZFXG0', 'PPI', '01', 'Txn Success', 'TXN_SUCCESS', '2999.00', '2019-05-10 18:26:53.0', '20190510111212800110168378200495914'),
(36, 'asdasdasd@gmail.com', '9LHKDY', NULL, NULL, NULL, NULL, NULL, 'ORDER_ZBNH2RYU7O', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, 'adityasaxena602@gmail.com', '9LHKDY', NULL, NULL, NULL, NULL, NULL, 'ORDER_N83Z8AMP0W', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 'aditya6asd@gmail.com', '9LHKDY', NULL, NULL, NULL, NULL, NULL, 'ORDER_0HXYYMEUV0', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, 'adityasaxena602@gmail.com', '9LHKDY', NULL, NULL, NULL, NULL, NULL, 'ORDER_BPSGPBP8Y1', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 'djadkhakdj@gmail.com', '9LHKDY', 'WALLET', '6884703', 'INR', 'WALLET', 'uytcBp59542228260983', 'ORDER_U9FMXQVDX2', 'PPI', '01', 'Txn Success', 'TXN_SUCCESS', '2999.00', '2019-05-10 22:39:44.0', '20190510111212800110168813200488585'),
(41, 'adityasaxena602@gmail.com', '9LHKDY', NULL, NULL, NULL, NULL, NULL, 'ORDER_NKSEL9W0D6', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 'adityadas@gmail.com', '9LHKDY', NULL, NULL, NULL, NULL, NULL, 'ORDER_KXWOZYETSM', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 'adityasaxena602@gmail.com', '9LHKDY', NULL, NULL, NULL, NULL, NULL, 'ORDER_JB6NQDGLCT', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 'adityasaxena602@gmail.com', '9LHKDY', NULL, NULL, NULL, NULL, NULL, 'ORDER_AFLM9OHD1U', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, 'adityasaxena602@gmail.com', '9LHKDY', NULL, NULL, NULL, NULL, NULL, 'ORDER_MAYCGQJTDA', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 'adityasaxena602@gmail.com', '9LHKDY', NULL, NULL, NULL, NULL, NULL, 'ORDER_AIUEHUVFF7', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, 'adit111ya@gmail.com', '9LHKDY', NULL, NULL, NULL, NULL, NULL, 'ORDER_T9D6H8CC4P', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 'asdasdsad@gmail.com', '9LHKDY', NULL, NULL, NULL, NULL, NULL, 'ORDER_TFNS7XKC8X', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(49, 'adityasaxena602@gmail.com', '9L6HEX', 'HDFC Bank', '4036217121962950', 'INR', 'HDFC', 'uytcBp59542228260983', 'ORDER_W1AKSQTP8F', 'CC', '01', 'Txn Success', 'TXN_SUCCESS', '876868.00', '2019-05-14 00:27:56.0', '20190514111212800110168995200483024'),
(50, 'adityasaxena602@gmail.com', 'EHJOOP', 'WALLET', '6903139', 'INR', 'WALLET', 'uytcBp59542228260983', 'ORDER_E2TXFNDKE7', 'PPI', '01', 'Txn Success', 'TXN_SUCCESS', '380.00', '2019-05-14 01:46:16.0', '20190514111212800110168894500502564'),
(51, 'adityasaxena602@gmail.com', 'NNFWGP', 'WALLET', '6904826', 'INR', 'WALLET', 'uytcBp59542228260983', 'ORDER_805E6OP70F', 'PPI', '01', 'Txn Success', 'TXN_SUCCESS', '2999.00', '2019-05-14 11:12:36.0', '20190514111212800110168377700502931'),
(52, 'adityasaxena602@gmail.com', 'V2AF2V', NULL, NULL, NULL, NULL, NULL, 'ORDER_5E98ZIR8RR', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(53, 'adityasaxena602@gmail.com', 'V2AF2V', NULL, NULL, NULL, NULL, NULL, 'ORDER_3OFH5NTHNS', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, 'adityasaxena602@gmail.com', 'V2AF2V', NULL, NULL, NULL, NULL, NULL, 'ORDER_105PZ83MF6', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(55, 'adityasaxena602@gmail.com', 'V2AF2V', NULL, NULL, NULL, NULL, NULL, 'ORDER_5VX9JW0B85', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(56, 'adityasaxena602@gmail.com', 'V2AF2V', 'WALLET', '6924890', 'INR', 'WALLET', 'uytcBp59542228260983', 'ORDER_ZKH26WLS4Y', 'PPI', '01', 'Txn Success', 'TXN_SUCCESS', '1500.00', '2019-05-16 12:17:59.0', '20190516111212800110168892400508454'),
(57, 'adityasaxena602@gmail.com', 'V2AF2V', NULL, NULL, NULL, NULL, NULL, 'ORDER_C74RSQORWA', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(58, 'adityasaxena602@gmail.com', 'V2AF2V', NULL, NULL, NULL, NULL, NULL, 'ORDER_SSBPBOCW9W', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(59, 'adityasaxena602@gmail.com', 'V2AF2V', NULL, NULL, NULL, NULL, NULL, 'ORDER_TL2CI24FTM', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(60, 'aa@gmail.com', 'V2AF2V', NULL, NULL, NULL, NULL, NULL, 'ORDER_B2FQ7B12RA', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(61, 'aa@gmail.com', 'V2AF2V', NULL, NULL, NULL, NULL, NULL, 'ORDER_LZVLEHDQ1X', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(62, 'aa@gmail.com', 'V2AF2V', NULL, NULL, NULL, NULL, NULL, 'ORDER_BMK2W9O834', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(63, 'aa@gmail.com', 'V2AF2V', 'WALLET', '6968282', 'INR', 'WALLET', 'uytcBp59542228260983', 'ORDER_WS426HWC0X', 'PPI', '01', 'Txn Success', 'TXN_SUCCESS', '1500.00', '2019-05-21 23:49:30.0', '20190521111212800110168373800523941'),
(64, 'adityasaxena602@gmail.com', 'V2AF2V', NULL, NULL, NULL, NULL, NULL, 'ORDER_W94GV4F15E', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
(2, 'admin@admin.com', '21232f297a57a5a743894a0e4a801fc3'),
(3, 'sudo199', '8d3b82f990a1e59cc4ea3505d8ec0238'),
(4, 'sudo19933', '8d3b82f990a1e59cc4ea3505d8ec0238'),
(5, 'test12', '8d3b82f990a1e59cc4ea3505d8ec0238'),
(12, 'sudo2323232', '25d55ad283aa400af464c76d713c07ad'),
(13, '123user', '25d55ad283aa400af464c76d713c07ad'),
(15, 'adityasaxena602@gmail.com', '92ad11a510da635d3e8c8759e92705bb'),
(18, 'arzanr@gmail.com', '92ad11a510da635d3e8c8759e92705bb'),
(19, 'saxenaaditya69@yahoo.in', '92ad11a510da635d3e8c8759e92705bb'),
(20, 'Hkashyap890@gmail.com', '92ad11a510da635d3e8c8759e92705bb'),
(21, 'DGHASDK@GMAIL.COM', '92ad11a510da635d3e8c8759e92705bb'),
(22, 'akjdhakd@gmail.com', '92ad11a510da635d3e8c8759e92705bb'),
(23, 'asdasdad@gmail.com', '92ad11a510da635d3e8c8759e92705bb'),
(24, 'asdasdasd@gmail.com', '92ad11a510da635d3e8c8759e92705bb'),
(25, 'aditya6asd@gmail.com', '92ad11a510da635d3e8c8759e92705bb'),
(26, 'aasdrzanr@gmail.com', '92ad11a510da635d3e8c8759e92705bb'),
(27, 'djadkhakdj@gmail.com', 'fb6179ae4a8b59a14db544850b8bf597'),
(28, 'adityadas@gmail.com', '92ad11a510da635d3e8c8759e92705bb'),
(29, 'adit111ya@gmail.com', '92ad11a510da635d3e8c8759e92705bb'),
(30, 'adasd@gmail.com', '92ad11a510da635d3e8c8759e92705bb'),
(31, 'asdasdsad@gmail.com', '92ad11a510da635d3e8c8759e92705bb'),
(32, 'arzanrAA@gmail.com', '92ad11a510da635d3e8c8759e92705bb'),
(33, 'aa@gmail.com', '92ad11a510da635d3e8c8759e92705bb');

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
  `ud_role` varchar(5) NOT NULL DEFAULT '0',
  `ud_img_path` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hc_user_details`
--

INSERT INTO `hc_user_details` (`ud_id`, `ud_username`, `ud_firstname`, `ud_lastname`, `ud_institute`, `ud_email`, `ud_role`, `ud_img_path`) VALUES
(1, 'student', 'studentUpdatedasadas', 'studentUpdateasdasd', 'required', 'studentupdate122sadasda@gmail.com', '0', NULL),
(2, 'admin@admin.com', 'Aman', 'Saxena', 'Graphic Era Hill University', 'admin@admin.com', '1', 'img/160.jpg'),
(4, 'sudo199', 'sudipt', 'dabral', NULL, 'sudipt@gmail.com', '0', NULL),
(10, 'sudo19933', 'sudipt', 'dabral', NULL, 'sudipt121@gmail.com', '0', NULL),
(13, 'test12', 'sudipt', 'dabral', NULL, 'sudipt122@gmail.com', '0', NULL),
(20, 'sudo2323232', 'Sudipt', 'Dabral', NULL, 'sudiptwork1999@gmail.com', '0', NULL),
(21, '123user', 'test', 'user', NULL, 'sakdjaklsj@gmail.com', '0', NULL),
(23, 'adityasaxena602@gmail.com', 'Aman', 'Saxena', 'Graphic Era University', 'adityasaxena602@gmail.com', '0', 'img/160.jpg'),
(27, 'arzanr@gmail.com', 'Aditya ', 'Saxena', NULL, 'arzanr@gmail.com', '0', 'img/Design.svg'),
(28, 'saxenaaditya69@yahoo.in', 'Aditya ', 'Saxena', NULL, 'saxenaaditya69@yahoo.in', '0', NULL),
(29, 'Hkashyap890@gmail.com', 'Aditya ', 'Saxena', NULL, 'Hkashyap890@gmail.com', '0', NULL),
(30, 'DGHASDK@GMAIL.COM', 'Aditya ', 'Saxena', NULL, 'DGHASDK@GMAIL.COM', '0', NULL),
(31, 'akjdhakd@gmail.com', 'Aditya ', 'Saxena', NULL, 'akjdhakd@gmail.com', '0', NULL),
(32, 'asdasdad@gmail.com', 'Aditya ', 'Saxena', NULL, 'asdasdad@gmail.com', '0', NULL),
(33, 'asdasdasd@gmail.com', 'Aditya ', 'Saxena', NULL, 'asdasdasd@gmail.com', '0', NULL),
(34, 'aditya6asd@gmail.com', 'Aditya ', 'Saxena', NULL, 'aditya6asd@gmail.com', '0', NULL),
(35, 'aasdrzanr@gmail.com', 'Aditya ', 'Saxena', NULL, 'aasdrzanr@gmail.com', '0', 'img/10337.jpg'),
(36, 'djadkhakdj@gmail.com', 'Aditya ', 'Saxena', NULL, 'djadkhakdj@gmail.com', '0', NULL),
(37, 'adityadas@gmail.com', 'Aditya ', 'Saxena', NULL, 'adityadas@gmail.com', '0', NULL),
(38, 'adit111ya@gmail.com', 'Aditya ', 'Saxena', NULL, 'adit111ya@gmail.com', '0', NULL),
(39, 'adasd@gmail.com', 'Aditya ', 'Saxena', NULL, 'adasd@gmail.com', '0', NULL),
(40, 'asdasdsad@gmail.com', 'Aditya ', 'Saxena', NULL, 'asdasdsad@gmail.com', '0', NULL),
(41, 'arzanrAA@gmail.com', 'Aditya', 'Saxena', NULL, 'arzanrAA@gmail.com', '0', NULL),
(42, 'aa@gmail.com', 'Aditya 2', 'Saxena', NULL, 'aa@gmail.com', '0', 'img/chris-lawton-154388-unsplash (1).jpg');

-- --------------------------------------------------------

--
-- Table structure for table `hc_user_program`
--

CREATE TABLE `hc_user_program` (
  `up_id` int(11) NOT NULL,
  `up_username` varchar(500) NOT NULL,
  `up_code` varchar(20) NOT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  `up_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hc_user_program`
--

INSERT INTO `hc_user_program` (`up_id`, `up_username`, `up_code`, `is_paid`, `up_date`) VALUES
(25, 'adityasaxena602@gmail.com', 'V2AF2V', 1, '2019-05-16 06:48:24'),
(26, 'aa@gmail.com', 'V2AF2V', 1, '2019-05-21 18:19:51'),
(27, 'adityasaxena602@gmail.com', '4QUF2R', 1, '2019-06-08 11:13:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hc_chapters`
--
ALTER TABLE `hc_chapters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hc_counter`
--
ALTER TABLE `hc_counter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hc_courses`
--
ALTER TABLE `hc_courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hc_lessons`
--
ALTER TABLE `hc_lessons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hc_lesson_track`
--
ALTER TABLE `hc_lesson_track`
  ADD PRIMARY KEY (`lt_id`);

--
-- Indexes for table `hc_programs`
--
ALTER TABLE `hc_programs`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `hc_questions`
--
ALTER TABLE `hc_questions`
  ADD PRIMARY KEY (`q_question_id`);

--
-- Indexes for table `hc_resources`
--
ALTER TABLE `hc_resources`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `hc_test_questions`
--
ALTER TABLE `hc_test_questions`
  ADD PRIMARY KEY (`tq_id`);

--
-- Indexes for table `hc_transactions`
--
ALTER TABLE `hc_transactions`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `hc_chapters`
--
ALTER TABLE `hc_chapters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `hc_counter`
--
ALTER TABLE `hc_counter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hc_courses`
--
ALTER TABLE `hc_courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `hc_lessons`
--
ALTER TABLE `hc_lessons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `hc_lesson_track`
--
ALTER TABLE `hc_lesson_track`
  MODIFY `lt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hc_programs`
--
ALTER TABLE `hc_programs`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hc_questions`
--
ALTER TABLE `hc_questions`
  MODIFY `q_question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `hc_resources`
--
ALTER TABLE `hc_resources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `hc_tests`
--
ALTER TABLE `hc_tests`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `hc_test_questions`
--
ALTER TABLE `hc_test_questions`
  MODIFY `tq_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `hc_transactions`
--
ALTER TABLE `hc_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `hc_user`
--
ALTER TABLE `hc_user`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `hc_user_details`
--
ALTER TABLE `hc_user_details`
  MODIFY `ud_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `hc_user_program`
--
ALTER TABLE `hc_user_program`
  MODIFY `up_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hc_sets`
--
ALTER TABLE `hc_sets`
  ADD CONSTRAINT `hc_sets_ibfk_1` FOREIGN KEY (`s_test_id`) REFERENCES `hc_tests` (`t_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
