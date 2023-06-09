-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: crm
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actors`
--

DROP TABLE IF EXISTS `actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actors` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Username` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role_id` bigint unsigned DEFAULT NULL,
  `verified` enum('true','false') DEFAULT 'false',
  `active` enum('true','false') DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `actors_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actors`
--

LOCK TABLES `actors` WRITE;
/*!40000 ALTER TABLE `actors` DISABLE KEYS */;
INSERT INTO `actors` VALUES (4,'ilham','$2a$08$0atOm4qv5vKaKn66rY8PDeklaPxs.ICRWPOi1IEt9F.O3g7eJuJ3.',3,'false','false','2023-06-08 10:33:54','2023-06-08 10:33:54',NULL),(5,'irfan','$2a$08$8CCRdildB7ZiffeM.9xoo.FI7DFPA6MepPNHBRoXuUsOp2a.7/SYG',1,'false','true','2023-06-08 10:00:14','2023-06-08 10:00:14',NULL),(7,'rizki','$2a$08$M/l5T677xzvTxZWw9bESx.LXdx3AlsjrMXCXV.TELMMwLuezFgi0e',3,'false','true','2023-06-08 11:47:36','2023-06-08 12:20:41',NULL),(8,'taufik','$2a$08$jl8v6sfkVgsbISJbhcxAje9wG8hqb1HVDgd35YRZqZ1j0Bn0m4kWi',3,'false','false','2023-06-08 11:49:59','2023-06-08 11:49:59',NULL),(9,'fajri','$2a$08$8av7yVaI61WJfYSIougZL.fU4apxzdmEwTAgeabI/SgBcWD7/b8UK',3,'false','false','2023-06-08 12:39:51','2023-06-08 12:39:51',NULL);
/*!40000 ALTER TABLE `actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'George','Bluth','george.bluth@reqres.in','https://reqres.in/img/faces/1-image.jpg','2023-06-08 03:24:36','2023-06-08 03:24:36',NULL),(2,'Janet','Weaver','janet.weaver@reqres.in','https://reqres.in/img/faces/2-image.jpg','2023-06-08 03:24:36','2023-06-08 03:24:36',NULL),(3,'Emma','Wong','emma.wong@reqres.in','https://reqres.in/img/faces/3-image.jpg','2023-06-08 03:24:36','2023-06-08 03:24:36',NULL),(4,'Eve','Holt','eve.holt@reqres.in','https://reqres.in/img/faces/4-image.jpg','2023-06-08 03:24:36','2023-06-08 03:24:36',NULL),(5,'Charles','Morris','charles.morris@reqres.in','https://reqres.in/img/faces/5-image.jpg','2023-06-08 03:24:36','2023-06-08 03:24:36',NULL),(6,'Tracey','Ramos','tracey.ramos@reqres.in','https://reqres.in/img/faces/6-image.jpg','2023-06-08 03:24:36','2023-06-08 03:24:36',NULL),(7,'Michael','Lawson','michael.lawson@reqres.in','https://reqres.in/img/faces/7-image.jpg','2023-06-08 03:24:36','2023-06-08 03:24:36',NULL),(8,'Lindsay','Ferguson','lindsay.ferguson@reqres.in','https://reqres.in/img/faces/8-image.jpg','2023-06-08 03:24:36','2023-06-08 03:24:36',NULL),(9,'Tobias','Funke','tobias.funke@reqres.in','https://reqres.in/img/faces/9-image.jpg','2023-06-08 03:24:36','2023-06-08 03:24:36',NULL),(10,'ahmad','joko','joko@gmail.com','https://reqres.in/img/faces/10-image.jpg','2023-06-08 08:49:28','2023-06-08 08:53:29','2023-06-08 08:53:29');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `register_approvals`
--

DROP TABLE IF EXISTS `register_approvals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `register_approvals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` bigint unsigned DEFAULT NULL,
  `super_admin_id` bigint unsigned DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `register_approvals`
--

LOCK TABLES `register_approvals` WRITE;
/*!40000 ALTER TABLE `register_approvals` DISABLE KEYS */;
INSERT INTO `register_approvals` VALUES (1,2,0,'','2023-06-08 10:02:58','2023-06-08 10:02:58',NULL),(2,4,0,'','2023-06-08 10:33:54','2023-06-08 10:33:54',NULL),(3,7,0,'','2023-06-08 11:47:37','2023-06-08 11:47:37',NULL),(4,8,0,'','2023-06-08 11:49:59','2023-06-08 11:49:59',NULL),(5,9,0,'','2023-06-08 12:39:51','2023-06-08 12:39:51',NULL);
/*!40000 ALTER TABLE `register_approvals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'admin','2023-06-08 09:59:42','2023-06-08 09:59:42',NULL),(2,'superadmin','2023-06-08 09:59:42','2023-06-08 09:59:42',NULL),(3,'user','2023-06-08 10:33:20','2023-06-08 10:33:20',NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-09 20:38:21
