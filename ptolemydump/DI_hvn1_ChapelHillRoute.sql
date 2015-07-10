CREATE DATABASE  IF NOT EXISTS `DI_hvn1` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `DI_hvn1`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: db1.cs.uakron.edu    Database: DI_hvn1
-- ------------------------------------------------------
-- Server version	5.5.43-0ubuntu0.12.04.1

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
-- Table structure for table `ChapelHillRoute`
--

DROP TABLE IF EXISTS `ChapelHillRoute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ChapelHillRoute` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Stop_Name` varchar(45) NOT NULL,
  `Stop_Lat` float NOT NULL,
  `Stop_Lng` float NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ChapelHillRoute`
--

LOCK TABLES `ChapelHillRoute` WRITE;
/*!40000 ALTER TABLE `ChapelHillRoute` DISABLE KEYS */;
INSERT INTO `ChapelHillRoute` VALUES (1,'Student Union',41.0753,-81.513),(2,'Howe Plaza',41.1171,-81.4801),(3,'Cinema',41.1103,-81.4713),(4,'Chapel Hill Mall',41.1127,-81.4696),(5,'Target',41.1204,-81.4775);
/*!40000 ALTER TABLE `ChapelHillRoute` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-02 14:01:48
