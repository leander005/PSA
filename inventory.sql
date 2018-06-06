CREATE DATABASE  IF NOT EXISTS `inventory` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `inventory`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: inventory
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.30-MariaDB

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
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `active` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (0,'PILOT',1),(1,'CACTUS',1),(2,'COPIER PAPER',1);
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `divisions`
--

DROP TABLE IF EXISTS `divisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `divisions` (
  `division_id` int(11) NOT NULL,
  `division_name` varchar(45) NOT NULL,
  `division_status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `soft_deleted` enum('N','Y') DEFAULT NULL,
  PRIMARY KEY (`division_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `divisions`
--

LOCK TABLES `divisions` WRITE;
/*!40000 ALTER TABLE `divisions` DISABLE KEYS */;
INSERT INTO `divisions` VALUES (1,'PSA-SOCD','Active',NULL),(2,'PSA-ADMIN','Active',NULL),(3,'PSA-REG','Active',NULL);
/*!40000 ALTER TABLE `divisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `log_description` varchar(140) NOT NULL,
  `user` varchar(140) NOT NULL,
  `module` varchar(140) NOT NULL,
  `log_status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM AUTO_INCREMENT=279 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (1,'2018-05-05 22:17:53','User Amy has edited her profile','Amy Admin','Administrator',1);
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `memo`
--

DROP TABLE IF EXISTS `memo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `memo` (
  `memo_id` int(11) NOT NULL AUTO_INCREMENT,
  `memo_user` varchar(45) NOT NULL,
  `memo_date` date NOT NULL,
  `memo_description` varchar(500) NOT NULL,
  `soft_deleted` enum('N','Y') NOT NULL DEFAULT 'N',
  `memo_status` enum('Pending','Finished') NOT NULL DEFAULT 'Pending',
  `memo_title` varchar(10) NOT NULL,
  PRIMARY KEY (`memo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memo`
--

LOCK TABLES `memo` WRITE;
/*!40000 ALTER TABLE `memo` DISABLE KEYS */;
INSERT INTO `memo` VALUES (8,'Amy Admin','2018-05-08',' Water the plants','N','Pending','Do later'),(1,'Administrator','2018-06-05',' Remember to buy tools','N','Pending','Buy materi');
/*!40000 ALTER TABLE `memo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `qty` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `description` text NOT NULL,
  `attribute_value_id` text,
  `brand_id` text NOT NULL,
  `category_id` text NOT NULL,
  `store_id` int(11) NOT NULL,
  `availability` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (2,'G-Tec','GHE-423','15','98','assets/images/product_image/5ac043ae91b25.jpg','<p>Used for writing</p>','null','[\"5\"]','[\"4\"]',3,1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `returns`
--

DROP TABLE IF EXISTS `returns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `returns` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `return_date` date NOT NULL,
  `quantity_returned` int(11) NOT NULL,
  `cost_amount` double NOT NULL,
  `reason` varchar(45) NOT NULL,
  `return_status` enum('Pending','Returned') NOT NULL DEFAULT 'Pending',
  `po_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `supplies_id` int(11) NOT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `returns`
--

LOCK TABLES `returns` WRITE;
/*!40000 ALTER TABLE `returns` DISABLE KEYS */;
/*!40000 ALTER TABLE `returns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role_id` int(2) NOT NULL,
  `role_type` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'User'),(2,'Admin');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliers` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(45) NOT NULL,
  `supplier_contact` varchar(45) NOT NULL,
  `supplier_status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `product` enum('Medical','Office') NOT NULL DEFAULT 'Office',
  `remarks` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'AMSCO Enterprises','09182726371','Active','Office','Good provider'),(2,'EVA GOODS','09390786532','Active','Office','Always on time');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplies`
--

DROP TABLE IF EXISTS `supplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplies` (
  `supply_id` int(11) NOT NULL AUTO_INCREMENT,
  `supply_type` enum('Medical','Office') DEFAULT NULL,
  `supply_description` varchar(45) DEFAULT NULL,
  `brand_name` varchar(45) DEFAULT NULL,
  `unit` varchar(45) NOT NULL,
  `quantity_in_stock` int(11) DEFAULT NULL,
  `unit_price` double DEFAULT NULL,
  `unit_on_order` int(11) DEFAULT NULL,
  `reorder_level` int(11) DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `good_condition` int(11) DEFAULT NULL,
  `damaged` int(11) DEFAULT NULL,
  `total_quantity` int(11) DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `delivery_id` int(11) DEFAULT NULL,
  `suppliers_id` int(11) DEFAULT NULL,
  `request_id` int(11) DEFAULT NULL,
  `soft_deleted` enum('N','Y') NOT NULL,
  `qty_issued` int(11) DEFAULT NULL,
  `supply_remarks` varchar(100) DEFAULT NULL,
  `dep_name` varchar(45) DEFAULT NULL,
  `accounted_for` enum('N','Y') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`supply_id`),
  KEY `supplies_delvfk_idx` (`delivery_id`),
  KEY `supplies_suprfk_idx` (`suppliers_id`),
  KEY `requisition_id_idx` (`request_id`),
  CONSTRAINT `request_id` FOREIGN KEY (`request_id`) REFERENCES `request_supplies` (`requisition_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `supplies_delvfk` FOREIGN KEY (`delivery_id`) REFERENCES `deliveries` (`delivery_id`),
  CONSTRAINT `supplies_suprfk` FOREIGN KEY (`suppliers_id`) REFERENCES `suppliers` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplies`
--

LOCK TABLES `supplies` WRITE;
/*!40000 ALTER TABLE `supplies` DISABLE KEYS */;
INSERT INTO `supplies` VALUES (0,'Office','5MM PEN','PILOT ','',12,25,NULL,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,NULL,'N');
/*!40000 ALTER TABLE `supplies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group`
--

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
INSERT INTO `user_group` VALUES (1,1,1);
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` enum('Admin','User') NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `fname` varchar(45) NOT NULL,
  `user_contact` varchar(45) NOT NULL,
  `user_email` varchar(45) NOT NULL,
  `user_status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `dept_name` varchar(150) NOT NULL,
  `dept_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `password_UNIQUE` (`password`),
  KEY `user_deptfk_idx` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','Admin','psasocd','trator','admini','09123456789','psa@gmail.com','Active','PSA-SOCD',8),(2,'User','nathan','12345','Calimlim','Nathaniel','09125413241','nathan@gmail.com','Active','PSA-ADMIN',3);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-06 10:30:04
