-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: trackstacking
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.16.04.1

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
-- Table structure for table `collection`
--

DROP TABLE IF EXISTS `collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection` (
  `collectionId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `songId` int(11) NOT NULL,
  PRIMARY KEY (`collectionId`),
  KEY `fk_collection_1_idx` (`userId`),
  KEY `fk_collection_2_idx` (`songId`),
  CONSTRAINT `fk_collection_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_collection_2` FOREIGN KEY (`songId`) REFERENCES `song` (`songId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection`
--

LOCK TABLES `collection` WRITE;
/*!40000 ALTER TABLE `collection` DISABLE KEYS */;
INSERT INTO `collection` VALUES (175,1,1),(176,2,3);
/*!40000 ALTER TABLE `collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `download`
--

DROP TABLE IF EXISTS `download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `download` (
  `downloadId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `songId` int(11) NOT NULL,
  `downloadTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`downloadId`),
  KEY `fk_download_1_idx` (`userId`),
  KEY `fk_download_2_idx` (`songId`),
  CONSTRAINT `fk_download_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_download_2` FOREIGN KEY (`songId`) REFERENCES `song` (`songId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `download`
--

LOCK TABLES `download` WRITE;
/*!40000 ALTER TABLE `download` DISABLE KEYS */;
INSERT INTO `download` VALUES (1,1,3,'2018-04-30 12:50:13'),(2,1,1,'2018-04-30 13:28:21'),(3,1,1,'2018-04-30 13:28:21'),(4,1,3,'2018-05-01 01:32:18'),(5,1,3,'2018-05-02 10:04:47');
/*!40000 ALTER TABLE `download` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `monthRanking`
--

DROP TABLE IF EXISTS `monthRanking`;
/*!50001 DROP VIEW IF EXISTS `monthRanking`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `monthRanking` AS SELECT 
 1 AS `songId`,
 1 AS `trendingCoefficient`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `play`
--

DROP TABLE IF EXISTS `play`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `play` (
  `playId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `songId` int(11) NOT NULL,
  `playTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`playId`),
  KEY `fk_play_1_idx` (`userId`),
  KEY `fk_play_2_idx` (`songId`),
  CONSTRAINT `fk_play_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_play_2` FOREIGN KEY (`songId`) REFERENCES `song` (`songId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `play`
--

LOCK TABLES `play` WRITE;
/*!40000 ALTER TABLE `play` DISABLE KEYS */;
INSERT INTO `play` VALUES (1,1,1,'2018-04-29 12:50:27'),(2,1,3,'2018-04-29 12:51:31'),(3,2,3,'2018-04-29 15:58:03'),(4,1,3,'2018-04-30 11:39:32'),(5,1,3,'2018-04-30 11:40:24'),(6,1,3,'2018-04-30 11:43:50'),(7,1,3,'2018-04-30 11:46:00'),(8,1,3,'2018-04-30 11:46:16'),(9,1,3,'2018-04-30 11:46:25'),(10,1,3,'2018-04-30 11:46:57'),(11,1,1,'2018-04-30 11:50:37'),(12,1,3,'2018-04-30 11:54:51'),(13,1,3,'2018-04-30 11:54:57'),(14,1,3,'2018-04-30 11:55:01'),(15,1,3,'2018-04-30 11:55:10'),(16,1,1,'2018-04-30 12:59:35'),(17,1,3,'2018-04-30 13:05:38'),(18,1,3,'2018-05-01 01:32:15'),(19,1,1,'2018-05-02 07:06:10'),(20,1,3,'2018-05-02 07:06:12'),(21,1,3,'2018-05-02 07:06:16'),(22,1,1,'2018-05-02 07:06:19'),(23,1,3,'2018-05-02 07:06:20'),(24,1,3,'2018-05-02 10:04:44'),(25,2,3,'2018-05-02 11:10:33'),(26,2,3,'2018-05-02 11:11:08');
/*!40000 ALTER TABLE `play` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song`
--

DROP TABLE IF EXISTS `song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `song` (
  `songId` int(11) NOT NULL AUTO_INCREMENT,
  `songName` varchar(45) NOT NULL,
  `songAddress` varchar(255) NOT NULL,
  `songCoverAddress` varchar(255) DEFAULT NULL,
  `songType` varchar(45) DEFAULT NULL,
  `songLength` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`songId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song`
--

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
INSERT INTO `song` VALUES (1,'喜欢你','http://www.wangruns.top/wp-content/uploads/2017/03/%E5%96%9C%E6%AC%A2%E4%BD%A0.mp3',NULL,NULL,1),(2,'绝世','http://www.wangruns.top/wp-content/uploads/2017/03/%E7%BB%9D%E4%B8%96.mp3',NULL,NULL,1),(3,'一生所爱(Live)','track/song/一生所爱(Live).mp3',NULL,NULL,1);
/*!40000 ALTER TABLE `song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `trending`
--

DROP TABLE IF EXISTS `trending`;
/*!50001 DROP VIEW IF EXISTS `trending`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `trending` AS SELECT 
 1 AS `songId`,
 1 AS `trendingCoefficient`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'wangrunsjob@qq.com','e10adc3949ba59abbe56e057f20f883e'),(2,'runstutu@gmail.com','e10adc3949ba59abbe56e057f20f883e');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `weekRanking`
--

DROP TABLE IF EXISTS `weekRanking`;
/*!50001 DROP VIEW IF EXISTS `weekRanking`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `weekRanking` AS SELECT 
 1 AS `songId`,
 1 AS `trendingCoefficient`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `monthRanking`
--

/*!50001 DROP VIEW IF EXISTS `monthRanking`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `monthRanking` AS select `play`.`songId` AS `songId`,count(`play`.`songId`) AS `trendingCoefficient` from `play` where (month(`play`.`playTime`) >= (month(now()) - 1)) group by `play`.`songId` limit 50 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `trending`
--

/*!50001 DROP VIEW IF EXISTS `trending`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `trending` AS select `play`.`songId` AS `songId`,count(`play`.`songId`) AS `trendingCoefficient` from `play` group by `play`.`songId` limit 50 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `weekRanking`
--

/*!50001 DROP VIEW IF EXISTS `weekRanking`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `weekRanking` AS select `play`.`songId` AS `songId`,count(`play`.`songId`) AS `trendingCoefficient` from `play` where (week(`play`.`playTime`,0) >= (week(now(),0) - 1)) group by `play`.`songId` limit 50 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-02 19:42:16
