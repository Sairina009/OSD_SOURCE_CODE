-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: kvm
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `id` int NOT NULL,
  `device` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `encoder_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `ip_address` text COLLATE utf8mb4_general_ci NOT NULL,
  `netmask` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `broadcast` text COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'','10.1.1.1','192.168.1.1','',''),(2,'','20.1.1.1','170.1.1.2','',''),(3,'','30.1.1.1','160.1.1.1','',''),(4,'','40.1.1.1','150.1.1.1','',''),(5,'','50.1.1.1','140.1.1.1','','');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `decoder`
--

DROP TABLE IF EXISTS `decoder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `decoder` (
  `decoder_count` int NOT NULL,
  `ip_address` text COLLATE utf8mb4_general_ci NOT NULL,
  `encoder_id` int NOT NULL,
  `decoder_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `decoder_type` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int NOT NULL,
  `mac_address` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `banner` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `thumbnailview` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lastupdatedby` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_authority` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`decoder_count`),
  KEY `encoder_id` (`encoder_id`),
  CONSTRAINT `decoder_ibfk_1` FOREIGN KEY (`decoder_count`) REFERENCES `portname` (`id`),
  CONSTRAINT `decoder_ibfk_2` FOREIGN KEY (`encoder_id`) REFERENCES `portname` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `decoder`
--

LOCK TABLES `decoder` WRITE;
/*!40000 ALTER TABLE `decoder` DISABLE KEYS */;
INSERT INTO `decoder` VALUES (1,'172.1681.220',2,'decoder1','remote',2,'03:42:4e:d1:03:2H','OFF','OFF','2024-02-28 12:48:30','View'),(2,'192.158.2.100',2,'decoder2','remote',9,'04:42:4e:d1:03:7H','ON','OFF','2023-12-19 10:16:19','Share'),(3,'168.1.1.3',3,'decoder3','local',2,'02:42:2e:d1:03:2H','ON','OFF','2023-12-19 10:16:30',''),(4,'162.1681.22',24,'decoder4','remote',0,'01:12:4sd:d1:03:8d','OFF','ON','2023-12-11 07:13:25',''),(5,'19.1681.224',13,'oct1','remote',0,'09:42:7e:d1:03:2q','ON','ON','2024-01-09 09:56:52','');
/*!40000 ALTER TABLE `decoder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `decoder_log`
--

DROP TABLE IF EXISTS `decoder_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `decoder_log` (
  `decoder_id` int NOT NULL,
  `table_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `column_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `new_value` text COLLATE utf8mb4_general_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `encoder_id` int DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_encoder` (`encoder_id`),
  CONSTRAINT `fk_encoder` FOREIGN KEY (`encoder_id`) REFERENCES `switch` (`encoder_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `decoder_log`
--

LOCK TABLES `decoder_log` WRITE;
/*!40000 ALTER TABLE `decoder_log` DISABLE KEYS */;
INSERT INTO `decoder_log` VALUES (4,'decoder','decoder_name','decoder4','2023-11-24 05:34:00',10,1),(2,'decoder','decoder_type','local','2023-11-24 06:11:06',11,2),(4,'decoder','thumbnailview','ON','2023-11-24 06:11:27',10,3),(4,'decoder','mac_address','01:12:4sd:d1:03:8d','2023-11-24 06:12:28',10,4),(2,'decoder','decoder_type','remote','2023-11-24 06:13:03',11,5),(2,'decoder','thumbnailview','OFF','2023-11-24 06:49:01',11,6),(1,'decoder','thumbnailview','OFF','2023-11-24 06:55:53',2,7),(4,'decoder','decoder_type','local','2023-11-24 11:03:07',10,8),(5,'decoder','encoder_id','13','2023-11-26 06:15:12',13,9),(4,'decoder','encoder_id','24','2023-11-26 06:15:12',24,10),(1,'decoder','encoder_id','1','2023-11-27 04:56:47',1,11),(1,'decoder','encoder_id','2','2023-11-27 05:03:36',2,12),(1,'decoder','encoder_id','3','2023-11-27 05:41:12',3,13),(1,'decoder','encoder_id','4','2023-11-27 05:41:45',4,14),(1,'decoder','encoder_id','5','2023-11-27 05:57:08',5,15),(1,'decoder','encoder_id','6','2023-11-27 06:08:05',6,16),(1,'decoder','encoder_id','1','2023-12-11 05:39:26',1,17),(3,'decoder','ip_address','168.1.1.3','2023-12-11 07:12:22',21,18),(4,'decoder','decoder_type','remote','2023-12-11 07:13:25',24,19),(1,'decoder','encoder_id','2','2023-12-15 05:01:07',2,20),(2,'decoder','encoder_id','3','2023-12-15 06:26:51',3,21),(1,'decoder','encoder_id','3','2023-12-15 06:27:30',3,22),(1,'decoder','encoder_id','1','2023-12-15 07:02:56',1,23),(2,'decoder','encoder_id','4','2023-12-15 07:03:11',4,24),(2,'decoder','encoder_id','2','2023-12-15 07:10:35',2,25);
/*!40000 ALTER TABLE `decoder_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `decoder_status`
--

DROP TABLE IF EXISTS `decoder_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `decoder_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `decoder_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `login_time` timestamp NULL DEFAULT NULL,
  `logout_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `decoder_status`
--

LOCK TABLES `decoder_status` WRITE;
/*!40000 ALTER TABLE `decoder_status` DISABLE KEYS */;
INSERT INTO `decoder_status` VALUES (1,16,16,'2024-03-04 08:38:42',NULL);
/*!40000 ALTER TABLE `decoder_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kvm_log`
--

DROP TABLE IF EXISTS `kvm_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kvm_log` (
  `kvm_id` int NOT NULL,
  `table_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `column_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `new_value` text COLLATE utf8mb4_general_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kvm_log`
--

LOCK TABLES `kvm_log` WRITE;
/*!40000 ALTER TABLE `kvm_log` DISABLE KEYS */;
INSERT INTO `kvm_log` VALUES (1,'kvmname1','name','KVM_RACK2111','2023-05-29 07:56:46'),(1,'kvmname1','time','2023 / 26 / 05 14:  29','2023-05-29 07:57:04'),(1,'kvmname1','language','French','2023-05-29 07:57:16'),(1,'kvmname1','language','English','2023-05-29 07:57:27'),(1,'kvmname1','hotkey','< Scroll Lock >','2023-05-29 07:57:33'),(1,'kvmname1','banner','OFF','2023-05-29 07:58:14'),(1,'kvmname1','encryp','Disable','2023-05-29 08:00:54'),(1,'kvmname1','encryp','AES','2023-05-29 08:01:05'),(1,'kvmname1','encryp','DES','2023-05-29 08:01:14'),(1,'kvmname1','encryp','3DES','2023-05-29 08:01:20'),(1,'kvmname','time','2023 / 06 / 10 12 :35','2023-10-06 06:47:58'),(1,'kvmname','time','2023 / 11 / 10 12 :35','2023-10-11 04:55:13'),(1,'kvmname','time','2023 / 12 / 10 17 :15','2023-10-12 11:19:08'),(1,'kvmname','time','2023 / 13 / 10 17 :15','2023-10-13 09:17:17'),(1,'kvmname','time','2023 / 16 / 10 12 :15','2023-10-16 05:23:03'),(1,'kvmname','time','2023 / 16 / 10 14 :15','2023-10-16 07:14:43'),(1,'kvmname','time','2023 / 16 / 10 15 :15','2023-10-16 09:06:17'),(1,'kvmname','time','2023 / 17 / 10 12 :15','2023-10-17 05:18:20'),(1,'kvmname','time','2023 / 17 / 10 16 :15','2023-10-17 09:22:00'),(1,'kvmname','time','2023 / 18 / 10 14 :15','2023-10-18 07:32:17'),(1,'kvmname','time','2023 / 19 / 10 13 :15','2023-10-19 06:17:02'),(1,'kvmname','time','2023 / 20 / 10 12 :15','2023-10-20 04:26:04'),(1,'kvmname','time','2023 / 23 / 10 12 :15','2023-10-23 07:08:22'),(1,'kvmname','time','2023 / 23 / 10 14 :15','2023-10-23 07:08:28'),(1,'kvmname','language','French','2023-10-25 07:34:34'),(1,'kvmname','hotkey','< Scroll Lock>','2024-02-25 12:05:54'),(1,'kvmname','hotkey','< Ctrl>','2024-02-25 12:06:10'),(1,'kvmname','time','2024 / 29 / 02 11 : 15','2024-02-29 04:54:45'),(1,'kvmname','language','French','2024-02-29 04:55:21'),(1,'kvmname','language','German','2024-02-29 04:59:13'),(1,'kvmname','language','French','2024-02-29 04:59:13'),(1,'kvmname','language','German','2024-02-29 05:05:21'),(1,'kvmname','kvmname','RACK1_KVM','2024-02-29 05:09:25'),(1,'kvmname','language','French','2024-02-29 05:10:56'),(1,'kvmname','language','German','2024-02-29 05:51:43'),(1,'kvmname','time','2024 / 04 / 03 11 : 15','2024-03-04 05:14:50'),(1,'kvmname','time','2024 / 04 / 03 14 : 15','2024-03-04 07:56:57');
/*!40000 ALTER TABLE `kvm_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kvmname`
--

DROP TABLE IF EXISTS `kvmname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kvmname` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kvmname` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `language` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `banner` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `encryption` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `hotkey` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `time` text COLLATE utf8mb4_general_ci NOT NULL,
  `path` text COLLATE utf8mb4_general_ci NOT NULL,
  `lastUpdatedBy` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `bannertime` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kvmname`
--

LOCK TABLES `kvmname` WRITE;
/*!40000 ALTER TABLE `kvmname` DISABLE KEYS */;
INSERT INTO `kvmname` VALUES (1,'RACK1_KVM','German','ALWAYS ON','3DES','< Ctrl>','2024 / 04 / 03 14 : 15','C:/xampp1/htdocs/user1 (2).sql','2024-03-04 07:56:57',7);
/*!40000 ALTER TABLE `kvmname` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `kvm_trigger` AFTER UPDATE ON `kvmname` FOR EACH ROW BEGIN
    DECLARE column_name VARCHAR(255);
    DECLARE new_value VARCHAR(255);
    DECLARE trigger_name VARCHAR(255);

 SET trigger_name='kvm_trigger';
    IF NEW.kvmname <> OLD.kvmname THEN
        SET column_name = 'kvmname';
        SET new_value = NEW.kvmname;
        INSERT INTO kvm_log (kvm_id, table_name, column_name, new_value) VALUES (OLD.id, 'kvmname', column_name, new_value);
        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.language <> OLD.language THEN
        SET column_name = 'language';
        SET new_value = NEW.language;
        INSERT INTO kvm_log (kvm_id, table_name, column_name, new_value) VALUES (OLD.id, 'kvmname', column_name, new_value);
        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.banner <> OLD.banner THEN
        SET column_name = 'banner';
        SET new_value = NEW.banner;
        INSERT INTO kvm_log (kvm_id, table_name, column_name, new_value) VALUES (OLD.id, 'kvmname', column_name, new_value);
        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.encryption <> OLD.encryption THEN
        SET column_name = 'encryption';
        SET new_value = NEW.encryption;
        INSERT INTO kvm_log (kvm_id, table_name, column_name, new_value) VALUES (OLD.id, 'kvmname', column_name, new_value);
        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.hotkey <> OLD.hotkey THEN
        SET column_name = 'hotkey';
        SET new_value = NEW.hotkey;
        INSERT INTO kvm_log (kvm_id, table_name, column_name, new_value) VALUES (OLD.id, 'kvmname', column_name, new_value);
        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.time <> OLD.time THEN
        SET column_name = 'time';
        SET new_value = NEW.time;
        INSERT INTO kvm_log (kvm_id, table_name, column_name, new_value) VALUES (OLD.id, 'kvmname', column_name, new_value);
        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.path <> OLD.path THEN
        SET column_name = 'path';
        SET new_value = NEW.path;
        INSERT INTO kvm_log (kvm_id, table_name, column_name, new_value) VALUES (OLD.id, 'kvmname', column_name, new_value);
        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.bannertime <> OLD.bannertime THEN
        SET column_name = 'bannertime';
        SET new_value = NEW.bannertime;
        INSERT INTO kvm_log (kvm_id, table_name, column_name, new_value) VALUES (OLD.id, 'kvmname', column_name, new_value);
        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `action_made` text COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `event` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (1,11,'Logged out.','2023-02-26 21:31:29','Access Logout'),(2,11,'Logged in','2023-02-26 21:32:19','Access Login'),(3,3,'Logged in','2023-02-28 01:57:59','Access Login'),(4,3,'Logged out.','2023-02-28 01:58:07','Access Logout'),(5,5,'Logged in','2023-02-28 01:58:31','Access Login'),(6,16,'Logged in','2023-02-28 02:09:16','Access Login'),(7,16,'Logged out.','2023-02-28 02:09:20','Access Logout'),(8,5,'Logged in','2023-02-28 02:09:38','Access Login'),(9,8,'Logged in','2023-02-28 02:13:53','Access Login'),(10,8,'Logged out.','2023-02-28 03:50:38','Access Logout'),(11,5,'Logged in','2023-02-28 05:14:40','Access Login'),(12,5,'Logged out.','2023-02-28 05:55:55','Access Logout'),(13,11,'Logged in','2023-02-28 05:56:15','Access Login'),(14,11,'Logged out.','2023-02-28 05:59:21','Access Logout'),(15,4,'Logged in','2023-02-28 06:00:08','Access Login'),(16,4,'Logged out.','2023-02-28 06:00:16','Access Logout'),(17,15,'Logged in','2023-02-28 06:00:23','Access Login'),(18,15,'Logged out.','2023-02-28 06:00:25','Access Logout'),(19,5,'Logged in','2023-02-28 06:00:31','Access Login'),(20,5,'Logged out.','2023-02-28 19:24:25','Access Logout'),(21,12,'Logged in','2023-02-28 19:24:40','Access Login'),(22,12,'Logged out.','2023-02-28 19:24:46','Access Logout'),(23,6,'Logged in','2023-02-28 19:24:55','Access Login'),(24,6,'Logged out.','2023-02-28 19:24:58','Access Logout'),(25,11,'Logged in','2023-02-28 19:25:22','Access Login'),(26,1,'Logged in','2024-02-23 00:11:27','Access Login'),(27,1,'Logged in','2024-02-25 04:01:35','Access Login'),(28,1,'Logged in','2024-02-27 04:45:19','Access Login'),(29,1,'Logged in','2024-02-28 01:48:43','Access Login'),(30,1,'Logged in','2024-02-28 01:49:00','Access Login'),(31,1,'Logged in','2024-02-28 02:01:49','Access Login'),(32,1,'Logged in','2024-02-28 02:50:40','Access Login'),(33,1,'Logged in','2024-02-28 03:20:18','Access Login'),(34,1,'Logged in','2024-02-28 03:40:08','Access Login'),(35,1,'Logged in','2024-02-28 03:59:08','Access Login'),(36,1,'Logged in','2024-02-28 04:26:52','Access Login'),(37,1,'Logged in','2024-02-28 04:31:06','Access Login'),(38,1,'Logged in','2024-02-28 04:41:39','Access Login'),(39,1,'Logged in','2024-02-28 20:52:18','Access Login'),(40,1,'Logged in','2024-02-28 21:51:02','Access Login'),(41,2,'Logged out.','2024-02-28 21:51:09','Access Logout'),(42,1,'Logged in','2024-02-28 21:51:14','Access Login'),(43,1,'Logged in','2024-03-03 21:14:28','Access Login'),(44,9,'Logged out.','2024-03-03 23:36:05','Access Logout'),(45,14,'Logged out.','2024-03-03 23:42:44','Access Logout'),(46,14,'Logged out.','2024-03-03 23:43:15','Access Logout'),(47,14,'Logged out.','2024-03-03 23:51:25','Access Logout'),(48,2,'Logged out.','2024-03-03 23:55:00','Access Logout'),(49,14,'Logged out.','2024-03-03 23:55:23','Access Logout'),(50,9,'Logged out.','2024-03-03 23:58:03','Access Logout'),(51,9,'Logged out.','2024-03-04 00:04:35','Access Logout'),(52,2,'Logged out.','2024-03-04 00:05:46','Access Logout'),(53,9,'Logged out.','2024-03-04 00:08:52','Access Logout'),(54,15,'Logged out.','2024-03-04 00:10:07','Access Logout'),(55,14,'Logged out.','2024-03-04 00:14:29','Access Logout'),(56,14,'Logged out.','2024-03-04 00:20:12','Access Logout'),(57,9,'Logged out.','2024-03-04 00:27:03','Access Logout'),(58,1,'Logged out.','2024-03-04 00:30:29','Access Logout'),(59,1,'Logged out.','2024-03-04 00:32:44','Access Logout'),(60,1,'Logged out.','2024-03-04 00:35:15','Access Logout'),(61,2,'Logged out.','2024-03-04 00:38:04','Access Logout'),(62,1,'Logged out.','2024-03-04 00:38:26','Access Logout'),(63,1,'Logged out.','2024-03-04 00:38:26','Access Logout'),(64,14,'Logged out.','2024-03-04 00:41:53','Access Logout'),(65,9,'Logged out.','2024-03-04 00:45:52','Access Logout'),(66,2,'Logged out.','2024-03-04 00:54:47','Access Logout'),(67,1,'Logged out.','2024-03-04 00:55:18','Access Logout');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `port_log`
--

DROP TABLE IF EXISTS `port_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `port_log` (
  `port_id` int NOT NULL,
  `table_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `column_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `new_value` text COLLATE utf8mb4_general_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `switch_id` int DEFAULT NULL,
  KEY `fk_swi` (`switch_id`),
  CONSTRAINT `fk_swi` FOREIGN KEY (`switch_id`) REFERENCES `switch` (`switch_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `port_log`
--

LOCK TABLES `port_log` WRITE;
/*!40000 ALTER TABLE `port_log` DISABLE KEYS */;
INSERT INTO `port_log` VALUES (10,'portname','resolution','640 * 480','2023-11-24 05:37:14',23),(1,'portname','linktype','StandardPort','2023-11-24 05:41:57',32),(5,'portname','framerate','60 fps','2023-11-24 06:43:13',28),(13,'portname','macaddr','06:42:4e:d2:03:2H','2023-11-24 06:46:40',20),(2,'portname','framerate','30 fps','2023-11-24 06:54:12',31),(2,'portname','framerate','60 fps','2023-11-24 07:00:36',31),(1,'portname','linktype','KvmSwitch','2023-11-24 07:15:45',32),(7,'portname','macaddr','06:42:4e:d1:03:2a','2023-11-24 07:20:23',26),(2,'portname','resolution','320 * 240','2023-11-24 07:47:11',31),(2,'portname','linktype','KvmSwitch','2023-11-24 07:50:14',31),(2,'portname','audio','Digital','2023-11-24 08:01:09',31),(10,'portname','macaddr','01:40:4e:d1:03:2a','2023-11-24 08:06:32',23),(14,'portname','macaddr','06:42:4e:d1:03:26','2023-11-24 08:15:50',19),(1,'portname','resolution','320 * 240','2023-11-24 08:33:56',32),(2,'portname','media','/opt/lampp/htdocs/','2023-11-24 08:35:51',31),(6,'portname','resolution','1920 * 1080','2023-11-24 08:36:47',27),(3,'portname','portname','server3','2023-11-24 09:01:45',30),(7,'portname','resolution','1280 * 720','2023-11-24 09:08:39',26),(3,'portname','resolution','1920 * 1080','2023-11-24 09:23:02',30),(2,'portname','resolution','3840 * 2160','2023-11-24 09:24:15',31),(5,'portname','resolution','1920 * 1080','2023-11-24 09:44:32',28),(10,'portname','media','/opt/lampp/htdocs/','2023-11-24 09:47:10',23),(13,'portname','media','/opt/lampp/htdocs/','2023-11-24 09:55:56',20),(4,'portname','resolution','1280 * 720','2023-11-24 10:45:03',29),(1,'portname','linktype','StandardPort','2023-11-24 10:45:17',32),(1,'portname','audio','Analog','2024-02-23 09:06:48',32),(2,'portname','audio','OFF','2024-02-23 09:06:53',31),(8,'portname','media','/opt/lampp/htdocs/','2024-02-23 09:07:56',25),(2,'portname','resolution','1920 * 1080','2024-02-23 09:10:42',31),(4,'portname','framerate','15 fps','2024-02-23 09:10:51',29),(2,'portname','audio','Digital','2024-02-23 09:12:38',31),(2,'portname','format','Mono, 48KHz','2024-02-23 09:12:38',31),(5,'portname','resolution','1920 * 1080','2024-02-23 09:12:47',28),(8,'portname','framerate','15 fps','2024-02-23 09:12:53',25),(3,'portname','audio','Digital','2024-02-25 12:04:06',30),(3,'portname','format','Stereo, 48KHz','2024-02-25 12:04:06',30),(3,'portname','resolution','3840 * 2160','2024-02-25 12:04:12',30),(8,'portname','framerate','60 fps','2024-02-25 12:04:17',25),(3,'portname','framerate','15 fps','2024-02-25 12:04:46',30),(13,'portname','linktype','KvmSwitch','2024-02-25 12:04:58',20),(5,'portname','media','/opt/lampp/htdocs/','2024-02-25 12:05:04',28),(2,'portname','enable16','on','2024-02-25 12:05:09',31),(3,'portname','scan15','s','2024-02-25 12:05:15',30),(2,'portname','a2','View','2024-02-25 12:05:21',31),(6,'portname','connect','1','2024-02-28 10:36:24',27),(3,'portname','linktype','KvmSwitch','2024-02-28 12:27:17',30),(18,'portname','connect','3','2024-02-28 12:41:48',15),(2,'portname','connect','2','2024-02-28 12:41:53',31),(6,'portname','connect','2','2024-02-28 12:41:56',27),(6,'portname','connect','3','2024-02-28 12:41:58',27),(7,'portname','connect','2','2024-02-28 12:47:45',26),(2,'portname','connect','3','2024-02-28 12:48:30',31),(2,'portname','connect','1','2024-02-28 12:51:42',31),(3,'portname','connect','1','2024-02-28 12:51:42',30),(4,'portname','connect','1','2024-02-28 12:51:42',29),(5,'portname','connect','1','2024-02-28 12:51:42',28),(6,'portname','connect','1','2024-02-28 12:51:42',27),(7,'portname','connect','1','2024-02-28 12:51:42',26),(10,'portname','connect','1','2024-02-28 12:51:42',23),(12,'portname','connect','1','2024-02-28 12:51:42',21),(13,'portname','connect','1','2024-02-28 12:51:42',20),(17,'portname','connect','1','2024-02-28 12:51:42',16),(18,'portname','connect','1','2024-02-28 12:51:42',15),(19,'portname','connect','1','2024-02-28 12:51:42',14),(20,'portname','connect','1','2024-02-28 12:51:42',13),(21,'portname','connect','1','2024-02-28 12:51:42',12),(25,'portname','connect','1','2024-02-28 12:51:42',8),(26,'portname','connect','1','2024-02-28 12:51:42',7),(27,'portname','connect','1','2024-02-28 12:51:42',6),(28,'portname','connect','1','2024-02-28 12:51:42',5),(29,'portname','connect','1','2024-02-28 12:51:42',4),(30,'portname','connect','1','2024-02-28 12:51:42',3),(31,'portname','connect','1','2024-02-28 12:51:42',2),(32,'portname','connect','1','2024-02-28 12:51:42',1),(6,'portname','resolution','1920 * 1080','2024-02-29 04:52:51',27),(7,'portname','media','/opt/lampp/htdocs/','2024-02-29 05:53:59',26);
/*!40000 ALTER TABLE `port_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `port_queue`
--

DROP TABLE IF EXISTS `port_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `port_queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `portname` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `decoder_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `request_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(50) COLLATE utf8mb4_general_ci DEFAULT 'waiting',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `port_queue`
--

LOCK TABLES `port_queue` WRITE;
/*!40000 ALTER TABLE `port_queue` DISABLE KEYS */;
INSERT INTO `port_queue` VALUES (1,14,'port1','decoder1','2023-12-19 11:33:12','busy'),(2,14,'port1','decoder1','2023-12-19 11:49:05','waiting'),(3,14,'port1','decoder1','2023-12-19 11:49:57','waiting'),(4,14,'port2','decoder1','2023-12-20 05:09:27','waiting'),(5,14,'port2','decoder1','2023-12-20 05:09:29','waiting'),(6,14,'port7','decoder1','2023-12-20 05:42:42','waiting'),(7,14,'port7','decoder1','2023-12-20 06:28:37','waiting'),(8,14,'port8','decoder1','2023-12-20 06:28:40','waiting'),(9,14,'port1','decoder1','2023-12-20 08:49:34','waiting'),(10,14,'port4','decoder1','2023-12-21 04:48:33','waiting'),(11,14,'port3','decoder1','2023-12-21 05:58:35','waiting'),(12,14,'port8','decoder1','2023-12-21 05:58:39','waiting'),(13,14,'port1','decoder1','2023-12-21 05:58:43','waiting'),(14,1,'port3','decoder1','2023-12-27 05:43:37','waiting'),(15,1,'server2','decoder1','2024-01-03 05:37:47','waiting'),(16,11,'ENCODER1','decoder1','2024-01-05 05:10:57','waiting'),(17,11,'ENCODER1','decoder1','2024-01-05 06:00:49','waiting'),(18,1,'ENCODER1','decoder1','2024-01-05 08:50:02','waiting'),(19,14,'ENCODER1','decoder1','2024-01-08 05:19:24','waiting'),(20,14,'ENCODER1','decoder1','2024-01-08 05:27:10','waiting'),(21,14,'ENCODER1','decoder1','2024-01-08 05:27:48','waiting'),(22,14,'portserver1','decoder1','2024-01-08 05:29:08','waiting'),(23,14,'portserver1','decoder1','2024-01-08 08:28:38','waiting'),(24,1,'ENCODER1','decoder1','2024-01-11 08:55:13','waiting'),(25,16,'ENCODER1','decoder1','2024-01-16 05:39:55','waiting'),(26,2,'encoder6','decoder1','2024-02-28 10:36:25','waiting'),(27,2,'encoder7','decoder1','2024-02-28 12:47:45','waiting'),(28,2,'encoder2','decoder1','2024-02-28 12:48:30','waiting');
/*!40000 ALTER TABLE `port_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portname`
--

DROP TABLE IF EXISTS `portname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portname` (
  `id` int NOT NULL AUTO_INCREMENT,
  `portname` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `ip_address` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `macaddr` text COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `pc_online` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `linktype` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `audio` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `version` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `media` text COLLATE utf8mb4_general_ci NOT NULL,
  `format` text COLLATE utf8mb4_general_ci NOT NULL,
  `resolution` text COLLATE utf8mb4_general_ci,
  `framerate` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `connect` int NOT NULL,
  `decoder_name` text COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `lastupdatedby` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `upgrade` int NOT NULL,
  `path` text COLLATE utf8mb4_general_ci NOT NULL,
  `enable1` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `enable2` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `enable3` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `enable4` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `enable5` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `enable6` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `enable7` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `enable8` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `enable9` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `enable10` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `enable11` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `enable12` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `enable13` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `enable14` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `enable15` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `enable16` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `scan1` text COLLATE utf8mb4_general_ci NOT NULL,
  `scan2` text COLLATE utf8mb4_general_ci NOT NULL,
  `scan3` text COLLATE utf8mb4_general_ci NOT NULL,
  `scan4` text COLLATE utf8mb4_general_ci NOT NULL,
  `scan5` text COLLATE utf8mb4_general_ci NOT NULL,
  `scan6` text COLLATE utf8mb4_general_ci NOT NULL,
  `scan7` text COLLATE utf8mb4_general_ci NOT NULL,
  `scan8` text COLLATE utf8mb4_general_ci NOT NULL,
  `scan9` text COLLATE utf8mb4_general_ci NOT NULL,
  `scan10` text COLLATE utf8mb4_general_ci NOT NULL,
  `scan11` text COLLATE utf8mb4_general_ci NOT NULL,
  `scan12` text COLLATE utf8mb4_general_ci NOT NULL,
  `scan13` text COLLATE utf8mb4_general_ci NOT NULL,
  `scan14` text COLLATE utf8mb4_general_ci NOT NULL,
  `scan15` text COLLATE utf8mb4_general_ci NOT NULL,
  `scan16` text COLLATE utf8mb4_general_ci NOT NULL,
  `a1` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `a2` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `a3` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `a4` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `a5` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `a6` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `a7` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `a8` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `a9` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `a10` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `a11` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `a12` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `a13` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `a14` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `a15` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `a16` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `switch_id` int DEFAULT NULL,
  `decoder_count` int DEFAULT NULL,
  `image_data` blob,
  `image_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `switch_id` (`switch_id`),
  KEY `decoder_count` (`decoder_count`),
  CONSTRAINT `portname_ibfk_1` FOREIGN KEY (`switch_id`) REFERENCES `switch` (`switch_id`),
  CONSTRAINT `portname_ibfk_2` FOREIGN KEY (`decoder_count`) REFERENCES `decoder` (`decoder_count`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portname`
--

LOCK TABLES `portname` WRITE;
/*!40000 ALTER TABLE `portname` DISABLE KEYS */;
INSERT INTO `portname` VALUES (1,'encoder1','192.168.1.1','06:42:4e:d1:03:2l','HDMI-CIM','Yes','KvmSwitch','Analog','2.0.0.2010','/opt/lampp/htdocs/default.json','Stereo, 96KHz','3840 * 2160','60 fps',1,'decoder1','busy','2024-02-23 09:06:48',1,'C:/xampp1/htdocs/','on','','on','on','on','on','on','on','on','on','on','on','on','on','on','on','s','','','s','s','s','s','s','s','s','s','s','s','s','s','s','Share','Private','Private','Share','','','','','Share','View','Private','','View','Private','','',32,NULL,NULL,'port1.jpg'),(2,'encoder2','170.1.1.2','06:42:4e:d1:03:2g','DP-CIM','Yes','KvmSwitch','Digital','2.0.0.2010','/opt/lampp/htdocs/index.js','Mono, 48KHz','1920 * 1080','15 fps',1,'decoder1','busy','2024-02-28 12:51:42',1,'C:/xampp1/htdocs/index.js','on','on','on','on','on','','on','on','on','on','on','on','on','on','','on','s','s','s','s','s','s','s','s','s','s','s','s','s','s','s','s','View','View','Share','Private','View','Private','View','View','Share','Private','','','','Share','','',31,NULL,NULL,'port2.jpg'),(3,'encoder3','160.1.1.1','01:42:4e:d1:03:2d','HDMI-CIM','Yes','KvmSwitch','Digital','2.0','/opt/lampp/var/','Stereo, 48KHz','3840 * 2160','15 fps',1,'decoder1','busy','2024-02-28 12:51:42',0,'','on','on','on','on','on','on','on','on','on','on','on','on','on','on','on','on','s','s','s','s','','s','s','s','s','s','s','s','s','s','s','','','','Share','Share','','Private','','Private','','','','','','View','','',30,3,NULL,'port3.jpg'),(4,'encoder4','150.1.1.1','09:42:4e:d1:03:2w','HDMI-CIM','Yes','KvmSwitch','Analog','2.0.0.2010','/opt/lampp/htdocs/','Stereo, 48KHz','640 * 480','15 fps',1,'decoder1','busy','2024-02-28 12:51:42',1,'C:/xampp1/htdocs/Order_ID_5030927518.pdf','on','on','on','on','on','on','on','on','on','on','on','on','on','on','on','on','s','s','s','s','s','s','s','s','s','s','s','s','s','s','s','s','','','','','','','','','','','','','','','','',29,NULL,NULL,'port4.jpg'),(5,'encoder5','140.1.1.1','16:42:4e:d7:03:2f','DP-CIM','Yes','KvmSwitch','Analog','2.0.0.2010','/opt/lampp/htdocs/','Mono, 44.1KHz','1920 * 1080','30 fps',1,'decoder1','busy','2024-02-28 12:51:42',0,'','on','on','on','on','on','on','','on','on','on','on','on','on','on','on','on','s','s','s','s','s','s','s','s','s','s','s','s','s','s','s','s','','','','','','Private','','','','','','','','','','',28,NULL,NULL,'port5.jpg'),(6,'encoder6','10.5.5.2','06:42:4e:d1:03:2a','HDMI-CIM','Yes','Standard Port','Analog','2.0.0.2','/opt/lampp/htdocs/','Stereo, 96KHz','1920 * 1080','60 fps',1,'decoder1','busy','2024-02-29 04:52:51',1,'C:/xampp1/htdocs/build.js','on','on','on','on','on','on','on','on','on','on','on','on','on','on','on','on','s','s','s','s','s','s','s','s','s','s','s','s','s','s','s','s','','','','','','','','','','','','','','View','','',27,NULL,NULL,'port6.jpg'),(7,'encoder7','10.5.5.2','06:42:4e:d1:03:2a','HDMI-CIM','Yes','Standard Port','Analog','2.0.0.2010','/opt/lampp/htdocs/','Stereo, 96KHz','1280 * 720','60 fps',1,'decoder1','busy','2024-02-29 05:53:59',1,'C:/xampp1/htdocs/','on','on','on','on','on','on','on','on','on','on','on','on','on','on','on','on','s','s','s','s','s','s','s','s','s','s','s','s','s','s','s','s','','Private','','View','','','','','','','','','','share','','',26,NULL,NULL,'port7.jpg'),(8,'encoder8','10.5.5.2','06:42:4e:d1:06:2e','DP-CIM','Yes','Standard Port','Digital','2.0.0.2010','/opt/lampp/htdocs/','Stereo, 96KHz',' 800 * 600','60 fps',1,'decoder1','busy','2024-02-25 12:04:17',0,'','on','on','on','on','on','on','on','on','on','on','on','on','on','on','on','on','s','s','s','s','s','s','s','s','s','s','s','s','s','s','s','s','','','','','','','','View','','','','','','','','',25,NULL,NULL,'port8.jpg'),(9,'encoder9','10.5.5.2','06:42:4e:d1:03:2H','HDMI-CIM','Yes','Standard Port','OFF','2.0.0.2010','/opt/lampp/var/','Stereo, 96KHz','1280 * 720','30 fps',1,'','idel','2024-02-23 09:00:42',0,'','on','','on','on','','on','','','','','','','on','on','','','','s','','','','s','','','','','','s','','s','s','','','','','','','','','','','','','','','','','',24,NULL,NULL,'/home/acclivis/Desktop/images/port9.jpg'),(10,'encoder10','12.2.2.2','01:40:4e:d1:03:2a','HDMI-CIM','Yes','KvmSwitch','Analog','2.0.0.2010','/opt/lampp/htdocs/','Stereo, 96KHz','640 * 480','30 fps',1,'','idel','2024-02-28 12:51:42',0,'','on','','on','','','','on','on','','','on','','','','','on','','s','','','','s','','','','','s','','s','','s','','','','','','','','','','','','','','','','','',23,NULL,NULL,'/home/acclivis/Desktop/images/port10.jpg'),(11,'encoder11','12.2.2.2','06:42:4e:d1:03:2H','HDMI-CIM','Yes','Standard Port','Digital','2.0.0.2010','/opt/lampp/htdocs/','Stereo, 96KHz','320 * 240','15 fps',1,'','busy','2024-02-23 09:00:42',0,'','on','on','on','','','','','','','','','on','on','on','on','','','s','','','s','','s','','s','','','s','','s','','','View','','View','','View','','View','','','','','','','','','',22,NULL,NULL,'/home/acclivis/Desktop/images/port11.jpg'),(12,'encoder12','12.2.2.2','06:42:4e:d1:01:2H','DP-CIM','','Standard Port','Analog','2.0.0.2010','/opt/lampp/var/','Stereo, 96KHz','320 * 240','15 fps',1,'','','2024-02-28 12:51:42',0,'','','','on','on','on','','','','','on','','on','','','on','on','','s','','','','','s','s','','','s','s','','s','','','','','','View','','','','','','','','','','','','',21,NULL,NULL,'/home/acclivis/Desktop/images/port12.jpg'),(13,'encoder13','12.2.2.2','06:42:4e:d2:03:2H','HDMI-CIM','','KvmSwitch','Digital','2.0.0.2010','/opt/lampp/htdocs/','Stereo, 96KHz',' 800 * 600','30 fps',1,'','idel','2024-02-28 12:51:42',0,'','','on','','','','','','','','','on','on','on','on','','','s','','','','','s','','s','','s','','','','s','','','','','','','','','','','','','','','','View','','',20,NULL,NULL,'/home/acclivis/Desktop/images/port13.jpg'),(14,'encoder14','12.2.2.2','06:42:4e:d1:03:26','HDMI-CIM','Yes','Standard Port','Analog','2.0.0.2010','/opt/lampp/var/','Stereo, 96KHz','1280 * 720','60 fps',1,'decoder1','busy','2024-02-23 09:00:42',0,'','on','','','','','','','on','','on','','on','','','on','','s','','','','','','','','','s','','s','s','','s','','','','','','','','','Private','','','','','','','','',19,NULL,NULL,'/home/acclivis/Desktop/images/port14.jpg'),(15,'encoder15','12.2.2.2','06:42:4e:d1:03:2H','HDMI-CIM','Yes','Standard Port','Digital','2.0.0.2010','/opt/lampp/var/','Stereo, 96KHz','320 * 240','60 fps',1,'','busy','2024-02-23 09:00:42',0,'','on','','','','','','','','','on','','','on','on','','on','s','s','','','','','','','','','','s','','','s','s','','','','','','','','','','','','','','','','',18,NULL,NULL,'/home/acclivis/Desktop/images/port15.jpg'),(16,'encoder16','12.2.2.2','06:42:4e:d1:03:2H','HDMI-CIM','Yes','Standard Port','Analog','2.0.0.2010','/opt/lampp/htdocs/','Stereo, 96KHz','1920 * 1080','60 fps',1,'','','2024-02-23 09:00:42',1,'C:/xampp1/htdocs/','on','','','','','','on','','on','','','on','','','','','s','','','','','','','','','','','s','s','','','s','','','','','','','','View','','Private','','','','','','',17,NULL,NULL,'/home/acclivis/Desktop/images/port16.jpg'),(17,'encoder17','12.2.2.2','06:42:4e:d1:03:2H','DP-CIM','','Standard Port','Digital','2.0.0.2010','/opt/lampp/var/','Stereo, 96KHz','1280 * 720','30 fps',1,'','','2024-02-28 12:51:42',0,'','','','','on','on','','','','on','on','','','on','','on','','','s','','','','','','','','','s','s','s','','s','','View','','','','','','','','','','','','','','','',16,NULL,NULL,'/home/acclivis/Desktop/images/port17.jpg'),(18,'encoder18','12.2.2.2','06:42:4e:d1:03:2H','HDMI-CIM','Yes','KvmSwitch','Analog','2.0.0.2010','/opt/lampp/htdocs/','Stereo, 96KHz','3840 * 2160','60 fps',1,'decoder1','busy','2024-02-28 12:51:42',0,'','','on','','','','','','on','on','','','','on','','on','on','s','','','','','s','','','','','s','s','','','','','','','','','','','','','','','Private','','','','','',15,NULL,NULL,'/home/acclivis/Desktop/images/port18.jpg'),(19,'encoder19','12.2.2.2','16:42:4e:d1:03:2j','DP-CIM','','Standard Port','Digital','2.0.0.2010','/opt/lampp/var/','Stereo, 96KHz','640 * 480','15 fps',1,'','','2024-02-28 12:51:42',0,'','on','','','on','on','','','','','on','','','','','','','s','','','s','s','s','','','s','','s','','','','','','','','','','','','','','','','','','','','','',14,NULL,NULL,'/home/acclivis/Desktop/images/port19.jpg'),(20,'encoder20','12.2.2.2','06:42:4e:d1:03:2H','HDMI-CIM','','Standard Port','Analog','2.0.0.2010','/opt/lampp/var/','Stereo, 96KHz','640 * 480','60 fps',1,'','','2024-02-28 12:51:42',0,'','on','','','','','','on','on','','on','on','','','','on','on','s','','s','s','s','s','s','s','','','s','','','','','','','','','','','','','','','','','','','','','',13,NULL,NULL,'/home/acclivis/Desktop/images/port20.jpg'),(21,'encoder21','12.2.2.2','10:42:4e:d1:03:2d','HDMI-CIM','','KvmSwitch','Digital','2.0.0.2010','/opt/lampp/var/','Stereo, 96KHz','320 * 240','15 fps',1,'','','2024-02-28 12:51:42',0,'','on','','','','','on','on','','','on','','','','','','','','','','','','','s','','','s','','s','s','s','','','','','','','','','','','','','','','','','','',12,NULL,NULL,'/home/acclivis/Desktop/images/port21.jpg'),(22,'encoder22','12.2.2.2','06:42:4e:d1:03:2H','HDMI-CIM','Yes','Standard Port','OFF','2.0.0.2010','/opt/lampp/var/','Stereo, 96KHz','640 * 480','60 fps',1,'','','2024-02-23 09:00:42',0,'','on','','','','','','','','','on','','on','on','on','','','','s','','','','','','s','','','s','s','s','','s','','','','','','','','','','','','','','','','','',11,NULL,NULL,'/home/acclivis/Desktop/images/port22.jpg'),(23,'encoder23','12.2.2.2','06:42:4e:d1:03:2H','DP-CIM','Yes','Standard Port','Digital','2.0.0.2010','/opt/lampp/htdocs/','Mono, 44.1KHz','1280 * 720','60 fps',1,'','','2024-02-23 09:00:42',0,'','on','','','','on','','','','on','','','on','','','','','s','','','','s','','','','','s','','s','','','','s','','','View','','','','','','','','','','','','','',10,NULL,NULL,'/home/acclivis/Desktop/images/port23.jpg'),(24,'encoder24','12.2.2.2','06:42:4e:d1:03:2H','HDMI-CIM','Yes','Standard Port','Digital','2.0.0.2010','/opt/lampp/var/','Stereo, 96KHz','3840 * 2160','30 fps',1,'','','2024-02-23 09:00:42',1,'C:/xampp1/htdocs/','on','','','','','','','','','','on','','','on','','','s','','','','','','','','','s','','s','s','s','','','','','','','','','','','','','','','','','','',9,NULL,NULL,'/home/acclivis/Desktop/images/port24.jpg'),(25,'encoder25','12.2.2.2','06:42:4e:d1:03:2H','HDMI-CIM','','Standard Port','Analog','2.0.0.2010','/opt/lampp/var/','Stereo, 96KHz','1280 * 720','15 fps',1,'','','2024-02-28 12:51:42',0,'','','on','','','','','on','','on','','','','on','on','on','','','','','s','','','s','','s','s','','','s','','s','','','','','','','','','','','','','','','','','',8,NULL,NULL,'/home/acclivis/Desktop/images/port25.jpg'),(26,'encoder26','12.2.2.2','06:42:4e:d1:03:2H','HDMI-CIM','','Standard Port','Analog','2.0.0.2010','/opt/lampp/var/','Stereo, 96KHz','3840 * 2160','60 fps',1,'','','2024-02-28 12:51:42',0,'','on','','','','','','on','on','','on','on','on','','','','','','','s','','','','s','s','s','','','s','','s','','','','','','','','','','','','','','','','','','',7,NULL,NULL,'/home/acclivis/Desktop/images/port26.jpg'),(27,'encoder27','12.2.2.2','06:42:4e:d1:03:2H','HDMI-CIM','','Standard Port','Analog','2.0.0.2010','/opt/lampp/var/','Stereo, 96KHz','640 * 480','60 fps',1,'','','2024-02-28 12:51:42',0,'','','','','','','','','','','','on','','on','','on','','','','','','','s','s','s','','s','s','','s','','','','','','','','','','','','','','','','','','','',6,NULL,NULL,'/home/acclivis/Desktop/images/port27.jpg'),(28,'encoder28','12.2.2.2','06:42:4e:d1:03:2H','HDMI-CIM','','Standard Port','Analog','2.0.0.2010','/opt/lampp/var/','Stereo, 96KHz','1920 * 1080','60 fps',1,'','','2024-02-28 12:51:42',0,'','','on','','','','','','','on','on','','on','','','','','s','','','','','','','','','s','s','s','s','','','s','','','','','','','','','','','','','','','','',5,NULL,NULL,'/home/acclivis/Desktop/images/port28.jpg'),(29,'encoder29','12.2.2.2','06:42:4e:d1:03:2H','HDMI-CIM','','Standard Port','Analog','2.0.0.2010','/opt/lampp/var/','Stereo, 96KHz','640 * 480','60 fps',1,'','','2024-02-28 12:51:42',0,'','on','on','on','','','','','','','','','on','','','','on','','','s','','s','','s','s','','s','','s','','','','','','','','','','','','','','','','','','','','',4,NULL,NULL,'/home/acclivis/Desktop/images/port29.jpg'),(30,'encoder30','12.2.2.2','06:42:4e:d1:03:2H','HDMI-CIM','','Standard Port','Analog','2.0.0.2010','/opt/lampp/var/','Stereo, 96KHz','1920 * 1080','60 fps',1,'','','2024-02-28 12:51:42',0,'','on','','','','','','','','','','','','on','','','','s','s','','','','','s','','','','','s','s','s','','','','','','','','','','','','','','','','','','',3,NULL,NULL,'/home/acclivis/Desktop/images/port30.jpg'),(31,'encoder31','12.2.2.2','06:42:4e:d1:03:2H','HDMI-CIM','','Standard Port','Analog','2.0.0.2010','/opt/lampp/var/','Stereo, 96KHz','640 * 480','60 fps',1,'','','2024-02-28 12:51:42',0,'','','','','','','','on','','','on','','','on','on','','','s','','','','','','','s','','s','','s','','s','','','','','','','','','','','','','','','','','','',2,NULL,NULL,'/home/acclivis/Desktop/images/port31.jpg'),(32,'encoder32','12.2.2.2','06:42:4e:d1:03:2H','HDMI-CIM','','Standard Port','Analog','2.0.0.2010','/opt/lampp/var/','Stereo, 96KHz','1920 * 1080','60 fps',1,'','','2024-02-28 12:51:42',0,'','','on','','','','on','','','','','on','','on','','','','','','','s','','','','','','s','','','s','s','','','','','','','','','','','','','','','','','','',1,NULL,NULL,'/home/acclivis/Desktop/images/port32.jpg');
/*!40000 ALTER TABLE `portname` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `port_trigger` AFTER UPDATE ON `portname` FOR EACH ROW BEGIN
    DECLARE column_name VARCHAR(50);
    DECLARE new_value TEXT;
    DECLARE trigger_name VARCHAR(50);
    DECLARE portname_switch_id INT;

    SET trigger_name = 'portname_trigger';

    IF NEW.portname <> OLD.portname THEN
        SET column_name = 'portname';
        SET new_value = NEW.portname;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.ip_address <> OLD.ip_address THEN
        SET column_name = 'ip_address';
        SET new_value = NEW.ip_address;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.macaddr <> OLD.macaddr THEN
        SET column_name = 'macaddr';
        SET new_value = NEW.macaddr;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.type <> OLD.type THEN
        SET column_name = 'type';
        SET new_value = NEW.type;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

        IF NEW.pc_online <> OLD.pc_online THEN
        SET column_name = 'pc_online';
        SET new_value = NEW.pc_online;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.linktype <> OLD.linktype THEN
        SET column_name = 'linktype';
        SET new_value = NEW.linktype;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.audio <> OLD.audio THEN
        SET column_name = 'audio';
        SET new_value = NEW.audio;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.format <> OLD.format THEN
        SET column_name = 'format';
        SET new_value = NEW.format;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.resolution <> OLD.resolution THEN
        SET column_name = 'resolution';
        SET new_value = NEW.resolution;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.framerate <> OLD.framerate THEN
        SET column_name = 'framerate';
        SET new_value = NEW.framerate;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

        IF NEW.connect <> OLD.connect THEN
        SET column_name = 'connect';
        SET new_value = NEW.connect;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.decoder_name <> OLD.decoder_name THEN
        SET column_name = 'decoder_name';
        SET new_value = NEW.decoder_name;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                IF NEW.path <> OLD.path THEN
        SET column_name = 'path';
        SET new_value = NEW.path;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    
                IF NEW.upgrade <> OLD.upgrade THEN
        SET column_name = 'upgrade';
        SET new_value = NEW.upgrade;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

        IF NEW.switch_id <> OLD.switch_id THEN
        SET column_name = 'switch_id';
        SET new_value = NEW.switch_id;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

        IF NEW.decoder_count <> OLD.decoder_count THEN
        SET column_name = 'decoder_count';
        SET new_value = NEW.decoder_count;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.media <> OLD.media THEN
        SET column_name = 'media';
        SET new_value = NEW.media;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                IF NEW.a1 <> OLD.a1 THEN
        SET column_name = 'a1';
        SET new_value = NEW.a1;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                IF NEW.a2 <> OLD.a2 THEN
        SET column_name = 'a2';
        SET new_value = NEW.a2;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.a3 <> OLD.a3 THEN
        SET column_name = 'a3';
        SET new_value = NEW.a3;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.a4 <> OLD.a4 THEN
        SET column_name = 'a4';
        SET new_value = NEW.a4;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.a5 <> OLD.a5 THEN
        SET column_name = 'a5';
        SET new_value = NEW.a5;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.a6 <> OLD.a6 THEN
        SET column_name = 'a6';
        SET new_value = NEW.a6;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.a7 <> OLD.a7 THEN
        SET column_name = 'a7';
        SET new_value = NEW.a7;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.a8 <> OLD.a8 THEN
        SET column_name = 'a8';
        SET new_value = NEW.a8;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.a9 <> OLD.a9 THEN
        SET column_name = 'a9';
        SET new_value = NEW.a9;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.a10 <> OLD.a10 THEN
        SET column_name = 'a10';
        SET new_value = NEW.a10;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.a11 <> OLD.a11 THEN
        SET column_name = 'a11';
        SET new_value = NEW.a11;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.a12 <> OLD.a12 THEN
        SET column_name = 'a12';
        SET new_value = NEW.a12;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.a13 <> OLD.a13 THEN
        SET column_name = 'a13';
        SET new_value = NEW.a13;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.a14 <> OLD.a14 THEN
        SET column_name = 'a14';
        SET new_value = NEW.a14;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.a15 <> OLD.a15 THEN
        SET column_name = 'a15';
        SET new_value = NEW.a15;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.a16 <> OLD.a16 THEN
        SET column_name = 'a16';
        SET new_value = NEW.a16;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.enable1 <> OLD.enable1 THEN
        SET column_name = 'enable1';
        SET new_value = NEW.enable1;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable2 <> OLD.enable2 THEN
        SET column_name = 'enable2';
        SET new_value = NEW.enable2;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable3 <> OLD.enable3 THEN
        SET column_name = 'enable3';
        SET new_value = NEW.enable3;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable4 <> OLD.enable4 THEN
        SET column_name = 'enable4';
        SET new_value = NEW.enable4;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable5 <> OLD.enable5 THEN
        SET column_name = 'enable5';
        SET new_value = NEW.enable5;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable6 <> OLD.enable6 THEN
        SET column_name = 'enable6';
        SET new_value = NEW.enable6;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable7 <> OLD.enable7 THEN
        SET column_name = 'enable7';
        SET new_value = NEW.enable7;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable8 <> OLD.enable8 THEN
        SET column_name = 'enable8';
        SET new_value = NEW.enable8;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable9 <> OLD.enable9 THEN
        SET column_name = 'enable9';
        SET new_value = NEW.enable9;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable10 <> OLD.enable10 THEN
        SET column_name = 'enable10';
        SET new_value = NEW.enable10;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable11 <> OLD.enable11 THEN
        SET column_name = 'enable11';
        SET new_value = NEW.enable11;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable12 <> OLD.enable12 THEN
        SET column_name = 'enable12';
        SET new_value = NEW.enable12;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable13 <> OLD.enable13 THEN
        SET column_name = 'enable13';
        SET new_value = NEW.enable13;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable14 <> OLD.enable14 THEN
        SET column_name = 'enable14';
        SET new_value = NEW.enable14;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable15 <> OLD.enable15 THEN
        SET column_name = 'enable15';
        SET new_value = NEW.enable15;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable16 <> OLD.enable16 THEN
        SET column_name = 'enable16';
        SET new_value = NEW.enable16;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

        IF NEW.scan1 <> OLD.scan1 THEN
        SET column_name = 'scan1';
        SET new_value = NEW.scan1;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan2 <> OLD.scan2 THEN
        SET column_name = 'scan2';
        SET new_value = NEW.scan2;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan3 <> OLD.scan3 THEN
        SET column_name = 'scan3';
        SET new_value = NEW.scan3;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan4 <> OLD.scan4 THEN
        SET column_name = 'scan4';
        SET new_value = NEW.scan4;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan5 <> OLD.scan5 THEN
        SET column_name = 'scan5';
        SET new_value = NEW.scan5;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan6 <> OLD.scan6 THEN
        SET column_name = 'scan6';
        SET new_value = NEW.scan6;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan7 <> OLD.scan7 THEN
        SET column_name = 'scan7';
        SET new_value = NEW.scan7;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan8 <> OLD.scan8 THEN
        SET column_name = 'scan8';
        SET new_value = NEW.scan8;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan9 <> OLD.scan9 THEN
        SET column_name = 'scan9';
        SET new_value = NEW.scan9;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan10 <> OLD.scan10 THEN
        SET column_name = 'scan10';
        SET new_value = NEW.scan10;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan11 <> OLD.scan11 THEN
        SET column_name = 'scan11';
        SET new_value = NEW.scan11;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan12 <> OLD.scan12 THEN
        SET column_name = 'scan12';
        SET new_value = NEW.scan12;

        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan13 <> OLD.scan13 THEN
        SET column_name = 'scan13';
        SET new_value = NEW.scan13;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan14 <> OLD.scan14 THEN
        SET column_name = 'scan14';
        SET new_value = NEW.scan14;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan15 <> OLD.scan15 THEN
        SET column_name = 'scan15';
        SET new_value = NEW.scan15;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan16 <> OLD.scan16 THEN
        SET column_name = 'scan16';
        SET new_value = NEW.scan16;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `switch`
--

DROP TABLE IF EXISTS `switch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `switch` (
  `switch_id` int NOT NULL AUTO_INCREMENT,
  `encoder_id` int NOT NULL,
  `kvm_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `kvm_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `lastupdatedby` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`switch_id`),
  KEY `fk_switch` (`encoder_id`),
  CONSTRAINT `fk_switch` FOREIGN KEY (`encoder_id`) REFERENCES `portname` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `switch`
--

LOCK TABLES `switch` WRITE;
/*!40000 ALTER TABLE `switch` DISABLE KEYS */;
INSERT INTO `switch` VALUES (1,32,'Standard Port','Rack2023','2023-11-24 05:02:51'),(2,31,'Standard Port','Rack2023','2023-11-24 05:02:51'),(3,30,'Standard Port','oct','2023-11-24 10:49:16'),(4,29,'Kvm Switch','Rack2023','2023-11-24 09:58:09'),(5,28,'Standard Port','Rack2023','2023-11-24 05:02:51'),(6,27,'Standard Port','Rack2023','2023-11-24 05:02:51'),(7,26,'Standard Port','Rack2023','2023-11-24 05:02:51'),(8,25,'kvm','Rack2023','2023-11-24 11:55:50'),(9,24,'Standard Port','oct','2023-11-24 10:08:41'),(10,23,'Kvm Switch','Rack2023','2023-11-24 06:06:00'),(11,22,'Standard Port','Rack2023','2023-11-24 05:02:51'),(12,21,'Standard Port','Rack2023','2023-11-24 05:02:51'),(13,20,'kvm','Rack2023','2023-11-24 11:59:08'),(14,19,'Standard Port','oct','2023-11-24 10:53:59'),(15,18,'Standard Port','Rack2023','2023-11-24 05:02:51'),(16,17,'Kvm Switch','Rack_oct','2023-11-24 06:06:54'),(17,16,'Standard Port','kkkkk','2023-11-24 11:05:45'),(18,15,'oct','Rack2023','2023-11-24 12:01:33'),(19,14,'Standard Port','Rack2023','2023-11-24 05:02:51'),(20,13,'Standard Port','Rackoct','2023-11-24 06:46:25'),(21,12,'Standard Port','Rack2023','2023-11-24 05:02:51'),(22,11,'Standard Port','oct','2023-11-24 06:48:04'),(23,10,'Kvm switch','kvm_13','2024-01-09 10:01:00'),(24,9,'Standard Port','Rack2023','2023-11-24 05:02:51'),(25,8,'Standard Port','oct','2023-11-24 12:06:18'),(26,7,'Standard Port','Rack2023','2023-11-24 05:02:51'),(27,6,'Standard Port','Rack2023','2023-11-24 05:02:51'),(28,5,'Standard Port','Rack2023','2023-11-24 05:02:51'),(29,4,'Kvm Switch','Rack2023','2023-11-24 06:08:57'),(30,3,'Standard Port','Rack2023','2023-11-24 05:02:51'),(31,2,'Kvm Switch','oct','2023-11-24 07:04:13'),(32,1,'Kvm Switch','Rack2023','2023-11-24 06:09:36');
/*!40000 ALTER TABLE `switch` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `switch_trigger` AFTER UPDATE ON `switch` FOR EACH ROW BEGIN
    DECLARE column_name VARCHAR(50);
    DECLARE new_value TEXT;
    DECLARE trigger_name VARCHAR(50);
    DECLARE switch_encoder_id INT;

    SET trigger_name = 'switch_trigger';

    IF NEW.encoder_id <> OLD.encoder_id THEN
        SET column_name = 'encoder_id';
        SET new_value = NEW.encoder_id;
        SET switch_encoder_id = NEW.encoder_id; 

        INSERT INTO switch_log (switch_id, table_name, column_name, new_value, encoder_id)
        VALUES (OLD.switch_id, 'switch', column_name, new_value, switch_encoder_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.kvm_type <> OLD.kvm_type THEN
        SET column_name = 'kvm_type';
        SET new_value = NEW.kvm_type;
        SET switch_encoder_id = NEW.encoder_id; 

        INSERT INTO switch_log (switch_id, table_name, column_name, new_value, encoder_id)
        VALUES (OLD.switch_id, 'switch', column_name, new_value, switch_encoder_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.kvm_name <> OLD.kvm_name THEN
        SET column_name = 'kvm_name';
        SET new_value = NEW.kvm_name;
        SET switch_encoder_id = NEW.encoder_id; 

        INSERT INTO switch_log (switch_id, table_name, column_name, new_value, encoder_id)
        VALUES (OLD.switch_id, 'switch', column_name, new_value, switch_encoder_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `switch_log`
--

DROP TABLE IF EXISTS `switch_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `switch_log` (
  `switch_id` int NOT NULL,
  `table_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `column_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `new_value` text COLLATE utf8mb4_general_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `encoder_id` int DEFAULT NULL,
  KEY `fk_enco` (`encoder_id`),
  CONSTRAINT `fk_enco` FOREIGN KEY (`encoder_id`) REFERENCES `portname` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `switch_log`
--

LOCK TABLES `switch_log` WRITE;
/*!40000 ALTER TABLE `switch_log` DISABLE KEYS */;
INSERT INTO `switch_log` VALUES (23,'switch','kvm_type','Kvm seitch','2023-11-24 05:36:32',10),(16,'switch','kvm_name','Rack_oct','2023-11-24 06:01:26',17),(23,'switch','kvm_type','Kvm switch','2023-11-24 06:05:32',10),(10,'switch','kvm_type','Kvm Switch','2023-11-24 06:06:00',23),(16,'switch','kvm_type','Kvm Switch','2023-11-24 06:06:54',17),(29,'switch','kvm_type','Kvm Switch','2023-11-24 06:08:57',4),(32,'switch','kvm_type','Kvm Switch','2023-11-24 06:09:36',1),(20,'switch','kvm_name','Rackoct','2023-11-24 06:46:25',13),(22,'switch','kvm_name','oct','2023-11-24 06:48:04',11),(31,'switch','kvm_type','Kvm Switch','2023-11-24 06:57:37',2),(31,'switch','kvm_name','oct','2023-11-24 07:04:13',2),(4,'switch','kvm_type','Kvm Switch','2023-11-24 09:58:09',29),(9,'switch','kvm_name','oct','2023-11-24 10:08:41',24),(18,'switch','kvm_type','kvm switch','2023-11-24 10:42:46',15),(3,'switch','kvm_name','oct','2023-11-24 10:49:16',30),(18,'switch','kvm_type','Standard Port','2023-11-24 10:51:31',15),(14,'switch','kvm_name','oct','2023-11-24 10:53:59',19),(17,'switch','kvm_name','kkkkk','2023-11-24 11:05:45',16),(8,'switch','kvm_type','kvm','2023-11-24 11:55:50',25),(13,'switch','kvm_type','kvm','2023-11-24 11:59:08',20),(18,'switch','kvm_type','oct','2023-11-24 12:01:33',15),(25,'switch','kvm_name','oct','2023-11-24 12:06:18',8),(23,'switch','kvm_name','kvm_13','2024-01-09 10:01:00',10);
/*!40000 ALTER TABLE `switch_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trigger_log`
--

DROP TABLE IF EXISTS `trigger_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trigger_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `trigger_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `event_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trigger_log`
--

LOCK TABLES `trigger_log` WRITE;
/*!40000 ALTER TABLE `trigger_log` DISABLE KEYS */;
INSERT INTO `trigger_log` VALUES (1,'user_trigger','2024-02-23 08:13:04'),(2,'portname_trigger','2024-02-23 09:06:48'),(3,'portname_trigger','2024-02-23 09:06:53'),(4,'portname_trigger','2024-02-23 09:07:56'),(5,'user_trigger','2024-02-23 09:09:58'),(6,'portname_trigger','2024-02-23 09:10:42'),(7,'portname_trigger','2024-02-23 09:10:51'),(8,'portname_trigger','2024-02-23 09:12:38'),(9,'portname_trigger','2024-02-23 09:12:38'),(10,'portname_trigger','2024-02-23 09:12:47'),(11,'portname_trigger','2024-02-23 09:12:53'),(12,'portname_trigger','2024-02-25 12:04:06'),(13,'portname_trigger','2024-02-25 12:04:06'),(14,'portname_trigger','2024-02-25 12:04:12'),(15,'portname_trigger','2024-02-25 12:04:17'),(16,'portname_trigger','2024-02-25 12:04:46'),(17,'portname_trigger','2024-02-25 12:04:58'),(18,'portname_trigger','2024-02-25 12:05:04'),(19,'portname_trigger','2024-02-25 12:05:09'),(20,'portname_trigger','2024-02-25 12:05:15'),(21,'portname_trigger','2024-02-25 12:05:21'),(22,'user_trigger','2024-02-25 12:05:33'),(23,'user_trigger','2024-02-25 12:05:38'),(24,'kvm_trigger','2024-02-25 12:05:54'),(25,'kvm_trigger','2024-02-25 12:06:10'),(26,'portname_trigger','2024-02-28 10:36:24'),(27,'portname_trigger','2024-02-28 12:27:17'),(28,'portname_trigger','2024-02-28 12:41:48'),(29,'portname_trigger','2024-02-28 12:41:53'),(30,'portname_trigger','2024-02-28 12:41:56'),(31,'portname_trigger','2024-02-28 12:41:58'),(32,'user_trigger','2024-02-28 12:42:31'),(33,'portname_trigger','2024-02-28 12:47:45'),(34,'portname_trigger','2024-02-28 12:48:30'),(35,'portname_trigger','2024-02-28 12:51:42'),(36,'portname_trigger','2024-02-28 12:51:42'),(37,'portname_trigger','2024-02-28 12:51:42'),(38,'portname_trigger','2024-02-28 12:51:42'),(39,'portname_trigger','2024-02-28 12:51:42'),(40,'portname_trigger','2024-02-28 12:51:42'),(41,'portname_trigger','2024-02-28 12:51:42'),(42,'portname_trigger','2024-02-28 12:51:42'),(43,'portname_trigger','2024-02-28 12:51:42'),(44,'portname_trigger','2024-02-28 12:51:42'),(45,'portname_trigger','2024-02-28 12:51:42'),(46,'portname_trigger','2024-02-28 12:51:42'),(47,'portname_trigger','2024-02-28 12:51:42'),(48,'portname_trigger','2024-02-28 12:51:42'),(49,'portname_trigger','2024-02-28 12:51:42'),(50,'portname_trigger','2024-02-28 12:51:42'),(51,'portname_trigger','2024-02-28 12:51:42'),(52,'portname_trigger','2024-02-28 12:51:42'),(53,'portname_trigger','2024-02-28 12:51:42'),(54,'portname_trigger','2024-02-28 12:51:42'),(55,'portname_trigger','2024-02-28 12:51:42'),(56,'portname_trigger','2024-02-28 12:51:42'),(57,'portname_trigger','2024-02-29 04:52:51'),(58,'kvm_trigger','2024-02-29 04:54:45'),(59,'kvm_trigger','2024-02-29 04:55:21'),(60,'kvm_trigger','2024-02-29 04:59:13'),(61,'kvm_trigger','2024-02-29 04:59:13'),(62,'kvm_trigger','2024-02-29 05:05:21'),(63,'kvm_trigger','2024-02-29 05:09:25'),(64,'kvm_trigger','2024-02-29 05:10:56'),(65,'kvm_trigger','2024-02-29 05:51:43'),(66,'portname_trigger','2024-02-29 05:53:59'),(67,'kvm_trigger','2024-03-04 05:14:50'),(68,'kvm_trigger','2024-03-04 07:56:57'),(69,'user_trigger','2024-03-04 08:54:36'),(70,'user_trigger','2024-03-04 08:54:36'),(71,'user_trigger','2024-03-04 08:54:36'),(72,'user_trigger','2024-03-04 08:54:36'),(73,'user_trigger','2024-03-04 08:54:36'),(74,'user_trigger','2024-03-04 08:54:36'),(75,'user_trigger','2024-03-04 08:54:36'),(76,'user_trigger','2024-03-04 08:54:36'),(77,'user_trigger','2024-03-04 08:54:36'),(78,'user_trigger','2024-03-04 08:54:36'),(79,'user_trigger','2024-03-04 08:54:36'),(80,'user_trigger','2024-03-04 08:54:36'),(81,'user_trigger','2024-03-04 08:54:36'),(82,'user_trigger','2024-03-04 08:54:36'),(83,'user_trigger','2024-03-04 08:54:36'),(84,'user_trigger','2024-03-04 08:54:36');
/*!40000 ALTER TABLE `trigger_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upgradehistory`
--

DROP TABLE IF EXISTS `upgradehistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upgradehistory` (
  `no` int NOT NULL AUTO_INCREMENT,
  `type` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `user` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `starttime` datetime NOT NULL,
  `endtime` datetime NOT NULL,
  `perversion` varchar(80) COLLATE utf8mb4_general_ci NOT NULL,
  `upgradeversion` varchar(80) COLLATE utf8mb4_general_ci NOT NULL,
  `result` varchar(80) COLLATE utf8mb4_general_ci NOT NULL,
  `path` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upgradehistory`
--

LOCK TABLES `upgradehistory` WRITE;
/*!40000 ALTER TABLE `upgradehistory` DISABLE KEYS */;
INSERT INTO `upgradehistory` VALUES (1,'Dongle FW Upgrade',' USER3 ','2023-04-11 11:28:31','2023-04-11 11:34:11','2.0.0.2010','','successful','C:/xampp1/htdocs/'),(2,'Dongle FW Upgrade',' USER3 ','2023-04-11 11:28:31','2023-04-11 11:34:11','2.0.0.2010','','successful','C:/xampp1/htdocs/'),(3,'Dongle FW Upgrade',' USER3 ','2023-04-11 11:28:31','2023-04-11 11:34:11','2.0.0.2010','','successful','C:/xampp1/htdocs/dongleupgrade2.php'),(4,'Dongle FW Upgrade',' USER3 ','2023-04-11 11:28:31','2023-04-11 11:34:11','2.0.0.2010','','successful',''),(5,'Dongle FW Upgrade',' USER3 ','2023-04-11 11:28:31','2023-04-11 11:34:11','2.0.0.2010','','successful','C:/xampp1/htdocs/upload.php'),(6,'Dongle FW Upgrade',' USER3 ','2023-04-11 11:28:31','2023-04-11 11:34:11','2.0.0.2010','','successful','C:/xampp1/htdocs/demo.php'),(7,'Dongle FW Upgrade',' USER3 ','2023-04-11 11:28:31','2023-04-11 11:34:11','2.0.0.2010','','successful','C:/xampp1/htdocs/DBConnection.php'),(8,'Dongle FW Upgrade',' USER3 ','2023-04-11 11:28:31','2023-04-11 11:34:11','2.0.0.2010','','successful','C:/xampp1/htdocs/style.css'),(9,'Dongle FW Upgrade',' USER3 ','2023-04-11 11:28:31','2023-04-11 11:34:11','2.0.0.2010','','successful','C:/xampp1/htdocs/upload.php'),(10,'Dongle FW Upgrade',' USER3 ','2023-04-11 11:28:31','2023-04-11 11:34:11','2.0.0.2010','','successful','C:/xampp1/htdocs/virtualmedia.php'),(11,'Dongle FW Upgrade',' USER3 ','2023-04-11 11:28:31','2023-04-11 11:34:11','2.0.0.2010','','successful','C:/xampp1/htdocs/Actions_audit.php'),(12,'Dongle FW Upgrade',' USER3 ','2023-04-11 11:28:31','2023-04-11 11:34:11','2.0.0.2010','','successful','C:/xampp1/htdocs/'),(13,'Dongle FW Upgrade',' USER3 ','2023-04-11 11:28:31','2023-04-11 11:34:11','2.0.0.2010','','successful','C:/xampp1/htdocs/'),(14,'Dongle FW Upgrade',' USER3 ','2023-04-11 11:28:31','2023-04-11 11:34:11','2.0.0.2010','','successful','C:/xampp1/htdocs/'),(15,'Dongle FW Upgrade',' USER3 ','2023-04-11 11:28:31','2023-04-11 11:34:11','2.0.0.2010','','successful','C:/xampp1/htdocs/'),(16,'Dongle FW Upgrade',' USER3 ','2023-04-11 11:28:31','2023-04-11 11:34:11','2.0.0.2010','','successful','C:/xampp1/htdocs/audio3.php'),(17,'Dongle FW Upgrade',' USER3 ','2023-04-11 11:28:31','2023-04-11 11:34:11','2.0.0.2010','','successful','C:/xampp1/htdocs/'),(18,'Dongle FW Upgrade',' USER3 ','2023-04-11 11:28:31','2023-04-11 11:34:11','2.0.0.2010','','successful','C:/xampp1/htdocs/'),(19,'Dongle FW Upgrade',' USER3 ','2023-04-11 11:28:31','2023-04-11 11:34:11','2.0.0.2010','','successful','C:/xampp1/htdocs/Actions_audit.php'),(20,'Dongle FW Upgrade',' USER7 ','2023-04-11 11:28:31','2023-04-11 11:34:11','2.0.0.2010','','successful','C:/xampp1/htdocs/data1 (4).sql'),(21,'Dongle FW Upgrade',' USER7 ','2023-04-11 11:28:31','2023-04-11 11:34:11','2.0.0.2010','','successful','C:/xampp1/htdocs/'),(22,'Dongle FW Upgrade',' USER7 ','2023-04-11 11:28:31','2023-04-11 11:34:11','2.0.0.2010','','successful','C:/xampp1/htdocs/IMG_8766.JPG'),(23,'Dongle FW Upgrade',' ADMIN ','2023-04-12 09:38:59','2023-04-12 09:38:59','2.0.0.2010','','successful','C:/xampp1/htdocs/'),(24,'Dongle FW Upgrade',' ADMIN ','2023-04-12 12:41:59','2023-04-12 12:41:59','2.0.0.2010','','successful','C:/xampp1/htdocs/'),(25,'Dongle FW Upgrade',' ADMIN ','2023-04-12 12:42:00','2023-04-12 12:42:00','2.0.0.2010','','successful','C:/xampp1/htdocs/');
/*!40000 ALTER TABLE `upgradehistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_log`
--

DROP TABLE IF EXISTS `user_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_log` (
  `user_id` int NOT NULL,
  `table_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `column_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `new_value` text COLLATE utf8mb4_general_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_log`
--

LOCK TABLES `user_log` WRITE;
/*!40000 ALTER TABLE `user_log` DISABLE KEYS */;
INSERT INTO `user_log` VALUES (11,'user1','authority','User','2023-05-29 07:50:04'),(3,'user1','active','1','2023-05-29 07:50:21'),(10,'user1','uname','user10','2023-05-29 07:50:43'),(7,'user1','mass','','2023-05-29 07:51:07'),(8,'user1','mass','','2023-05-29 07:51:07'),(15,'user1','mass','','2023-05-29 07:51:07'),(6,'user1','uname','USER6','2023-05-31 05:04:15'),(6,'user1','active','1','2023-05-31 05:13:33'),(1,'user1','uname','user1','2023-05-31 12:02:02'),(1,'username','view','ON','2023-11-20 05:29:21'),(1,'username','view','OFF','2023-11-20 05:39:58'),(1,'username','view','ON','2023-11-20 11:33:47'),(2,'username','view','ON','2023-11-20 11:33:47'),(3,'username','view','ON','2023-11-20 11:33:47'),(4,'username','view','ON','2023-11-20 11:33:47'),(5,'username','view','ON','2023-11-20 11:33:47'),(6,'username','view','ON','2023-11-20 11:33:47'),(7,'username','view','ON','2023-11-20 11:33:47'),(8,'username','view','ON','2023-11-20 11:33:47'),(9,'username','view','ON','2023-11-20 11:33:47'),(10,'username','view','ON','2023-11-20 11:33:47'),(11,'username','view','ON','2023-11-20 11:33:47'),(12,'username','view','ON','2023-11-20 11:33:47'),(13,'username','view','ON','2023-11-20 11:33:47'),(14,'username','view','ON','2023-11-20 11:33:47'),(15,'username','view','ON','2023-11-20 11:33:47'),(16,'username','view','ON','2023-11-20 11:33:47'),(1,'username','view','OFF','2023-11-20 12:29:03'),(2,'username','view','OFF','2023-11-20 12:29:03'),(3,'username','view','OFF','2023-11-20 12:29:03'),(4,'username','view','OFF','2023-11-20 12:29:03'),(5,'username','view','OFF','2023-11-20 12:29:03'),(6,'username','view','OFF','2023-11-20 12:29:03'),(7,'username','view','OFF','2023-11-20 12:29:03'),(8,'username','view','OFF','2023-11-20 12:29:03'),(9,'username','view','OFF','2023-11-20 12:29:03'),(10,'username','view','OFF','2023-11-20 12:29:03'),(11,'username','view','OFF','2023-11-20 12:29:03'),(12,'username','view','OFF','2023-11-20 12:29:03'),(13,'username','view','OFF','2023-11-20 12:29:03'),(14,'username','view','OFF','2023-11-20 12:29:03'),(15,'username','view','OFF','2023-11-20 12:29:03'),(16,'username','view','OFF','2023-11-20 12:29:03'),(2,'username','hid','on','2023-11-22 05:47:13'),(2,'username','mass','','2023-11-22 05:47:13'),(2,'username','virtual','','2023-11-22 05:47:13'),(4,'username','mass','','2023-11-22 05:47:14'),(4,'username','virtual','','2023-11-22 05:47:14'),(12,'username','mass','','2023-11-22 05:50:29'),(12,'username','virtual','','2023-11-22 05:50:29'),(14,'username','hid','','2023-11-22 05:50:29'),(14,'username','mass','','2023-11-22 05:50:29'),(14,'username','virtual','','2023-11-22 05:50:29'),(14,'username','hid','on','2023-11-22 05:54:54'),(8,'username','mass','','2023-11-22 06:00:53'),(3,'username','hid','on','2023-11-22 06:06:29'),(3,'username','mass','','2023-11-22 06:06:29'),(16,'username','hid','on','2023-11-22 06:06:29'),(15,'username','hid','on','2023-11-22 06:12:52'),(11,'username','authority','Admin','2024-01-05 05:13:21'),(1,'username','username','LOVELINA','2024-01-05 09:53:12'),(1,'username','username','USER6','2024-01-05 09:54:00'),(1,'username','active','0','2024-01-05 09:54:00'),(1,'username','authority','User','2024-01-05 09:54:00'),(1,'username','active','1','2024-01-05 09:56:34'),(1,'username','authority','Admin','2024-01-05 09:56:34'),(1,'username','username','LOVELINA','2024-01-05 09:56:34'),(1,'username','username','USER4','2024-01-05 10:18:59'),(1,'username','active','0','2024-01-05 10:21:12'),(1,'username','authority','User','2024-01-05 10:21:12'),(1,'username','username','USER7','2024-01-05 10:21:12'),(1,'username','active','1','2024-01-09 08:11:59'),(1,'username','username','admin','2024-01-09 08:12:06'),(1,'username','authority','Admin','2024-01-09 08:12:32'),(2,'username','active','0','2024-01-09 09:52:40'),(4,'username','active','0','2024-01-10 05:47:29'),(16,'username','authority','Admin','2024-01-11 09:01:45'),(1,'username','mass','','2024-01-12 07:34:11'),(2,'username','mass','on','2024-01-12 07:34:12'),(3,'username','mass','on','2024-01-12 07:34:12'),(4,'username','mass','on','2024-01-12 07:34:12'),(2,'username','active','1','2024-01-16 11:12:57'),(8,'username','mass','on','2024-01-18 09:13:37'),(12,'username','mass','on','2024-01-18 09:13:37'),(14,'username','mass','on','2024-01-18 09:13:37'),(4,'username','authority','User','2024-02-23 08:13:04'),(8,'username','authority','Admin','2024-02-23 09:09:58'),(4,'username','active','1','2024-02-25 12:05:33'),(3,'username','authority','Admin','2024-02-25 12:05:38'),(6,'username','active','0','2024-02-28 12:42:31'),(1,'username','view','ON','2024-03-04 08:54:36'),(2,'username','view','ON','2024-03-04 08:54:36'),(3,'username','view','ON','2024-03-04 08:54:36'),(4,'username','view','ON','2024-03-04 08:54:36'),(5,'username','view','ON','2024-03-04 08:54:36'),(6,'username','view','ON','2024-03-04 08:54:36'),(7,'username','view','ON','2024-03-04 08:54:36'),(8,'username','view','ON','2024-03-04 08:54:36'),(9,'username','view','ON','2024-03-04 08:54:36'),(10,'username','view','ON','2024-03-04 08:54:36'),(11,'username','view','ON','2024-03-04 08:54:36'),(12,'username','view','ON','2024-03-04 08:54:36'),(13,'username','view','ON','2024-03-04 08:54:36'),(14,'username','view','ON','2024-03-04 08:54:36'),(15,'username','view','ON','2024-03-04 08:54:36'),(16,'username','view','ON','2024-03-04 08:54:36');
/*!40000 ALTER TABLE `user_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `username`
--

DROP TABLE IF EXISTS `username`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `username` (
  `id` int NOT NULL AUTO_INCREMENT,
  `aesname` text CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `desname` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `3desname` text COLLATE utf8mb4_general_ci NOT NULL,
  `aespass` text COLLATE utf8mb4_general_ci NOT NULL,
  `despass` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `3despass` text COLLATE utf8mb4_general_ci NOT NULL,
  `active` int NOT NULL,
  `authority` text COLLATE utf8mb4_general_ci NOT NULL,
  `username` text COLLATE utf8mb4_general_ci NOT NULL,
  `password` text COLLATE utf8mb4_general_ci NOT NULL,
  `view` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `hid` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `mass` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `card` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `virtual` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `lastUpdatedBy` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `username`
--

LOCK TABLES `username` WRITE;
/*!40000 ALTER TABLE `username` DISABLE KEYS */;
INSERT INTO `username` VALUES (1,'2sPDkQJ0Eb4R0zoMq6P7RA==','€Xç>w\nðìa','F8+HXyJjIg8=','4QmiRgF99LHi','€só˜9ÓFz¶\\lA÷.U\r','v05RBiWrY1am9Lgzn1jgrQ==',1,'Admin','admin','Admin@123','ON','on','','on','on','2024-03-04 08:54:36'),(2,'Sz2U1QYrgmEDLNLB7lR8IQ==','€ÜJÉØsU*e','OihiqHHsb/Y=','9R6qXV199LHiLvc=','€š¾bãï÷a2Æò?)Ž´','6M0pao9hrFEf1t5aoMouuQ==',1,'User','USER2','User2@12345','ON','on','on','','','2024-03-04 08:54:36'),(3,'JnR69HP7mn7H3cm7BG4hlg==','€1êÞ5éxž”','maQhwyAQCGA=','9R6qXVx99LHiLvc=','€Úà@¹;nÏÕÞm…ûG\'','QG4O4iuBxx4voMiMFOULGg==',1,'Admin','USER3','User3@12345','ON','on','on','on','on','2024-03-04 08:54:36'),(4,'hv6bRIo6dg2REa7ZovbA0Q==','€¨‹Ëÿ^Ñ\r\n','XHJs2Ory9QM=','9R6qXVt99LHiLvc=','€<‘}_7r\0^9—Å˜Õ','VC0b/yisuRIvoMiMFOULGg==',1,'User','USER4','User4@12345','ON','','on','on','','2024-03-04 08:54:36'),(5,'8mN8CSURPJZxropve0HoJA==','€Ž‘M½\\‡','iVM5iuF/teI=','9R6qXVp99LHiLvc=','€«V&þëj)ÎTe®','SM6D+gCOGmEvoMiMFOULGg==',0,'User','USER5','User5@12345','ON','on','on','on','on','2024-03-04 08:54:36'),(6,'zl5cxwShn41JVKZrLEibVw==','€¯Úöd0ô','rElCH/DTxKc=','9R6qXVl99LHiLvc=','€±c¢`KÈrYó€ó¦ ','0rPbY6iXAoovoMiMFOULGg==',0,'User','USER6','User6@12345','ON','on','on','on','on','2024-03-04 08:54:36'),(7,'0Vd5oH/pehlPCBCMgfTFgw==','€N«#Ÿ\'ˆë','5r3A1DRgpe0=','9R6qXVh99LHiLvc=','€þ\'Ÿ%l“†â!,Éh','x/WqepJ2rTgvoMiMFOULGg==',0,'User','USER7','User7@12345','ON','on','on','on','on','2024-03-04 08:54:36'),(8,'VHl8o5oac01YTAGP3+E/iw==','€,©_ýõK‚','HcyYLKHkWb4=','1R6qXVd99LHi','€jH…l°\\ŸÄB:Å+\ZZù','lAt8jMGtZ4+m9Lgzn1jgrQ==',0,'Admin','USER8','user8@123','ON','on','on','','on','2024-03-04 08:54:36'),(9,'jYyZLBNlFBn4yM4rSm0tmw==','€}F§\0Ò®','Q4x8RqW7SzQ=','9R6qXVZ99LHiLvc=','€HÐŸŒAyR*Âó0õÿ ¯','l9CLCe6BLewvoMiMFOULGg==',1,'Admin','USER9','User9@12345','ON','on','on','on','on','2024-03-04 08:54:36'),(10,'em7Yt4l8RLimUf47Iy47iQ==','€[ÁÖvÞÛ','qfbFKKQJwT8=','9R6qXV4NhbLjKfb4','€,°ú$¥¤…»µÜñÀ<˜s','0EenkO+4Y3sdRR/o1qzTUw==',0,'User','USER10','User10@12345','ON','on','on','on','on','2024-03-04 08:54:36'),(11,'iTWsyHOuabdXSmw3VV6+KQ==','€7^0†LÈR\'','+uoS9mJcrUc=','9R6qXV4MhbLjKfb4','€×¨WÝmÙDÚ?íÂë','FL8AEWyZV5kdRR/o1qzTUw==',1,'Admin','USER11','User11@12345','ON','on','on','on','on','2024-03-04 08:54:36'),(12,'iyYtY06TxTjHPOYODDduSA==','€¡LìóÇ›','NB4kF0HfkuA=','9R6qXV4PhbLjKfb4','€Ž©¤Fzø²¬âÛ½¦gA','scb5ysudtC8dRR/o1qzTUw==',0,'User','user12','User12@12345','ON','on','on','','','2024-03-04 08:54:36'),(13,'bkmXn8ipMpBpX0o9rDkJTA==','€‚–Y\rž[\nÀ','iKKpkXrSpvs=','1R6qXV4OhbLjKQ==','€Þ-­Á=V\0úÿ\ZÊ°q','EyAkLYC+Hyesw7aZymrFqg==',0,'User','USER13','user13@123','ON','on','on','on','on','2024-03-04 08:54:36'),(14,'UK589/JSYa15wyRNQoTxlQ==','€«Æ­eKb~6','YOSyd1zqcgM=','9R6qXV4JhbLjKfb4','€ö&¦\Zºá²hÑi^bb~','mEdxVLqpfc8dRR/o1qzTUw==',1,'User','USER14','User14@12345','ON','on','on','','','2024-03-04 08:54:36'),(15,'UqANM2nlW4HcMegvDbnMCQ==','€’wÉ¼?9Sý','wAhsYanANuY=','9R6qXV4IhbLjKfb4','€/M[‘\ZìrÑÛœ”>Ñô{','Y+AJBeAD2AsdRR/o1qzTUw==',1,'Admin','USER15','User15@12345','ON','on','on','','on','2024-03-04 08:54:36'),(16,'pXbAamDck7wy18zYInD0KA==','€Ph]æa\"','hlDIInESIF8=','9R6qXV4LhbLjKfb4','€æ„rÍ·Û÷÷$ûþô‰B','Ov3dbwnbes4dRR/o1qzTUw==',1,'Admin','USER16','User16@12345','ON','on','on','','on','2024-03-04 08:54:36');
/*!40000 ALTER TABLE `username` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `user_trigger` AFTER UPDATE ON `username` FOR EACH ROW BEGIN
    DECLARE column_name VARCHAR(255);
    DECLARE new_value VARCHAR(255);
         DECLARE trigger_name VARCHAR(255);

     SET trigger_name='user_trigger';
    
    IF NEW.view <> OLD.view THEN
        SET column_name = 'view';
        SET new_value = NEW.view;
        INSERT INTO user_log (user_id, table_name, column_name, new_value) VALUES ( OLD.id, 'username', column_name, new_value);
    INSERT INTO trigger_log (trigger_name) VALUES (trigger_name); END IF;

    IF NEW.hid <> OLD.hid THEN
        
        SET column_name = 'hid';
        SET new_value = NEW.hid;
        INSERT INTO user_log (user_id, table_name, column_name, new_value) VALUES ( OLD.id, 'username', column_name, new_value);
    INSERT INTO trigger_log (trigger_name) VALUES (trigger_name); END IF;
    
    IF NEW.`mass` <> OLD.`mass` THEN
        
        SET column_name = 'mass';
        SET new_value = NEW.`mass`;
        INSERT INTO user_log (user_id, table_name, column_name, new_value) VALUES ( OLD.id, 'username', column_name, new_value);
    INSERT INTO trigger_log (trigger_name) VALUES (trigger_name); END IF;
    
    IF NEW.virtual <> OLD.virtual THEN
        
        SET column_name = 'virtual';
        SET new_value = NEW.virtual;
        INSERT INTO user_log (user_id, table_name, column_name, new_value) VALUES ( OLD.id, 'username', column_name, new_value);
    INSERT INTO trigger_log (trigger_name) VALUES (trigger_name); END IF;
    
    IF NEW.active <> OLD.active THEN
        
        SET column_name = 'active';
        SET new_value = NEW.active;
        INSERT INTO user_log (user_id, table_name, column_name, new_value) VALUES ( OLD.id, 'username', column_name, new_value);
    INSERT INTO trigger_log (trigger_name) VALUES (trigger_name); END IF;

    IF NEW.authority <> OLD.authority THEN
        
        SET column_name = 'authority';
        SET new_value = NEW.authority;
        INSERT INTO user_log (user_id, table_name, column_name, new_value) VALUES ( OLD.id, 'username', column_name, new_value);
    INSERT INTO trigger_log (trigger_name) VALUES (trigger_name); END IF;

    IF NEW.username <> OLD.username THEN
        
        SET column_name = 'username';
        SET new_value = NEW.username;
        INSERT INTO user_log (user_id, table_name, column_name, new_value) VALUES ( OLD.id, 'username', column_name, new_value);
    INSERT INTO trigger_log (trigger_name) VALUES (trigger_name); END IF;

    IF NEW.password <> OLD.password THEN
        
        SET column_name = 'password';
        SET new_value = NEW.password;
        INSERT INTO user_log (user_id, table_name, column_name, new_value) VALUES ( OLD.id, 'username', column_name, new_value);
    INSERT INTO trigger_log (trigger_name) VALUES (trigger_name); END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `waiting_list`
--

DROP TABLE IF EXISTS `waiting_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `waiting_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `login_time` timestamp NULL DEFAULT NULL,
  `served` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waiting_list`
--

LOCK TABLES `waiting_list` WRITE;
/*!40000 ALTER TABLE `waiting_list` DISABLE KEYS */;
INSERT INTO `waiting_list` VALUES (1,9,'2024-03-04 08:40:10',0),(2,2,'2024-03-04 08:41:34',0);
/*!40000 ALTER TABLE `waiting_list` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-04  0:56:54
