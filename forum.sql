-- phpMyAdmin SQL Dump
-- version 4.0.4.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 13, 2018 at 03:42 AM
-- Server version: 5.6.13
-- PHP Version: 5.4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `forum`
--
CREATE DATABASE IF NOT EXISTS `forum` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `forum`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `cat_id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `category_title` varchar(64) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `category_title`) VALUES
(1, 'Food Items'),
(2, 'Games'),
(3, 'Programming Languages');

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

CREATE TABLE IF NOT EXISTS `replies` (
  `reply_id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(3) unsigned NOT NULL,
  `subcategory_id` int(3) unsigned NOT NULL,
  `topic_id` int(3) unsigned NOT NULL,
  `author` varchar(16) NOT NULL,
  `comment` text NOT NULL,
  `date_posted` date NOT NULL,
  PRIMARY KEY (`reply_id`),
  KEY `category_id` (`category_id`,`subcategory_id`,`topic_id`),
  KEY `subcategory_id` (`subcategory_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE IF NOT EXISTS `subcategories` (
  `subcat_id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(3) unsigned NOT NULL,
  `subcategory_title` varchar(128) NOT NULL,
  `subcategory_desc` varchar(255) NOT NULL,
  PRIMARY KEY (`subcat_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`subcat_id`, `parent_id`, `subcategory_title`, `subcategory_desc`) VALUES
(1, 1, 'Filipino food', 'Adobo, Sinigang, Paksiw, Lechon, Sisig'),
(2, 1, 'Italian food', 'pizza, pasta, antipasti, alfredo sauce, etc etc.'),
(3, 1, 'Japanese food', 'sushi, sashimi, nigiri, raw fish, salmon, tuna'),
(4, 2, 'pubg', 'find some folks here to play against you on pubg'),
(5, 2, 'league of legends', 'find some teammates you can play with on league of legends to kick some ass'),
(6, 3, 'Java', 'this is java'),
(7, 3, 'php', 'php is life');

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE IF NOT EXISTS `topics` (
  `topic_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(3) unsigned NOT NULL,
  `subcategory_id` int(3) unsigned NOT NULL,
  `author` varchar(16) NOT NULL,
  `title` varchar(128) NOT NULL,
  `content` text NOT NULL,
  `date_posted` date NOT NULL,
  `views` int(5) unsigned NOT NULL,
  `replies` int(3) unsigned NOT NULL,
  PRIMARY KEY (`topic_id`),
  KEY `category_id` (`category_id`,`subcategory_id`),
  KEY `subcategory_id` (`subcategory_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`topic_id`, `category_id`, `subcategory_id`, `author`, `title`, `content`, `date_posted`, `views`, `replies`) VALUES
(8, 1, 1, 'admin', 'Chowking', 'Chowfan!', '2018-04-13', 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `password` varchar(64) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`) VALUES
(1, 'admin', 'admin'),
(2, 'user', '1234');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `replies`
--
ALTER TABLE `replies`
  ADD CONSTRAINT `replies_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`cat_id`),
  ADD CONSTRAINT `replies_ibfk_2` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`subcat_id`),
  ADD CONSTRAINT `replies_ibfk_3` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`topic_id`);

--
-- Constraints for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`cat_id`);

--
-- Constraints for table `topics`
--
ALTER TABLE `topics`
  ADD CONSTRAINT `topics_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`cat_id`),
  ADD CONSTRAINT `topics_ibfk_2` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`subcat_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
