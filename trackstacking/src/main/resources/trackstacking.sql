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
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection`
--

LOCK TABLES `collection` WRITE;
/*!40000 ALTER TABLE `collection` DISABLE KEYS */;
INSERT INTO `collection` VALUES (176,2,3),(180,5,207),(181,5,192),(182,5,230),(183,5,224),(184,5,1),(185,5,239),(186,5,234),(187,5,228),(188,5,220),(189,5,198),(190,5,212),(193,7,1),(194,7,198),(195,7,239),(203,1,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `download`
--

LOCK TABLES `download` WRITE;
/*!40000 ALTER TABLE `download` DISABLE KEYS */;
INSERT INTO `download` VALUES (1,1,3,'2018-04-30 12:50:13'),(2,1,1,'2018-04-30 13:28:21'),(3,1,1,'2018-04-30 13:28:21'),(4,1,3,'2018-05-01 01:32:18'),(5,1,3,'2018-05-02 10:04:47'),(6,5,207,'2018-05-03 15:18:40'),(7,5,207,'2018-05-03 15:18:44'),(8,5,207,'2018-05-03 15:18:59'),(10,1,1,'2018-05-06 10:08:54'),(11,1,3,'2018-05-06 11:09:12'),(12,1,1,'2018-05-06 11:09:18'),(13,1,3,'2018-05-29 03:52:51'),(14,1,2,'2018-05-29 03:53:03');
/*!40000 ALTER TABLE `download` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liking`
--

DROP TABLE IF EXISTS `liking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liking` (
  `likeId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `reviewId` int(11) NOT NULL,
  PRIMARY KEY (`likeId`),
  KEY `fk_like_1_idx` (`userId`),
  KEY `fk_like_2_idx` (`reviewId`),
  CONSTRAINT `fk_like_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_like_2` FOREIGN KEY (`reviewId`) REFERENCES `review` (`reviewId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liking`
--

LOCK TABLES `liking` WRITE;
/*!40000 ALTER TABLE `liking` DISABLE KEYS */;
INSERT INTO `liking` VALUES (170,1,3),(171,15,3),(222,15,6);
/*!40000 ALTER TABLE `liking` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `play`
--

LOCK TABLES `play` WRITE;
/*!40000 ALTER TABLE `play` DISABLE KEYS */;
INSERT INTO `play` VALUES (1,1,1,'2018-04-29 12:50:27'),(2,1,3,'2018-04-29 12:51:31'),(3,2,3,'2018-04-29 15:58:03'),(4,1,3,'2018-04-30 11:39:32'),(5,1,3,'2018-04-30 11:40:24'),(6,1,3,'2018-04-30 11:43:50'),(7,1,3,'2018-04-30 11:46:00'),(8,1,3,'2018-04-30 11:46:16'),(9,1,3,'2018-04-30 11:46:25'),(10,1,3,'2018-04-30 11:46:57'),(11,1,1,'2018-04-30 11:50:37'),(12,1,3,'2018-04-30 11:54:51'),(13,1,3,'2018-04-30 11:54:57'),(14,1,3,'2018-04-30 11:55:01'),(15,1,3,'2018-04-30 11:55:10'),(16,1,1,'2018-04-30 12:59:35'),(17,1,3,'2018-04-30 13:05:38'),(18,1,3,'2018-05-01 01:32:15'),(19,1,1,'2018-05-02 07:06:10'),(20,1,3,'2018-05-02 07:06:12'),(21,1,3,'2018-05-02 07:06:16'),(22,1,1,'2018-05-02 07:06:19'),(23,1,3,'2018-05-02 07:06:20'),(24,1,3,'2018-05-02 10:04:44'),(25,2,3,'2018-05-02 11:10:33'),(26,2,3,'2018-05-02 11:11:08'),(27,1,3,'2018-05-03 02:45:43'),(28,1,239,'2018-05-03 02:47:52'),(29,1,3,'2018-05-03 02:48:10'),(30,1,239,'2018-05-03 02:49:17'),(31,1,240,'2018-05-03 02:50:36'),(32,4,229,'2018-05-03 09:53:27'),(33,5,207,'2018-05-03 15:18:19'),(34,5,192,'2018-05-03 15:20:05'),(35,5,1,'2018-05-03 15:21:38'),(36,5,239,'2018-05-03 15:21:51'),(37,5,234,'2018-05-03 15:21:58'),(38,5,228,'2018-05-03 15:22:13'),(39,5,220,'2018-05-03 15:22:25'),(40,5,209,'2018-05-03 15:22:33'),(41,5,198,'2018-05-03 15:22:44'),(42,5,193,'2018-05-03 15:23:58'),(43,1,1,'2018-05-03 15:32:24'),(44,1,1,'2018-05-03 15:41:21'),(45,1,209,'2018-05-03 15:41:35'),(46,6,3,'2018-05-03 15:49:31'),(47,1,198,'2018-05-03 15:50:38'),(48,1,1,'2018-05-03 15:53:19'),(49,7,3,'2018-05-03 16:23:45'),(50,7,239,'2018-05-03 16:24:44'),(51,7,239,'2018-05-03 16:25:12'),(52,7,3,'2018-05-03 16:25:31'),(53,7,1,'2018-05-03 16:25:34'),(54,7,1,'2018-05-03 16:28:23'),(55,1,198,'2018-05-03 16:30:41'),(56,1,239,'2018-05-03 16:32:41'),(57,1,229,'2018-05-03 16:33:00'),(58,8,220,'2018-05-04 00:21:39'),(59,8,239,'2018-05-04 00:34:39'),(60,8,240,'2018-05-04 00:34:40'),(61,1,207,'2018-05-06 03:49:13'),(62,1,2,'2018-05-06 06:51:43'),(128,1,220,'2018-05-06 09:50:17'),(129,1,1,'2018-05-06 09:50:20'),(130,1,1,'2018-05-06 09:50:25'),(131,1,3,'2018-05-06 09:53:25'),(132,1,193,'2018-05-06 09:53:28'),(133,1,233,'2018-05-06 09:53:31'),(134,1,198,'2018-05-06 09:53:55'),(135,1,220,'2018-05-06 09:54:03'),(136,1,3,'2018-05-06 09:54:17'),(137,1,240,'2018-05-06 09:54:28'),(138,1,193,'2018-05-06 09:54:37'),(139,1,193,'2018-05-06 09:55:03'),(140,1,193,'2018-05-06 09:55:03'),(141,1,193,'2018-05-06 09:55:04'),(142,1,228,'2018-05-06 09:55:06'),(143,1,220,'2018-05-06 09:55:23'),(144,1,193,'2018-05-06 09:56:07'),(145,1,3,'2018-05-06 09:56:11'),(146,1,240,'2018-05-06 09:57:10'),(147,1,228,'2018-05-06 09:57:13'),(148,1,220,'2018-05-06 09:57:59'),(149,1,239,'2018-05-06 09:58:03'),(150,1,1,'2018-05-06 09:58:22'),(151,1,239,'2018-05-06 09:59:15'),(152,1,3,'2018-05-06 09:59:18'),(153,1,193,'2018-05-06 09:59:22'),(154,1,3,'2018-05-06 10:00:58'),(155,1,228,'2018-05-06 10:01:02'),(156,1,233,'2018-05-06 10:05:42'),(157,1,239,'2018-05-06 10:07:15'),(158,1,220,'2018-05-06 10:14:53'),(159,1,3,'2018-05-06 10:15:38'),(160,1,3,'2018-05-06 10:17:43'),(161,1,3,'2018-05-06 10:18:48'),(162,1,3,'2018-05-06 10:20:13'),(163,1,3,'2018-05-06 10:21:37'),(164,1,2,'2018-05-06 10:23:28'),(165,1,2,'2018-05-06 10:24:07'),(166,1,3,'2018-05-06 10:33:26'),(167,1,3,'2018-05-06 10:36:31'),(168,1,2,'2018-05-06 10:39:13'),(169,1,2,'2018-05-06 10:39:30'),(170,1,2,'2018-05-06 10:39:48'),(171,1,2,'2018-05-06 10:45:50'),(172,1,2,'2018-05-06 10:46:39'),(173,1,2,'2018-05-06 10:48:35'),(174,1,1,'2018-05-06 10:50:38'),(175,1,2,'2018-05-06 10:52:46'),(176,1,193,'2018-05-06 10:52:49'),(177,1,2,'2018-05-06 10:53:01'),(178,1,3,'2018-05-06 10:55:28'),(179,1,193,'2018-05-06 10:55:38'),(180,1,1,'2018-05-06 10:55:43'),(181,1,2,'2018-05-06 10:55:46'),(182,1,240,'2018-05-06 10:56:42'),(183,1,3,'2018-05-06 11:00:24'),(184,1,1,'2018-05-06 11:00:37'),(185,1,3,'2018-05-06 11:09:10'),(186,1,234,'2018-05-06 11:09:43'),(187,1,3,'2018-05-06 11:09:56'),(188,1,1,'2018-05-06 11:09:59'),(189,1,1,'2018-05-06 11:10:16'),(190,1,1,'2018-05-06 11:10:51'),(191,1,193,'2018-05-06 11:22:51'),(192,1,1,'2018-05-06 11:22:53'),(193,1,240,'2018-05-06 11:26:45'),(194,1,239,'2018-05-06 11:26:46'),(195,1,2,'2018-05-06 11:26:58'),(196,1,1,'2018-05-06 11:27:19'),(197,1,2,'2018-05-06 11:27:33'),(198,1,3,'2018-05-06 11:27:43'),(199,1,1,'2018-05-06 11:43:59'),(200,1,3,'2018-05-06 11:44:17'),(201,1,2,'2018-05-06 11:44:22'),(202,1,2,'2018-05-06 11:45:56'),(203,1,2,'2018-05-06 12:20:27'),(204,1,2,'2018-05-06 12:29:18'),(205,1,3,'2018-05-07 03:55:44'),(206,1,3,'2018-05-28 06:46:46'),(207,1,2,'2018-05-28 06:46:49'),(208,1,1,'2018-05-28 06:46:51'),(209,1,1,'2018-05-28 07:16:23'),(210,1,1,'2018-05-28 08:06:09'),(211,1,1,'2018-05-28 08:11:39'),(212,1,1,'2018-05-28 09:11:10'),(213,1,2,'2018-05-29 03:52:41'),(214,1,2,'2018-05-29 03:53:00'),(215,1,3,'2018-05-30 13:48:47'),(216,1,2,'2018-06-07 13:37:26'),(217,1,1,'2018-06-07 13:38:06');
/*!40000 ALTER TABLE `play` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reca`
--

DROP TABLE IF EXISTS `reca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reca` (
  `recId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `songId` int(11) NOT NULL,
  PRIMARY KEY (`recId`),
  KEY `fk_reca_1_idx` (`userId`),
  KEY `fk_reca_2_idx` (`songId`),
  CONSTRAINT `fk_reca_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_reca_2` FOREIGN KEY (`songId`) REFERENCES `song` (`songId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18141 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reca`
--

LOCK TABLES `reca` WRITE;
/*!40000 ALTER TABLE `reca` DISABLE KEYS */;
INSERT INTO `reca` VALUES (18031,1,4),(18032,1,5),(18033,1,6),(18034,1,7),(18035,1,8),(18036,1,9),(18037,1,10),(18038,1,11),(18039,1,12),(18040,1,13),(18041,2,224),(18042,2,234),(18043,2,212),(18044,2,228),(18045,2,198),(18046,2,239),(18047,2,220),(18048,2,1),(18049,2,192),(18050,2,207),(18051,4,212),(18052,4,234),(18053,4,239),(18054,4,228),(18055,4,198),(18056,4,3),(18057,4,220),(18058,4,1),(18059,4,192),(18060,4,207),(18061,5,5),(18062,5,9),(18063,5,4),(18064,5,10),(18065,5,6),(18066,5,7),(18067,5,8),(18068,5,3),(18069,5,229),(18070,5,11),(18071,2011227,233),(18072,2011227,198),(18073,2011227,228),(18074,2011227,193),(18075,2011227,240),(18076,2011227,3),(18077,2011227,220),(18078,2011227,2),(18079,2011227,1),(18080,2011227,239),(18081,6,240),(18082,6,207),(18083,6,234),(18084,6,2),(18085,6,198),(18086,6,220),(18087,6,228),(18088,6,239),(18089,6,1),(18090,6,193),(18091,7,209),(18092,7,230),(18093,7,229),(18094,7,220),(18095,7,212),(18096,7,224),(18097,7,228),(18098,7,192),(18099,7,207),(18100,7,234),(18101,8,212),(18102,8,192),(18103,8,234),(18104,8,2),(18105,8,198),(18106,8,3),(18107,8,228),(18108,8,207),(18109,8,1),(18110,8,193),(18111,9,233),(18112,9,198),(18113,9,228),(18114,9,193),(18115,9,240),(18116,9,3),(18117,9,220),(18118,9,2),(18119,9,1),(18120,9,239),(18121,15,233),(18122,15,198),(18123,15,228),(18124,15,193),(18125,15,240),(18126,15,3),(18127,15,220),(18128,15,2),(18129,15,1),(18130,15,239),(18131,1,244),(18132,2,244),(18133,4,244),(18134,5,244),(18135,2011227,244),(18136,6,244),(18137,7,244),(18138,8,244),(18139,9,244),(18140,15,244);
/*!40000 ALTER TABLE `reca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recb`
--

DROP TABLE IF EXISTS `recb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recb` (
  `recId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `songId` int(11) NOT NULL,
  PRIMARY KEY (`recId`),
  KEY `fk_recb_1_idx` (`userId`),
  KEY `fk_recb_2_idx` (`songId`),
  CONSTRAINT `fk_recb_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_recb_2` FOREIGN KEY (`songId`) REFERENCES `song` (`songId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6721 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recb`
--

LOCK TABLES `recb` WRITE;
/*!40000 ALTER TABLE `recb` DISABLE KEYS */;
INSERT INTO `recb` VALUES (6611,1,4),(6612,1,5),(6613,1,6),(6614,1,7),(6615,1,8),(6616,1,9),(6617,1,10),(6618,1,11),(6619,1,12),(6620,1,13),(6621,2,224),(6622,2,234),(6623,2,212),(6624,2,228),(6625,2,198),(6626,2,239),(6627,2,220),(6628,2,1),(6629,2,192),(6630,2,207),(6631,4,212),(6632,4,234),(6633,4,239),(6634,4,228),(6635,4,198),(6636,4,3),(6637,4,220),(6638,4,1),(6639,4,192),(6640,4,207),(6641,5,5),(6642,5,9),(6643,5,4),(6644,5,10),(6645,5,6),(6646,5,7),(6647,5,8),(6648,5,3),(6649,5,229),(6650,5,11),(6651,2011227,233),(6652,2011227,198),(6653,2011227,228),(6654,2011227,193),(6655,2011227,240),(6656,2011227,3),(6657,2011227,220),(6658,2011227,2),(6659,2011227,1),(6660,2011227,239),(6661,6,240),(6662,6,207),(6663,6,234),(6664,6,2),(6665,6,198),(6666,6,220),(6667,6,228),(6668,6,239),(6669,6,1),(6670,6,193),(6671,7,209),(6672,7,230),(6673,7,229),(6674,7,220),(6675,7,212),(6676,7,224),(6677,7,228),(6678,7,192),(6679,7,207),(6680,7,234),(6681,8,212),(6682,8,192),(6683,8,234),(6684,8,2),(6685,8,198),(6686,8,3),(6687,8,228),(6688,8,207),(6689,8,1),(6690,8,193),(6691,9,233),(6692,9,198),(6693,9,228),(6694,9,193),(6695,9,240),(6696,9,3),(6697,9,220),(6698,9,2),(6699,9,1),(6700,9,239),(6701,15,233),(6702,15,198),(6703,15,228),(6704,15,193),(6705,15,240),(6706,15,3),(6707,15,220),(6708,15,2),(6709,15,1),(6710,15,239);
/*!40000 ALTER TABLE `recb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `reviewId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `songId` int(11) NOT NULL,
  `review` varchar(140) NOT NULL,
  `reviewTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`reviewId`),
  KEY `fk_review_1_idx` (`userId`),
  KEY `fk_review_2_idx` (`songId`),
  CONSTRAINT `fk_review_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_2` FOREIGN KEY (`songId`) REFERENCES `song` (`songId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,1,3,'呵呵，楼上的真搞笑，这个评论模板的插件好丑陋，简直丑爆了，我简单做的都比这个好，信不信，我分分钟肥腻做出来一个，吓屎你们这群都比','2018-05-30 03:44:40'),(2,2,3,'这才是真正的冷门好歌','2018-05-30 03:48:33'),(3,4,3,'人生百年，谁不曾大闹天宫，谁不曾头上紧箍，谁不曾爱上层楼，谁不曾孤单上路。','2018-05-30 03:50:20'),(4,15,3,'有时候，你选择与某人保持距离，不是因为不在乎，而是因为你清楚的知道，她不属于你。人生遇到的每个人，出场顺序真的很重要，很多人如果换一个时间认识，就会有不同的结局。或许，有些爱，只能止于唇齿，掩于岁月！','2018-05-30 03:53:11'),(5,1,1,'紫棋自己的味道，很好听。欣赏她的才华与实力，加油！','2018-05-30 15:40:05'),(6,15,1,'还记得曾经有个人对我唱，“喜欢你”，当时，我并不知道。','2018-05-30 15:41:54'),(12,1,3,'精彩精彩精彩精彩精彩精彩精彩精彩','2018-06-01 13:25:25'),(14,1,3,'精彩精彩精彩精彩精彩精彩精彩精彩精彩精彩精彩精彩精彩精彩精彩精彩','2018-06-01 13:25:36'),(15,1,3,'精彩','2018-06-01 13:25:40');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(45) NOT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'管理员');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
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
  `lyricName` varchar(120) DEFAULT NULL,
  `lyricAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`songId`)
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song`
--

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
INSERT INTO `song` VALUES (1,'喜欢你','http://www.wangruns.top/wp-content/uploads/2017/03/%E5%96%9C%E6%AC%A2%E4%BD%A0.mp3',NULL,NULL,1,NULL,NULL),(2,'绝世','http://www.wangruns.top/wp-content/uploads/2017/03/%E7%BB%9D%E4%B8%96.mp3',NULL,NULL,1,NULL,NULL),(3,'一生所爱(Live)','track/song/一生所爱(Live).mp3',NULL,NULL,1,NULL,NULL),(4,'天涯','track/song/天涯.mp3',NULL,NULL,0,NULL,NULL),(5,'沉默是金','track/song/沉默是金.mp3',NULL,NULL,0,NULL,NULL),(6,'哭砂','track/song/哭砂.mp3',NULL,NULL,0,NULL,NULL),(7,'飘雪','track/song/飘雪.mp3',NULL,NULL,0,NULL,NULL),(8,'千年等一回','track/song/千年等一回.mp3',NULL,NULL,0,NULL,NULL),(9,'你那么爱她','track/song/你那么爱她.mp3',NULL,NULL,0,NULL,NULL),(10,'太阳星辰','track/song/太阳星辰.mp3',NULL,NULL,0,NULL,NULL),(11,'月亮代表我的心','track/song/月亮代表我的心.mp3',NULL,NULL,0,NULL,NULL),(12,'雪见—仙凡之旅-麦振鸿','track/song/雪见—仙凡之旅-麦振鸿.mp3',NULL,NULL,0,NULL,NULL),(13,'月亮惹的祸','track/song/月亮惹的祸.mp3',NULL,NULL,0,NULL,NULL),(14,'The Mass','track/song/The Mass.mp3',NULL,NULL,0,NULL,NULL),(15,'醉赤壁','track/song/醉赤壁.mp3',NULL,NULL,0,NULL,NULL),(16,'涛声依旧','track/song/涛声依旧.mp3',NULL,NULL,0,NULL,NULL),(17,'千千阙歌','track/song/千千阙歌.mp3',NULL,NULL,0,NULL,NULL),(18,'仙剑奇缘-麦振鸿','track/song/仙剑奇缘-麦振鸿.mp3',NULL,NULL,0,NULL,NULL),(19,'遇见','track/song/遇见.mp3',NULL,NULL,0,NULL,NULL),(20,'心之焰','track/song/心之焰.mp3',NULL,NULL,0,NULL,NULL),(21,'烧酒话','track/song/烧酒话.mp3',NULL,NULL,0,NULL,NULL),(22,'一剪梅','track/song/一剪梅.mp3',NULL,NULL,0,NULL,NULL),(23,'黑街','track/song/黑街.mp3',NULL,NULL,0,NULL,NULL),(24,'懂你','track/song/懂你.mp3',NULL,NULL,0,NULL,NULL),(25,'有多少爱可以重来','track/song/有多少爱可以重来.mp3',NULL,NULL,0,NULL,NULL),(26,'约定','track/song/约定.mp3',NULL,NULL,0,NULL,NULL),(27,'Main Titles','track/song/Main Titles.mp3',NULL,NULL,0,NULL,NULL),(28,'Panama','track/song/Panama.mp3',NULL,NULL,0,NULL,NULL),(29,'酒干倘卖无','track/song/酒干倘卖无.mp3',NULL,NULL,0,NULL,NULL),(30,'矜持','track/song/矜持.mp3',NULL,NULL,0,NULL,NULL),(31,'The Day You Went Away','track/song/The Day You Went Away.mp3',NULL,NULL,0,NULL,NULL),(32,'I Just Wanna Run','track/song/I Just Wanna Run.mp3',NULL,NULL,0,NULL,NULL),(33,'往事只能回味','track/song/往事只能回味.mp3',NULL,NULL,0,NULL,NULL),(34,'知心爱人','track/song/知心爱人.mp3',NULL,NULL,0,NULL,NULL),(35,'三万英尺','track/song/三万英尺.mp3',NULL,NULL,0,NULL,NULL),(36,'有一个姑娘','track/song/有一个姑娘.mp3',NULL,NULL,0,NULL,NULL),(37,'手放开','track/song/手放开.mp3',NULL,NULL,0,NULL,NULL),(38,'tokyo hot','track/song/tokyo hot.mp3',NULL,NULL,0,NULL,NULL),(39,'平凡之路','track/song/平凡之路.mp3',NULL,NULL,0,NULL,NULL),(40,'美酒加咖啡','track/song/美酒加咖啡.mp3',NULL,NULL,0,NULL,NULL),(41,'九九女儿红','track/song/九九女儿红.mp3',NULL,NULL,0,NULL,NULL),(42,'「名探偵コナン」~メインテーマ(バラード・ヴァージョン)','track/song/「名探偵コナン」~メインテーマ(バラード・ヴァージョン).mp3',NULL,NULL,0,NULL,NULL),(43,'如果这都不算爱','track/song/如果这都不算爱.mp3',NULL,NULL,0,NULL,NULL),(44,'Something Just Like This','track/song/Something Just Like This.mp3',NULL,NULL,0,NULL,NULL),(45,'我从崖边跌落','track/song/我从崖边跌落.mp3',NULL,NULL,0,NULL,NULL),(46,'Toca Toca','track/song/Toca Toca.mp3',NULL,NULL,0,NULL,NULL),(47,'月光の雲海','track/song/月光の雲海.mp3',NULL,NULL,0,NULL,NULL),(48,'宿敌','track/song/宿敌.mp3',NULL,NULL,0,NULL,NULL),(49,'叹十声','track/song/叹十声.mp3',NULL,NULL,0,NULL,NULL),(50,'어떤 욕심','track/song/어떤 욕심.mp3',NULL,NULL,0,NULL,NULL),(51,'又见炊烟','track/song/又见炊烟.mp3',NULL,NULL,0,NULL,NULL),(52,'一生何求','track/song/一生何求.mp3',NULL,NULL,0,NULL,NULL),(53,'#Lov3 #Ngẫu Hứng','track/song/#Lov3 #Ngẫu Hứng.mp3',NULL,NULL,0,NULL,NULL),(54,'万水千山总是情','track/song/万水千山总是情.mp3',NULL,NULL,0,NULL,NULL),(55,'小雨','track/song/小雨.mp3',NULL,NULL,0,NULL,NULL),(56,'吻别','track/song/吻别.mp3',NULL,NULL,0,NULL,NULL),(57,'站在高岗上','track/song/站在高岗上.mp3',NULL,NULL,0,NULL,NULL),(58,'拜月-麦振鸿','track/song/拜月-麦振鸿.mp3',NULL,NULL,0,NULL,NULL),(59,'你是风儿我是沙','track/song/你是风儿我是沙.mp3',NULL,NULL,0,NULL,NULL),(60,'容易受伤的女人','track/song/容易受伤的女人.mp3',NULL,NULL,0,NULL,NULL),(61,'相见不如怀念','track/song/相见不如怀念.mp3',NULL,NULL,0,NULL,NULL),(62,'月半小夜曲','track/song/月半小夜曲.mp3',NULL,NULL,0,NULL,NULL),(63,'空空如也','track/song/空空如也.mp3',NULL,NULL,0,NULL,NULL),(64,'外婆的澎湖湾','track/song/外婆的澎湖湾.mp3',NULL,NULL,0,NULL,NULL),(65,'偏偏喜欢你','track/song/偏偏喜欢你.mp3',NULL,NULL,0,NULL,NULL),(66,'花好月圆','track/song/花好月圆.mp3',NULL,NULL,0,NULL,NULL),(67,'Hey Oh','track/song/Hey Oh.mp3',NULL,NULL,0,NULL,NULL),(68,'兰花草','track/song/兰花草.mp3',NULL,NULL,0,NULL,NULL),(69,'敖包相会','track/song/敖包相会.mp3',NULL,NULL,0,NULL,NULL),(70,'红日','track/song/红日.mp3',NULL,NULL,0,NULL,NULL),(71,'你的眼神','track/song/你的眼神.mp3',NULL,NULL,0,NULL,NULL),(72,'比翼鸟-麦振鸿','track/song/比翼鸟-麦振鸿.mp3',NULL,NULL,0,NULL,NULL),(73,'相思风雨中','track/song/相思风雨中.mp3',NULL,NULL,0,NULL,NULL),(74,'Unity','track/song/Unity.mp3',NULL,NULL,0,NULL,NULL),(75,'花太香','track/song/花太香.mp3',NULL,NULL,0,NULL,NULL),(76,'花香','track/song/花香.mp3',NULL,NULL,0,NULL,NULL),(77,'真的爱你','track/song/真的爱你.mp3',NULL,NULL,0,NULL,NULL),(78,'相见恨晚','track/song/相见恨晚.mp3',NULL,NULL,0,NULL,NULL),(79,'We Will Rock You','track/song/We Will Rock You.mp3',NULL,NULL,0,NULL,NULL),(80,'牵绊一生 (不可说)-麦振鸿','track/song/牵绊一生 (不可说)-麦振鸿.mp3',NULL,NULL,0,NULL,NULL),(81,'越夜越有机','track/song/越夜越有机.mp3',NULL,NULL,0,NULL,NULL),(82,'旧欢如梦','track/song/旧欢如梦.mp3',NULL,NULL,0,NULL,NULL),(83,'突然的自我','track/song/突然的自我.mp3',NULL,NULL,0,NULL,NULL),(84,'记事本','track/song/记事本.mp3',NULL,NULL,0,NULL,NULL),(85,'谁明浪子心','track/song/谁明浪子心.mp3',NULL,NULL,0,NULL,NULL),(86,'I Want My Tears Back','track/song/I Want My Tears Back.mp3',NULL,NULL,0,NULL,NULL),(87,'有没有一首歌会让你想起我','track/song/有没有一首歌会让你想起我.mp3',NULL,NULL,0,NULL,NULL),(88,'天下第一-麦振鸿','track/song/天下第一-麦振鸿.mp3',NULL,NULL,0,NULL,NULL),(89,'映山红','track/song/映山红.mp3',NULL,NULL,0,NULL,NULL),(90,'Samsara','track/song/Samsara.mp3',NULL,NULL,0,NULL,NULL),(91,'蜗牛与黄鹂鸟','track/song/蜗牛与黄鹂鸟.mp3',NULL,NULL,0,NULL,NULL),(92,'笑脸','track/song/笑脸.mp3',NULL,NULL,0,NULL,NULL),(93,'舞女','track/song/舞女.mp3',NULL,NULL,0,NULL,NULL),(94,'取一念','track/song/取一念.mp3',NULL,NULL,0,NULL,NULL),(95,'挪威的森林','track/song/挪威的森林.mp3',NULL,NULL,0,NULL,NULL),(96,'痴心绝对','track/song/痴心绝对.mp3',NULL,NULL,0,NULL,NULL),(97,'Wicked Wonderland','track/song/Wicked Wonderland.mp3',NULL,NULL,0,NULL,NULL),(98,'一人有一个梦想','track/song/一人有一个梦想.mp3',NULL,NULL,0,NULL,NULL),(99,'天涯歌女','track/song/天涯歌女.mp3',NULL,NULL,0,NULL,NULL),(100,'走过咖啡屋','track/song/走过咖啡屋.mp3',NULL,NULL,0,NULL,NULL),(101,'连锁反应','track/song/连锁反应.mp3',NULL,NULL,0,NULL,NULL),(102,'野鸟','track/song/野鸟.mp3',NULL,NULL,0,NULL,NULL),(103,'Epic Sax Guy','track/song/Epic Sax Guy.mp3',NULL,NULL,0,NULL,NULL),(104,'泡沫','track/song/泡沫.mp3',NULL,NULL,0,NULL,NULL),(105,'只爱西经','track/song/只爱西经.mp3',NULL,NULL,0,NULL,NULL),(106,'Time','track/song/Time.mp3',NULL,NULL,0,NULL,NULL),(107,'星星点灯','track/song/星星点灯.mp3',NULL,NULL,0,NULL,NULL),(108,'高高在下','track/song/高高在下.mp3',NULL,NULL,0,NULL,NULL),(109,'月亮光光','track/song/月亮光光.mp3',NULL,NULL,0,NULL,NULL),(110,'Es rappelt im Karton','track/song/Es rappelt im Karton.mp3',NULL,NULL,0,NULL,NULL),(111,'Silver Scrapes','track/song/Silver Scrapes.mp3',NULL,NULL,0,NULL,NULL),(112,'Bailemen Swing Feat. Zhang Le','track/song/Bailemen Swing Feat. Zhang Le.mp3',NULL,NULL,0,NULL,NULL),(113,'Bom Bom','track/song/Bom Bom.mp3',NULL,NULL,0,NULL,NULL),(114,'我在那一角落患过伤风','track/song/我在那一角落患过伤风.mp3',NULL,NULL,0,NULL,NULL),(115,'问情','track/song/问情.mp3',NULL,NULL,0,NULL,NULL),(116,'你究竟有几个好妹妹','track/song/你究竟有几个好妹妹.mp3',NULL,NULL,0,NULL,NULL),(117,'友情岁月','track/song/友情岁月.mp3',NULL,NULL,0,NULL,NULL),(118,'Victory','track/song/Victory.mp3',NULL,NULL,0,NULL,NULL),(119,'青青河边草','track/song/青青河边草.mp3',NULL,NULL,0,NULL,NULL),(120,'Loves Me Not','track/song/Loves Me Not.mp3',NULL,NULL,0,NULL,NULL),(121,'月满西楼','track/song/月满西楼.mp3',NULL,NULL,0,NULL,NULL),(122,'降魔剑-麦振鸿','track/song/降魔剑-麦振鸿.mp3',NULL,NULL,0,NULL,NULL),(123,'继续奋战(杀破狼 演奏曲)-麦振鸿','track/song/继续奋战(杀破狼 演奏曲)-麦振鸿.mp3',NULL,NULL,0,NULL,NULL),(124,'大地之母-麦振鸿','track/song/大地之母-麦振鸿.mp3',NULL,NULL,0,NULL,NULL),(125,'张三的歌','track/song/张三的歌.mp3',NULL,NULL,0,NULL,NULL),(126,'心雨','track/song/心雨.mp3',NULL,NULL,0,NULL,NULL),(127,'让一切随风','track/song/让一切随风.mp3',NULL,NULL,0,NULL,NULL),(128,'将冰山劈开(Live)','track/song/将冰山劈开(Live).mp3',NULL,NULL,0,NULL,NULL),(129,'Bomba','track/song/Bomba.mp3',NULL,NULL,0,NULL,NULL),(130,'浪花一朵朵(任贤齐&Friends演唱会版) - live','track/song/浪花一朵朵(任贤齐&Friends演唱会版) - live.mp3',NULL,NULL,0,NULL,NULL),(131,'我很快乐','track/song/我很快乐.mp3',NULL,NULL,0,NULL,NULL),(132,'当你','track/song/当你.mp3',NULL,NULL,0,NULL,NULL),(133,'九月九的酒','track/song/九月九的酒.mp3',NULL,NULL,0,NULL,NULL),(134,'Breath and Life','track/song/Breath and Life.mp3',NULL,NULL,0,NULL,NULL),(135,'不再说永远','track/song/不再说永远.mp3',NULL,NULL,0,NULL,NULL),(136,'讲不出再见','track/song/讲不出再见.mp3',NULL,NULL,0,NULL,NULL),(137,'梦驼铃','track/song/梦驼铃.mp3',NULL,NULL,0,NULL,NULL),(138,'Go Time','track/song/Go Time.mp3',NULL,NULL,0,NULL,NULL),(139,'水手','track/song/水手.mp3',NULL,NULL,0,NULL,NULL),(140,'花开花落','track/song/花开花落.mp3',NULL,NULL,0,NULL,NULL),(141,'雨一直下','track/song/雨一直下.mp3',NULL,NULL,0,NULL,NULL),(142,'狂风卷奔云飙','track/song/狂风卷奔云飙.mp3',NULL,NULL,0,NULL,NULL),(143,'分飞燕','track/song/分飞燕.mp3',NULL,NULL,0,NULL,NULL),(144,'沧海一声笑','track/song/沧海一声笑.mp3',NULL,NULL,0,NULL,NULL),(145,'温柔乡','track/song/温柔乡.mp3',NULL,NULL,0,NULL,NULL),(146,'知音梦里寻','track/song/知音梦里寻.mp3',NULL,NULL,0,NULL,NULL),(147,'Jar Of Love','track/song/Jar Of Love.mp3',NULL,NULL,0,NULL,NULL),(148,'Lonely','track/song/Lonely.mp3',NULL,NULL,0,NULL,NULL),(149,'顺流逆流','track/song/顺流逆流.mp3',NULL,NULL,0,NULL,NULL),(150,'247','track/song/247.mp3',NULL,NULL,0,NULL,NULL),(151,'萍聚','track/song/萍聚.mp3',NULL,NULL,0,NULL,NULL),(152,'梦醒时分','track/song/梦醒时分.mp3',NULL,NULL,0,NULL,NULL),(153,'Primetime-sexcrime','track/song/Primetime-sexcrime.mp3',NULL,NULL,0,NULL,NULL),(154,'酒杯敲钢琴','track/song/酒杯敲钢琴.mp3',NULL,NULL,0,NULL,NULL),(155,'Axel F','track/song/Axel F.mp3',NULL,NULL,0,NULL,NULL),(156,'「名探偵コナン」~メインテーマ','track/song/「名探偵コナン」~メインテーマ.mp3',NULL,NULL,0,NULL,NULL),(157,'男儿当自强','track/song/男儿当自强.mp3',NULL,NULL,0,NULL,NULL),(158,'阿嬷的话','track/song/阿嬷的话.mp3',NULL,NULL,0,NULL,NULL),(159,'单身情歌','track/song/单身情歌.mp3',NULL,NULL,0,NULL,NULL),(160,'Yeah','track/song/Yeah.mp3',NULL,NULL,0,NULL,NULL),(161,'祝你平安','track/song/祝你平安.mp3',NULL,NULL,0,NULL,NULL),(162,'The Next Episode','track/song/The Next Episode.mp3',NULL,NULL,0,NULL,NULL),(163,'运动员进行曲','track/song/运动员进行曲.mp3',NULL,NULL,0,NULL,NULL),(164,'慢慢','track/song/慢慢.mp3',NULL,NULL,0,NULL,NULL),(165,'賭神','track/song/賭神.mp3',NULL,NULL,0,NULL,NULL),(166,'BOOM','track/song/BOOM.mp3',NULL,NULL,0,NULL,NULL),(167,'明月千里寄相思','track/song/明月千里寄相思.mp3',NULL,NULL,0,NULL,NULL),(168,'Hello','track/song/Hello.mp3',NULL,NULL,0,NULL,NULL),(169,'独家试唱','track/song/独家试唱.mp3',NULL,NULL,0,NULL,NULL),(170,'中华民谣','track/song/中华民谣.mp3',NULL,NULL,0,NULL,NULL),(171,'Turn Down for What','track/song/Turn Down for What.mp3',NULL,NULL,0,NULL,NULL),(172,'长相依','track/song/长相依.mp3',NULL,NULL,0,NULL,NULL),(173,'The Discovery','track/song/The Discovery.mp3',NULL,NULL,0,NULL,NULL),(174,'帝女芳魂','track/song/帝女芳魂.mp3',NULL,NULL,0,NULL,NULL),(175,'爱一点','track/song/爱一点.mp3',NULL,NULL,0,NULL,NULL),(176,'情债','track/song/情债.mp3',NULL,NULL,0,NULL,NULL),(177,'九百九十九朵玫瑰','track/song/九百九十九朵玫瑰.mp3',NULL,NULL,0,NULL,NULL),(178,'attraction','track/song/attraction.mp3',NULL,NULL,0,NULL,NULL),(179,'游子吟','track/song/游子吟.mp3',NULL,NULL,0,NULL,NULL),(180,'大海','track/song/大海.mp3',NULL,NULL,0,NULL,NULL),(181,'我悄悄蒙上你的眼睛','track/song/我悄悄蒙上你的眼睛.mp3',NULL,NULL,0,NULL,NULL),(182,'天外有天','track/song/天外有天.mp3',NULL,NULL,0,NULL,NULL),(183,'皆大欢喜','track/song/皆大欢喜.mp3',NULL,NULL,0,NULL,NULL),(184,'Here We Are Again','track/song/Here We Are Again.mp3',NULL,NULL,0,NULL,NULL),(185,'落雨大','track/song/落雨大.mp3',NULL,NULL,0,NULL,NULL),(186,'家后','track/song/家后.mp3',NULL,NULL,0,NULL,NULL),(187,'恨爱交加-麦振鸿','track/song/恨爱交加-麦振鸿.mp3',NULL,NULL,0,NULL,NULL),(188,'Freaks','track/song/Freaks.mp3',NULL,NULL,0,NULL,NULL),(189,'真真假假','track/song/真真假假.mp3',NULL,NULL,0,NULL,NULL),(190,'蝶儿蝶儿满天飞','track/song/蝶儿蝶儿满天飞.mp3',NULL,NULL,0,NULL,NULL),(191,'不要说话','track/song/不要说话.mp3',NULL,NULL,0,NULL,NULL),(192,'梦里水乡','track/song/梦里水乡.mp3',NULL,NULL,0,NULL,NULL),(193,'潇洒走一回','track/song/潇洒走一回.mp3',NULL,NULL,0,NULL,NULL),(194,'寻词','track/song/寻词.mp3',NULL,NULL,0,NULL,NULL),(195,'我的1997','track/song/我的1997.mp3',NULL,NULL,0,NULL,NULL),(196,'重逢','track/song/重逢.mp3',NULL,NULL,0,NULL,NULL),(197,'漫步人生路','track/song/漫步人生路.mp3',NULL,NULL,0,NULL,NULL),(198,'光辉岁月','track/song/光辉岁月.mp3',NULL,NULL,0,NULL,NULL),(199,'爱你一万年','track/song/爱你一万年.mp3',NULL,NULL,0,NULL,NULL),(200,'月半弯','track/song/月半弯.mp3',NULL,NULL,0,NULL,NULL),(201,'一路上有你','track/song/一路上有你.mp3',NULL,NULL,0,NULL,NULL),(202,'狐狸','track/song/狐狸.mp3',NULL,NULL,0,NULL,NULL),(203,'风的季节','track/song/风的季节.mp3',NULL,NULL,0,NULL,NULL),(204,'月牙湾','track/song/月牙湾.mp3',NULL,NULL,0,NULL,NULL),(205,'致姗姗来迟的你','track/song/致姗姗来迟的你.mp3',NULL,NULL,0,NULL,NULL),(206,'潮湿的心','track/song/潮湿的心.mp3',NULL,NULL,0,NULL,NULL),(207,'Me Too','track/song/Me Too.mp3',NULL,NULL,0,NULL,NULL),(208,'靠近','track/song/靠近.mp3',NULL,NULL,0,NULL,NULL),(209,'阿郎','track/song/阿郎.mp3',NULL,NULL,0,NULL,NULL),(210,'感恩的心','track/song/感恩的心.mp3',NULL,NULL,0,NULL,NULL),(211,'We Are Electric','track/song/We Are Electric.mp3',NULL,NULL,0,NULL,NULL),(212,'新不了情','track/song/新不了情.mp3',NULL,NULL,0,NULL,NULL),(213,'铁血丹心','track/song/铁血丹心.mp3',NULL,NULL,0,NULL,NULL),(214,'桃花岛-麦振鸿','track/song/桃花岛-麦振鸿.mp3',NULL,NULL,0,NULL,NULL),(215,'丁香花','track/song/丁香花.mp3',NULL,NULL,0,NULL,NULL),(216,'踏浪','track/song/踏浪.mp3',NULL,NULL,0,NULL,NULL),(217,'风中有朵雨做的云','track/song/风中有朵雨做的云.mp3',NULL,NULL,0,NULL,NULL),(218,'相思','track/song/相思.mp3',NULL,NULL,0,NULL,NULL),(219,'Stronger','track/song/Stronger.mp3',NULL,NULL,0,NULL,NULL),(220,'Faded','track/song/Faded.mp3',NULL,NULL,0,NULL,NULL),(221,'林中鸟','track/song/林中鸟.mp3',NULL,NULL,0,NULL,NULL),(222,'曾经心痛','track/song/曾经心痛.mp3',NULL,NULL,0,NULL,NULL),(223,'太傻','track/song/太傻.mp3',NULL,NULL,0,NULL,NULL),(224,'雪花','track/song/雪花.mp3',NULL,NULL,0,NULL,NULL),(225,'难得有情人','track/song/难得有情人.mp3',NULL,NULL,0,NULL,NULL),(226,'来生缘','track/song/来生缘.mp3',NULL,NULL,0,NULL,NULL),(227,'珍重','track/song/珍重.mp3',NULL,NULL,0,NULL,NULL),(228,'Because of You','track/song/Because of You.mp3',NULL,NULL,0,NULL,NULL),(229,'倩女幽魂','track/song/倩女幽魂.mp3',NULL,NULL,0,NULL,NULL),(230,'羞答答的玫瑰静悄悄地开','track/song/羞答答的玫瑰静悄悄地开.mp3',NULL,NULL,0,NULL,NULL),(231,'坐在巷口的那对男女','track/song/坐在巷口的那对男女.mp3',NULL,NULL,0,NULL,NULL),(232,'爸爸的汽水','track/song/爸爸的汽水.mp3',NULL,NULL,0,NULL,NULL),(233,'窗外','track/song/窗外.mp3',NULL,NULL,0,NULL,NULL),(234,'Mi Mi Mi','track/song/Mi Mi Mi.mp3',NULL,NULL,0,NULL,NULL),(235,'甜蜜蜜','track/song/甜蜜蜜.mp3',NULL,NULL,0,NULL,NULL),(236,'Seve','track/song/Seve.mp3',NULL,NULL,0,NULL,NULL),(237,'独角戏','track/song/独角戏.mp3',NULL,NULL,0,NULL,NULL),(238,'恰似你的温柔','track/song/恰似你的温柔.mp3',NULL,NULL,0,NULL,NULL),(239,'江湖笑','track/song/江湖笑.mp3',NULL,NULL,0,NULL,NULL),(240,'时空之钥-麦振鸿','track/song/时空之钥-麦振鸿.mp3',NULL,NULL,0,NULL,NULL),(242,'Beat It (12\' Mix) - Michael Jackson','track/song/Beat It (12\' Mix) - Michael Jackson.mp3',NULL,NULL,0,'Beat It (12\' Mix) - Michael Jackson.lrc','track/lyric/Beat It (12\' Mix) - Michael Jackson.lrc'),(244,'You Are Not Alone (live) - Michael Jackson','track/song/You Are Not Alone (live) - Michael Jackson.mp3',NULL,NULL,0,'You Are Not Alone (live) - Michael Jackson.lrc','track/lyric/You Are Not Alone (live) - Michael Jackson.lrc');
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
  `userName` varchar(45) NOT NULL DEFAULT '菜鸡一枚我不哭',
  PRIMARY KEY (`userId`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2011228 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'wangrunsjob@qq.com','e10adc3949ba59abbe56e057f20f883e','菜鸡一枚我不哭'),(2,'runstutu@gmail.com','e10adc3949ba59abbe56e057f20f883e','一人之下'),(4,'1344986@qq.com','e10adc3949ba59abbe56e057f20f883e','Donald J. Trump'),(5,'2504208@qq.com','d9f4e4bb710357210fa9fe30c178fc42','菜鸡一枚我不哭'),(6,'265991@163.com','bf08b01ead83cbd62a9839ca1cf35ada','菜鸡一枚我不哭'),(7,'5878433@qq.com','5fc70f8b935595586dbbae4cda7cae3f','菜鸡一枚我不哭'),(8,'19962007@126.com','3fde6bb0541387e4ebdadf7c2ff31123','菜鸡一枚我不哭'),(9,'2145930654@qq.com','c943feee03ccd9aa8b842e7efdf4664f','菜鸡一枚我不哭'),(15,'212582493@qq.com','c4ca4238a0b923820dcc509a6f75849b','东方姑凉'),(2011227,'root@trackstacking.top','63a9f0ea7bb98050796b649e85481845','ROOT');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userrole`
--

DROP TABLE IF EXISTS `userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userrole` (
  `userroleId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`userroleId`),
  KEY `fk_userrole_1_idx` (`userId`),
  KEY `fk_userrole_2_idx` (`roleId`),
  CONSTRAINT `fk_userrole_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_userrole_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userrole`
--

LOCK TABLES `userrole` WRITE;
/*!40000 ALTER TABLE `userrole` DISABLE KEYS */;
INSERT INTO `userrole` VALUES (1,2011227,1);
/*!40000 ALTER TABLE `userrole` ENABLE KEYS */;
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

-- Dump completed on 2018-06-10 16:06:17
