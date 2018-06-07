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
-- Table structure for table `divisions`
--

DROP TABLE IF EXISTS `divisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `divisions` (
  `division_id` int(11) NOT NULL AUTO_INCREMENT,
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
-- Table structure for table `issued`
--

DROP TABLE IF EXISTS `issued`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issued` (
  `issued_id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity_issued` int(11) NOT NULL,
  `soft_deleted` enum('N','Y') DEFAULT NULL,
  `artic_id` int(11),
  PRIMARY KEY (`issued_id`),
  FOREIGN KEY (artic_id) REFERENCES supplies(article_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issued`
--

LOCK TABLES `issued` WRITE;
/*!40000 ALTER TABLE `issued` DISABLE KEYS */;
/*!40000 ALTER TABLE `issued` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchased`
--

DROP TABLE IF EXISTS `purchased`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchased` (
  `purchased_id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity_purchased` int(11) NOT NULL,
  `soft_deleted` enum('N','Y') DEFAULT NULL,
  `art_id` int(11),
  PRIMARY KEY (`purchased_id`),
  FOREIGN KEY (art_id) REFERENCES supplies(article_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchased`
--

LOCK TABLES `purchased` WRITE;
/*!40000 ALTER TABLE `purchased` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchased` ENABLE KEYS */;
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
-- Table structure for table `supplies`
--

DROP TABLE IF EXISTS `supplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplies` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `article_type` enum('Consumable','Office','Computer','Janitorial','Electrical','Vehicle','Accountable Form','General Form','Others') DEFAULT NULL,
  `stock_code` int(11) DEFAULT NULL,
  `article` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `unit` varchar(45) NOT NULL,
  `quantity_in_stock` int(11) DEFAULT NULL,
  `unit_price` double DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `reorder_level` int(11) DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `total_quantity` int(11) DEFAULT NULL,
  `article_remarks` varchar(100) DEFAULT NULL,
  `dep_name` varchar(45) DEFAULT NULL,
  `soft_deleted` enum('N','Y') NOT NULL,
  `accounted_for` enum('N','Y') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplies`
--

LOCK TABLES `supplies` WRITE;
/*!40000 ALTER TABLE `supplies` DISABLE KEYS */;
INSERT INTO `supplies` VALUES (1,'Office',NULL,'Alcohol','Ethyl 500m/l','bottle',126,47.82,6025.32,NULL,NULL,NULL,NULL,NULL,'N','N'),(2,'Office',NULL,'Acetate','A4','box',6,235,1410,NULL,NULL,NULL,NULL,NULL,'N','N'),(3,'Office',NULL,'Adoptor',NULL,'pc',10,45,450,NULL,NULL,NULL,NULL,NULL,'N','N'),(4,'Office',NULL,'Archfile','Long','pc',24,115,2760,NULL,NULL,NULL,NULL,NULL,'N','N'),(5,'Office',NULL,'Archfile','Blue, 3\", A4','pc',100,125,12500,NULL,NULL,NULL,NULL,NULL,'N','N'),(6,'Office',NULL,'Ballpen','Regular - red','pc',786,8.46,6649.56,NULL,NULL,NULL,NULL,NULL,'N','N'),(7,'Office',NULL,'Ballpen','Black, flexstick','doz',14,54.81,767.33,NULL,NULL,NULL,NULL,NULL,'N','N'),(8,'Office',NULL,'Ballpen','Blue, flexstick','doz',45,53.98,2429.04,NULL,NULL,NULL,NULL,NULL,'N','N'),(9,'Office',NULL,'Battery','AAA, alkaline 2 pcs/pack','pack',12,27.13,325.52,NULL,NULL,NULL,NULL,NULL,'N','N'),(10,'Office',NULL,'Battery','AAA, alkaline 2 pcs/pack','pack',20,19,380,NULL,NULL,NULL,NULL,NULL,'N','N'),(11,'Office',NULL,'Battery','AA, alkaline 2 pcs/pack ','pack',9,20,180,NULL,NULL,NULL,NULL,NULL,'N','N'),(12,'Office',NULL,'Board Paper','cream, short','pack',4,20,80,NULL,NULL,NULL,NULL,NULL,'N','N'),(13,'Office',NULL,'Board Paper','cream, A4','pack',37,24,888,NULL,NULL,NULL,NULL,NULL,'N','N'),(14,'Office',NULL,'Board Paper','cream, long','pack',5,24,120,NULL,NULL,NULL,NULL,NULL,'N','N'),(15,'Office',NULL,'Bond Paper','Letter','ream',29,153,4437,NULL,NULL,NULL,NULL,NULL,'N','N'),(16,'Office',NULL,'Bond Paper','A4','ream',101,134.31,13565.81,NULL,NULL,NULL,NULL,NULL,'N','N'),(17,'Office',NULL,'Bond Paper','Legal','ream',57,141,8037,NULL,NULL,NULL,NULL,NULL,'N','N'),(18,'Office',NULL,'Calculator','14 digits','pc',2,1750,3500,NULL,NULL,NULL,NULL,NULL,'N','N'),(19,'Office',NULL,'Carbon Paper','Long','pack',2,260.05,520.1,NULL,NULL,NULL,NULL,NULL,'N','N'),(20,'Office',NULL,'CD-Writable','CD-Writable w/ case','pc',12,15.73,188.76,NULL,NULL,NULL,NULL,NULL,'N','N'),(21,'Office',NULL,'Certificate Holders','A4','pc',181,36,6516,NULL,NULL,NULL,NULL,NULL,'N','N'),(22,'Office',NULL,'Certificate Holders','Short','pc',150,33.5,5025,NULL,NULL,NULL,NULL,NULL,'N','N'),(23,'Office',NULL,'Clip, Backfold','all metal clamping; 50mm','box',4,40.5,162,NULL,NULL,NULL,NULL,NULL,'N','N'),(24,'Office',NULL,'Clip, Backfold','all metal clamping; 32mm','box',4,20,80,NULL,NULL,NULL,NULL,NULL,'N','N'),(25,'Office',NULL,'Clip, Backfold','all metal clamping; 25mm','box',5,15,75,NULL,NULL,NULL,NULL,NULL,'N','N'),(26,'Office',NULL,'Clip, Backfold','all metal clamping; 19mm','box',4,8,32,NULL,NULL,NULL,NULL,NULL,'N','N'),(27,'Office',NULL,'Columnar Notebook','10 columns','pad',20,19.77,395.4,NULL,NULL,NULL,NULL,NULL,'N','N'),(28,'Office',NULL,'Columnar Pad','4 columns','pad',12,21.85,262.2,NULL,NULL,NULL,NULL,NULL,'N','N'),(29,'Office',NULL,'Continuous Form','2 ply','ream',3,713.58,2140.74,NULL,NULL,NULL,NULL,NULL,'N','N'),(30,'Office',NULL,'Continuous Form','3 ply','ream',1,636.9,636.9,NULL,NULL,NULL,NULL,NULL,'N','N'),(31,'Office',NULL,'Correction Tape',NULL,'pc',73,40,2920,NULL,NULL,NULL,NULL,NULL,'N','N'),(32,'Office',NULL,'Convenience Outlet','3 Gang Flush Type','pc',10,250,2500,NULL,NULL,NULL,NULL,NULL,'N','N'),(33,'Office',NULL,'Convenience Outlet','2 Gang Flush Type','pc',10,180,1800,NULL,NULL,NULL,NULL,NULL,'N','N'),(34,'Office',NULL,'Cutter','Big','pc',3,24.9,74.7,NULL,NULL,NULL,NULL,NULL,'N','N'),(35,'Office',NULL,'Cutter blade','Big','pack',7,9.4,65.8,NULL,NULL,NULL,NULL,NULL,'N','N'),(36,'Office',NULL,'Desk Rack','3 layered tray','pc',4,400,1600,NULL,NULL,NULL,NULL,NULL,'N','N'),(37,'Office',NULL,'Duplo Ink','514K black','pc',18,816.2,14691.6,NULL,NULL,NULL,NULL,NULL,'N','N'),(38,'Office',NULL,'DTR','Form 48','pad',45,24,1080,NULL,NULL,NULL,NULL,NULL,'N','N'),(39,'Office',NULL,'DVD','Recordable with Case','pc',91,20,1820,NULL,NULL,NULL,NULL,NULL,'N','N'),(40,'Office',NULL,'DVD','Rewritable Disc','pc',59,31.52,1859,NULL,NULL,NULL,NULL,NULL,'N','N'),(41,'Office',NULL,'Elmer\'s Glue','Medium Size','pc',19,39,741,NULL,NULL,NULL,NULL,NULL,'N','N'),(42,'Office',NULL,'Electrical Plug, Rubber','2 Prong Male','pc',2,75,150,NULL,NULL,NULL,NULL,NULL,'N','N'),(43,'Office',NULL,'Electrical Wire','Flatcord #14','pc',30,38,1140,NULL,NULL,NULL,NULL,NULL,'N','N'),(44,'Office',NULL,'Envelope, plastic, long','with handle, transparent','',411,59,24249,NULL,NULL,NULL,NULL,NULL,'N','N'),(45,'Office',NULL,'Envelope','Expanding-legal','pc',374,6.22,NULL,NULL,NULL,NULL,NULL,NULL,'N','N'),(46,'Office',NULL,'Envelope','Brown-short','pc.',124,0.96,119.09,NULL,NULL,NULL,NULL,NULL,'N','N'),(47,'Office',NULL,'Envelope','Mailing, white, w/ window','pc.',403,0.59,237.77,NULL,NULL,NULL,NULL,NULL,'N','N'),(48,'Office',NULL,'Envelope','A4','pc.',439,4,1,NULL,NULL,NULL,NULL,NULL,'N','N'),(49,'Office',NULL,'Envelope','Documentary, legal size','box',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N','N'),(50,'Office',NULL,'Eraser','Steadler','pc.',6,13.5,81,NULL,NULL,NULL,NULL,NULL,'N','N'),(51,'Office',NULL,'Eraser for whiteboard',NULL,'pc.',3,20,60,NULL,NULL,NULL,NULL,NULL,'N','N'),(52,'Office',NULL,'Extension Cord','10 meters','pc.',9,695,6,NULL,NULL,NULL,NULL,NULL,'N','N'),(53,'Office',NULL,'Fillers',NULL,'pc.',358,7.5,2,NULL,NULL,NULL,NULL,NULL,'N','N'),(54,'Office',NULL,'Flourescent LED','18 watts','pc.',30,315,9,NULL,NULL,NULL,NULL,NULL,'N','N'),(55,'Office',NULL,'Folder','Long-Brown','pc.',54,3.29,177.66,NULL,NULL,NULL,NULL,NULL,'N','N'),(56,'Office',NULL,'Folder','Expanded, Legal Size (green)','pc.',377,8.55,3,NULL,NULL,NULL,NULL,NULL,'N','N'),(57,'Office',NULL,'Folder','Short','pc.',1050,2.9,3,NULL,NULL,NULL,NULL,NULL,'N','N'),(58,'Office',NULL,'Folder','Morocco/fancy, A4 size, 50pc/pack','pc.',0,5.2,NULL,NULL,NULL,NULL,NULL,NULL,'N','N'),(59,'Office',NULL,'Glue Gun','Glue gun, good quality, big size','pc.',2,275,550,NULL,NULL,NULL,NULL,NULL,'N','N'),(60,'Office',NULL,'Glue Stick','Glue stick, big size','pc.',50,8,400,NULL,NULL,NULL,NULL,NULL,'N','N'),(61,'Office',NULL,'Folder','Tagboard, A4','pc.',683,2.07,1,NULL,NULL,NULL,NULL,NULL,'N','N'),(62,'Office',NULL,'Highlighter','highlighter, lotus','pc.',37,25.06,927.26,NULL,NULL,NULL,NULL,NULL,'N','N'),(63,'Office',NULL,'Hook Cable Clip with Steel Nail','10 mm','box',3,185,555,NULL,NULL,NULL,NULL,NULL,'N','N'),(64,'Office',NULL,'ID Clip',NULL,'pc.',50,3.5,175,NULL,NULL,NULL,NULL,NULL,'N','N'),(65,'Office',NULL,'ID Lace',NULL,'pc.',120,7,840,NULL,NULL,NULL,NULL,NULL,'N','N'),(66,'Office',NULL,'ID jacket-rubberized',NULL,'pc.',120,7,840,NULL,NULL,NULL,NULL,NULL,'N','N'),(67,'Office',NULL,'Index Tab',NULL,'box',28,79.46,2,NULL,NULL,NULL,NULL,NULL,'N','N'),(68,'Office',NULL,'Laminating Plastic Roll','250 microm','roll',2,950,1,NULL,NULL,NULL,NULL,NULL,'N','N'),(69,'Office',NULL,'Laminating Plastic Roll','125 microm','roll',2,995,1,NULL,NULL,NULL,NULL,NULL,'N','N'),(70,'Office',NULL,'Magnifying Glass',NULL,'pc.',1,90,90,NULL,NULL,NULL,NULL,NULL,'N','N'),(71,'Office',NULL,'Magazine File Box/ Data File Box',NULL,'pc.',105,99,10,NULL,NULL,NULL,NULL,NULL,'N','N'),(72,'Office',NULL,'Magazine File Box/ Data File Box','Black','pc.',300,105,31,NULL,NULL,NULL,NULL,NULL,'N','N'),(73,'Office',NULL,'Marking Pen','Permanent - black','pc.',61,9.79,596.91,NULL,NULL,NULL,NULL,NULL,'N','N'),(74,'Office',NULL,'Marking Pen','Permanent - blue','pc.',66,11.55,762.24,NULL,NULL,NULL,NULL,NULL,'N','N'),(75,'Office',NULL,'Marker Pen','Flourscent (3colors/set)','set',10,75,750,NULL,NULL,NULL,NULL,NULL,'N','N'),(76,'Office',NULL,'Marker','whiteboard, bullet type, black','pc.',58,12.4,719.2,NULL,NULL,NULL,NULL,NULL,'N','N'),(77,'Office',NULL,'Master Roll','835','pc.',12,3,45,NULL,NULL,NULL,NULL,NULL,'N','N'),(78,'Office',NULL,'Micro SD, 64 GB',NULL,'pc.',3,1,4,NULL,NULL,NULL,NULL,NULL,'N','N'),(79,'Office',NULL,'Mouse Pad',NULL,'pc.',16,34,544,NULL,NULL,NULL,NULL,NULL,'N','N'),(80,'Office',NULL,'Mouse, Optical','USB Connection Type','pc.',14,195,2,NULL,NULL,NULL,NULL,NULL,'N','N'),(81,'Office',NULL,'Notebook','Steno 40 leaves','pc.',460,11.49,5,NULL,NULL,NULL,NULL,NULL,'N','N'),(82,'Office',NULL,'Notepad','Post-it (3\"x4\")','pad',32,24,768,NULL,NULL,NULL,NULL,NULL,'N','N'),(83,'Office',NULL,'Paper',NULL,'pack',20,275,5,NULL,NULL,NULL,NULL,NULL,'N','N'),(84,'Office',NULL,'Paper','Manila','bundle',2,1,2,NULL,NULL,NULL,NULL,NULL,'N','N'),(85,'Office',NULL,'Paper','Cartolina','pc.',20,6,120,NULL,NULL,NULL,NULL,NULL,'N','N'),(86,'Office',NULL,'Paper Clip','Small - #22','box',9,8,72,NULL,NULL,NULL,NULL,NULL,'N','N'),(87,'Office',NULL,'Paper Clip','Small - #50','box',39,6.8,265.2,NULL,NULL,NULL,NULL,NULL,'N','N'),(88,'Office',NULL,'Envelope','Brown-short','pc.',124,0.96,119.09,NULL,NULL,NULL,NULL,NULL,'N','N'),(89,'Office',NULL,'Envelope','Mailing, white, w/ window','pc.',403,0.59,237.77,NULL,NULL,NULL,NULL,NULL,'N','N'),(90,'Office',NULL,'Envelope','A4','pc.',439,4,1,NULL,NULL,NULL,NULL,NULL,'N','N'),(91,'Office',NULL,'Envelope','Documentary, legal size','box',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N','N'),(92,'Office',NULL,'Eraser','Steadler','pc.',6,13.5,81,NULL,NULL,NULL,NULL,NULL,'N','N'),(93,'Office',NULL,'Eraser for whiteboard',NULL,'pc.',3,20,60,NULL,NULL,NULL,NULL,NULL,'N','N'),(94,'Office',NULL,'Extension Cord','10 meters','pc.',9,695,6,NULL,NULL,NULL,NULL,NULL,'N','N'),(95,'Office',NULL,'Fillers',NULL,'pc.',358,7.5,2,NULL,NULL,NULL,NULL,NULL,'N','N'),(96,'Office',NULL,'Flourescent LED','18 watts','pc.',30,315,9,NULL,NULL,NULL,NULL,NULL,'N','N'),(97,'Office',NULL,'Folder','Long-Brown','pc.',54,3.29,177.66,NULL,NULL,NULL,NULL,NULL,'N','N'),(98,'Office',NULL,'Folder','Expanded, Legal Size (green)','pc.',377,8.55,3,NULL,NULL,NULL,NULL,NULL,'N','N'),(99,'Office',NULL,'Folder','Short','pc.',1050,2.9,3,NULL,NULL,NULL,NULL,NULL,'N','N'),(100,'Office',NULL,'Folder','Morocco/fancy, A4 size, 50pc/pack','pc.',0,5.2,NULL,NULL,NULL,NULL,NULL,NULL,'N','N'),(101,'Office',NULL,'Glue Gun','Glue gun, good quality, big size','pc.',2,275,550,NULL,NULL,NULL,NULL,NULL,'N','N'),(102,'Office',NULL,'Glue Stick','Glue stick, big size','pc.',50,8,400,NULL,NULL,NULL,NULL,NULL,'N','N'),(103,'Office',NULL,'Folder','Tagboard, A4','pc.',683,2.07,1,NULL,NULL,NULL,NULL,NULL,'N','N'),(104,'Office',NULL,'Highlighter','highlighter, lotus','pc.',37,25.06,927.26,NULL,NULL,NULL,NULL,NULL,'N','N'),(105,'Office',NULL,'Hook Cable Clip with Steel Nail','10 mm','box',3,185,555,NULL,NULL,NULL,NULL,NULL,'N','N'),(106,'Office',NULL,'ID Clip',NULL,'pc.',50,3.5,175,NULL,NULL,NULL,NULL,NULL,'N','N'),(107,'Office',NULL,'ID Lace',NULL,'pc.',120,7,840,NULL,NULL,NULL,NULL,NULL,'N','N'),(108,'Office',NULL,'ID jacket-rubberized',NULL,'pc.',120,7,840,NULL,NULL,NULL,NULL,NULL,'N','N'),(109,'Office',NULL,'Index Tab',NULL,'box',28,79.46,2,NULL,NULL,NULL,NULL,NULL,'N','N'),(110,'Office',NULL,'Laminating Plastic Roll','250 microm','roll',2,950,1,NULL,NULL,NULL,NULL,NULL,'N','N'),(111,'Office',NULL,'Laminating Plastic Roll','125 microm','roll',2,995,1,NULL,NULL,NULL,NULL,NULL,'N','N'),(112,'Office',NULL,'Magnifying Glass',NULL,'pc.',1,90,90,NULL,NULL,NULL,NULL,NULL,'N','N'),(113,'Office',NULL,'Magazine File Box/ Data File Box',NULL,'pc.',105,99,10,NULL,NULL,NULL,NULL,NULL,'N','N'),(114,'Office',NULL,'Magazine File Box/ Data File Box','Black','pc.',300,105,31,NULL,NULL,NULL,NULL,NULL,'N','N'),(115,'Office',NULL,'Marking Pen','Permanent - black','pc.',61,9.79,596.91,NULL,NULL,NULL,NULL,NULL,'N','N'),(116,'Office',NULL,'Marking Pen','Permanent - blue','pc.',66,11.55,762.24,NULL,NULL,NULL,NULL,NULL,'N','N'),(117,'Office',NULL,'Marker Pen','Flourscent (3colors/set)','set',10,75,750,NULL,NULL,NULL,NULL,NULL,'N','N'),(118,'Office',NULL,'Marker','whiteboard, bullet type, black','pc.',58,12.4,719.2,NULL,NULL,NULL,NULL,NULL,'N','N'),(119,'Office',NULL,'Master Roll','835','pc.',12,3,45,NULL,NULL,NULL,NULL,NULL,'N','N'),(120,'Office',NULL,'Micro SD, 64 GB',NULL,'pc.',3,1,4,NULL,NULL,NULL,NULL,NULL,'N','N'),(121,'Office',NULL,'Mouse Pad',NULL,'pc.',16,34,544,NULL,NULL,NULL,NULL,NULL,'N','N'),(122,'Office',NULL,'Mouse, Optical','USB Connection Type','pc.',14,195,2,NULL,NULL,NULL,NULL,NULL,'N','N'),(123,'Office',NULL,'Notebook','Steno 40 leaves','pc.',460,11.49,5,NULL,NULL,NULL,NULL,NULL,'N','N'),(124,'Office',NULL,'Notepad','Post-it (3\"x4\")','pad',32,24,768,NULL,NULL,NULL,NULL,NULL,'N','N'),(125,'Office',NULL,'Paper',NULL,'pack',20,275,5,NULL,NULL,NULL,NULL,NULL,'N','N'),(126,'Office',NULL,'Paper','Manila','bundle',2,1,2,NULL,NULL,NULL,NULL,NULL,'N','N'),(127,'Office',NULL,'Paper','Cartolina','pc.',20,6,120,NULL,NULL,NULL,NULL,NULL,'N','N'),(128,'Office',NULL,'Paper Clip','Small - #22','box',9,8,72,NULL,NULL,NULL,NULL,NULL,'N','N'),(129,'Office',NULL,'Paper Clip','Small - #50','box',39,6.8,265.2,NULL,NULL,NULL,NULL,NULL,'N','N');
/*!40000 ALTER TABLE `supplies` ENABLE KEYS */;
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
INSERT INTO `users` VALUES (1,'Admin','Admin','psasocd','strator','admini','09123456789','psa@gmail.com','Active','PSA-SOCD',8),(2,'User','nathan','12345','Calimlim','Nathaniel','09125413241','nathan@gmail.com','Active','PSA-ADMIN',3);
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
