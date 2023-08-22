-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: springbootwebex3
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assignmentbuilding`
--

DROP TABLE IF EXISTS `assignmentbuilding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `assignmentbuilding` (
  `buildingid` bigint(20) NOT NULL,
  `staffid` bigint(20) NOT NULL,
  KEY `FKf4ibbod44h32ao1o6pb4yq98p` (`staffid`),
  KEY `FKkk3mdegrmfcdlsxqds1m6q238` (`buildingid`),
  CONSTRAINT `FKf4ibbod44h32ao1o6pb4yq98p` FOREIGN KEY (`staffid`) REFERENCES `user` (`id`),
  CONSTRAINT `FKkk3mdegrmfcdlsxqds1m6q238` FOREIGN KEY (`buildingid`) REFERENCES `building` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignmentbuilding`
--

LOCK TABLES `assignmentbuilding` WRITE;
/*!40000 ALTER TABLE `assignmentbuilding` DISABLE KEYS */;
INSERT INTO `assignmentbuilding` VALUES (1,3),(1,4),(9,2),(9,3),(10,2),(10,3),(10,4),(11,3),(11,4),(22,3),(22,4);
/*!40000 ALTER TABLE `assignmentbuilding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignmentcustomer`
--

DROP TABLE IF EXISTS `assignmentcustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `assignmentcustomer` (
  `staffid` bigint(20) NOT NULL,
  `customerid` bigint(20) NOT NULL,
  KEY `FK4sygo3a6twd6tkay7em8f1lgg` (`customerid`),
  KEY `FKco26n95l1hpuq1suv0briljor` (`staffid`),
  CONSTRAINT `FK4sygo3a6twd6tkay7em8f1lgg` FOREIGN KEY (`customerid`) REFERENCES `customer` (`id`),
  CONSTRAINT `FKco26n95l1hpuq1suv0briljor` FOREIGN KEY (`staffid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignmentcustomer`
--

LOCK TABLES `assignmentcustomer` WRITE;
/*!40000 ALTER TABLE `assignmentcustomer` DISABLE KEYS */;
/*!40000 ALTER TABLE `assignmentcustomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `building` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `ward` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `floorarea` int(11) DEFAULT NULL,
  `numberofbasement` int(11) DEFAULT NULL,
  `rentprice` int(11) DEFAULT NULL,
  `rentpricedescription` varchar(255) DEFAULT NULL,
  `managername` varchar(255) DEFAULT NULL,
  `managerphone` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `brokeragefee` decimal(19,2) DEFAULT NULL,
  `carfee` varchar(255) DEFAULT NULL,
  `decorationtime` varchar(255) DEFAULT NULL,
  `deposit` varchar(255) DEFAULT NULL,
  `direction` varchar(255) DEFAULT NULL,
  `electricityfee` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `linkofbuilding` varchar(255) DEFAULT NULL,
  `map` varchar(255) DEFAULT NULL,
  `motofee` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `overtimefee` varchar(255) DEFAULT NULL,
  `payment` varchar(255) DEFAULT NULL,
  `renttime` varchar(255) DEFAULT NULL,
  `servicefee` varchar(255) DEFAULT NULL,
  `structure` varchar(255) DEFAULT NULL,
  `waterfee` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES (1,'Nam Giao Building Tower','59 phan xích long','Phường 2','QUAN_1',500,2,15,'15 triệu/m2','an','123456789','TANG_TRET,NGUYEN_CAN',NULL,'','','','','',NULL,NULL,'',NULL,'','','','','',NULL,'',NULL,NULL,NULL,'nguyenvana','2023-07-29 23:25:12'),(5,'Binh An','hoang hoa tham','quan thanh','-1',100,1,NULL,'','','','NOI_THAT,TANG_TRET',NULL,'','','','','',NULL,NULL,'',NULL,'','','','','',NULL,'',NULL,'nguyenvana','2023-07-29 23:28:41','nguyenvana','2023-07-29 23:28:41'),(9,'Alpha 2 Building Tower','153 nguyễn đình chiểu','Phường 6','QUAN_1',200,1,20,'20 triệu/m2','hai nam','543126789','NOI_THAT',NULL,'','','','','',NULL,NULL,'',NULL,'','','','','',NULL,'',NULL,NULL,NULL,'nguyenvana','2023-07-29 23:37:18'),(10,'IDD 1 Building','111 Lý Chính Thắng','Phường 7','QUAN_4',200,1,12,'12 triệu/m2','le anh','214365879','NOI_THAT,TANG_TRET,NGUYEN_CAN',NULL,'','','','','',NULL,NULL,'',NULL,'','','','','',NULL,'',NULL,'nguyenvana','2023-07-29 23:36:53','nguyenvana','2023-07-29 23:36:53'),(11,'NGUYỄN BÌNH AN','hoang hoa tham','quan thanh','-1',100,1,NULL,'','','0966781056','NOI_THAT,TANG_TRET',NULL,'','','','','',NULL,NULL,'',NULL,'','','','','',NULL,'',NULL,'nguyenvana','2023-07-29 23:58:26','nguyenvana','2023-07-29 23:58:26'),(22,'ACM Tower','96 cao thắng','Phường 4','QUAN_2',650,2,18,'18 triệu/m2','hai anh','543162789','NOI_THAT,TANG_TRET',NULL,'','','','','',NULL,NULL,'',NULL,'','','','','',NULL,'',NULL,'nguyenvana','2023-07-30 00:58:09','nguyenvana','2023-07-30 00:58:09');
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rentarea`
--

DROP TABLE IF EXISTS `rentarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rentarea` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `buildingid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqhqoxlvm1iblaew5s0v8n3ut4` (`buildingid`),
  CONSTRAINT `FKqhqoxlvm1iblaew5s0v8n3ut4` FOREIGN KEY (`buildingid`) REFERENCES `building` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentarea`
--

LOCK TABLES `rentarea` WRITE;
/*!40000 ALTER TABLE `rentarea` DISABLE KEYS */;
INSERT INTO `rentarea` VALUES (1,'nguyenvana','2023-07-29 23:25:12','nguyenvana','2023-07-29 23:25:12',100,1),(2,'nguyenvana','2023-07-29 23:25:12','nguyenvana','2023-07-29 23:25:12',200,1),(12,'nguyenvana','2023-07-29 23:28:41','nguyenvana','2023-07-29 23:28:41',100,5),(13,'nguyenvana','2023-07-29 23:28:41','nguyenvana','2023-07-29 23:28:41',250,5),(14,'nguyenvana','2023-07-29 23:28:41','nguyenvana','2023-07-29 23:28:41',350,5),(22,'nguyenvana','2023-07-29 23:36:53','nguyenvana','2023-07-29 23:36:53',150,10),(23,'nguyenvana','2023-07-29 23:36:53','nguyenvana','2023-07-29 23:36:53',250,10),(24,'nguyenvana','2023-07-29 23:36:53','nguyenvana','2023-07-29 23:36:53',350,10),(25,'nguyenvana','2023-07-29 23:37:18','nguyenvana','2023-07-29 23:37:18',20,9),(26,'nguyenvana','2023-07-29 23:58:26','nguyenvana','2023-07-29 23:58:26',100,11),(27,'nguyenvana','2023-07-29 23:58:26','nguyenvana','2023-07-29 23:58:26',250,11),(28,'nguyenvana','2023-07-29 23:58:26','nguyenvana','2023-07-29 23:58:26',350,11),(47,'nguyenvana','2023-07-30 00:58:09','nguyenvana','2023-07-30 00:58:09',100,22),(48,'nguyenvana','2023-07-30 00:58:09','nguyenvana','2023-07-30 00:58:09',200,22),(49,'nguyenvana','2023-07-30 00:58:09','nguyenvana','2023-07-30 00:58:09',350,22);
/*!40000 ALTER TABLE `rentarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_c36say97xydpmgigg38qv5l2p` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,NULL,NULL,NULL,NULL,'MANAGER','Quản lý'),(2,NULL,NULL,NULL,NULL,'STAFF','Nhân viên');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `transaction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `staffid` bigint(20) DEFAULT NULL,
  `customerid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKldobv9jeuxje0fjqnhrw6e23v` (`customerid`),
  CONSTRAINT `FKldobv9jeuxje0fjqnhrw6e23v` FOREIGN KEY (`customerid`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`),
  UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'nguyenvana','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','nguyen van a',1,NULL,NULL,NULL,NULL,NULL,NULL),(2,'nguyenvanb','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','nguyen van b',1,NULL,NULL,NULL,NULL,NULL,NULL),(3,'nguyenvanc','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','nguyen van c',1,NULL,NULL,NULL,NULL,NULL,NULL),(4,'nguyenvand','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','nguyen van d',1,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_role` (
  `userid` bigint(20) NOT NULL,
  `roleid` bigint(20) NOT NULL,
  KEY `FKbo5ik0bthje7hum554xb17ry6` (`roleid`),
  KEY `FKd0xwi6psywvnj59btfns0alnm` (`userid`),
  CONSTRAINT `FKbo5ik0bthje7hum554xb17ry6` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`),
  CONSTRAINT `FKd0xwi6psywvnj59btfns0alnm` FOREIGN KEY (`userid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1),(2,2),(3,2),(4,2);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-30  1:57:33
