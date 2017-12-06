CREATE DATABASE  IF NOT EXISTS `react_modified` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `react_modified`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: react_modified
-- ------------------------------------------------------
-- Server version	5.6.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `company_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `company_name` varchar(45) NOT NULL,
  `company_location` varchar(45) NOT NULL,
  `primary_contact_name` varchar(45) DEFAULT NULL,
  `primary_contact_email` varchar(45) DEFAULT NULL,
  `primary_contact_phone_no` varchar(20) DEFAULT NULL,
  `secondary_contact_name` varchar(45) DEFAULT NULL,
  `secondary_contact_email` varchar(45) DEFAULT NULL,
  `secondary_contact_phone_no` varchar(45) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'American Red Cross','Washington, DC','Bob Smith','bob.smith@arc.com','7703464664','','','','2017-09-18 12:18:03','2017-09-18 12:18:03'),(2,'ABC Inc.','Atlanta Georgia','Ryan Smith','ryan.smith@abc.com','7705678466','','','','2017-09-12 12:18:03','2017-09-12 12:18:03'),(3,'GBC Ed','Londom','Sherif Kamal','sherifkamal@gbced.com','4546456546','Sarah Smith','sarahsmith@gbced.com','54645657','2017-09-18 12:18:03','2017-09-18 12:18:03'),(32,'LexisNexis','Atlanta, GA',NULL,NULL,NULL,'Dinesh Shetye','ds@gmail.com','34543534','2017-12-05 21:06:50','2017-12-05 21:06:50');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_category`
--

DROP TABLE IF EXISTS `company_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_category` (
  `company_category_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) unsigned NOT NULL,
  `company_type_id` int(11) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modifed` datetime NOT NULL,
  PRIMARY KEY (`company_category_id`),
  KEY `cat_comp_fk_idx` (`company_id`),
  KEY `cat_comp_type_fk_idx` (`company_type_id`),
  CONSTRAINT `cat_comp_fk` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cat_comp_type_fk` FOREIGN KEY (`company_type_id`) REFERENCES `company_type` (`company_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_category`
--

LOCK TABLES `company_category` WRITE;
/*!40000 ALTER TABLE `company_category` DISABLE KEYS */;
INSERT INTO `company_category` VALUES (1,1,1,'2017-09-18 12:18:03','2017-09-18 12:18:03'),(2,1,2,'2017-09-18 12:18:03','2017-09-18 12:18:03'),(3,2,2,'2017-09-18 12:18:03','2017-09-18 12:18:03');
/*!40000 ALTER TABLE `company_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_type`
--

DROP TABLE IF EXISTS `company_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_type` (
  `company_type_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `company_type` varchar(45) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`company_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_type`
--

LOCK TABLES `company_type` WRITE;
/*!40000 ALTER TABLE `company_type` DISABLE KEYS */;
INSERT INTO `company_type` VALUES (1,'Private Company','2017-09-18 12:18:03','2017-09-18 12:18:03'),(2,'Implementation Partners','2017-09-18 12:18:03','2017-09-18 12:18:03'),(3,'Education Cannot Wait Partners','2017-09-18 12:18:03','2017-09-18 12:18:03');
/*!40000 ALTER TABLE `company_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `encrypted_pwd` varchar(45) NOT NULL,
  `company_id` int(11) unsigned NOT NULL,
  `isActive` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `user_comp_fk_idx` (`company_id`),
  CONSTRAINT `user_comp_fk` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'bobsmith@arc.com','dGVzdA==',1,1,'2017-09-18 12:18:03','2017-09-18 12:18:03'),(2,'ryansmith@abc.com','dGVzdA==',2,1,'2017-09-18 12:18:03','2017-09-18 12:18:03'),(22,'ds@gmail.com','Dinesh',32,0,'2017-12-05 21:06:50','2017-12-05 21:06:50');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-06  0:03:30
