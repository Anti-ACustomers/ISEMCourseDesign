-- MySQL dump 10.13  Distrib 5.7.26, for Win64 (x86_64)
--
-- Host: localhost    Database: isem
-- ------------------------------------------------------
-- Server version	5.7.26

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `A_uid` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `A_name` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `a_block_time` datetime DEFAULT '2000-01-01 00:00:00',
  `a_error_time` datetime DEFAULT '2000-01-01 00:00:00',
  `A_login_time` date DEFAULT NULL,
  `A_update_time` date DEFAULT NULL,
  `A_error_times` tinyint(4) DEFAULT '0',
  `A_iteration_value` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `A_challenge_value` int(11) DEFAULT NULL,
  `A_random_num` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `A_reset_password` tinyint(1) DEFAULT '0',
  `A_request_unfreeze` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`A_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger FROZEN
before update on account
for each row
begin
if new.a_error_times = 3 then
set new.a_block_time = now(), new.a_error_times = 0;
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrator` (
  `AD_id` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `AD_name` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AD_iteration_value` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AD_challenge_value` int(11) DEFAULT NULL,
  `AD_random_num` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AD_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`AD_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES ('log','logAdmin','8794e7a3b03d80bf4058882606eb5763',214,'IirXAN1e',2),('security','securityAdmin','b3667d6fd4613cb36be916e08a8f3e50',179,'yKfFEqvh',1);
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password`
--

DROP TABLE IF EXISTS `password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password` (
  `P_no` int(11) NOT NULL AUTO_INCREMENT,
  `P_iteration_value` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `P_challenge_value` int(11) DEFAULT NULL,
  `P_random_num` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `A_uid` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`P_no`),
  KEY `A_uid` (`A_uid`),
  CONSTRAINT `password_ibfk_1` FOREIGN KEY (`A_uid`) REFERENCES `account` (`A_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password`
--

LOCK TABLES `password` WRITE;
/*!40000 ALTER TABLE `password` DISABLE KEYS */;
/*!40000 ALTER TABLE `password` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-16 12:13:37
