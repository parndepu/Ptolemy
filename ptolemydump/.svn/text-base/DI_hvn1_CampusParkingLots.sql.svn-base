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
-- Table structure for table `CampusParkingLots`
--

DROP TABLE IF EXISTS `CampusParkingLots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CampusParkingLots` (
  `Lot_num` int(11) NOT NULL,
  `Lot_Name` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Longitude` float DEFAULT NULL,
  `Latitude` float DEFAULT NULL,
  PRIMARY KEY (`Lot_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CampusParkingLots`
--

LOCK TABLES `CampusParkingLots` WRITE;
/*!40000 ALTER TABLE `CampusParkingLots` DISABLE KEYS */;
INSERT INTO `CampusParkingLots` VALUES (1,'East Campus Parking Deck','450 East Buchtel Ave.',-81.5054,41.076),(2,'Rhodes Arena','382 Carroll St',-81.5076,41.0757),(3,'Fir Hill Lot','138 Buchtel Ave.',-81.5075,41.0774),(4,'Delta Gamma Lot','394 Buchtel Common',-81.5075,41.0763),(5,'Wheeler Lot','344 Wheeler St.',-81.5104,41.0706),(6,'InfoCision Stadium - Summa Field','340 S Union St',-81.5097,41.0725),(7,'Kappa Kappa Gamma Sorority','475 Orchard St.',-81.5051,41.0747),(8,'ONAT','438 Carroll St.',-81.5066,41.0748),(9,'Spicer / Exchange','341 Spicer Street',-81.5068,41.0716),(10,'Field House','449 Vine/Spicer St.',-81.5068,41.074),(11,'Eshelman Building - Chima Family Center','S Forge St',-81.5065,41.0805),(12,'Greek Church Lot','129 South Union Street',-81.5089,41.0792),(13,'Phi Delta Theta Frat.','431 Carroll St.',-81.5068,41.0756),(14,'Union St.','151 E. Buchtel Ave.',-81.5084,41.0778),(15,'Olin Hall','160 E. Buchtel Ave.',-81.5079,41.0771),(18,'Student Union','240 Carroll St',-81.5127,41.0749),(19,'Day Care Ctr.','108 Fir Hill',-81.5078,41.0787),(20,'Methodist Church','263 East Mill St.',-81.5103,41.0812),(21,'Roadway Bldg.','71 South College St.',-81.5106,41.0808),(22,'Ritchie Residence Hall','204 South College St.',-81.5119,41.0772),(23,'UAPD','116 South College St.',-81.5116,41.0794),(24,'Central Hower','136 South College St.',-81.5109,41.0786),(25,'Robertson DeckÂ (Visitor A-Lot)','256 East Buchtel Ave.',-81.5126,41.0779),(26,'North Campus Parking Deck','255 East Buchtel Ave.',-81.5122,41.0782),(27,'North Campus Lot - Guzzetta','215 East Buchtel Ave.',-81.5137,41.0785),(28,'EJ Thomas Deck','198 Hill St.',-81.5144,41.0786),(29,'Olsen Research','200 South Forge St.',-81.5136,41.0803),(30,'College/Market','31 S. College St.',-81.5098,41.0817),(32,'Former Ballet Center','24 Fir Hill',-81.5075,41.0807),(34,'Computer Center','275 Wolf Ledges',-81.5163,41.0759),(36,'South Campus Parking Deck','261 E. Exchange St.',-81.5145,41.0741),(37,'Schrank Deck','240 Carroll St.',-81.5142,41.075),(39,'Exchange St. Deck','207 East Exchange St.',-81.5151,41.0747),(40,'Mill / Lincoln','Lincoln St. near 197 E Mill St',-81.5121,41.0805),(43,'Turbine Building','220 Wolf Ledges Pkwy.',-81.5177,41.0756),(44,'Grant Residence Hall','151 Wheeler St.',-81.5163,41.0721),(45,'Lincoln Building','Lincoln and South Forge St.',-81.5129,41.0803),(46,'Gallucci Residence Hall','200 East Exchange St.',-81.5175,41.0723),(47,'Folk Hall','150 East Exchange St.',-81.5179,41.0739),(49,'West Campus Parking Deck','275 South High St.',-81.5192,41.0774),(50,'Hower House','60 Fir Hill St.',-81.5082,41.0797),(52,'Paul martin Ctr.','105 Fir Hill St.',-81.5062,41.0789),(54,'The Chapel Lot','Chapel Dr.',-81.5049,41.0772),(56,'BCCE Turnaround','220 Wolf Ledges Pkwy',-81.5165,41.0771),(57,'JAR Arena Circle','373 Carroll St.',-81.5085,41.0753),(60,'Polymer Training Center','225 East Mill St.',-81.5111,41.0808),(61,'Broadway Building','277 South Broadway',-81.5181,41.0772),(62,'CBA Lot','289 South Broadway',-81.5183,41.0769),(66,'Grismers','278 South High St.',-81.5202,41.0777),(69,'PFOC','201 South Forge st.',-81.5149,41.0793),(71,'Administration Building','36 South college St.',-81.5118,41.0811);
/*!40000 ALTER TABLE `CampusParkingLots` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-02 14:01:47
