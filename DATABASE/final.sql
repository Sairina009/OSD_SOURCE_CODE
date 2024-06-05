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
  `device` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `encoder_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ip_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `netmask` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `broadcast` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connect`
--

DROP TABLE IF EXISTS `connect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connect` (
  `id` int NOT NULL AUTO_INCREMENT,
  `port_id` int DEFAULT NULL,
  `portname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `decoder_name` varchar(255) DEFAULT NULL,
  `decoder_id` int DEFAULT NULL,
  `count` int DEFAULT NULL,
  `user_authority` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connect`
--

LOCK TABLES `connect` WRITE;
/*!40000 ALTER TABLE `connect` DISABLE KEYS */;
/*!40000 ALTER TABLE `connect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `decoder`
--

DROP TABLE IF EXISTS `decoder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `decoder` (
  `decoder_count` int NOT NULL,
  `ip_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `encoder_id` int NOT NULL,
  `decoder_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `decoder_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int NOT NULL,
  `mac_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `banner` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `thumbnailview` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lastupdatedby` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_authority` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`decoder_count`),
  KEY `encoder_id` (`encoder_id`),
  CONSTRAINT `decoder_ibfk_2` FOREIGN KEY (`encoder_id`) REFERENCES `portname` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `decoder`
--

LOCK TABLES `decoder` WRITE;
/*!40000 ALTER TABLE `decoder` DISABLE KEYS */;
INSERT INTO `decoder` VALUES (1,'192.168.1.1',1,'decoder1','stadard',5,'','OFF','ON','2024-05-29 05:25:18',''),(2,'2.168.1.1',7,'decoder2','kvm',5,'','ON','OFF','2024-05-05 06:19:46',''),(3,'3.168.1.1',2,'','',3,'','','','2024-05-03 07:59:09',''),(4,'4.168.1.1',5,'','',5,'','','','2024-05-03 10:43:32','');
/*!40000 ALTER TABLE `decoder` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`kvm`@`localhost`*/ /*!50003 TRIGGER `decoder_trigger` AFTER UPDATE ON `decoder` FOR EACH ROW BEGIN
    DECLARE column_name VARCHAR(50);
    DECLARE new_value TEXT;
    DECLARE trigger_name VARCHAR(50);
    DECLARE decoder_encoder_id INT;

    SET trigger_name = 'decoder_trigger';

    IF NEW.decoder_count <> OLD.decoder_count THEN
        SET column_name = 'decoder_count';
        SET new_value = NEW.decoder_count;
        SET decoder_encoder_id = NEW.encoder_id; 

        INSERT INTO decoder_log (decoder_id, table_name, column_name, new_value, encoder_id)
        VALUES (NEW.decoder_count, 'decoder', column_name, new_value, decoder_encoder_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.ip_address <> OLD.ip_address THEN
        SET column_name = 'ip_address';
        SET new_value = NEW.ip_address;
        SET decoder_encoder_id = NEW.encoder_id; 

        INSERT INTO decoder_log (decoder_id, table_name, column_name, new_value, encoder_id)
        VALUES (NEW.decoder_count, 'decoder', column_name, new_value, decoder_encoder_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;



    IF NEW.encoder_id <> OLD.encoder_id THEN
        SET column_name = 'encoder_id';
        SET new_value = NEW.encoder_id;
        SET decoder_encoder_id = NEW.encoder_id; 

        INSERT INTO decoder_log (decoder_id, table_name, column_name, new_value, encoder_id)
        VALUES (NEW.decoder_count, 'decoder', column_name, new_value, decoder_encoder_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;


    IF NEW.decoder_name <> OLD.decoder_name THEN
        SET column_name = 'decoder_name';
        SET new_value = NEW.decoder_name;
        SET decoder_encoder_id = NEW.encoder_id; 

        INSERT INTO decoder_log (decoder_id, table_name, column_name, new_value, encoder_id)
        VALUES (NEW.decoder_count, 'decoder', column_name, new_value, decoder_encoder_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.decoder_type <> OLD.decoder_type THEN
        SET column_name = 'decoder_type';
        SET new_value = NEW.decoder_type;
        SET decoder_encoder_id = NEW.encoder_id; 

        INSERT INTO decoder_log (decoder_id, table_name, column_name, new_value, encoder_id)
        VALUES (NEW.decoder_count, 'decoder', column_name, new_value, decoder_encoder_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

        IF NEW.mac_address <> OLD.mac_address THEN
        SET column_name = 'mac_address';
        SET new_value = NEW.mac_address;
        SET decoder_encoder_id = NEW.encoder_id; 

        INSERT INTO decoder_log (decoder_id, table_name, column_name, new_value, encoder_id)
        VALUES (NEW.decoder_count, 'decoder', column_name, new_value, decoder_encoder_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.banner <> OLD.banner THEN
        SET column_name = 'banner';
        SET new_value = NEW.banner;
        SET decoder_encoder_id = NEW.encoder_id; 

        INSERT INTO decoder_log (decoder_id, table_name, column_name, new_value, encoder_id)
        VALUES (NEW.decoder_count, 'decoder', column_name, new_value, decoder_encoder_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                IF NEW.thumbnailview <> OLD.thumbnailview THEN
        SET column_name = 'thumbnailview';
        SET new_value = NEW.thumbnailview;
        SET decoder_encoder_id = NEW.encoder_id; 

        INSERT INTO decoder_log (decoder_id, table_name, column_name, new_value, encoder_id)
        VALUES (NEW.decoder_count, 'decoder', column_name, new_value, decoder_encoder_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `decoder_log`
--

DROP TABLE IF EXISTS `decoder_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `decoder_log` (
  `decoder_id` int NOT NULL,
  `table_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `column_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `new_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `encoder_id` int DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_encoder` (`encoder_id`),
  CONSTRAINT `fk_encoder` FOREIGN KEY (`encoder_id`) REFERENCES `switch` (`encoder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `decoder_log`
--

LOCK TABLES `decoder_log` WRITE;
/*!40000 ALTER TABLE `decoder_log` DISABLE KEYS */;
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
INSERT INTO `decoder_status` VALUES (1,1,5,'2024-05-29 05:22:59',NULL);
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
  `table_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `column_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `new_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kvm_log`
--

LOCK TABLES `kvm_log` WRITE;
/*!40000 ALTER TABLE `kvm_log` DISABLE KEYS */;
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
  `language` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `banner` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `encryption` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hotkey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `time` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
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
INSERT INTO `kvmname` VALUES (1,'RACK1_KVM2024','English','ON','Disable','< Ctrl>','2024 / 29 / 05 12 : 35','C:/xampp1/htdocs/user1 (2).sql','2024-05-29 05:24:52',8);
/*!40000 ALTER TABLE `kvmname` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`kvm`@`localhost`*/ /*!50003 TRIGGER `kvm_trigger` AFTER UPDATE ON `kvmname` FOR EACH ROW BEGIN
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
-- Table structure for table `local_decoder`
--

DROP TABLE IF EXISTS `local_decoder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `local_decoder` (
  `id` int NOT NULL AUTO_INCREMENT,
  `encoder_id` int NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `connect` int DEFAULT NULL,
  `last_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `local_decoder`
--

LOCK TABLES `local_decoder` WRITE;
/*!40000 ALTER TABLE `local_decoder` DISABLE KEYS */;
/*!40000 ALTER TABLE `local_decoder` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`kvm`@`localhost`*/ /*!50003 TRIGGER `local_trigger` AFTER UPDATE ON `local_decoder` FOR EACH ROW BEGIN
    DECLARE column_name VARCHAR(50);
    DECLARE new_value TEXT;
    DECLARE trigger_name VARCHAR(50);
    DECLARE local_encoder_id INT;

    SET trigger_name = 'local_trigger';

    IF NEW.encoder_id <> OLD.encoder_id THEN
        SET column_name = 'encoder_id';
        SET new_value = NEW.encoder_id;
        SET local_encoder_id = NEW.encoder_id; 

        INSERT INTO local_log (local_id, table_name, column_name, new_value, encoder_id)
        VALUES (NEW.id, 'local_decoder', column_name, new_value, local_encoder_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.ip_address <> OLD.ip_address THEN
        SET column_name = 'ip_address';
        SET new_value = NEW.ip_address;
        SET local_encoder_id = NEW.encoder_id; 

        INSERT INTO local_log (local_id, table_name, column_name, new_value, encoder_id)
        VALUES (NEW.id, 'local_decoder', column_name, new_value, local_encoder_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.connect <> OLD.connect THEN
        SET column_name = 'connect';
        SET new_value = NEW.connect;
        SET local_encoder_id = NEW.encoder_id; 

        INSERT INTO local_log (local_id, table_name, column_name, new_value, encoder_id)
        VALUES (NEW.id, 'local_decoder', column_name, new_value, local_encoder_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.last_updated <> OLD.last_updated THEN
        SET column_name = 'last_updated';
        SET new_value = NEW.last_updated;
        SET local_encoder_id = NEW.encoder_id; 

        INSERT INTO local_log (local_id, table_name, column_name, new_value, encoder_id)
        VALUES (NEW.id, 'local_decoder', column_name, new_value, local_encoder_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.username <> OLD.username THEN
        SET column_name = 'username';
        SET new_value = NEW.username;
        SET local_encoder_id = NEW.encoder_id; 

        INSERT INTO local_log (local_id, table_name, column_name, new_value, encoder_id)
        VALUES (NEW.id, 'local_decoder', column_name, new_value, local_encoder_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.password <> OLD.password THEN
        SET column_name = 'password';
        SET new_value = NEW.password;
        SET local_encoder_id = NEW.encoder_id; 

        INSERT INTO local_log (local_id, table_name, column_name, new_value, encoder_id)
        VALUES (NEW.id, 'local_decoder', column_name, new_value, local_encoder_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `local_log`
--

DROP TABLE IF EXISTS `local_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `local_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `encoder_id` int NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `changed_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `connect` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `local_log`
--

LOCK TABLES `local_log` WRITE;
/*!40000 ALTER TABLE `local_log` DISABLE KEYS */;
INSERT INTO `local_log` VALUES (1,3,'160.1.1.1','2024-04-25 07:52:40',NULL),(2,8,'10.5.5.2','2024-04-25 07:56:16',NULL),(3,8,'10.5.5.2','2024-04-25 08:00:13',1),(4,15,'12.2.2.2','2024-04-25 08:00:35',1),(5,2,'170.1.1.2','2024-04-29 09:17:19',1),(6,3,'160.1.1.1','2024-04-29 10:34:07',1),(7,5,'140.1.1.1','2024-04-29 12:07:07',1),(8,2,'170.1.1.2','2024-04-29 12:07:27',1),(9,4,'4.168.1.1','2024-05-27 11:19:35',1),(10,6,'6.168.1.1','2024-05-27 11:20:06',1),(11,7,'7.168.1.1','2024-05-27 11:20:36',1),(12,2,'2.168.1.1','2024-05-28 04:58:47',1),(13,5,'5.168.1.1','2024-05-28 05:00:50',1),(14,4,'4.168.1.1','2024-05-28 05:01:21',1),(15,2,'2.168.1.1','2024-05-28 05:04:46',1);
/*!40000 ALTER TABLE `local_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `action_made` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `event` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=714 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (1,11,'Logged out.','2023-02-26 21:31:29','Access Logout'),(2,11,'Logged in','2023-02-26 21:32:19','Access Login'),(3,3,'Logged in','2023-02-28 01:57:59','Access Login'),(4,3,'Logged out.','2023-02-28 01:58:07','Access Logout'),(5,5,'Logged in','2023-02-28 01:58:31','Access Login'),(6,16,'Logged in','2023-02-28 02:09:16','Access Login'),(7,16,'Logged out.','2023-02-28 02:09:20','Access Logout'),(8,5,'Logged in','2023-02-28 02:09:38','Access Login'),(9,8,'Logged in','2023-02-28 02:13:53','Access Login'),(10,8,'Logged out.','2023-02-28 03:50:38','Access Logout'),(11,5,'Logged in','2023-02-28 05:14:40','Access Login'),(12,5,'Logged out.','2023-02-28 05:55:55','Access Logout'),(13,11,'Logged in','2023-02-28 05:56:15','Access Login'),(14,11,'Logged out.','2023-02-28 05:59:21','Access Logout'),(15,4,'Logged in','2023-02-28 06:00:08','Access Login'),(16,4,'Logged out.','2023-02-28 06:00:16','Access Logout'),(17,15,'Logged in','2023-02-28 06:00:23','Access Login'),(18,15,'Logged out.','2023-02-28 06:00:25','Access Logout'),(19,5,'Logged in','2023-02-28 06:00:31','Access Login'),(20,5,'Logged out.','2023-02-28 19:24:25','Access Logout'),(21,12,'Logged in','2023-02-28 19:24:40','Access Login'),(22,12,'Logged out.','2023-02-28 19:24:46','Access Logout'),(23,6,'Logged in','2023-02-28 19:24:55','Access Login'),(24,6,'Logged out.','2023-02-28 19:24:58','Access Logout'),(25,11,'Logged in','2023-02-28 19:25:22','Access Login'),(26,1,'Logged in','2024-02-23 00:11:27','Access Login'),(27,1,'Logged in','2024-02-25 04:01:35','Access Login'),(28,1,'Logged in','2024-02-27 04:45:19','Access Login'),(29,1,'Logged in','2024-02-28 01:48:43','Access Login'),(30,1,'Logged in','2024-02-28 01:49:00','Access Login'),(31,1,'Logged in','2024-02-28 02:01:49','Access Login'),(32,1,'Logged in','2024-02-28 02:50:40','Access Login'),(33,1,'Logged in','2024-02-28 03:20:18','Access Login'),(34,1,'Logged in','2024-02-28 03:40:08','Access Login'),(35,1,'Logged in','2024-02-28 03:59:08','Access Login'),(36,1,'Logged in','2024-02-28 04:26:52','Access Login'),(37,1,'Logged in','2024-02-28 04:31:06','Access Login'),(38,1,'Logged in','2024-02-28 04:41:39','Access Login'),(39,1,'Logged in','2024-02-28 20:52:18','Access Login'),(40,1,'Logged in','2024-02-28 21:51:02','Access Login'),(41,2,'Logged out.','2024-02-28 21:51:09','Access Logout'),(42,1,'Logged in','2024-02-28 21:51:14','Access Login'),(43,1,'Logged in','2024-03-03 21:14:28','Access Login'),(44,9,'Logged out.','2024-03-03 23:36:05','Access Logout'),(45,14,'Logged out.','2024-03-03 23:42:44','Access Logout'),(46,14,'Logged out.','2024-03-03 23:43:15','Access Logout'),(47,14,'Logged out.','2024-03-03 23:51:25','Access Logout'),(48,2,'Logged out.','2024-03-03 23:55:00','Access Logout'),(49,14,'Logged out.','2024-03-03 23:55:23','Access Logout'),(50,9,'Logged out.','2024-03-03 23:58:03','Access Logout'),(51,9,'Logged out.','2024-03-04 00:04:35','Access Logout'),(52,2,'Logged out.','2024-03-04 00:05:46','Access Logout'),(53,9,'Logged out.','2024-03-04 00:08:52','Access Logout'),(54,15,'Logged out.','2024-03-04 00:10:07','Access Logout'),(55,14,'Logged out.','2024-03-04 00:14:29','Access Logout'),(56,14,'Logged out.','2024-03-04 00:20:12','Access Logout'),(57,9,'Logged out.','2024-03-04 00:27:03','Access Logout'),(58,1,'Logged out.','2024-03-04 00:30:29','Access Logout'),(59,1,'Logged out.','2024-03-04 00:32:44','Access Logout'),(60,1,'Logged out.','2024-03-04 00:35:15','Access Logout'),(61,2,'Logged out.','2024-03-04 00:38:04','Access Logout'),(62,1,'Logged out.','2024-03-04 00:38:26','Access Logout'),(63,1,'Logged out.','2024-03-04 00:38:26','Access Logout'),(64,14,'Logged out.','2024-03-04 00:41:53','Access Logout'),(65,9,'Logged out.','2024-03-04 00:45:52','Access Logout'),(66,2,'Logged out.','2024-03-04 00:54:47','Access Logout'),(67,1,'Logged out.','2024-03-04 00:55:18','Access Logout'),(68,1,'Logged in.','2024-03-07 00:55:16','Access Login'),(69,2,'Logged in.','2024-03-07 00:59:31','Access Login'),(70,1,'Logged in.','2024-03-07 01:23:21','Access Login'),(71,2,'Logged in.','2024-03-07 02:29:03','Access Login'),(72,1,'Logged in.','2024-03-07 03:15:48','Access Login'),(73,1,'Logged in.','2024-03-07 04:11:12','Access Login'),(74,1,'Logged in.','2024-03-07 20:31:52','Access Login'),(75,1,'Logged in.','2024-03-08 01:00:22','Access Login'),(76,1,'Logged in.','2024-03-08 01:29:05','Access Login'),(77,1,'Logged out.','2024-03-08 01:30:49','Access Logout'),(78,1,'Logged in.','2024-03-10 21:54:45','Access Login'),(79,1,'Logged in.','2024-03-10 22:51:10','Access Login'),(80,2,'Logged in.','2024-03-10 23:51:09','Access Login'),(81,16,'Logged in.','2024-03-10 23:51:45','Access Login'),(82,2,'Logged out.','2024-03-10 23:59:16','Access Logout'),(83,1,'Logged in.','2024-03-10 23:59:26','Access Login'),(84,1,'Logged out.','2024-03-11 01:50:41','Access Logout'),(85,16,'Logged in.','2024-03-11 01:51:19','Access Login'),(86,16,'Logged out.','2024-03-11 01:52:37','Access Logout'),(87,2,'Logged in.','2024-03-11 01:52:54','Access Login'),(88,2,'Logged out.','2024-03-11 01:54:19','Access Logout'),(89,1,'Logged in.','2024-03-11 01:54:29','Access Login'),(90,1,'Logged out.','2024-03-11 01:56:28','Access Logout'),(91,14,'Logged in.','2024-03-11 01:56:39','Access Login'),(92,14,'Logged out.','2024-03-11 01:59:57','Access Logout'),(93,16,'Logged in.','2024-03-11 02:00:13','Access Login'),(94,16,'Logged out.','2024-03-11 02:01:07','Access Logout'),(95,1,'Logged in.','2024-03-11 02:01:18','Access Login'),(96,1,'Logged out.','2024-03-11 02:10:28','Access Logout'),(97,1,'Logged in.','2024-03-11 02:10:51','Access Login'),(98,16,'Logged in.','2024-03-11 02:16:20','Access Login'),(99,16,'Logged out.','2024-03-11 02:18:38','Access Logout'),(100,14,'Logged in.','2024-03-11 02:19:40','Access Login'),(101,14,'Logged out.','2024-03-11 02:33:04','Access Logout'),(102,2,'Logged in.','2024-03-11 02:34:46','Access Login'),(103,2,'Logged out.','2024-03-11 02:39:22','Access Logout'),(104,1,'Logged in.','2024-03-11 02:39:35','Access Login'),(105,1,'Logged out.','2024-03-11 02:41:33','Access Logout'),(106,2,'Logged in.','2024-03-11 02:44:57','Access Login'),(107,2,'Logged out.','2024-03-11 02:54:59','Access Logout'),(108,1,'Logged in.','2024-03-11 02:55:15','Access Login'),(109,1,'Logged out.','2024-03-11 03:00:39','Access Logout'),(110,2,'Logged in.','2024-03-11 03:00:48','Access Login'),(111,2,'Logged out.','2024-03-11 03:03:17','Access Logout'),(112,2,'Logged in.','2024-03-11 03:03:32','Access Login'),(113,2,'Logged out.','2024-03-11 03:11:06','Access Logout'),(114,16,'Logged in.','2024-03-11 03:11:17','Access Login'),(115,16,'Logged in.','2024-03-11 03:14:15','Access Login'),(116,2,'Logged in.','2024-03-11 03:53:53','Access Login'),(117,2,'Logged out.','2024-03-11 04:07:23','Access Logout'),(118,1,'Logged in.','2024-03-11 04:07:31','Access Login'),(119,1,'Logged out.','2024-03-11 04:15:32','Access Logout'),(120,1,'Logged in.','2024-03-11 04:15:55','Access Login'),(121,1,'Logged in.','2024-03-11 22:12:17','Access Login'),(122,1,'Logged out.','2024-03-11 23:04:51','Access Logout'),(123,2,'Logged in.','2024-03-11 23:04:59','Access Login'),(124,2,'Logged out.','2024-03-12 00:39:57','Access Logout'),(125,16,'Logged in.','2024-03-12 00:40:14','Access Login'),(126,16,'Logged out.','2024-03-12 00:44:20','Access Logout'),(127,1,'Logged in.','2024-03-12 00:44:26','Access Login'),(128,2,'Logged in.','2024-03-12 00:46:36','Access Login'),(129,3,'Logged in.','2024-03-12 00:58:39','Access Login'),(130,3,'Logged out.','2024-03-12 01:03:15','Access Logout'),(131,16,'Logged in.','2024-03-12 01:03:24','Access Login'),(132,2,'Logged in.','2024-03-12 01:28:22','Access Login'),(133,2,'Logged out.','2024-03-12 01:30:31','Access Logout'),(134,2,'Logged in.','2024-03-12 01:30:58','Access Login'),(135,3,'Logged in.','2024-03-12 01:31:07','Access Login'),(136,3,'Logged out.','2024-03-12 02:39:50','Access Logout'),(137,4,'Logged in.','2024-03-12 02:40:09','Access Login'),(138,16,'Logged in.','2024-03-12 03:33:32','Access Login'),(139,1,'Logged in.','2024-03-12 21:58:25','Access Login'),(140,2,'Logged in.','2024-03-12 23:30:31','Access Login'),(141,3,'Logged in.','2024-03-12 23:30:49','Access Login'),(142,2,'Logged in.','2024-03-13 02:11:49','Access Login'),(143,1,'Logged in.','2024-03-13 02:16:29','Access Login'),(144,16,'Logged in.','2024-03-13 02:29:35','Access Login'),(145,3,'Logged in.','2024-03-13 02:30:49','Access Login'),(146,1,'Logged in.','2024-03-13 04:06:14','Access Login'),(147,14,'Logged in.','2024-03-13 05:07:52','Access Login'),(148,1,'Logged in.','2024-03-13 05:47:54','Access Login'),(149,1,'Logged in.','2024-03-13 08:15:05','Access Login'),(150,2,'Logged in.','2024-03-13 08:15:49','Access Login'),(151,3,'Logged in.','2024-03-13 09:13:42','Access Login'),(152,1,'Logged in.','2024-03-13 21:52:27','Access Login'),(153,1,'Logged in.','2024-03-13 23:09:32','Access Login'),(154,16,'Logged in.','2024-03-14 03:08:59','Access Login'),(155,2,'Logged in.','2024-03-14 03:16:39','Access Login'),(156,2,'Logged in.','2024-03-14 03:30:34','Access Login'),(157,2,'Logged in.','2024-03-14 03:59:58','Access Login'),(158,16,'Logged in.','2024-03-14 05:15:08','Access Login'),(159,3,'Logged in.','2024-03-14 05:27:21','Access Login'),(160,2,'Logged in.','2024-03-14 05:29:05','Access Login'),(161,1,'Logged in.','2024-03-14 06:42:16','Access Login'),(162,3,'Logged in.','2024-03-14 06:42:26','Access Login'),(163,2,'Logged in.','2024-03-14 06:42:44','Access Login'),(164,16,'Logged in.','2024-03-14 06:44:47','Access Login'),(165,16,'Logged out.','2024-03-14 06:45:29','Access Logout'),(166,16,'Logged in.','2024-03-14 06:45:46','Access Login'),(167,16,'Logged in.','2024-03-14 06:51:47','Access Login'),(168,2,'Logged in.','2024-03-14 06:58:47','Access Login'),(169,3,'Logged in.','2024-03-14 07:03:18','Access Login'),(170,2,'Logged in.','2024-03-14 07:09:45','Access Login'),(171,1,'Logged in.','2024-03-14 21:34:34','Access Login'),(172,1,'Logged out.','2024-03-14 21:40:40','Access Logout'),(173,1,'Logged in.','2024-03-14 21:40:47','Access Login'),(174,1,'Logged out.','2024-03-14 21:41:38','Access Logout'),(175,1,'Logged in.','2024-03-14 21:41:45','Access Login'),(176,2,'Logged in.','2024-03-14 22:12:03','Access Login'),(177,3,'Logged in.','2024-03-14 23:36:21','Access Login'),(178,1,'Logged in.','2024-03-15 00:24:33','Access Login'),(179,2,'Logged in.','2024-03-15 00:25:00','Access Login'),(180,2,'Logged in.','2024-03-15 00:26:19','Access Login'),(181,16,'Logged in.','2024-03-15 01:49:07','Access Login'),(182,2,'Logged in.','2024-03-15 01:50:16','Access Login'),(183,3,'Logged in.','2024-03-15 01:52:09','Access Login'),(184,1,'Logged in.','2024-03-15 05:07:44','Access Login'),(185,16,'Logged in.','2024-03-15 05:09:54','Access Login'),(186,3,'Logged in.','2024-03-15 05:10:57','Access Login'),(187,3,'Logged out.','2024-03-15 05:18:09','Access Logout'),(188,4,'Logged in.','2024-03-15 05:18:21','Access Login'),(189,3,'Logged in.','2024-03-15 05:18:50','Access Login'),(190,1,'Logged in.','2024-03-15 05:22:43','Access Login'),(191,3,'Logged in.','2024-03-15 05:23:01','Access Login'),(192,2,'Logged in.','2024-03-15 05:23:29','Access Login'),(193,1,'Logged out.','2024-03-15 05:26:35','Access Logout'),(194,2,'Logged out.','2024-03-15 05:26:38','Access Logout'),(195,1,'Logged in.','2024-03-15 05:27:16','Access Login'),(196,3,'Logged in.','2024-03-15 05:27:34','Access Login'),(197,2,'Logged in.','2024-03-15 05:27:56','Access Login'),(198,2,'Logged out.','2024-03-15 05:30:32','Access Logout'),(199,3,'Logged out.','2024-03-15 05:30:36','Access Logout'),(200,2,'Logged in.','2024-03-15 05:30:58','Access Login'),(201,16,'Logged in.','2024-03-15 05:31:15','Access Login'),(202,3,'Logged in.','2024-03-15 05:34:54','Access Login'),(203,3,'Logged out.','2024-03-15 05:38:43','Access Logout'),(204,16,'Logged out.','2024-03-15 05:38:51','Access Logout'),(205,4,'Logged in.','2024-03-15 05:39:17','Access Login'),(206,2,'Logged in.','2024-03-15 05:39:36','Access Login'),(207,1,'Logged in.','2024-03-15 05:42:55','Access Login'),(208,16,'Logged in.','2024-03-15 05:44:57','Access Login'),(209,1,'Logged out.','2024-03-15 05:52:48','Access Logout'),(210,16,'Logged out.','2024-03-15 05:52:56','Access Logout'),(211,4,'Logged out.','2024-03-15 05:53:09','Access Logout'),(212,2,'Logged out.','2024-03-15 05:53:26','Access Logout'),(213,16,'Logged in.','2024-03-15 05:53:55','Access Login'),(214,2,'Logged in.','2024-03-15 05:54:13','Access Login'),(215,2,'Logged in.','2024-03-15 05:54:35','Access Login'),(216,2,'Logged out.','2024-03-15 05:54:44','Access Logout'),(217,3,'Logged in.','2024-03-15 05:54:59','Access Login'),(218,14,'Logged in.','2024-03-15 05:55:19','Access Login'),(219,2,'Logged in.','2024-03-15 05:55:35','Access Login'),(220,1,'Logged in.','2024-03-18 21:36:25','Access Login'),(221,2,'Logged in.','2024-03-18 21:36:41','Access Login'),(222,16,'Logged in.','2024-03-18 21:37:09','Access Login'),(223,4,'Logged in.','2024-03-18 23:30:00','Access Login'),(224,2,'Logged in.','2024-03-18 23:32:41','Access Login'),(225,2,'Logged out.','2024-03-18 23:38:45','Access Logout'),(226,4,'Logged out.','2024-03-18 23:39:19','Access Logout'),(227,16,'Logged out.','2024-03-18 23:40:38','Access Logout'),(228,1,'Logged out.','2024-03-18 23:42:03','Access Logout'),(229,4,'Logged in.','2024-03-18 23:43:41','Access Login'),(230,5,'Logged in.','2024-03-18 23:46:29','Access Login'),(231,6,'Logged in.','2024-03-18 23:46:46','Access Login'),(232,4,'Logged in.','2024-03-19 00:18:33','Access Login'),(233,5,'Logged in.','2024-03-19 00:18:41','Access Login'),(234,6,'Logged in.','2024-03-19 00:18:51','Access Login'),(235,1,'Logged in.','2024-03-19 00:22:22','Access Login'),(236,1,'Logged out.','2024-03-19 00:23:21','Access Logout'),(237,6,'Logged out.','2024-03-19 00:46:23','Access Logout'),(238,6,'Logged in.','2024-03-19 00:46:53','Access Login'),(239,2,'Logged in.','2024-03-19 00:50:02','Access Login'),(240,6,'Logged out.','2024-03-19 01:23:18','Access Logout'),(241,1,'Logged in.','2024-03-19 01:25:51','Access Login'),(242,1,'Logged out.','2024-03-19 01:28:33','Access Logout'),(243,4,'Logged in.','2024-03-19 01:35:20','Access Login'),(244,4,'Logged out.','2024-03-19 01:41:55','Access Logout'),(245,5,'Logged in.','2024-03-19 01:42:05','Access Login'),(246,6,'Logged in.','2024-03-19 01:43:05','Access Login'),(247,5,'Logged in.','2024-03-19 01:43:58','Access Login'),(248,5,'Logged in.','2024-03-19 01:44:38','Access Login'),(249,4,'Logged in.','2024-03-19 01:45:38','Access Login'),(250,6,'Logged in.','2024-03-19 01:46:46','Access Login'),(251,1,'Logged in.','2024-03-19 01:52:41','Access Login'),(252,1,'Logged out.','2024-03-19 01:53:28','Access Logout'),(253,1,'Logged in.','2024-03-19 01:54:00','Access Login'),(254,2,'Logged out.','2024-03-19 01:54:22','Access Logout'),(255,6,'Logged out.','2024-03-19 01:54:34','Access Logout'),(256,6,'Logged in.','2024-03-19 01:54:52','Access Login'),(257,6,'Logged in.','2024-03-19 01:58:49','Access Login'),(258,6,'Logged in.','2024-03-19 01:59:50','Access Login'),(259,4,'Logged in.','2024-03-19 02:00:35','Access Login'),(260,4,'Logged out.','2024-03-19 02:01:50','Access Logout'),(261,1,'Logged in.','2024-03-19 02:02:19','Access Login'),(262,5,'Logged in.','2024-03-19 02:02:39','Access Login'),(263,6,'Logged in.','2024-03-19 02:02:56','Access Login'),(264,4,'Logged in.','2024-03-19 02:03:28','Access Login'),(265,4,'Logged out.','2024-03-19 02:04:01','Access Logout'),(266,4,'Logged in.','2024-03-19 02:04:21','Access Login'),(267,4,'Logged out.','2024-03-19 02:47:10','Access Logout'),(268,4,'Logged in.','2024-03-19 02:47:29','Access Login'),(269,6,'Logged in.','2024-03-19 03:00:57','Access Login'),(270,4,'Logged out.','2024-03-19 03:03:01','Access Logout'),(271,5,'Logged in.','2024-03-19 03:03:24','Access Login'),(272,5,'Logged out.','2024-03-19 03:39:24','Access Logout'),(273,6,'Logged in.','2024-03-19 03:39:33','Access Login'),(274,6,'Logged out.','2024-03-19 03:41:20','Access Logout'),(275,5,'Logged in.','2024-03-19 03:41:35','Access Login'),(276,5,'Logged out.','2024-03-19 04:12:58','Access Logout'),(277,4,'Logged in.','2024-03-19 04:13:11','Access Login'),(278,1,'Logged in.','2024-03-19 07:35:11','Access Login'),(279,5,'Logged in.','2024-03-19 22:16:08','Access Login'),(280,5,'Logged out.','2024-03-19 22:19:47','Access Logout'),(281,4,'Logged in.','2024-03-19 22:19:53','Access Login'),(282,5,'Logged in.','2024-03-20 00:09:12','Access Login'),(283,4,'Logged in.','2024-03-20 00:11:48','Access Login'),(284,5,'Logged out.','2024-03-20 00:17:12','Access Logout'),(285,4,'Logged out.','2024-03-20 00:17:27','Access Logout'),(286,1,'Logged in.','2024-03-20 00:18:55','Access Login'),(287,1,'Logged out.','2024-03-20 00:22:06','Access Logout'),(288,1,'Logged in.','2024-03-20 00:23:40','Access Login'),(289,3,'Logged in.','2024-03-20 00:24:08','Access Login'),(290,5,'Logged in.','2024-03-20 00:24:54','Access Login'),(291,6,'Logged in.','2024-03-20 00:25:24','Access Login'),(292,6,'Logged in.','2024-03-20 02:12:17','Access Login'),(293,3,'Logged in.','2024-03-20 02:12:33','Access Login'),(294,5,'Logged in.','2024-03-20 02:12:58','Access Login'),(295,1,'Logged in.','2024-03-20 03:05:41','Access Login'),(296,5,'Logged in.','2024-03-20 03:34:29','Access Login'),(297,5,'Logged out.','2024-03-20 03:36:39','Access Logout'),(298,1,'Logged out.','2024-03-20 03:37:09','Access Logout'),(299,3,'Logged in.','2024-03-20 03:37:57','Access Login'),(300,1,'Logged in.','2024-03-20 03:38:18','Access Login'),(301,5,'Logged in.','2024-03-20 03:38:48','Access Login'),(302,6,'Logged in.','2024-03-20 03:41:57','Access Login'),(303,6,'Logged in.','2024-03-20 05:12:25','Access Login'),(304,3,'Logged in.','2024-03-20 05:13:39','Access Login'),(305,1,'Logged in.','2024-03-20 05:14:54','Access Login'),(306,5,'Logged in.','2024-03-20 05:15:34','Access Login'),(307,1,'Logged in.','2024-03-21 22:10:57','Access Login'),(308,2,'Logged in.','2024-03-21 22:47:56','Access Login'),(309,2,'Logged out.','2024-03-21 22:48:38','Access Logout'),(310,1,'Logged in.','2024-03-21 22:48:58','Access Login'),(311,1,'Logged out.','2024-03-21 22:49:53','Access Logout'),(312,2,'Logged in.','2024-03-21 22:50:00','Access Login'),(313,2,'Logged out.','2024-03-21 22:52:36','Access Logout'),(314,2,'Logged in.','2024-03-21 22:52:42','Access Login'),(315,2,'Logged out.','2024-03-21 22:53:44','Access Logout'),(316,1,'Logged in.','2024-03-21 22:53:52','Access Login'),(317,2,'Logged in.','2024-03-21 23:04:29','Access Login'),(318,2,'Logged out.','2024-03-21 23:16:30','Access Logout'),(319,1,'Logged in.','2024-03-21 23:16:36','Access Login'),(320,5,'Logged in.','2024-03-21 23:17:13','Access Login'),(321,5,'Logged out.','2024-03-21 23:22:08','Access Logout'),(322,2,'Logged in.','2024-03-21 23:22:18','Access Login'),(323,2,'Logged out.','2024-03-21 23:23:01','Access Logout'),(324,6,'Logged in.','2024-03-21 23:23:22','Access Login'),(325,1,'Logged in.','2024-03-22 00:01:42','Access Login'),(326,2,'Logged in.','2024-03-22 00:01:51','Access Login'),(327,6,'Logged in.','2024-03-22 00:15:02','Access Login'),(328,6,'Logged in.','2024-03-22 00:26:01','Access Login'),(329,1,'Logged in.','2024-03-22 00:26:28','Access Login'),(330,6,'Logged in.','2024-03-22 01:10:39','Access Login'),(331,6,'Logged out.','2024-03-22 01:11:25','Access Logout'),(332,5,'Logged in.','2024-03-22 01:11:34','Access Login'),(333,5,'Logged out.','2024-03-22 01:24:12','Access Logout'),(334,2,'Logged in.','2024-03-22 01:28:45','Access Login'),(335,2,'Logged out.','2024-03-22 01:40:35','Access Logout'),(336,1,'Logged in.','2024-03-22 01:40:42','Access Login'),(337,1,'Logged out.','2024-03-22 01:48:49','Access Logout'),(338,1,'Logged in.','2024-03-22 01:48:55','Access Login'),(339,1,'Logged out.','2024-03-22 01:50:45','Access Logout'),(340,5,'Logged in.','2024-03-22 01:50:52','Access Login'),(341,5,'Logged out.','2024-03-22 01:51:02','Access Logout'),(342,6,'Logged in.','2024-03-22 01:51:08','Access Login'),(343,6,'Logged out.','2024-03-22 01:51:52','Access Logout'),(344,1,'Logged in.','2024-03-25 22:00:13','Access Login'),(345,2,'Logged in.','2024-03-25 22:01:28','Access Login'),(346,2,'Logged out.','2024-03-25 22:03:49','Access Logout'),(347,1,'Logged in.','2024-03-25 22:03:55','Access Login'),(348,1,'Logged out.','2024-03-25 22:55:08','Access Logout'),(349,16,'Logged in.','2024-03-25 22:55:19','Access Login'),(350,16,'Logged out.','2024-03-25 22:59:05','Access Logout'),(351,2,'Logged in.','2024-03-25 22:59:13','Access Login'),(352,2,'Logged out.','2024-03-25 22:59:42','Access Logout'),(353,1,'Logged in.','2024-03-25 22:59:52','Access Login'),(354,1,'Logged in.','2024-03-25 23:20:37','Access Login'),(355,5,'Logged in.','2024-03-25 23:26:11','Access Login'),(356,16,'Logged in.','2024-03-25 23:26:39','Access Login'),(357,1,'Logged out.','2024-03-26 00:09:02','Access Logout'),(358,5,'Logged in.','2024-03-26 00:09:12','Access Login'),(359,16,'Logged in.','2024-03-26 00:17:25','Access Login'),(360,16,'Logged in.','2024-03-26 00:17:55','Access Login'),(361,16,'Logged out.','2024-03-26 00:26:09','Access Logout'),(362,5,'Logged in.','2024-03-26 00:31:32','Access Login'),(363,16,'Logged in.','2024-03-26 00:32:41','Access Login'),(364,16,'Logged out.','2024-03-26 00:33:37','Access Logout'),(365,5,'Logged out.','2024-03-26 00:34:12','Access Logout'),(366,16,'Logged in.','2024-03-26 00:38:15','Access Login'),(367,16,'Logged out.','2024-03-26 00:38:49','Access Logout'),(368,16,'Logged in.','2024-03-26 00:39:05','Access Login'),(369,16,'Logged out.','2024-03-26 00:41:27','Access Logout'),(370,2,'Logged in.','2024-03-26 00:42:39','Access Login'),(371,2,'Logged out.','2024-03-26 01:27:09','Access Logout'),(372,1,'Logged in.','2024-03-26 01:27:57','Access Login'),(373,1,'Logged in.','2024-03-26 01:46:53','Access Login'),(374,1,'Logged in.','2024-03-26 03:49:18','Access Login'),(375,16,'Logged in.','2024-03-26 04:13:20','Access Login'),(376,5,'Logged in.','2024-03-26 21:45:29','Access Login'),(377,5,'Logged out.','2024-03-26 22:55:08','Access Logout'),(378,2,'Logged in.','2024-03-26 22:55:13','Access Login'),(379,1,'Logged in.','2024-03-27 01:13:44','Access Login'),(380,16,'Logged in.','2024-03-27 01:15:56','Access Login'),(381,1,'Logged out.','2024-03-27 02:54:41','Access Logout'),(382,2,'Logged out.','2024-03-27 02:54:51','Access Logout'),(383,1,'Logged in.','2024-03-27 02:55:00','Access Login'),(384,1,'Logged in.','2024-03-27 04:53:29','Access Login'),(385,1,'Logged in.','2024-03-27 04:53:55','Access Login'),(386,16,'Logged in.','2024-03-27 23:17:27','Access Login'),(387,16,'Logged out.','2024-03-27 23:54:29','Access Logout'),(388,2,'Logged in.','2024-03-27 23:54:36','Access Login'),(389,1,'Logged in.','2024-03-28 00:40:54','Access Login'),(390,1,'Logged out.','2024-03-28 03:18:44','Access Logout'),(391,16,'Logged in.','2024-03-28 03:18:52','Access Login'),(392,1,'Logged in.','2024-03-28 22:14:25','Access Login'),(393,2,'Logged in.','2024-03-28 23:21:01','Access Login'),(394,2,'Logged out.','2024-03-28 23:56:48','Access Logout'),(395,1,'Logged in.','2024-03-28 23:56:57','Access Login'),(396,1,'Logged in.','2024-03-31 22:25:47','Access Login'),(397,1,'Logged in.','2024-04-01 03:43:28','Access Login'),(398,1,'Logged out.','2024-04-01 03:43:30','Access Logout'),(399,1,'Logged in.','2024-04-01 03:43:37','Access Login'),(400,1,'Logged in.','2024-04-01 21:57:29','Access Login'),(401,1,'Logged out.','2024-04-01 21:57:46','Access Logout'),(402,16,'Logged in.','2024-04-01 21:58:15','Access Login'),(403,1,'Logged in.','2024-04-01 23:34:27','Access Login'),(404,1,'Logged in.','2024-04-02 00:15:45','Access Login'),(405,1,'Logged out.','2024-04-02 00:15:48','Access Logout'),(406,5,'Logged in.','2024-04-02 00:15:56','Access Login'),(407,16,'Logged in.','2024-04-02 01:28:44','Access Login'),(408,1,'Logged in.','2024-04-02 23:28:58','Access Login'),(409,1,'Logged in.','2024-04-03 02:52:15','Access Login'),(410,1,'Logged out.','2024-04-03 03:34:09','Access Logout'),(411,16,'Logged in.','2024-04-03 03:34:18','Access Login'),(412,1,'Logged in.','2024-04-03 21:39:49','Access Login'),(413,1,'Logged out.','2024-04-04 00:39:02','Access Logout'),(414,2,'Logged in.','2024-04-04 00:39:09','Access Login'),(415,2,'Logged in.','2024-04-04 23:52:43','Access Login'),(416,2,'Logged out.','2024-04-04 23:52:48','Access Logout'),(417,1,'Logged in.','2024-04-04 23:52:54','Access Login'),(418,1,'Logged out.','2024-04-05 00:29:41','Access Logout'),(419,1,'Logged in','2024-04-05 00:29:46','Access Login'),(420,2,'Logged in.','2024-04-05 03:09:35','Access Login'),(421,2,'Logged out.','2024-04-05 03:10:14','Access Logout'),(422,1,'Logged in.','2024-04-05 03:10:22','Access Login'),(423,1,'Logged in.','2024-04-05 04:54:00','Access Login'),(424,1,'Logged in.','2024-04-07 21:48:41','Access Login'),(425,1,'Logged in.','2024-04-08 00:19:48','Access Login'),(426,1,'Logged in.','2024-04-09 22:19:53','Access Login'),(427,1,'Logged out.','2024-04-09 22:48:33','Access Logout'),(428,1,'Logged in.','2024-04-09 22:53:04','Access Login'),(429,1,'Logged in.','2024-04-09 22:54:07','Access Login'),(430,1,'Logged out.','2024-04-09 22:54:54','Access Logout'),(431,1,'Logged in.','2024-04-09 22:55:18','Access Login'),(432,2,'Logged in.','2024-04-09 22:56:00','Access Login'),(433,1,'Logged in.','2024-04-10 02:27:37','Access Login'),(434,2,'Logged in.','2024-04-10 03:24:18','Access Login'),(435,16,'Logged in.','2024-04-10 03:30:53','Access Login'),(436,5,'Logged in.','2024-04-10 03:31:34','Access Login'),(437,16,'Logged out.','2024-04-10 03:31:55','Access Logout'),(438,16,'Logged in.','2024-04-10 03:58:08','Access Login'),(439,16,'Logged in.','2024-04-10 03:58:58','Access Login'),(440,1,'Logged in.','2024-04-10 22:13:47','Access Login'),(441,1,'Logged in.','2024-04-10 22:40:26','Access Login'),(442,3,'Logged in.','2024-04-10 22:43:07','Access Login'),(443,3,'Logged out.','2024-04-10 22:51:33','Access Logout'),(444,1,'Logged out.','2024-04-10 22:54:40','Access Logout'),(445,1,'Logged in.','2024-04-10 22:55:11','Access Login'),(446,5,'Logged in.','2024-04-10 22:56:40','Access Login'),(447,16,'Logged in.','2024-04-10 23:58:36','Access Login'),(448,16,'Logged in.','2024-04-11 00:03:22','Access Login'),(449,2,'Logged in.','2024-04-11 00:35:57','Access Login'),(450,1,'Logged in.','2024-04-11 22:26:49','Access Login'),(451,5,'Logged in.','2024-04-11 22:27:05','Access Login'),(452,5,'Logged out.','2024-04-11 22:55:52','Access Logout'),(453,3,'Logged in.','2024-04-11 22:56:36','Access Login'),(454,2,'Logged in.','2024-04-12 02:16:39','Access Login'),(455,16,'Logged in.','2024-04-12 03:27:24','Access Login'),(456,16,'Logged out.','2024-04-12 03:31:29','Access Logout'),(457,5,'Logged in.','2024-04-12 03:31:37','Access Login'),(458,1,'Logged in.','2024-04-14 22:35:51','Access Login'),(459,2,'Logged in.','2024-04-14 22:36:15','Access Login'),(460,1,'Logged in.','2024-04-15 02:36:38','Access Login'),(461,1,'Logged out.','2024-04-15 02:37:43','Access Logout'),(462,5,'Logged in.','2024-04-15 02:38:02','Access Login'),(463,5,'Logged in.','2024-04-15 02:38:31','Access Login'),(464,16,'Logged in.','2024-04-15 02:39:21','Access Login'),(465,2,'Logged in.','2024-04-15 02:40:35','Access Login'),(466,1,'Logged in.','2024-04-15 02:42:42','Access Login'),(467,1,'Logged in.','2024-04-15 22:12:14','Access Login'),(468,2,'Logged in.','2024-04-15 23:12:44','Access Login'),(469,1,'Logged in.','2024-04-16 01:05:38','Access Login'),(470,1,'Logged in.','2024-04-16 06:33:29','Access Login'),(471,1,'Logged out.','2024-04-16 06:38:42','Access Logout'),(472,2,'Logged in.','2024-04-16 06:38:50','Access Login'),(473,2,'Logged out.','2024-04-16 06:39:37','Access Logout'),(474,1,'Logged in.','2024-04-16 06:42:23','Access Login'),(475,1,'Logged in.','2024-04-16 06:42:37','Access Login'),(476,1,'Logged in','2024-04-16 06:47:31','Access Login'),(477,1,'Logged out.','2024-04-16 07:02:01','Access Logout'),(478,1,'Logged in.','2024-04-16 07:03:03','Access Login'),(479,1,'Logged in.','2024-04-16 07:03:16','Access Login'),(480,2,'Logged in.','2024-04-16 07:03:39','Access Login'),(481,1,'Logged in.','2024-04-16 07:04:02','Access Login'),(482,1,'Logged in','2024-04-16 07:05:36','Access Login'),(483,1,'Logged in','2024-04-16 21:37:28','Access Login'),(484,1,'Logged out.','2024-04-16 22:50:00','Access Logout'),(485,1,'Logged in','2024-04-16 22:50:17','Access Login'),(486,2,'Logged in','2024-04-16 22:51:58','Access Login'),(487,2,'Logged out.','2024-04-16 23:53:34','Access Logout'),(488,1,'Logged in','2024-04-16 23:53:44','Access Login'),(489,1,'Logged in.','2024-04-16 23:59:52','Access Login'),(490,1,'Logged out.','2024-04-17 00:17:35','Access Logout'),(491,16,'Logged in.','2024-04-17 00:17:51','Access Login'),(492,16,'Logged out.','2024-04-17 00:20:20','Access Logout'),(493,16,'Logged in.','2024-04-17 00:20:28','Access Login'),(494,16,'Logged out.','2024-04-17 00:20:52','Access Logout'),(495,2,'Logged in.','2024-04-17 00:20:59','Access Login'),(496,2,'Logged out.','2024-04-17 00:28:12','Access Logout'),(497,5,'Logged in.','2024-04-17 00:28:20','Access Login'),(498,5,'Logged out.','2024-04-17 00:29:47','Access Logout'),(499,1,'Logged in.','2024-04-17 00:29:54','Access Login'),(500,1,'Logged out.','2024-04-17 00:31:18','Access Logout'),(501,2,'Logged in.','2024-04-17 00:31:24','Access Login'),(502,2,'Logged out.','2024-04-17 00:32:26','Access Logout'),(503,2,'Logged in.','2024-04-17 00:32:36','Access Login'),(504,2,'Logged out.','2024-04-17 00:35:23','Access Logout'),(505,1,'Logged in.','2024-04-17 00:35:29','Access Login'),(506,1,'Logged out.','2024-04-17 00:41:40','Access Logout'),(507,1,'Logged in.','2024-04-17 00:41:48','Access Login'),(508,3,'Logged in.','2024-04-17 03:15:02','Access Login'),(509,3,'Logged out.','2024-04-17 03:28:45','Access Logout'),(510,1,'Logged in.','2024-04-17 03:28:51','Access Login'),(511,1,'Logged out.','2024-04-17 03:29:47','Access Logout'),(512,2,'Logged in.','2024-04-17 03:29:53','Access Login'),(513,2,'Logged out.','2024-04-17 03:35:19','Access Logout'),(514,16,'Logged in.','2024-04-17 03:35:32','Access Login'),(515,16,'Logged out.','2024-04-17 03:37:10','Access Logout'),(516,2,'Logged in.','2024-04-17 03:37:42','Access Login'),(517,16,'Logged in.','2024-04-17 03:42:05','Access Login'),(518,4,'Logged in.','2024-04-17 03:43:24','Access Login'),(519,3,'Logged in.','2024-04-17 03:46:21','Access Login'),(520,1,'Logged out.','2024-04-17 03:48:38','Access Logout'),(521,1,'Logged out.','2024-04-17 03:49:06','Access Logout'),(522,4,'Logged out.','2024-04-17 03:49:20','Access Logout'),(523,1,'Logged in.','2024-04-17 03:49:34','Access Login'),(524,16,'Logged out.','2024-04-17 03:50:04','Access Logout'),(525,5,'Logged in.','2024-04-17 03:50:16','Access Login'),(526,2,'Logged in.','2024-04-17 03:51:17','Access Login'),(527,1,'Logged in.','2024-04-17 03:51:45','Access Login'),(528,16,'Logged in.','2024-04-17 03:52:35','Access Login'),(529,1,'Logged in.','2024-04-17 23:32:00','Access Login'),(530,2,'Logged in.','2024-04-17 23:38:11','Access Login'),(531,1,'Logged in.','2024-04-18 03:27:32','Access Login'),(532,16,'Logged in.','2024-04-18 05:49:44','Access Login'),(533,1,'Logged in.','2024-04-18 22:17:59','Access Login'),(534,1,'Logged in.','2024-04-18 23:02:55','Access Login'),(535,1,'Logged in.','2024-04-19 02:42:00','Access Login'),(536,1,'Logged in.','2024-04-20 00:06:33','Access Login'),(537,1,'Logged in.','2024-04-20 23:17:01','Access Login'),(538,1,'Logged in.','2024-04-22 00:23:29','Access Login'),(539,1,'Logged in.','2024-04-22 04:43:44','Access Login'),(540,16,'Logged in.','2024-04-22 07:25:29','Access Login'),(541,5,'Logged in.','2024-04-22 08:12:23','Access Login'),(542,5,'Logged in.','2024-04-22 23:11:25','Access Login'),(543,3,'Logged in.','2024-04-22 23:28:27','Access Login'),(544,3,'Logged out.','2024-04-22 23:28:44','Access Logout'),(545,1,'Logged in.','2024-04-22 23:36:52','Access Login'),(546,1,'Logged out.','2024-04-22 23:42:00','Access Logout'),(547,16,'Logged in.','2024-04-22 23:42:26','Access Login'),(548,3,'Logged in.','2024-04-22 23:43:51','Access Login'),(549,4,'Logged in.','2024-04-22 23:44:21','Access Login'),(550,3,'Logged out.','2024-04-22 23:45:35','Access Logout'),(551,6,'Logged in.','2024-04-22 23:46:01','Access Login'),(552,16,'Logged out.','2024-04-22 23:55:23','Access Logout'),(553,4,'Logged out.','2024-04-22 23:56:27','Access Logout'),(554,5,'Logged in.','2024-04-22 23:57:35','Access Login'),(555,5,'Logged out.','2024-04-22 23:57:45','Access Logout'),(556,16,'Logged in.','2024-04-22 23:58:02','Access Login'),(557,16,'Logged out.','2024-04-23 00:00:06','Access Logout'),(558,16,'Logged in.','2024-04-23 00:00:18','Access Login'),(559,16,'Logged out.','2024-04-23 00:01:03','Access Logout'),(560,5,'Logged in.','2024-04-23 00:01:16','Access Login'),(561,5,'Logged out.','2024-04-23 00:02:02','Access Logout'),(562,5,'Logged in.','2024-04-23 00:02:54','Access Login'),(563,5,'Logged out.','2024-04-23 00:10:06','Access Logout'),(564,16,'Logged in.','2024-04-23 00:10:26','Access Login'),(565,16,'Logged out.','2024-04-23 00:11:32','Access Logout'),(566,16,'Logged in.','2024-04-23 00:11:44','Access Login'),(567,16,'Logged out.','2024-04-23 00:12:46','Access Logout'),(568,16,'Logged in.','2024-04-23 00:13:03','Access Login'),(569,16,'Logged out.','2024-04-23 00:15:23','Access Logout'),(570,3,'Logged in.','2024-04-23 00:16:04','Access Login'),(571,6,'Logged out.','2024-04-23 00:16:09','Access Logout'),(572,5,'Logged in.','2024-04-23 00:16:21','Access Login'),(573,5,'Logged out.','2024-04-23 00:21:01','Access Logout'),(574,3,'Logged out.','2024-04-23 00:21:16','Access Logout'),(575,16,'Logged in.','2024-04-23 00:21:27','Access Login'),(576,16,'Logged in.','2024-04-23 00:22:27','Access Login'),(577,16,'Logged out.','2024-04-23 00:22:37','Access Logout'),(578,5,'Logged in.','2024-04-23 00:22:58','Access Login'),(579,5,'Logged out.','2024-04-23 00:24:03','Access Logout'),(580,3,'Logged in.','2024-04-23 00:24:40','Access Login'),(581,3,'Logged out.','2024-04-23 00:25:43','Access Logout'),(582,5,'Logged in.','2024-04-23 00:25:56','Access Login'),(583,16,'Logged in.','2024-04-23 00:26:50','Access Login'),(584,16,'Logged out.','2024-04-23 00:29:55','Access Logout'),(585,1,'Logged in.','2024-04-23 00:30:33','Access Login'),(586,16,'Logged in.','2024-04-23 00:30:58','Access Login'),(587,16,'Logged out.','2024-04-23 00:31:55','Access Logout'),(588,1,'Logged out.','2024-04-23 00:32:05','Access Logout'),(589,5,'Logged out.','2024-04-23 00:32:11','Access Logout'),(590,5,'Logged in.','2024-04-23 00:32:36','Access Login'),(591,16,'Logged in.','2024-04-23 00:33:01','Access Login'),(592,3,'Logged in.','2024-04-23 00:33:19','Access Login'),(593,1,'Logged in.','2024-04-23 00:33:41','Access Login'),(594,16,'Logged out.','2024-04-23 00:34:36','Access Logout'),(595,6,'Logged in.','2024-04-23 00:35:11','Access Login'),(596,6,'Logged out.','2024-04-23 00:39:17','Access Logout'),(597,1,'Logged out.','2024-04-23 00:39:25','Access Logout'),(598,16,'Logged in.','2024-04-23 00:40:50','Access Login'),(599,5,'Logged in.','2024-04-23 00:41:36','Access Login'),(600,3,'Logged in.','2024-04-23 00:42:01','Access Login'),(601,4,'Logged in.','2024-04-23 00:42:27','Access Login'),(602,3,'Logged out.','2024-04-23 00:43:45','Access Logout'),(603,7,'Logged in.','2024-04-23 00:44:14','Access Login'),(604,4,'Logged out.','2024-04-23 00:51:34','Access Logout'),(605,3,'Logged out.','2024-04-23 00:53:30','Access Logout'),(606,7,'Logged out.','2024-04-23 00:53:47','Access Logout'),(607,16,'Logged in.','2024-04-23 00:57:18','Access Login'),(608,16,'Logged out.','2024-04-23 00:57:28','Access Logout'),(609,5,'Logged in.','2024-04-23 00:57:46','Access Login'),(610,16,'Logged in.','2024-04-23 00:58:18','Access Login'),(611,4,'Logged in.','2024-04-23 00:58:41','Access Login'),(612,3,'Logged in.','2024-04-23 00:59:22','Access Login'),(613,4,'Logged out.','2024-04-23 00:59:42','Access Logout'),(614,3,'Logged out.','2024-04-23 01:00:25','Access Logout'),(615,3,'Logged in.','2024-04-23 01:01:35','Access Login'),(616,16,'Logged out.','2024-04-23 01:01:51','Access Logout'),(617,4,'Logged in.','2024-04-23 01:02:37','Access Login'),(618,1,'Logged in.','2024-04-23 01:03:15','Access Login'),(619,1,'Logged out.','2024-04-23 01:03:30','Access Logout'),(620,3,'Logged out.','2024-04-23 01:05:23','Access Logout'),(621,4,'Logged out.','2024-04-23 01:05:27','Access Logout'),(622,3,'Logged in.','2024-04-23 01:08:29','Access Login'),(623,5,'Logged in.','2024-04-23 01:08:51','Access Login'),(624,16,'Logged in.','2024-04-23 01:09:18','Access Login'),(625,7,'Logged in.','2024-04-23 01:09:55','Access Login'),(626,5,'Logged out.','2024-04-23 01:10:05','Access Logout'),(627,5,'Logged in.','2024-04-23 01:10:58','Access Login'),(628,16,'Logged out.','2024-04-23 01:12:07','Access Logout'),(629,5,'Logged out.','2024-04-23 01:12:29','Access Logout'),(630,7,'Logged out.','2024-04-23 01:12:48','Access Logout'),(631,16,'Logged in.','2024-04-23 01:13:16','Access Login'),(632,3,'Logged out.','2024-04-23 01:13:36','Access Logout'),(633,5,'Logged in.','2024-04-23 01:13:54','Access Login'),(634,5,'Logged out.','2024-04-23 01:18:55','Access Logout'),(635,16,'Logged out.','2024-04-23 01:19:05','Access Logout'),(636,3,'Logged in.','2024-04-23 02:04:36','Access Login'),(637,3,'Logged out.','2024-04-23 02:04:45','Access Logout'),(638,3,'Logged in.','2024-04-23 02:04:51','Access Login'),(639,1,'Logged in.','2024-04-23 02:39:23','Access Login'),(640,1,'Logged in.','2024-04-23 07:29:09','Access Login'),(641,16,'Logged in.','2024-04-23 22:39:53','Access Login'),(642,16,'Logged out.','2024-04-23 23:31:30','Access Logout'),(643,16,'Logged in.','2024-04-23 23:32:16','Access Login'),(644,16,'Logged out.','2024-04-23 23:45:05','Access Logout'),(645,1,'Logged in.','2024-04-23 23:45:12','Access Login'),(646,5,'Logged in.','2024-04-23 23:47:22','Access Login'),(647,5,'Logged out.','2024-04-24 00:02:27','Access Logout'),(648,5,'Logged in.','2024-04-24 00:12:25','Access Login'),(649,3,'Logged in.','2024-04-24 00:27:49','Access Login'),(650,16,'Logged in.','2024-04-24 03:35:01','Access Login'),(651,5,'Logged in.','2024-04-24 03:55:55','Access Login'),(652,5,'Logged out.','2024-04-24 03:59:37','Access Logout'),(653,16,'Logged in.','2024-04-24 04:00:01','Access Login'),(654,3,'Logged in.','2024-04-24 05:07:05','Access Login'),(655,16,'Logged in.','2024-04-24 22:44:41','Access Login'),(656,3,'Logged in.','2024-04-25 03:37:28','Access Login'),(657,16,'Logged in.','2024-04-26 01:05:50','Access Login'),(658,1,'Logged in.','2024-04-26 01:56:37','Access Login'),(659,3,'Logged in.','2024-04-26 04:35:03','Access Login'),(660,16,'Logged in.','2024-04-28 23:27:14','Access Login'),(661,1,'Logged in.','2024-04-29 00:16:26','Access Login'),(662,1,'Logged in.','2024-04-29 02:17:12','Access Login'),(663,1,'Logged out.','2024-04-29 03:15:45','Access Logout'),(664,16,'Logged in.','2024-04-29 03:15:55','Access Login'),(665,16,'Logged in.','2024-04-29 22:48:01','Access Login'),(666,3,'Logged in.','2024-04-30 00:34:11','Access Login'),(667,5,'Logged in.','2024-04-30 01:52:11','Access Login'),(668,5,'Logged out.','2024-04-30 03:07:19','Access Logout'),(669,3,'Logged in.','2024-04-30 03:07:26','Access Login'),(670,16,'Logged in.','2024-04-30 04:27:23','Access Login'),(671,16,'Logged in.','2024-04-30 05:26:54','Access Login'),(672,3,'Logged in.','2024-05-01 23:39:06','Access Login'),(673,5,'Logged in.','2024-05-02 01:15:05','Access Login'),(674,16,'Logged in.','2024-05-02 02:14:46','Access Login'),(675,16,'Logged in.','2024-05-02 02:49:53','Access Login'),(676,16,'Logged in.','2024-05-02 04:17:34','Access Login'),(677,5,'Logged in.','2024-05-02 04:50:17','Access Login'),(678,3,'Logged in.','2024-05-02 04:52:18','Access Login'),(679,1,'Logged in.','2024-05-02 04:59:47','Access Login'),(680,3,'Logged out.','2024-05-02 05:01:29','Access Logout'),(681,1,'Logged out.','2024-05-02 05:01:51','Access Logout'),(682,5,'Logged out.','2024-05-02 05:01:58','Access Logout'),(683,1,'Logged in.','2024-05-02 05:12:11','Access Login'),(684,1,'Logged out.','2024-05-02 05:23:43','Access Logout'),(685,16,'Logged in.','2024-05-02 05:24:02','Access Login'),(686,5,'Logged in.','2024-05-02 23:16:28','Access Login'),(687,3,'Logged in.','2024-05-03 00:50:05','Access Login'),(688,5,'Logged in.','2024-05-03 01:07:19','Access Login'),(689,5,'Logged out.','2024-05-03 01:22:42','Access Logout'),(690,5,'Logged in.','2024-05-03 01:23:00','Access Login'),(691,4,'Logged in.','2024-05-03 05:10:00','Access Login'),(692,1,'Logged in.','2024-05-03 22:25:23','Access Login'),(693,5,'Logged in.','2024-05-04 22:55:58','Access Login'),(694,16,'Logged in.','2024-05-05 23:15:44','Access Login'),(695,1,'Logged in.','2024-05-14 22:59:58','Access Login'),(696,5,'Logged in.','2024-05-22 09:02:56','Access Login'),(697,1,'Logged in.','2024-05-22 23:34:27','Access Login'),(698,1,'Logged in.','2024-05-23 00:52:33','Access Login'),(699,1,'Logged in.','2024-05-23 02:33:30','Access Login'),(700,1,'Logged in.','2024-05-24 02:42:02','Access Login'),(701,3,'Logged in.','2024-05-24 03:34:50','Access Login'),(702,5,'Logged in.','2024-05-24 03:39:42','Access Login'),(703,5,'Logged in.','2024-05-24 03:41:13','Access Login'),(704,1,'Logged in.','2024-05-26 23:08:48','Access Login'),(705,5,'Logged in.','2024-05-27 04:18:25','Access Login'),(706,1,'Logged in.','2024-05-27 21:57:55','Access Login'),(707,1,'Logged out.','2024-05-27 22:11:01','Access Logout'),(708,5,'Logged in.','2024-05-27 22:11:10','Access Login'),(709,4,'Logged in.','2024-05-28 02:03:47','Access Login'),(710,6,'Logged in.','2024-05-28 05:32:02','Access Login'),(711,1,'Logged in.','2024-05-28 22:10:45','Access Login'),(712,1,'Logged out.','2024-05-28 22:22:51','Access Logout'),(713,5,'Logged in.','2024-05-28 22:22:59','Access Login');
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
  `table_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `column_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `new_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
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
  `portname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `decoder_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `request_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'waiting',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `port_queue`
--

LOCK TABLES `port_queue` WRITE;
/*!40000 ALTER TABLE `port_queue` DISABLE KEYS */;
INSERT INTO `port_queue` VALUES (1,1,'port1','','2024-04-16 13:48:59','waiting');
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
  `portname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `userauthority` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `macaddr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pc_online` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `linktype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `audio` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `version` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `media` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `format` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `resolution` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `framerate` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `connect` int NOT NULL,
  `decoder_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lastupdatedby` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `upgrade` int NOT NULL,
  `path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `enable1` int DEFAULT NULL,
  `enable2` int DEFAULT NULL,
  `enable3` int DEFAULT NULL,
  `enable4` int DEFAULT NULL,
  `enable5` int DEFAULT NULL,
  `enable6` int DEFAULT NULL,
  `enable7` int DEFAULT NULL,
  `enable8` int DEFAULT NULL,
  `enable9` int DEFAULT NULL,
  `enable10` int DEFAULT NULL,
  `enable11` int DEFAULT NULL,
  `enable12` int DEFAULT NULL,
  `enable13` int DEFAULT NULL,
  `enable14` int DEFAULT NULL,
  `enable15` int DEFAULT NULL,
  `enable16` int DEFAULT NULL,
  `scan1` int DEFAULT NULL,
  `scan2` int DEFAULT NULL,
  `scan3` int DEFAULT NULL,
  `scan4` int DEFAULT NULL,
  `scan5` int DEFAULT NULL,
  `scan6` int DEFAULT NULL,
  `scan7` int DEFAULT NULL,
  `scan8` int DEFAULT NULL,
  `scan9` int DEFAULT NULL,
  `scan10` int DEFAULT NULL,
  `scan11` int DEFAULT NULL,
  `scan12` int DEFAULT NULL,
  `scan13` int DEFAULT NULL,
  `scan14` int DEFAULT NULL,
  `scan15` int DEFAULT NULL,
  `scan16` int DEFAULT NULL,
  `a1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `a2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `a3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `a4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `a5` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `a6` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `a7` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `a8` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `a9` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `a10` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `a11` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `a12` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `a13` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `a14` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `a15` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `a16` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `switch_id` int DEFAULT NULL,
  `decoder_count` int DEFAULT NULL,
  `image_data` blob,
  `image_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `view_only` tinyint(1) NOT NULL DEFAULT '0',
  `aesportname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `desportname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `3desportname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `active_local` int DEFAULT '0',
  `scan_time` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `switch_id` (`switch_id`),
  KEY `decoder_count` (`decoder_count`),
  CONSTRAINT `fk_decoder_count` FOREIGN KEY (`decoder_count`) REFERENCES `decoder` (`decoder_count`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portname`
--

LOCK TABLES `portname` WRITE;
/*!40000 ALTER TABLE `portname` DISABLE KEYS */;
INSERT INTO `portname` VALUES (1,'encoder1',NULL,NULL,'1.168.1.1','06:42:4e:d1:03:22','HDMI-CIM','Yes','KvmSwitch','Analog','2.0.0.2010','','Stereo, 48KHz','1920 * 1080','60 fps',0,'decoder1','busy','2024-05-29 05:25:23',1,'C:/xampp1/htdocs/kvm.sql',1,1,1,1,1,1,1,0,1,1,1,1,1,0,1,1,0,1,0,0,1,1,1,1,1,1,1,1,0,1,1,1,'Share','Share','Share','View','View','View','View','View','Share','Share','Share','View','View','Share','Share','View',32,1,NULL,'port1.jpg',0,'RvQl6oeZL1WMwHdEsO7iOA==','JSCpri4QqvTsBktu2itePA==','MixEs5I2v3Ok2zPhbIUw/Q==\n',1,3),(2,'encoder2',NULL,NULL,'2.168.1.1','16:42:4e:d1:03:22','DP-CIM','Yes','KvmSwitch','Digital','2.0.0.2010','','Mono, 48KHz','640 * 480','15 fps',0,'decoder2','busy','2024-05-28 05:00:29',1,'C:/xampp1/htdocs/check_authority.php',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,0,1,1,1,1,'View','Share','View','Share','Share','Share','Share','Share','View','View','Share','Share','View','View','View','Share',31,2,NULL,'port2.jpg',0,'',NULL,'',1,0);
/*!40000 ALTER TABLE `portname` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`kvm`@`localhost`*/ /*!50003 TRIGGER `port_trigger` AFTER UPDATE ON `portname` FOR EACH ROW BEGIN
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

               IF NEW.view_only <> OLD.view_only THEN
        SET column_name = 'view_only';
        SET new_value = NEW.view_only;
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
  `kvm_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kvm_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lastupdatedby` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`switch_id`),
  KEY `fk_switch` (`encoder_id`),
  CONSTRAINT `fk1_encoder` FOREIGN KEY (`encoder_id`) REFERENCES `portname` (`id`),
  CONSTRAINT `fk_switch` FOREIGN KEY (`encoder_id`) REFERENCES `portname` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `switch`
--

LOCK TABLES `switch` WRITE;
/*!40000 ALTER TABLE `switch` DISABLE KEYS */;
INSERT INTO `switch` VALUES (1,32,'Standard Port','Rack2023','2023-11-24 05:02:51'),(2,31,'Standard Port','Rack2023','2023-11-24 05:02:51'),(3,30,'Standard Port','oct','2023-11-24 10:49:16'),(4,29,'Kvm Switch','Rack2023','2023-11-24 09:58:09'),(5,28,'Standard Port','Rack2023','2023-11-24 05:02:51'),(6,27,'Standard Port','Rack2023','2023-11-24 05:02:51'),(7,26,'Standard Port','Rack2023','2023-11-24 05:02:51'),(8,25,'kvm','Rack2023','2023-11-24 11:55:50'),(9,24,'Standard Port','oct','2023-11-24 10:08:41'),(10,23,'Kvm Switch','Rack2023','2023-11-24 06:06:00'),(11,22,'Standard Port','Rack2023','2023-11-24 05:02:51'),(12,21,'Standard Port','Rack2023','2023-11-24 05:02:51'),(13,20,'kvm','Rack2023','2023-11-24 11:59:08'),(14,19,'Standard Port','oct','2023-11-24 10:53:59'),(15,18,'Standard Port','Rack2023','2023-11-24 05:02:51'),(16,17,'Kvm Switch','Rack_oct','2023-11-24 06:06:54'),(17,16,'Standard Port','kkkkk','2023-11-24 11:05:45'),(18,15,'oct','Rack2023','2023-11-24 12:01:33'),(19,14,'Standard Port','Rack2023','2023-11-24 05:02:51'),(20,13,'Standard Port','kvm2024','2024-04-22 12:32:42'),(21,12,'Standard Port','Rack2023','2023-11-24 05:02:51'),(22,11,'Standard Port','oct','2023-11-24 06:48:04'),(23,10,'Kvm switch','kvm_13','2024-01-09 10:01:00'),(24,9,'Standard Port','Rack2023','2023-11-24 05:02:51'),(25,8,'Standard Port','oct','2023-11-24 12:06:18'),(26,7,'Standard Port','Rack2023','2023-11-24 05:02:51'),(27,6,'Standard Port','Rack2023','2023-11-24 05:02:51'),(28,5,'Standard Port','Rack2023','2023-11-24 05:02:51'),(29,4,'Kvm Switch','Rack2023','2023-11-24 06:08:57'),(30,3,'Standard Port','Rack2023','2023-11-24 05:02:51'),(31,2,'Kvm Switch','oct','2023-11-24 07:04:13'),(32,1,'Kvm Switch','Rack2023','2023-11-24 06:09:36');
/*!40000 ALTER TABLE `switch` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`kvm`@`localhost`*/ /*!50003 TRIGGER `switch_trigger` AFTER UPDATE ON `switch` FOR EACH ROW BEGIN
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
  `table_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `column_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `new_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
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
  `trigger_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `event_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trigger_log`
--

LOCK TABLES `trigger_log` WRITE;
/*!40000 ALTER TABLE `trigger_log` DISABLE KEYS */;
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
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `starttime` datetime NOT NULL,
  `endtime` datetime NOT NULL,
  `perversion` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `upgradeversion` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `result` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upgradehistory`
--

LOCK TABLES `upgradehistory` WRITE;
/*!40000 ALTER TABLE `upgradehistory` DISABLE KEYS */;
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
  `table_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `column_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `new_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_log`
--

LOCK TABLES `user_log` WRITE;
/*!40000 ALTER TABLE `user_log` DISABLE KEYS */;
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
  `desname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `3desname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `aespass` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `despass` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `3despass` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `active` int NOT NULL,
  `authority` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `username` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `view` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mass` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `card` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `virtual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lastUpdatedBy` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `username`
--

LOCK TABLES `username` WRITE;
/*!40000 ALTER TABLE `username` DISABLE KEYS */;
INSERT INTO `username` VALUES (1,'39ECqzRcvCL6lkFsRRLwMA==','DZFChS19WJ8=','ZOzCZDBJmoE=','5FtMB7azcO5eWnBzjW16Kg==','pwjqEguZCkY+n36dJGmnXA==','c8HNkEynNj+4qewzjNi3qw==',1,'Admin','Admin','Admin@123','OFF','on','','on','on','2024-05-29 05:24:40'),(2,'VOZhiwPGRBQPqH9C4mqurg==','NM0ufMi7JW8=','C9DNFNcY9ME=','9R6qXV199LHiLvc=','€š¾bãï÷a2Æò?)Ž´','6M0pao9hrFEf1t5aoMouuQ==',1,'Admin','USER2','User2@12345','OFF','on','on','','','2024-05-29 05:25:03'),(3,'rnXISJN6sIxR4zR7uMUOlA==','KD2pjm85xY0=','MoeZznMF+8g=','T8uFqecbePP74G1nq1+/1g==','RC8Uz2ijCfzhmEtUWlv6Hg==','H+Mrj6NXGS8bHz7GGsn70A==',1,'Admin','USER3','User3@12345','OFF','on','on','on','on','2024-05-29 05:24:40'),(4,'hv6bRIo6dg2REa7ZovbA0Q==','','XHJs2Ory9QM=','9R6qXVt99LHiLvc=','€<‘}_7r\0^9—Å˜Õ','VC0b/yisuRIvoMiMFOULGg==',1,'Admin','USER4','User4@12345','OFF','','on','on','','2024-05-29 05:24:40'),(5,'8mN8CSURPJZxropve0HoJA==','','iVM5iuF/teI=','9R6qXVp99LHiLvc=','€«V&þëj)ÎTe®','SM6D+gCOGmEvoMiMFOULGg==',1,'Admin','USER5','User5@12345','OFF','on','on','on','on','2024-05-29 05:24:40'),(6,'zl5cxwShn41JVKZrLEibVw==','','rElCH/DTxKc=','9R6qXVl99LHiLvc=','€±c¢`KÈrYó€ó¦ ','0rPbY6iXAoovoMiMFOULGg==',1,'Admin','USER6','User6@12345','OFF','on','on','on','on','2024-05-29 05:24:40'),(7,'0Vd5oH/pehlPCBCMgfTFgw==','','5r3A1DRgpe0=','9R6qXVh99LHiLvc=','€þ\'Ÿ%l“†â!,Éh','x/WqepJ2rTgvoMiMFOULGg==',1,'User','USER7','User7@12345','OFF','on','on','on','on','2024-05-29 05:24:40'),(8,'VHl8o5oac01YTAGP3+E/iw==','','HcyYLKHkWb4=','1R6qXVd99LHi','€jH…l°\\ŸÄB:Å+\ZZù','lAt8jMGtZ4+m9Lgzn1jgrQ==',0,'Admin','USER8','user8@123','OFF','on','on','','on','2024-05-29 05:24:40'),(9,'jYyZLBNlFBn4yM4rSm0tmw==','','Q4x8RqW7SzQ=','9R6qXVZ99LHiLvc=','€HÐŸŒAyR*Âó0õÿ ¯','l9CLCe6BLewvoMiMFOULGg==',1,'Admin','USER9','User9@12345','OFF','on','on','on','on','2024-05-29 05:24:40'),(10,'em7Yt4l8RLimUf47Iy47iQ==','','qfbFKKQJwT8=','9R6qXV4NhbLjKfb4','€,°ú$¥¤…»µÜñÀ<˜s','0EenkO+4Y3sdRR/o1qzTUw==',0,'User','USER10','User10@12345','OFF','on','on','on','on','2024-05-29 05:24:40'),(11,'iTWsyHOuabdXSmw3VV6+KQ==','','+uoS9mJcrUc=','9R6qXV4MhbLjKfb4','€×¨WÝmÙDÚ?íÂë','FL8AEWyZV5kdRR/o1qzTUw==',1,'Admin','USER11','User11@12345','OFF','on','on','on','on','2024-05-29 05:24:40'),(12,'b3h5zZKv5ty5EOJ7VrS/3A==','mGJS28SDy0M=','Hd/IujyJ23Y=','9R6qXV4PhbLjKfb4','€Ž©¤Fzø²¬âÛ½¦gA','scb5ysudtC8dRR/o1qzTUw==',0,'User','USER12','User12@12345','OFF','on','on','','','2024-05-29 05:24:40'),(13,'bkmXn8ipMpBpX0o9rDkJTA==','','iKKpkXrSpvs=','1R6qXV4OhbLjKQ==','€Þ-­Á=V\0úÿ\ZÊ°q','EyAkLYC+Hyesw7aZymrFqg==',0,'User','USER13','user13@123','OFF','on','on','on','on','2024-05-29 05:24:40'),(14,'UK589/JSYa15wyRNQoTxlQ==','','YOSyd1zqcgM=','9R6qXV4JhbLjKfb4','€ö&¦\Zºá²hÑi^bb~','mEdxVLqpfc8dRR/o1qzTUw==',1,'User','USER14','User14@12345','OFF','on','on','','','2024-05-29 05:24:40'),(15,'UqANM2nlW4HcMegvDbnMCQ==','','wAhsYanANuY=','9R6qXV4IhbLjKfb4','€/M[‘\ZìrÑÛœ”>Ñô{','Y+AJBeAD2AsdRR/o1qzTUw==',1,'Admin','USER15','User15@12345','OFF','on','on','','on','2024-05-29 05:24:40'),(16,'pXbAamDck7wy18zYInD0KA==','','hlDIInESIF8=','9R6qXV4LhbLjKfb4','€æ„rÍ·Û÷÷$ûþô‰B','Ov3dbwnbes4dRR/o1qzTUw==',1,'Admin','USER16','User16@12345','OFF','on','on','','on','2024-05-29 05:24:40');
/*!40000 ALTER TABLE `username` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`kvm`@`localhost`*/ /*!50003 TRIGGER `notify` AFTER UPDATE ON `username` FOR EACH ROW BEGIN
    IF NEW.hid != OLD.hid THEN
        INSERT INTO rabbitmq_queue (id, table_name, column_name, new_value, timestamp)
        VALUES (NEW.id, 'username', 'hid', NEW.hid, NOW());
    END IF;

    IF NEW.mass != OLD.mass THEN
        INSERT INTO rabbitmq_queue (id, table_name, column_name, new_value, timestamp)
        VALUES (NEW.id, 'username', 'mass', NEW.mass, NOW());
    END IF;

    IF NEW.card != OLD.card THEN
        INSERT INTO rabbitmq_queue (id, table_name, column_name, new_value, timestamp)
        VALUES (NEW.id, 'username', 'card', NEW.card, NOW());
    END IF;

    IF NEW.virtual != OLD.virtual THEN
        INSERT INTO rabbitmq_queue (id, table_name, column_name, new_value, timestamp)
        VALUES (NEW.id, 'username', 'virtual', NEW.virtual, NOW());
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`kvm`@`localhost`*/ /*!50003 TRIGGER `user_trigger` AFTER UPDATE ON `username` FOR EACH ROW BEGIN
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waiting_list`
--

LOCK TABLES `waiting_list` WRITE;
/*!40000 ALTER TABLE `waiting_list` DISABLE KEYS */;
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

-- Dump completed on 2024-05-29 22:40:56
 SELECT  u.id FROM username u WHERE u.username = 'User2' AND u.password = 'User2@12345'

