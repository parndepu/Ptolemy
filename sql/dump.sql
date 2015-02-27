-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: ptolemy
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.12.04.1

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
-- Table structure for table `CampusBuildings`
--

DROP TABLE IF EXISTS `CampusBuildings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CampusBuildings` (
  `BLDG_NO` int(11) NOT NULL,
  `BUILDING_NAME` varchar(255) NOT NULL,
  `ABB` varchar(255) NOT NULL,
  `STREET_ADDRESS` varchar(255) NOT NULL,
  PRIMARY KEY (`BLDG_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CampusBuildings`
--

LOCK TABLES `CampusBuildings` WRITE;
/*!40000 ALTER TABLE `CampusBuildings` DISABLE KEYS */;
INSERT INTO `CampusBuildings` VALUES (1001,'McDowell Law Center','LAW','150 University Avenue'),(1002,'Business Admin. Bldg.','CBA','259 S. Broadway Street'),(1101,'Kolbe Hall','KO','328 Buchtel Common'),(1102,'Ballet Center','BC','354 East Market Street'),(1104,'Thomas Performing Arts Hall','PAH','198 Hill Street'),(1105,'West Hall','WEST','225 Wolf Ledges Parkway'),(1106,'Guzzetta Hall','GH','157 University Avenue'),(1107,'Olson Research Center','OLRC','260 South Forge Street'),(1108,'Folk Hall','FOLK','150 East Exchange Street'),(1109,'Guzzetta Hall Addition','GHAD','Buchtel Ave. side of Guzzetta Hall'),(1201,'Crouse Hall','CRH','252 Buchtel Common'),(1202,'Knight Chemical Lab.','KNCL','190 Buchtel Common'),(1204,'Ayer Hall','AYER','250 Buchtel Common'),(1205,'Steiner Woods','STWD','3675 La Mesa Drive Akron OH 44333'),(1301,'Leigh Hall','LH','308 Buchtel Common'),(1304,'Olin Hall','OLIN','361 Buchtel Common'),(1306,'College of Arts and Sciences','CAS','290 E. Buchtel Ave.'),(1401,'Zook Hall','ZOOK','276 Buchtel Common'),(1501,'Auburn Science & Engineering Ctr.','ASEC','235 Carroll Street'),(1502,'Schrank Hall (North)','SHN','240 Carroll Street'),(1503,'Whitby Hall','WHIT','200 Buchtel Common'),(1504,'Schrank Hall (South)','SHS','240 Carroll Street'),(1505,'Goodyear Polymer Ctr.','GDYR','170 University Avenue'),(1506,'Polymer Eng. Academic Center','PEAC','250 S. Forge St.'),(1507,'Gas Turbine Testing Facility','GTTF','280 Wolf Ledges Parkway'),(1508,'National Polymer Innovation Center','NPIC','240 South Forge Street'),(1509,'U of A Engineering Research Center','AERC','264 Wolf Ledges Parkway'),(1702,'Mary Gladwin Hall','MGH','209 Carroll Street'),(1703,'James A. Rhodes Health & P.E. Bldg.','JAR','373 Carroll Street'),(1704,'Ocasek Natatorium','ONAT','402 Carroll Street'),(1705,'Buchtel Field Tennis Facility','BFTF','322 Wheeler Street'),(1901,'Wayne College & Boyer H.P.E. Bldg.','UAWC','1901 Smucker Road, Orrville'),(1902,'Buckingham Building','BCCE','220 Wolf Ledges Parkway'),(1903,'Express Building','EB','250 Wolf Ledges Parkway'),(1906,'Wayne College Maint. Bldg.','WMB','1901 Smucker Road, Orrville'),(1907,'Student Life Building','SLB','1901 Smucker Road, Orrville'),(1908,'Wayne College @ Holmes County Higher Ed Ctr','WCHC','Millersburg, OH'),(1909,'Medina County University Center','MCUC','6300 Technology Lane Medina, Ohio 44358'),(1910,'Barnett Hoover Farm House','WCBH','1901 Smucker Road, Orrville'),(3002,'Bierce Library','LIB','315 Buchtel Common'),(4001,'Buchtel Hall','BH','302 Buchtel Common'),(4002,'Simmons Hall','SI','277 E. Buchtel Ave.'),(5002,'Polsky Building','POL','225 S. Main Street'),(5003,'Center For Child Development','CCD','108 Fir Hill'),(5004,'Student Recreation and Wellness Center','SRWC','382 Carroll Street'),(5005,'Louis and Freda Stile Athl Fld Hse','AFLD','289 South Union Street'),(5006,'Administrative Services Building','ASB','185 East Mill'),(5007,'Student Union','STUN','303 Carroll Street'),(5502,'Martin University Center (Vacated 9/2013)','PMUC','105 Fir Hill'),(6001,'Robertson Hall','RD','248 E. Buchtel Avenue'),(6009,'Electric Substation','ESUB','152 Carroll Street'),(6010,'Physical Fac. Operations Ctr.','PFOC','146 Hill Street'),(6011,'Jackson Field Storage Bldg.','JFST','310 S. Union St.'),(6013,'Exchange Parking Deck','EXPD','207 East Exchange Street'),(6014,'Bath Nature Preserve','BNP','4240 Ira Road'),(6017,'Computer Center','COMP','185 Carroll Street'),(6020,'West Campus Parking Deck','WCPD','275 S. High Street'),(6021,'Heisman Lodge','HEIS','800 George Washington'),(6022,'Forge St. Substation','FSUB','270 South Forge Street'),(6024,'Hazardous Material Storage Building','HMST','180 Buchtel Common'),(6025,'Parking Deck, East','PDE','450 E. Buchtel Ave.'),(6026,'Parking Deck, North','PDN','255 E. Buchtel Ave.'),(6027,'South Campus Parking Deck','PDS','261 East Exchange'),(6030,'32 South College (Superior Auto Service)','SUP','32 South College Street'),(6040,'Info Cision Stadium/Summa Field','ICS','375 East Exchange'),(6050,'FirstEnergy Stadium - Cub Cadet Field','FES','300 Carroll Street'),(7001,'Honors Complex','HCPX','180 South College Street'),(7002,'Orr Resident Hall','ORH','188 South College Street'),(7003,'Spanton Hall','SRH','190 South College Street'),(7004,'Ritchie Hall','RRH','269 Buchtel Common'),(7005,'Sisler-McFawn','SMRH','211 Buchtel Common'),(7007,'Bulger Hall','BRH','265 Buchtel Common'),(7008,'Exchange Street Residence Hall','EXC','180 East Exchange Street'),(7009,'Quaker Square','QSQR','135 South Broadway Akron, Ohio 44308'),(7013,'Grant High Rise','GRC','151 Wheeler Street'),(7020,'Gallucci Hall (S)','GALL','360 Grant Street'),(7021,'Gallucci Hall (N)','GALU','360 Grant Street'),(7022,'Spicer Residence Hall','SPCR','290 Spicer Street'),(7024,'President\'s Residence','PRES','465 Burning Tree Drive'),(7028,'South Hall','SH','353 Grant Street'),(9001,'Roadway Building','RDWY','73 South College Street'),(9002,'178 South Forge Street (Wonder Bread)','WBB','178 South Forge Street'),(9020,'Chima Family Center','CFC','27 South Forge Street'),(9030,'464 Carroll Street (TKE Fraternity Lease )','CSBL','464 Carroll Street'),(9040,'Central Hower Community School','CHCS','145 S. College Street'),(9077,'Hower House','HOW','60 Fir Hill'),(9079,'Carriage House','CARR','60 Fir Hill'),(9083,'Lincoln Bldg.','LINC','100 Lincoln Street'),(9087,'Akron Polymer Training Center  (Foundation)','APTC','225 E. Mill Street'),(9099,'Chilled Water Storage Tank','TANK','S. Forge St.'),(9124,'122 South College (Trecaso\'s)','TRE','122 College Street'),(9140,'The University of Akron Lakewood','UALW','14725 Detroit Ave. Lakewood OH 44107'),(9411,'Akron Innovation Campus North','AICN','411 Wolf Ledges'),(9441,'Akron Innovation Campus South','AICS','441 Wolf Ledges'),(9495,'University Akron Research Foundation','UARF','495 Wolf Ledges Parkway Akron 44311');
/*!40000 ALTER TABLE `CampusBuildings` ENABLE KEYS */;
UNLOCK TABLES;

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
  PRIMARY KEY (`Lot_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CampusParkingLots`
--

LOCK TABLES `CampusParkingLots` WRITE;
/*!40000 ALTER TABLE `CampusParkingLots` DISABLE KEYS */;
INSERT INTO `CampusParkingLots` VALUES (1,'East Campus Parking Deck','450 East Buchtel Ave.'),(2,'Rhodes Arena','382 Carroll St'),(3,'Fir Hill Lot','138 Buchtel Ave.'),(4,'Delta Gamma Lot','394 Buchtel Common'),(5,'Wheeler Lot','344 Wheeler St.'),(6,'InfoCision Stadium - Summa Field','340 S Union St'),(7,'Kappa Kappa Gamma Sorority','475 Orchard St.'),(8,'ONAT','438 Carroll St.'),(9,'Spicer / Exchange','341 Spicer Street'),(10,'Field House','449 Vine/Spicer St.'),(11,'Eshelman Building - Chima Family Center','S Forge St'),(12,'Greek Church Lot','129 South Union Street'),(13,'Phi Delta Theta Frat.','431 Carroll St.'),(14,'Union St.','151 E. Buchtel Ave.'),(15,'Olin Hall','160 E. Buchtel Ave.'),(18,'Student Union','240 Carroll St'),(19,'Day Care Ctr.','108 Fir Hill'),(20,'Methodist Church','263 East Mill St.'),(21,'Roadway Bldg.','71 South College St.'),(22,'Ritchie Residence Hall','204 South College St.'),(23,'UAPD','116 South College St.'),(24,'Central Hower','136 South College St.'),(25,'Robertson DeckÂ (Visitor A-Lot)','256 East Buchtel Ave.'),(26,'North Campus Parking Deck','255 East Buchtel Ave.'),(27,'North Campus Lot - Guzzetta','215 East Buchtel Ave.'),(28,'EJ Thomas Deck','198 Hill St.'),(29,'Olsen Research','200 South Forge St.'),(30,'College/Market','31 S. College St.'),(32,'Former Ballet Center','24 Fir Hill'),(34,'Computer Center','275 Wolf Ledges'),(36,'South Campus Parking Deck','261 E. Exchange St.'),(37,'Schrank Deck','240 Carroll St.'),(39,'Exchange St. Deck','207 East Exchange St.'),(40,'Mill / Lincoln','Lincoln St. near 197 E Mill St'),(43,'Turbine Building','220 Wolf Ledges Pkwy.'),(44,'Grant Residence Hall','151 Wheeler St.'),(45,'Lincoln Building','Lincoln and South Forge St.'),(46,'Gallucci Residence Hall','200 East Exchange St.'),(47,'Folk Hall','150 East Exchange St.'),(49,'West Campus Parking Deck','275 South High St.'),(50,'Hower House','60 Fir Hill St.'),(52,'Paul martin Ctr.','105 Fir Hill St.'),(54,'The Chapel Lot','Chapel Dr.'),(56,'BCCE Turnaround','220 Wolf Ledges Pkwy'),(57,'JAR Arena Circle','373 Carroll St.'),(60,'Polymer Training Center','225 East Mill St.'),(61,'Broadway Building','277 South Broadway'),(62,'CBA Lot','289 South Broadway'),(66,'Grismers','278 South High St.'),(69,'PFOC','201 South Forge st.'),(71,'Administration Building','36 South college St.');
/*!40000 ALTER TABLE `CampusParkingLots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ParkingMapping`
--

DROP TABLE IF EXISTS `ParkingMapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ParkingMapping` (
  `BLDG_NO` int(11) NOT NULL DEFAULT '0',
  `Lot_num` int(11) NOT NULL DEFAULT '0',
  `Priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`BLDG_NO`,`Lot_num`),
  KEY `Lot_num` (`Lot_num`),
  CONSTRAINT `ParkingMapping_ibfk_1` FOREIGN KEY (`BLDG_NO`) REFERENCES `CampusBuildings` (`BLDG_NO`),
  CONSTRAINT `ParkingMapping_ibfk_2` FOREIGN KEY (`Lot_num`) REFERENCES `CampusParkingLots` (`Lot_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ParkingMapping`
--

LOCK TABLES `ParkingMapping` WRITE;
/*!40000 ALTER TABLE `ParkingMapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `ParkingMapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PathPriority`
--

DROP TABLE IF EXISTS `PathPriority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PathPriority` (
  `PathId` int(11) NOT NULL AUTO_INCREMENT,
  `Path_Name` varchar(255) NOT NULL,
  `Start_Lat` float NOT NULL,
  `Start_Lng` float NOT NULL,
  `End_Lat` float NOT NULL,
  `End_Lng` float NOT NULL,
  `Priority` int(11) NOT NULL,
  PRIMARY KEY (`PathId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PathPriority`
--

LOCK TABLES `PathPriority` WRITE;
/*!40000 ALTER TABLE `PathPriority` DISABLE KEYS */;
/*!40000 ALTER TABLE `PathPriority` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-26 11:11:33
