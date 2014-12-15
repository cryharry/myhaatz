CREATE DATABASE  IF NOT EXISTS `jspbeginner` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `jspbeginner`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: jspbeginner
-- ------------------------------------------------------
-- Server version	5.5.22

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
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `passwd` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `reg_date` datetime NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `tel` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mtel` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zipcode` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addr1` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addr2` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('a','a','a','2014-11-08 17:56:52',11,'남','abc@abc.co.kr',NULL,NULL,NULL,'a','b'),('ab','ab','ab','2014-11-08 19:21:45',11,'여','ab@ab.co.kr','051-000-0000','010-000-0000',NULL,'123-456','1234'),('abc','abc','abc','2014-11-09 21:23:37',11,'여','abc@abc.abc','051-1234-5678','010-9876-5432',NULL,'614-847','부산광역시 부산진구 서면로 68 (부전동 257-53,부전동근린생활시설)'),('ad','ad','ad','2014-11-10 10:13:34',29,'남','ad@ad.com','051-1234-5678','010-9876-5432',NULL,'614-844','부산광역시 부산진구 새싹로28번길 28 (부전동 264-2,부전1동 주민센터)'),('admin','admin','관리자','2014-11-08 21:24:18',1,'남','admin@admin.com','051-1234-5678','010-1234-5678',NULL,'612-833','부산광역시 해운대구 재반로 96-17 (재송동 1125-2,나노메디칼)');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `board` (
  `num` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `passwd` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `file` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime NOT NULL,
  `readcount` int(11) DEFAULT '0',
  `ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `re_ref` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `re_lev` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `re_seq` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `name_fk_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'관리자','admin','테스트','테스트입니다.1','RUNNING.txt',NULL,'2014-11-09 14:03:19',36,'0:0:0:0:0:0:0:1','1','0','2'),(3,'ab','ab','[답글]ab','ab',NULL,NULL,'2014-11-09 18:25:24',31,'0:0:0:0:0:0:0:1','1','1','2'),(4,'ab','abc','[답글]abc','abc',NULL,NULL,'2014-11-09 18:26:16',13,'0:0:0:0:0:0:0:1','1','2','2'),(5,'관리자','bb','bb','bb','banner_1.jpg','image/jpeg','2014-11-09 22:20:21',79,'0:0:0:0:0:0:0:1','5','0','6'),(6,'관리자','abcd','[답글]abcd','abcd','email-3126.html','text/html','2014-11-10 12:06:38',36,'0:0:0:0:0:0:0:1','5','1','6'),(7,'bbb','bbb','[답글]bbb','bbb',NULL,NULL,'2014-11-26 14:24:05',0,NULL,'5','1','6');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-15 18:32:15
