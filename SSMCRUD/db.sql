-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: xiedemo1
-- ------------------------------------------------------
-- Server version	5.7.17

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
-- Table structure for table `tbl_dept`
--

DROP TABLE IF EXISTS `tbl_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_dept`
--

LOCK TABLES `tbl_dept` WRITE;
/*!40000 ALTER TABLE `tbl_dept` DISABLE KEYS */;
INSERT INTO `tbl_dept` VALUES (1,'开发部'),(2,'人事部'),(3,'测试部'),(6,'运营部'),(7,'市场部');
/*!40000 ALTER TABLE `tbl_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_emp`
--

DROP TABLE IF EXISTS `tbl_emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_emp` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(30) NOT NULL,
  `gender` char(1) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `d_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `fk_emp_dept` (`d_id`),
  CONSTRAINT `fk_emp_dept` FOREIGN KEY (`d_id`) REFERENCES `tbl_dept` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_emp`
--

LOCK TABLES `tbl_emp` WRITE;
/*!40000 ALTER TABLE `tbl_emp` DISABLE KEYS */;
INSERT INTO `tbl_emp` VALUES (16,'3d62015','M','xiewei@126.com',1),(17,'f748016','M','sherwin@126.com',1),(18,'bbd8417','F','bbd8417@126.com',2),(19,'629a818','F','xieweiwei@126.com',1),(20,'5d5d019','F','aaaaaaaaaa@126.com',3),(21,'bda9220','M','bdaaaaaaaaaaaa@126.com',3),(22,'16ada21','M','16ada21@126.com',1),(23,'983f922','M','983f922@126.com',1),(24,'1f51123','M','1f51123@126.com',1),(25,'f5fc324','M','f5fc324@126.com',1),(26,'8669925','M','8669925@126.com',1),(27,'1166226','M','1166226@126.com',1),(28,'9774c27','M','9774c27@126.com',1),(29,'68b7028','M','68b7028@126.com',1),(30,'28c7a29','M','28c7a29@126.com',1),(31,'2187930','M','2187930@126.com',1),(32,'4136231','M','4136231@126.com',1),(33,'c49b532','M','c49b532@126.com',1),(34,'a21b233','M','a21b233@126.com',1),(35,'2f28034','M','2f28034@126.com',1),(36,'e206035','M','e206035@126.com',1),(37,'1024636','M','1024636@126.com',1),(38,'170f337','M','170f337@126.com',1),(39,'32fdb38','M','32fdb38@126.com',1),(40,'522f139','M','522f139@126.com',1),(41,'cdfe440','M','cdfe440@126.com',1),(42,'514ee41','M','514ee41@126.com',1),(43,'d300342','M','d300342@126.com',1),(44,'3201943','M','3201943@126.com',1),(45,'5a09644','M','5a09644@126.com',1),(46,'be36f45','M','be36f45@126.com',1),(47,'ac58c46','M','ac58c46@126.com',1),(48,'4a5ac47','M','4a5ac47@126.com',1),(49,'f5f7048','M','f5f7048@126.com',1),(50,'333e149','M','333e149@126.com',1),(57,'4ea014','M','4ea014@126.com',1),(58,'1e2b75','M','aaaa@126.com',1),(78,'sherwin1','M','sherwinxie33@foxmail.com',1),(79,'sherwin1','M','sherwinxie33@foxmail.com',1),(80,'sherwin1','M','sherwinxie33@foxmail.com',1),(82,'SHERWIN1','M','sherwinxie@foxmail.com',1),(83,'SHERWIN1','M','sherwinxie@foxmail.com',1),(88,'SHERWIN12','M','aaaa@foxmail.com',2),(90,'aaaaaa','F','bbbbbbbbbb@123.com',2),(91,'cccccccc','F','sherwinxie@foxmail.com',2),(92,'a92aaa','M','sherwinxie@foxmail.com',2);
/*!40000 ALTER TABLE `tbl_emp` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-25 23:27:33
