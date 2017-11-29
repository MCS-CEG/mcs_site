-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 10, 2016 at 07:33 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mcs_final`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_insert_student` (IN `reg_no_ip` VARCHAR(20), IN `fname_ip` VARCHAR(50), IN `lname_ip` VARCHAR(50), IN `dob_ip` DATE, IN `mail_id_ip` VARCHAR(255), IN `mobile_no_ip` VARCHAR(20), IN `hometown_ip` VARCHAR(100), IN `pincode_ip` VARCHAR(10), IN `address_ip` VARCHAR(255), IN `blood_group_ip` VARCHAR(10), IN `hobby_ip` VARCHAR(100), IN `gender_ip` VARCHAR(15), IN `batch_desc_ip` VARCHAR(5), IN `branch_desc_ip` VARCHAR(30), IN `sem_ip` INT, IN `percentage1_ip` FLOAT, IN `med_of_inst1_ip` VARCHAR(30), IN `board1_ip` VARCHAR(20), IN `percentage2_ip` FLOAT, IN `med_of_inst2_ip` VARCHAR(30), IN `board2_ip` VARCHAR(20))  BEGIN
	SET @regulation_id =(SELECT `regulation_id` FROM `batch` WHERE `batch_desc` = batch_desc_ip);
    	SET @batch_id = (SELECT `batch_id` FROM `batch` WHERE `batch_desc` = batch_desc_ip );
	SET @branch_id= (SELECT `branch_id` FROM `branch` WHERE `branch_desc` = branch_desc_ip);
	SET @placement_status_id = (SELECT `placement_status_id` FROM `placement_status` WHERE `placement_status` = 'NONE');
	INSERT INTO `student` (`reg_no`,`first_name`,`last_name`,`dob`,`mail_id`,`mobile_no`,`hometown`,`pincode`,`address`,`blood_group`,`hobby`,`gender`,`batch_id`,`branch_id`,`placement_status_id`, `credits_earned`,`history_of_arrears`)
	VALUES 
	(reg_no_ip,fname_ip,lname_ip,dob_ip,mail_id_ip,mobile_no_ip,hometown_ip,pincode_ip,address_ip,blood_group_ip,hobby_ip,gender_ip,@batch_id,@branch_id,@placement_status_id,0,'NO');
	INSERT INTO `schooling_profile`
	(`reg_no`,`course`,`percentage`,`medium_of_instruction`,`board`) VALUES
	(reg_no_ip,'10 STD',percentage1_ip,med_of_inst1_ip,board1_ip),
	(reg_no_ip,'12 STD',percentage2_ip,med_of_inst2_ip,board2_ip);
	SET @sem_counter = 1;
	WHILE (@sem_counter <= 10)
	DO 
	INSERT INTO `college_profile`
	(`reg_no`,`sem`)
	VALUES
	(reg_no_ip,@sem_counter);
    SET @sem_counter = @sem_counter +1;
	END WHILE; 
	INSERT INTO `result`
	(`reg_no`,`subject_id`,`result_published`,`subject_taken_on`)
	SELECT reg_no_ip,`subject_id`,'NO',`sem` FROM `subject` WHERE `regulation_id` = @regulation_id AND `branch_id` = @branch_id AND  `sem` IS NOT NULL ;
	

 END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `access_levels`
--

CREATE TABLE `access_levels` (
  `access_level_id` int(11) NOT NULL,
  `access_level_desc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `achievements`
--

CREATE TABLE `achievements` (
  `achievement_id` int(11) NOT NULL,
  `reg_no` varchar(15) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `ach_sub_category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ach_category`
--

CREATE TABLE `ach_category` (
  `ach_category_id` int(11) NOT NULL,
  `ach_category_desc` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ach_sub_category`
--

CREATE TABLE `ach_sub_category` (
  `ach_sub_category_id` int(11) NOT NULL,
  `ach_sub_category_desc` varchar(100) NOT NULL,
  `ach_category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `alumni`
--

CREATE TABLE `alumni` (
  `reg_no` varchar(15) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `email_id` varchar(255) NOT NULL,
  `contact_no` varchar(15) DEFAULT NULL,
  `company` varchar(200) DEFAULT NULL,
  `created_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

CREATE TABLE `batch` (
  `batch_id` int(11) NOT NULL,
  `batch_desc` varchar(10) NOT NULL,
  `current_sem` int(11) NOT NULL,
  `regulation_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `batch`
--

INSERT INTO `batch` (`batch_id`, `batch_desc`, `current_sem`, `regulation_id`) VALUES
(6, '2001', -1, 3),
(7, '2002', -1, 3),
(8, '2003', -1, 3),
(9, '2004', -1, 3),
(10, '2005', -1, 3),
(11, '2006', -1, 3),
(12, '2017', -1, 3),
(13, '2008', -1, 3),
(14, '2009', -1, 3),
(15, '2010', -1, 1),
(16, '2011', -1, 1),
(17, '2012', -1, 1),
(18, '2013', -1, 1),
(19, '2014', -1, 1),
(20, '2015', -1, 2),
(21, '2016', -1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `branch_id` int(11) NOT NULL,
  `branch_code` varchar(10) NOT NULL,
  `branch_desc` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`branch_id`, `branch_code`, `branch_desc`) VALUES
(1, 'CS', 'Computer Science'),
(2, 'IT', 'Information Technology');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_desc` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `college_profile`
--

CREATE TABLE `college_profile` (
  `reg_no` varchar(15) DEFAULT NULL,
  `sem` int(11) NOT NULL,
  `cgpa` float DEFAULT NULL,
  `gpa` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `college_profile`
--

INSERT INTO `college_profile` (`reg_no`, `sem`, `cgpa`, `gpa`) VALUES
('2013242022', 1, NULL, NULL),
('2013242022', 2, NULL, NULL),
('2013242022', 3, NULL, NULL),
('2013242022', 4, NULL, NULL),
('2013242022', 5, NULL, NULL),
('2013242022', 6, NULL, NULL),
('2013242022', 7, NULL, NULL),
('2013242022', 8, NULL, NULL),
('2013242022', 9, NULL, NULL),
('2013242022', 10, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `column`
--

CREATE TABLE `column` (
  `menu_name` varchar(100) DEFAULT NULL,
  `form_name` varchar(100) DEFAULT NULL,
  `column_name` varchar(100) DEFAULT NULL,
  `required_or_not` int(11) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `company_id` int(11) NOT NULL,
  `company_desc` varchar(100) NOT NULL,
  `mail_id` varchar(255) NOT NULL,
  `contact_no` varchar(15) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `min_cgpa` float NOT NULL,
  `history_of_arrear_flag` varchar(5) NOT NULL,
  `max_no_of_arrears` int(11) DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `result_considered_until` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE `grade` (
  `grade_id` int(11) NOT NULL,
  `grade_desc` varchar(10) NOT NULL,
  `regulation_id` int(11) DEFAULT NULL,
  `grade_value` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grade`
--

INSERT INTO `grade` (`grade_id`, `grade_desc`, `regulation_id`, `grade_value`) VALUES
(1, 'S', 1, 10),
(2, 'A', 1, 9),
(3, 'B', 1, 8),
(4, 'C', 1, 7),
(5, 'D', 1, 6),
(6, 'E', 1, 5.5),
(7, 'U', 1, 0),
(8, 'O+', 2, 10),
(9, 'O', 2, 9.5),
(10, 'A+', 2, 9),
(11, 'A', 2, 8.5),
(12, 'B+', 2, 8),
(13, 'B', 2, 7.5);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `language_id` int(11) NOT NULL,
  `language_desc` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE `links` (
  `link_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `link_desc` varchar(500) NOT NULL,
  `link_subject` varchar(100) NOT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `link_category_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `link_category`
--

CREATE TABLE `link_category` (
  `link_category_id` int(11) NOT NULL,
  `link_category_desc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `login_id` varchar(15) NOT NULL,
  `password` varchar(20) NOT NULL,
  `access_level_id` int(11) DEFAULT NULL,
  `email_id` varchar(255) NOT NULL,
  `reg_no` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `login_temp`
--

CREATE TABLE `login_temp` (
  `login_id` varchar(15) NOT NULL,
  `temp_password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mail_details`
--

CREATE TABLE `mail_details` (
  `company_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `template_id` int(11) DEFAULT NULL,
  `template_modified` int(11) NOT NULL,
  `sent_mail` varchar(2500) DEFAULT NULL,
  `entry_owner` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mail_templates`
--

CREATE TABLE `mail_templates` (
  `template_id` int(11) NOT NULL,
  `template_desc` varchar(2500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `news_feed`
--

CREATE TABLE `news_feed` (
  `category_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `priority_id` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `place` varchar(100) DEFAULT NULL,
  `desc` varchar(500) NOT NULL,
  `batch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `placement_details`
--

CREATE TABLE `placement_details` (
  `reg_no` varchar(15) DEFAULT NULL,
  `sem` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `placement_status`
--

CREATE TABLE `placement_status` (
  `placement_status_id` int(11) NOT NULL,
  `placement_status` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `placement_status`
--

INSERT INTO `placement_status` (`placement_status_id`, `placement_status`) VALUES
(1, 'NONE'),
(2, '7TH SEM'),
(3, '10TH SEM'),
(4, 'PLACED');

-- --------------------------------------------------------

--
-- Table structure for table `priority`
--

CREATE TABLE `priority` (
  `priority_id` int(11) NOT NULL,
  `priority_desc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `project_id` int(11) NOT NULL,
  `reg_no` varchar(15) DEFAULT NULL,
  `project_title` varchar(100) NOT NULL,
  `synopsis` varchar(500) NOT NULL,
  `languages_used` varchar(500) NOT NULL,
  `tools_used` varchar(1000) NOT NULL,
  `os` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `regulation`
--

CREATE TABLE `regulation` (
  `regulation_id` int(11) NOT NULL,
  `regulation_year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `regulation`
--

INSERT INTO `regulation` (`regulation_id`, `regulation_year`) VALUES
(1, 2010),
(2, 2015),
(3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `reg_no` varchar(15) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `grade` varchar(10) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `result_id` int(11) NOT NULL,
  `result_published` varchar(10) NOT NULL,
  `subject_taken_on` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`reg_no`, `subject_id`, `grade`, `created_date`, `updated_date`, `result_id`, `result_published`, `subject_taken_on`) VALUES
('2013242022', 27, NULL, NULL, NULL, 1, 'NO', 5),
('2013242022', 28, NULL, NULL, NULL, 2, 'NO', 6),
('2013242022', 29, NULL, NULL, NULL, 3, 'NO', 6),
('2013242022', 30, NULL, NULL, NULL, 4, 'NO', 8),
('2013242022', 31, NULL, NULL, NULL, 5, 'NO', 8),
('2013242022', 32, NULL, NULL, NULL, 6, 'NO', 9),
('2013242022', 33, NULL, NULL, NULL, 7, 'NO', 9);

-- --------------------------------------------------------

--
-- Table structure for table `result_audit`
--

CREATE TABLE `result_audit` (
  `reg_no` varchar(15) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `old_grade` varchar(10) NOT NULL,
  `new_grade` varchar(10) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `sem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resume`
--

CREATE TABLE `resume` (
  `resume_id` int(11) NOT NULL,
  `reg_no` varchar(15) DEFAULT NULL,
  `resume_link` varchar(1000) NOT NULL,
  `sem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resume_templates`
--

CREATE TABLE `resume_templates` (
  `resume_template_id` int(11) NOT NULL,
  `sem` int(11) NOT NULL,
  `resume_link` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `schooling_profile`
--

CREATE TABLE `schooling_profile` (
  `reg_no` varchar(15) DEFAULT NULL,
  `course` varchar(30) DEFAULT NULL,
  `percentage` float DEFAULT NULL,
  `medium_of_instruction` varchar(10) DEFAULT NULL,
  `board` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schooling_profile`
--

INSERT INTO `schooling_profile` (`reg_no`, `course`, `percentage`, `medium_of_instruction`, `board`) VALUES
('2013242022', '10 STD', 90.5, 'English', 'State board'),
('2013242022', '12 STD', 92, 'tamil', 'CBSE');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL,
  `staff_desc` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `reg_no` varchar(15) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `mail_id` varchar(255) NOT NULL,
  `mobile_no` varchar(15) NOT NULL,
  `hometown` varchar(200) NOT NULL,
  `pincode` varchar(10) NOT NULL,
  `address` varchar(200) NOT NULL,
  `blood_group` varchar(15) NOT NULL,
  `hobby` varchar(100) NOT NULL,
  `gender` varchar(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `placement_status_id` int(11) NOT NULL,
  `credits_earned` int(11) NOT NULL,
  `history_of_arrears` varchar(5) NOT NULL,
  `changed_sem` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`reg_no`, `first_name`, `last_name`, `dob`, `mail_id`, `mobile_no`, `hometown`, `pincode`, `address`, `blood_group`, `hobby`, `gender`, `branch_id`, `batch_id`, `placement_status_id`, `credits_earned`, `history_of_arrears`, `changed_sem`) VALUES
('2013242022', 'sabhari', 'karthik', '1995-11-17', 'adgmani@gmail.com', '8056020198', 'ramnad', '600116', 'north car street', 'AB+', 'writing', 'male', 2, 18, 1, 0, 'NO', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `subject_id` int(11) NOT NULL,
  `subject_code` varchar(10) NOT NULL,
  `subject_desc` varchar(100) NOT NULL,
  `sem` int(11) DEFAULT NULL,
  `regulation_id` int(11) DEFAULT NULL,
  `credits` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`subject_id`, `subject_code`, `subject_desc`, `sem`, `regulation_id`, `credits`, `branch_id`) VALUES
(2, 'a', 'A', 1, 2, 3, 1),
(3, 'b', 'B', 1, 2, 4, 1),
(4, 'c', 'C', 2, 2, 3, 1),
(5, 'd', 'D', 2, 2, 4, 1),
(6, 'e', 'E', 3, 2, 3, 1),
(7, 'f', 'F', 3, 2, 4, 1),
(8, 'g', 'G', 4, 2, 3, 1),
(9, 'h', 'H', 4, 2, 4, 1),
(10, 'i', 'I', 5, 2, 3, 2),
(11, 'j', 'J', 5, 2, 4, 2),
(12, 'k', 'K', 6, 2, 3, 2),
(13, 'l', 'L', 6, 2, 4, 2),
(14, 'm', 'M', 8, 2, 3, 2),
(15, 'n', 'N', 8, 2, 4, 2),
(16, 'o', 'O', 9, 2, 3, 2),
(17, 'p', 'P', 9, 2, 4, 2),
(18, 'aa', 'AA', 1, 1, 3, 1),
(19, 'bb', 'BB', 1, 1, 4, 1),
(20, 'cc', 'CC', 2, 1, 3, 1),
(21, 'dd', 'DD', 2, 1, 4, 1),
(22, 'ee', 'EE', 3, 1, 3, 1),
(23, 'ff', 'FF', 3, 1, 4, 1),
(24, 'gg', 'GG', 4, 1, 3, 1),
(25, 'hh', 'HH', 4, 1, 4, 1),
(26, 'ii', 'II', 5, 1, 3, 1),
(27, 'jj', 'JJ', 5, 1, 4, 2),
(28, 'kk', 'KK', 6, 1, 3, 2),
(29, 'll', 'LL', 6, 1, 4, 2),
(30, 'mm', 'MM', 8, 1, 3, 2),
(31, 'nn', 'NN', 8, 1, 4, 2),
(32, 'oo', 'OO', 9, 1, 3, 2),
(33, 'pp', 'PP', 9, 1, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `subject_handling`
--

CREATE TABLE `subject_handling` (
  `subject_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tools`
--

CREATE TABLE `tools` (
  `tool_id` int(11) NOT NULL,
  `tool_desc` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `type_id` int(11) NOT NULL,
  `type_desc` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `willingness_table`
--

CREATE TABLE `willingness_table` (
  `company_id` int(11) DEFAULT NULL,
  `reg_no` varchar(15) DEFAULT NULL,
  `willingness` varchar(10) DEFAULT 'YES'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_levels`
--
ALTER TABLE `access_levels`
  ADD PRIMARY KEY (`access_level_id`);

--
-- Indexes for table `achievements`
--
ALTER TABLE `achievements`
  ADD PRIMARY KEY (`achievement_id`),
  ADD KEY `fk_regno_student_achievements` (`reg_no`),
  ADD KEY `fk_achsubcatid_achsubcat_achievements` (`ach_sub_category_id`);

--
-- Indexes for table `ach_category`
--
ALTER TABLE `ach_category`
  ADD PRIMARY KEY (`ach_category_id`);

--
-- Indexes for table `ach_sub_category`
--
ALTER TABLE `ach_sub_category`
  ADD PRIMARY KEY (`ach_sub_category_id`),
  ADD KEY `fk_catid_achcategory_achsubcat` (`ach_category_id`);

--
-- Indexes for table `alumni`
--
ALTER TABLE `alumni`
  ADD KEY `fk_regno_student_alumni` (`reg_no`);

--
-- Indexes for table `batch`
--
ALTER TABLE `batch`
  ADD PRIMARY KEY (`batch_id`),
  ADD KEY `fk_regulationid_regulation_batch` (`regulation_id`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`branch_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `college_profile`
--
ALTER TABLE `college_profile`
  ADD KEY `fk_regno_student_collegeprofile` (`reg_no`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`),
  ADD KEY `fk_batchid_batch_company` (`batch_id`);

--
-- Indexes for table `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`grade_id`),
  ADD KEY `fk_regulationid_regulation_grade` (`regulation_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`language_id`);

--
-- Indexes for table `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `fk_catid_category_links` (`category_id`),
  ADD KEY `fk_batchid_batch_links` (`batch_id`),
  ADD KEY `fk_linkcatid_linkcategory_links` (`link_category_id`),
  ADD KEY `fk_staffid_staff_links` (`staff_id`);

--
-- Indexes for table `link_category`
--
ALTER TABLE `link_category`
  ADD PRIMARY KEY (`link_category_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`login_id`),
  ADD KEY `fk_accesslvlid_accesslvl_login` (`access_level_id`),
  ADD KEY `fk_regno_student_login` (`reg_no`);

--
-- Indexes for table `login_temp`
--
ALTER TABLE `login_temp`
  ADD PRIMARY KEY (`login_id`);

--
-- Indexes for table `mail_details`
--
ALTER TABLE `mail_details`
  ADD KEY `fk_companyid_company_maildtls` (`company_id`),
  ADD KEY `fk_templateid_template_maildtls` (`template_id`),
  ADD KEY `fk_entryowner_login_maildtls` (`entry_owner`);

--
-- Indexes for table `mail_templates`
--
ALTER TABLE `mail_templates`
  ADD PRIMARY KEY (`template_id`);

--
-- Indexes for table `news_feed`
--
ALTER TABLE `news_feed`
  ADD KEY `fk_catid_category_newsfeed` (`category_id`),
  ADD KEY `fk_typeid_type_newsfeed` (`type_id`),
  ADD KEY `fk_priorityid_priority_newsfeed` (`priority_id`),
  ADD KEY `fk_batchid_batch_newsfeed` (`batch_id`);

--
-- Indexes for table `placement_details`
--
ALTER TABLE `placement_details`
  ADD KEY `fk_companyid_company_plcmntdtls` (`company_id`),
  ADD KEY `fk_regno_student_plcmntdtls` (`reg_no`);

--
-- Indexes for table `placement_status`
--
ALTER TABLE `placement_status`
  ADD PRIMARY KEY (`placement_status_id`);

--
-- Indexes for table `priority`
--
ALTER TABLE `priority`
  ADD PRIMARY KEY (`priority_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`project_id`),
  ADD KEY `fk_regno_student_projects` (`reg_no`);

--
-- Indexes for table `regulation`
--
ALTER TABLE `regulation`
  ADD PRIMARY KEY (`regulation_id`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`result_id`),
  ADD KEY `fk_regno_student_result` (`reg_no`),
  ADD KEY `fk_subid_subject_result` (`subject_id`);

--
-- Indexes for table `result_audit`
--
ALTER TABLE `result_audit`
  ADD KEY `fk_regno_student_resultaudit` (`reg_no`),
  ADD KEY `fk_subid_subject_resultaudit` (`subject_id`);

--
-- Indexes for table `resume`
--
ALTER TABLE `resume`
  ADD PRIMARY KEY (`resume_id`),
  ADD KEY `fk_regno_student_resume` (`reg_no`);

--
-- Indexes for table `resume_templates`
--
ALTER TABLE `resume_templates`
  ADD PRIMARY KEY (`resume_template_id`);

--
-- Indexes for table `schooling_profile`
--
ALTER TABLE `schooling_profile`
  ADD KEY `fk_regno_student_schoolingprofile` (`reg_no`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`reg_no`),
  ADD KEY `fk_batchid_batch_student` (`batch_id`),
  ADD KEY `fk_branchid_branch_student` (`branch_id`),
  ADD KEY `fk_plstatusid_plstatus_stu` (`placement_status_id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subject_id`),
  ADD KEY `fk_regulationid_regulation_subject` (`regulation_id`),
  ADD KEY `fk_branchid_branch_subject` (`branch_id`);

--
-- Indexes for table `subject_handling`
--
ALTER TABLE `subject_handling`
  ADD KEY `fk_subid_subject_subjecthandling` (`subject_id`),
  ADD KEY `fk_staffid_staff_subjecthandling` (`staff_id`),
  ADD KEY `fk_batchid_batch_subjecthandling` (`batch_id`);

--
-- Indexes for table `tools`
--
ALTER TABLE `tools`
  ADD PRIMARY KEY (`tool_id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `willingness_table`
--
ALTER TABLE `willingness_table`
  ADD KEY `fk_regno_student_willingness` (`reg_no`),
  ADD KEY `fk_companyid_company_willingness` (`company_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access_levels`
--
ALTER TABLE `access_levels`
  MODIFY `access_level_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `achievements`
--
ALTER TABLE `achievements`
  MODIFY `achievement_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ach_category`
--
ALTER TABLE `ach_category`
  MODIFY `ach_category_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ach_sub_category`
--
ALTER TABLE `ach_sub_category`
  MODIFY `ach_sub_category_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `batch`
--
ALTER TABLE `batch`
  MODIFY `batch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `grade`
--
ALTER TABLE `grade`
  MODIFY `grade_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `language_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `link_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `link_category`
--
ALTER TABLE `link_category`
  MODIFY `link_category_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mail_templates`
--
ALTER TABLE `mail_templates`
  MODIFY `template_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `placement_status`
--
ALTER TABLE `placement_status`
  MODIFY `placement_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `priority`
--
ALTER TABLE `priority`
  MODIFY `priority_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `regulation`
--
ALTER TABLE `regulation`
  MODIFY `regulation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `result_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `resume`
--
ALTER TABLE `resume`
  MODIFY `resume_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `resume_templates`
--
ALTER TABLE `resume_templates`
  MODIFY `resume_template_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `tools`
--
ALTER TABLE `tools`
  MODIFY `tool_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `achievements`
--
ALTER TABLE `achievements`
  ADD CONSTRAINT `fk_achsubcatid_achsubcat_achievements` FOREIGN KEY (`ach_sub_category_id`) REFERENCES `ach_sub_category` (`ach_sub_category_id`),
  ADD CONSTRAINT `fk_regno_student_achievements` FOREIGN KEY (`reg_no`) REFERENCES `student` (`reg_no`);

--
-- Constraints for table `ach_sub_category`
--
ALTER TABLE `ach_sub_category`
  ADD CONSTRAINT `fk_catid_achcategory_achsubcat` FOREIGN KEY (`ach_category_id`) REFERENCES `ach_category` (`ach_category_id`);

--
-- Constraints for table `alumni`
--
ALTER TABLE `alumni`
  ADD CONSTRAINT `fk_regno_student_alumni` FOREIGN KEY (`reg_no`) REFERENCES `student` (`reg_no`);

--
-- Constraints for table `batch`
--
ALTER TABLE `batch`
  ADD CONSTRAINT `fk_regulationid_regulation_batch` FOREIGN KEY (`regulation_id`) REFERENCES `regulation` (`regulation_id`);

--
-- Constraints for table `college_profile`
--
ALTER TABLE `college_profile`
  ADD CONSTRAINT `fk_regno_student_collegeprofile` FOREIGN KEY (`reg_no`) REFERENCES `student` (`reg_no`);

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `fk_batchid_batch_company` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`batch_id`);

--
-- Constraints for table `grade`
--
ALTER TABLE `grade`
  ADD CONSTRAINT `fk_regulationid_regulation_grade` FOREIGN KEY (`regulation_id`) REFERENCES `regulation` (`regulation_id`);

--
-- Constraints for table `links`
--
ALTER TABLE `links`
  ADD CONSTRAINT `fk_batchid_batch_links` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`batch_id`),
  ADD CONSTRAINT `fk_catid_category_links` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `fk_linkcatid_linkcategory_links` FOREIGN KEY (`link_category_id`) REFERENCES `link_category` (`link_category_id`),
  ADD CONSTRAINT `fk_staffid_staff_links` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`);

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `fk_accesslvlid_accesslvl_login` FOREIGN KEY (`access_level_id`) REFERENCES `access_levels` (`access_level_id`),
  ADD CONSTRAINT `fk_regno_student_login` FOREIGN KEY (`reg_no`) REFERENCES `student` (`reg_no`);

--
-- Constraints for table `mail_details`
--
ALTER TABLE `mail_details`
  ADD CONSTRAINT `fk_companyid_company_maildtls` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`),
  ADD CONSTRAINT `fk_entryowner_login_maildtls` FOREIGN KEY (`entry_owner`) REFERENCES `login` (`login_id`),
  ADD CONSTRAINT `fk_templateid_template_maildtls` FOREIGN KEY (`template_id`) REFERENCES `mail_templates` (`template_id`);

--
-- Constraints for table `news_feed`
--
ALTER TABLE `news_feed`
  ADD CONSTRAINT `fk_batchid_batch_newsfeed` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`batch_id`),
  ADD CONSTRAINT `fk_catid_category_newsfeed` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `fk_priorityid_priority_newsfeed` FOREIGN KEY (`priority_id`) REFERENCES `priority` (`priority_id`),
  ADD CONSTRAINT `fk_typeid_type_newsfeed` FOREIGN KEY (`type_id`) REFERENCES `type` (`type_id`);

--
-- Constraints for table `placement_details`
--
ALTER TABLE `placement_details`
  ADD CONSTRAINT `fk_companyid_company_plcmntdtls` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`),
  ADD CONSTRAINT `fk_regno_student_plcmntdtls` FOREIGN KEY (`reg_no`) REFERENCES `student` (`reg_no`);

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `fk_regno_student_projects` FOREIGN KEY (`reg_no`) REFERENCES `student` (`reg_no`);

--
-- Constraints for table `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `fk_regno_student_result` FOREIGN KEY (`reg_no`) REFERENCES `student` (`reg_no`),
  ADD CONSTRAINT `fk_subid_subject_result` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`);

--
-- Constraints for table `result_audit`
--
ALTER TABLE `result_audit`
  ADD CONSTRAINT `fk_regno_student_resultaudit` FOREIGN KEY (`reg_no`) REFERENCES `student` (`reg_no`),
  ADD CONSTRAINT `fk_subid_subject_resultaudit` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`);

--
-- Constraints for table `resume`
--
ALTER TABLE `resume`
  ADD CONSTRAINT `fk_regno_student_resume` FOREIGN KEY (`reg_no`) REFERENCES `student` (`reg_no`);

--
-- Constraints for table `schooling_profile`
--
ALTER TABLE `schooling_profile`
  ADD CONSTRAINT `fk_regno_student_schoolingprofile` FOREIGN KEY (`reg_no`) REFERENCES `student` (`reg_no`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `fk_batchid_batch_student` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`batch_id`),
  ADD CONSTRAINT `fk_branchid_branch_student` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`),
  ADD CONSTRAINT `fk_plstatusid_plstatus_stu` FOREIGN KEY (`placement_status_id`) REFERENCES `placement_status` (`placement_status_id`);

--
-- Constraints for table `subject`
--
ALTER TABLE `subject`
  ADD CONSTRAINT `fk_branchid_branch_subject` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`),
  ADD CONSTRAINT `fk_regulationid_regulation_subject` FOREIGN KEY (`regulation_id`) REFERENCES `regulation` (`regulation_id`);

--
-- Constraints for table `subject_handling`
--
ALTER TABLE `subject_handling`
  ADD CONSTRAINT `fk_batchid_batch_subjecthandling` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`batch_id`),
  ADD CONSTRAINT `fk_staffid_staff_subjecthandling` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`),
  ADD CONSTRAINT `fk_subid_subject_subjecthandling` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`);

--
-- Constraints for table `willingness_table`
--
ALTER TABLE `willingness_table`
  ADD CONSTRAINT `fk_companyid_company_willingness` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`),
  ADD CONSTRAINT `fk_regno_student_willingness` FOREIGN KEY (`reg_no`) REFERENCES `student` (`reg_no`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
