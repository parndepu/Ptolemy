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
  `Longitude` float DEFAULT NULL,
  `Latitude` float DEFAULT NULL,
  `Building_picture` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`BLDG_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CampusBuildings`
--

LOCK TABLES `CampusBuildings` WRITE;
/*!40000 ALTER TABLE `CampusBuildings` DISABLE KEYS */;
INSERT INTO `CampusBuildings` VALUES (1001,'McDowell Law Center','LAW','150 University Avenue',-81.5159,41.0774,'mcdowell.jpg'),(1002,'Business Admin. Bldg.','CBA','259 S. Broadway Street',-81.5177,41.0777,'cba-building-400px.jpg'),(1101,'Kolbe Hall','KO','328 Buchtel Common',-81.51,41.0762,'kolbe.jpg'),(1102,'Ballet Center','BC','354 East Market Street',-81.507,41.081,'ballet.jpg'),(1104,'Thomas Performing Arts Hall','PAH','198 Hill Street',-81.5154,41.0782,'ejthomas.jpg'),(1105,'West Hall','WEST','225 Wolf Ledges Parkway',-81.516,41.077,'west.jpg'),(1106,'Guzzetta Hall','GH','157 University Avenue',-81.5142,41.0774,'guzzetta.jpg'),(1107,'Olson Research Center','OLRC','260 South Forge Street',-81.5142,41.0798,'olson.jpg'),(1108,'Folk Hall','FOLK','150 East Exchange Street',-81.5177,41.0736,'folk.jpg'),(1201,'Crouse Hall','CRH','252 Buchtel Common',-81.5124,41.0762,'crouse_02.jpg'),(1202,'Knight Chemical Lab.','KNCL','190 Buchtel Common',-81.5151,41.0764,'knight.jpg'),(1204,'Ayer Hall','AYER','250 Buchtel Common',-81.5131,41.0763,'ayer2.jpg'),(1301,'Leigh Hall','LH','308 Buchtel Common',-81.5106,41.0763,'leigh.jpg'),(1304,'Olin Hall','OLIN','361 Buchtel Common',-81.509,41.0769,'olin.jpg'),(1306,'College of Arts and Sciences','CAS','290 E. Buchtel Ave.',-81.5107,41.0777,'arts_sci.jpg'),(1401,'Zook Hall','ZOOK','276 Buchtel Common',-81.5116,41.0764,'zook.jpg'),(1501,'Auburn Science & Engineering Ctr.','ASEC','235 Carroll Street',-81.5138,41.076,'auburn_1.jpg'),(1502,'Schrank Hall (North)','SHN','240 Carroll Street',-81.5138,41.0751,'schrankNo.jpg'),(1503,'Whitby Hall','WHIT','200 Buchtel Common',-81.5146,41.0764,'whitby.jpg'),(1504,'Schrank Hall (South)','SHS','240 Carroll Street',-81.5138,41.0746,'schrankSo.jpg'),(1505,'Goodyear Polymer Ctr.','GDYR','170 University Avenue',-81.5145,41.0768,'goodyear.jpg'),(1506,'Polymer Eng. Academic Center','PEAC','250 S. Forge St.',-81.5136,41.0794,'peac.jpg'),(1507,'Gas Turbine Testing Facility','GTTF','280 Wolf Ledges Parkway',-81.5176,41.0756,NULL),(1508,'National Polymer Innovation Center','NPIC','240 South Forge Street',-81.5131,41.0794,'nationalpolymer.jpg'),(1509,'U of A Engineering Research Center','AERC','264 Wolf Ledges Parkway',-81.517,41.076,NULL),(1702,'Mary Gladwin Hall','MGH','209 Carroll Street',-81.5151,41.0754,'gladwin.jpg'),(1703,'James A. Rhodes Health & P.E. Bldg.','JAR','373 Carroll Street',-81.5085,41.0756,'rhodes.jpg'),(1704,'Ocasek Natatorium','ONAT','402 Carroll Street',-81.5075,41.0749,'ocasek.jpg'),(1705,'Buchtel Field Tennis Facility','BFTF','322 Wheeler Street',-81.5111,41.0706,NULL),(1901,'Wayne College & Boyer H.P.E. Bldg.','UAWC','1901 Smucker Road, Orrville',-81.7928,40.8595,NULL),(1902,'Buckingham Building','BCCE','220 Wolf Ledges Parkway',-81.5166,41.0772,'buckingham.jpg'),(1903,'Express Building','EB','250 Wolf Ledges Parkway',-81.5172,41.0767,NULL),(3002,'Bierce Library','LIB','315 Buchtel Common',-81.5103,41.077,'bierce.jpg'),(4001,'Buchtel Hall','BH','302 Buchtel Common',-81.5112,41.0759,'buchtel.jpg'),(4002,'Simmons Hall','SI','277 E. Buchtel Ave.',-81.5116,41.0783,'simmons-hall-400px.jpg'),(5002,'Polsky Building','POL','225 S. Main Street',-81.5194,41.0786,'polsky.jpg'),(5003,'Center For Child Development','CCD','108 Fir Hill',-81.5076,41.0784,'childDevel.jpg'),(5004,'Student Recreation and Wellness Center','SRWC','382 Carroll Street',-81.509,41.0749,'recCenter.jpg'),(5005,'Louis and Freda Stile Athl Fld Hse','AFLD','289 South Union Street',-81.5084,41.0739,'Field-House.jpg'),(5006,'Administrative Services Building','ASB','185 East Mill',-81.511,41.0812,'admin-services-bldg_small.jpg'),(5007,'Student Union','STUN','303 Carroll Street',-81.5127,41.0755,'studentUnion.jpg'),(5502,'Martin University Center','PMUC','105 Fir Hill',-81.5065,41.0785,NULL),(6001,'Robertson Hall','RD','248 E. Buchtel Avenue',-81.5127,41.0777,'robertson.jpg'),(6010,'Physical Fac. Operations Ctr.','PFOC','146 Hill Street',-81.5142,41.0789,'physfac.jpg'),(6014,'Bath Nature Preserve','BNP','4240 Ira Road',-81.65,41.181,NULL),(6017,'Computer Center','COMP','185 Carroll Street',-81.5154,41.0754,'cc.jpg'),(6022,'Forge St. Substation','FSUB','270 South Forge Street',-81.5143,41.0794,NULL),(6040,'Info Cision Stadium/Summa Field','ICS','375 East Exchange',-81.51,41.0718,NULL),(6050,'FirstEnergy Stadium - Cub Cadet Field','FES','300 Carroll Street',-81.5118,41.0744,NULL),(7001,'Honors Complex','HCPX','180 South College Street',-81.5115,41.0776,NULL),(7002,'Orr Resident Hall','ORH','188 South College Street',-81.5121,41.0776,'orr.jpg'),(7003,'Spanton Hall','SRH','190 South College Street',-81.5127,41.0774,'spanton.jpg'),(7004,'Ritchie Hall','RRH','269 Buchtel Common',-81.5118,41.0768,'ritchie.jpg'),(7005,'Sisler-McFawn','SMRH','211 Buchtel Common',-81.513,41.0771,'sisler.jpg'),(7007,'Bulger Hall','BRH','265 Buchtel Common',-81.5124,41.0771,'bulger.jpg'),(7008,'Exchange Street Residence Hall','EXC','180 East Exchange Street',-81.5159,41.0739,'esrh.jpg'),(7009,'Quaker Square','QSQR','135 South Broadway Akron, Ohio 44308',-81.5151,41.0811,NULL),(7013,'Grant High Rise','GRC','151 Wheeler Street',-81.5165,41.0716,NULL),(7020,'Gallucci Hall (S)','GALL','360 Grant Street',-81.5165,41.0729,NULL),(7021,'Gallucci Hall (N)','GALU','360 Grant Street',-81.5165,41.0729,NULL),(7022,'Spicer Residence Hall','SPCR','290 Spicer Street',-81.5062,41.0733,NULL),(7028,'South Hall','SH','353 Grant Street',-81.5154,41.0732,'south-hall-400px.jpg'),(9001,'Roadway Building','RDWY','73 South College Street',-81.511,41.0805,'roadway.jpg'),(9020,'Chima Family Center','CFC','27 South Forge Street',-81.5069,41.0804,NULL),(9040,'Central Hower Community School','CHCS','145 S. College Street',-81.5109,41.0791,NULL),(9077,'Hower House','HOW','60 Fir Hill',-81.5076,41.0797,'hower.jpg'),(9079,'Carriage House','CARR','60 Fir Hill',-81.5078,41.0796,NULL),(9083,'Lincoln Bldg.','LINC','100 Lincoln Street',-81.5127,41.0804,'100lincoln.jpg'),(9087,'Akron Polymer Training Center  (Foundation)','APTC','225 E. Mill Street',-81.5112,41.0807,'polymerTrCtr.jpg'),(9411,'Akron Innovation Campus North','AICN','411 Wolf Ledges',-81.5198,41.0726,NULL),(9441,'Akron Innovation Campus South','AICS','441 Wolf Ledges',-81.5199,41.0716,NULL),(9495,'University Akron Research Foundation','UARF','495 Wolf Ledges Parkway Akron 44311',-81.5201,41.0703,NULL);
/*!40000 ALTER TABLE `CampusBuildings` ENABLE KEYS */;
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
