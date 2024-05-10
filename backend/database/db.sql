-- MariaDB dump 10.19  Distrib 10.11.6-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: my_chat_db
-- ------------------------------------------------------
-- Server version	10.11.6-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `direct_messages`
--

DROP TABLE IF EXISTS `direct_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `direct_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `content` varchar(255) DEFAULT NULL,
  `sender_ID` varchar(255) DEFAULT NULL,
  `receiver_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direct_messages`
--

LOCK TABLES `direct_messages` WRITE;
/*!40000 ALTER TABLE `direct_messages` DISABLE KEYS */;
INSERT INTO `direct_messages` VALUES
(5,'2024-04-09 13:23:04','Hello','2','1'),
(6,'2024-04-09 13:41:07','Antohter','2','1'),
(7,'2024-04-09 13:48:02','Cyka Blyat','2','1'),
(8,'2024-04-09 13:48:31','Cyka Blyat too','1','2');
/*!40000 ALTER TABLE `direct_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lobbies`
--

DROP TABLE IF EXISTS `lobbies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lobbies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `name` varchar(255) DEFAULT NULL,
  `admin_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lobbies`
--

LOCK TABLES `lobbies` WRITE;
/*!40000 ALTER TABLE `lobbies` DISABLE KEYS */;
INSERT INTO `lobbies` VALUES
(1,'2024-04-08 08:08:28','MotherFucker Lobby','2'),
(2,'2024-04-25 10:06:57','New Lobby','2'),
(3,'2024-04-25 10:07:03','Antoher Lobby','2');
/*!40000 ALTER TABLE `lobbies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lobby_members`
--

DROP TABLE IF EXISTS `lobby_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lobby_members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `lobby_ID` varchar(255) DEFAULT NULL,
  `user_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lobby_members`
--

LOCK TABLES `lobby_members` WRITE;
/*!40000 ALTER TABLE `lobby_members` DISABLE KEYS */;
INSERT INTO `lobby_members` VALUES
(1,'2024-04-08 08:08:28','1','2'),
(2,'2024-04-08 08:16:37','1','1'),
(3,'2024-04-25 10:06:57','2','2'),
(4,'2024-04-25 10:07:03','3','2');
/*!40000 ALTER TABLE `lobby_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lobby_messages`
--

DROP TABLE IF EXISTS `lobby_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lobby_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_ID` int(11) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `lobby_ID` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lobby_messages`
--

LOCK TABLES `lobby_messages` WRITE;
/*!40000 ALTER TABLE `lobby_messages` DISABLE KEYS */;
INSERT INTO `lobby_messages` VALUES
(3,'2024-04-08 08:21:41',1,'Use do whatever he wants',1,NULL),
(6,'2024-04-08 08:22:28',2,'Message d\'un admin',1,NULL),
(7,'2024-04-08 08:22:37',2,'Deuxième message d\'un admin',1,NULL),
(9,'2024-04-09 12:21:09',2,'Un autre',1,NULL),
(10,'2024-04-09 12:21:13',2,'Un rfrfdfdrfdrgdgrd',1,NULL),
(11,'2024-04-09 12:21:22',2,'Joao is looking',1,NULL),
(12,'2024-04-09 12:21:34',2,'Antoine is coding',1,NULL);
/*!40000 ALTER TABLE `lobby_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'2024-04-08 08:07:14','User','$2b$10$8fDa/arvv5kz2IApUFlWd.OfXToxf8v0CcT2i.EpyxKS8djPPHYim'),
(2,'2024-04-08 08:07:23','Admin','$2b$10$IWh5LABrh.m6o3javC4W.uprKGeiciDYw84Ftj3LCkb3byeKVlpz2');
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

-- Dump completed on 2024-05-10 11:03:30
