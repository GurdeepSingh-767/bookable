CREATE DATABASE  IF NOT EXISTS `bookable` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bookable`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: bookable
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add admin',7,'add_admin'),(26,'Can change admin',7,'change_admin'),(27,'Can delete admin',7,'delete_admin'),(28,'Can view admin',7,'view_admin'),(29,'Can add community_hall',8,'add_community_hall'),(30,'Can change community_hall',8,'change_community_hall'),(31,'Can delete community_hall',8,'delete_community_hall'),(32,'Can view community_hall',8,'view_community_hall'),(33,'Can add customer',9,'add_customer'),(34,'Can change customer',9,'change_customer'),(35,'Can delete customer',9,'delete_customer'),(36,'Can view customer',9,'view_customer'),(37,'Can add garden',10,'add_garden'),(38,'Can change garden',10,'change_garden'),(39,'Can delete garden',10,'delete_garden'),(40,'Can view garden',10,'view_garden'),(41,'Can add hall',11,'add_hall'),(42,'Can change hall',11,'change_hall'),(43,'Can delete hall',11,'delete_hall'),(44,'Can view hall',11,'view_hall'),(45,'Can add manager',12,'add_manager'),(46,'Can change manager',12,'change_manager'),(47,'Can delete manager',12,'delete_manager'),(48,'Can view manager',12,'view_manager'),(49,'Can add pool',13,'add_pool'),(50,'Can change pool',13,'change_pool'),(51,'Can delete pool',13,'delete_pool'),(52,'Can view pool',13,'view_pool'),(53,'Can add booked_community_halls',14,'add_booked_community_halls'),(54,'Can change booked_community_halls',14,'change_booked_community_halls'),(55,'Can delete booked_community_halls',14,'delete_booked_community_halls'),(56,'Can view booked_community_halls',14,'view_booked_community_halls'),(57,'Can add booked_gardens',15,'add_booked_gardens'),(58,'Can change booked_gardens',15,'change_booked_gardens'),(59,'Can delete booked_gardens',15,'delete_booked_gardens'),(60,'Can view booked_gardens',15,'view_booked_gardens'),(61,'Can add booked_pools',16,'add_booked_pools'),(62,'Can change booked_pools',16,'change_booked_pools'),(63,'Can delete booked_pools',16,'delete_booked_pools'),(64,'Can view booked_pools',16,'view_booked_pools'),(65,'Can add booked_halls',17,'add_booked_halls'),(66,'Can change booked_halls',17,'change_booked_halls'),(67,'Can delete booked_halls',17,'delete_booked_halls'),(68,'Can view booked_halls',17,'view_booked_halls'),(69,'Can add requested_community_hall',18,'add_requested_community_hall'),(70,'Can change requested_community_hall',18,'change_requested_community_hall'),(71,'Can delete requested_community_hall',18,'delete_requested_community_hall'),(72,'Can view requested_community_hall',18,'view_requested_community_hall'),(73,'Can add requested_garden',19,'add_requested_garden'),(74,'Can change requested_garden',19,'change_requested_garden'),(75,'Can delete requested_garden',19,'delete_requested_garden'),(76,'Can view requested_garden',19,'view_requested_garden'),(77,'Can add requested_hall',20,'add_requested_hall'),(78,'Can change requested_hall',20,'change_requested_hall'),(79,'Can delete requested_hall',20,'delete_requested_hall'),(80,'Can view requested_hall',20,'view_requested_hall'),(81,'Can add requested_pool',21,'add_requested_pool'),(82,'Can change requested_pool',21,'change_requested_pool'),(83,'Can delete requested_pool',21,'delete_requested_pool'),(84,'Can view requested_pool',21,'view_requested_pool'),(85,'Can add queries',22,'add_queries'),(86,'Can change queries',22,'change_queries'),(87,'Can delete queries',22,'delete_queries'),(88,'Can view queries',22,'view_queries'),(89,'Can add replies',23,'add_replies'),(90,'Can change replies',23,'change_replies'),(91,'Can delete replies',23,'delete_replies'),(92,'Can view replies',23,'view_replies');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookable1_admin`
--

DROP TABLE IF EXISTS `bookable1_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookable1_admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(500) NOT NULL,
  `password` varchar(500) NOT NULL,
  `email_id` varchar(500) NOT NULL,
  `phn_no` varchar(500) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookable1_admin`
--

LOCK TABLES `bookable1_admin` WRITE;
/*!40000 ALTER TABLE `bookable1_admin` DISABLE KEYS */;
INSERT INTO `bookable1_admin` VALUES (2,'Ashi','1234567','gs2011007@sgsitsindore.in','9993118567');
/*!40000 ALTER TABLE `bookable1_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookable1_booked_community_halls`
--

DROP TABLE IF EXISTS `bookable1_booked_community_halls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookable1_booked_community_halls` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cus_name` varchar(500) NOT NULL,
  `phn_no` varchar(500) NOT NULL,
  `eid` varchar(500) NOT NULL,
  `address` varchar(750) NOT NULL,
  `vname` varchar(500) NOT NULL,
  `type` varchar(200) NOT NULL,
  `dateend` date NOT NULL,
  `datestart` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookable1_booked_community_halls`
--

LOCK TABLES `bookable1_booked_community_halls` WRITE;
/*!40000 ALTER TABLE `bookable1_booked_community_halls` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookable1_booked_community_halls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookable1_booked_gardens`
--

DROP TABLE IF EXISTS `bookable1_booked_gardens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookable1_booked_gardens` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cus_name` varchar(500) NOT NULL,
  `phn_no` varchar(500) NOT NULL,
  `eid` varchar(500) NOT NULL,
  `address` varchar(750) NOT NULL,
  `vname` varchar(500) NOT NULL,
  `type` varchar(200) NOT NULL,
  `dateend` date NOT NULL,
  `datestart` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookable1_booked_gardens`
--

LOCK TABLES `bookable1_booked_gardens` WRITE;
/*!40000 ALTER TABLE `bookable1_booked_gardens` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookable1_booked_gardens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookable1_booked_halls`
--

DROP TABLE IF EXISTS `bookable1_booked_halls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookable1_booked_halls` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cus_name` varchar(500) NOT NULL,
  `phn_no` varchar(500) NOT NULL,
  `eid` varchar(500) NOT NULL,
  `address` varchar(750) NOT NULL,
  `vname` varchar(500) NOT NULL,
  `type` varchar(200) NOT NULL,
  `dateend` date NOT NULL,
  `datestart` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookable1_booked_halls`
--

LOCK TABLES `bookable1_booked_halls` WRITE;
/*!40000 ALTER TABLE `bookable1_booked_halls` DISABLE KEYS */;
INSERT INTO `bookable1_booked_halls` VALUES (2,'Golu','79694931366','mustkeem1310hussain@gmail.com','uvgcvgjcgjcj','Waterlily','Hall','2022-11-21','2022-11-20');
/*!40000 ALTER TABLE `bookable1_booked_halls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookable1_booked_pools`
--

DROP TABLE IF EXISTS `bookable1_booked_pools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookable1_booked_pools` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cus_name` varchar(500) NOT NULL,
  `phn_no` varchar(500) NOT NULL,
  `eid` varchar(500) NOT NULL,
  `address` varchar(750) NOT NULL,
  `vname` varchar(500) NOT NULL,
  `type` varchar(200) NOT NULL,
  `dateend` date NOT NULL,
  `datestart` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookable1_booked_pools`
--

LOCK TABLES `bookable1_booked_pools` WRITE;
/*!40000 ALTER TABLE `bookable1_booked_pools` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookable1_booked_pools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookable1_community_hall`
--

DROP TABLE IF EXISTS `bookable1_community_hall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookable1_community_hall` (
  `community_hall_id` int NOT NULL AUTO_INCREMENT,
  `community_hall_name` varchar(500) NOT NULL,
  `city` varchar(500) NOT NULL,
  `locality` varchar(500) NOT NULL,
  `description` varchar(1500) NOT NULL,
  `contact_no` varchar(500) NOT NULL,
  `capacity` varchar(500) NOT NULL,
  `url` varchar(500) NOT NULL,
  `manager_name` varchar(500) NOT NULL,
  `community_hall_email_id` varchar(500) NOT NULL,
  `cost` int unsigned NOT NULL,
  `img` varchar(100) NOT NULL,
  PRIMARY KEY (`community_hall_id`),
  UNIQUE KEY `community_hall_name_UNIQUE` (`community_hall_name`),
  KEY `manager3_idx` (`manager_name`),
  CONSTRAINT `manager3` FOREIGN KEY (`manager_name`) REFERENCES `bookable1_manager` (`manager_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bookable1_community_hall_chk_1` CHECK ((`cost` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookable1_community_hall`
--

LOCK TABLES `bookable1_community_hall` WRITE;
/*!40000 ALTER TABLE `bookable1_community_hall` DISABLE KEYS */;
INSERT INTO `bookable1_community_hall` VALUES (5,'Patel Club & Resort','Indore','Rajendra Nagar, Indore','Things To Know\r\nApproach\r\nPatel Club And Resort, Indore is located just off the Mugs and Beans Road, it about 11 minutes away from Rajendra Nagar Railway Station which makes it extremely accessible for all. It is 12.8 km away from Indore International Airport.\r\n\r\nAmbience\r\nWith banquet halls and ballrooms for your reception and room blocks for your guests, Patel Club And Resort make your big day memorable. The hotel has meetings and events facilities with high ceiling and contemporary design spread over a large area and can accommodate up to 450 guests. ','9977334564','700','patelclub1971','Sakshi  Jinju','jhinjhoresakshi9@gmail.com',350000,'Photos/patel-club-resort-rajendra-nagar-knyog.webp'),(7,'Daksh Residency','Indore',' Vijay Nagar','Things To Know\r\nApproach\r\nIn a mixed residential and commercial area, Daksh Residency is 5 km from Laxmi Bai Nagar train station, and 6 km from the Indore Museum and circa-1700s Rajwada palace. Devi Ahilyabai Holkar International Airport is 16 km from the property. It is less than 6 km from Indore Junction.\r\n\r\nAmbience\r\nThe rooms are made comfortable with ambient lighting, spaciously arranged furniture, and amenities like air-conditioning, coffee table, fridge, LCD television, safety locker, water heating facilities, and shower cabinet in the private bathroom. You also get complimentary Wi-Fi and breakfast. The venue is regularly sanitized. It has a kind of ambiance that will steal your gaze and make you fixated on their interior decor and infrastructure. The ambiance style is contemporary with a touch of minimalism and sophistication.','9977334564','150','dakash','Ashish ','ashishbagdi1234@gmail.com',60000,'Photos/daksh-residency-vijay-nagar-in0q2_X7f4qUM.webp');
/*!40000 ALTER TABLE `bookable1_community_hall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookable1_customer`
--

DROP TABLE IF EXISTS `bookable1_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookable1_customer` (
  `cust_id` int NOT NULL AUTO_INCREMENT,
  `cust_name` varchar(500) NOT NULL,
  `password` varchar(500) NOT NULL,
  `email_id` varchar(500) NOT NULL,
  `phn_no` varchar(500) NOT NULL,
  PRIMARY KEY (`cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookable1_customer`
--

LOCK TABLES `bookable1_customer` WRITE;
/*!40000 ALTER TABLE `bookable1_customer` DISABLE KEYS */;
INSERT INTO `bookable1_customer` VALUES (1,'Mustkeem','12345','mustkeem1310hussain@gmail.com','8827139678'),(2,'golu','1230','gs20020515@gmail.com','9111346898');
/*!40000 ALTER TABLE `bookable1_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookable1_garden`
--

DROP TABLE IF EXISTS `bookable1_garden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookable1_garden` (
  `garden_id` int NOT NULL AUTO_INCREMENT,
  `garden_name` varchar(500) NOT NULL,
  `city` varchar(500) NOT NULL,
  `locality` varchar(500) NOT NULL,
  `description` varchar(1500) NOT NULL,
  `contact_no` varchar(500) NOT NULL,
  `capacity` varchar(500) NOT NULL,
  `url` varchar(500) NOT NULL,
  `manager_name` varchar(500) NOT NULL,
  `garden_email_id` varchar(500) NOT NULL,
  `cost` int unsigned NOT NULL,
  `img` varchar(100) NOT NULL,
  PRIMARY KEY (`garden_id`),
  UNIQUE KEY `garden_name_UNIQUE` (`garden_name`),
  KEY `manager1_idx` (`manager_name`),
  CONSTRAINT `manager1` FOREIGN KEY (`manager_name`) REFERENCES `bookable1_manager` (`manager_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bookable1_garden_chk_1` CHECK ((`cost` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookable1_garden`
--

LOCK TABLES `bookable1_garden` WRITE;
/*!40000 ALTER TABLE `bookable1_garden` DISABLE KEYS */;
INSERT INTO `bookable1_garden` VALUES (13,'Shubh Karaj Marriage Garden','Indore','Pipliya Pala','The venue offers a huge lawn and a spacious banquet hall for weddings, birthday parties, seminars, and other celebrations. The hall is fully air-conditioned and ever ready to host a medium to a large-sized gathering. The lawn is very well maintained with lush green grass and beautifully small trees and shrubs. The garden and banquet hall combined provide for a huge space and gives the party host ample opportunity to play around with the decoration. When the lawns are spacious to create a regal setting or it can be transformed into a magical garden with fairy lights and flowers.','9977334564','2000','shubhkaraj@gmail.com','Sakshi  Jinju','jhinjhoresakshi9@gmail.com',150000,'Photos/shubh-karaj-marriage-garden-pipliya-pala-ippst.webp');
/*!40000 ALTER TABLE `bookable1_garden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookable1_hall`
--

DROP TABLE IF EXISTS `bookable1_hall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookable1_hall` (
  `hall_id` int NOT NULL AUTO_INCREMENT,
  `hall_name` varchar(500) NOT NULL,
  `city` varchar(500) NOT NULL,
  `locality` varchar(500) NOT NULL,
  `description` varchar(1500) NOT NULL,
  `contact_no` varchar(500) NOT NULL,
  `capacity` varchar(500) NOT NULL,
  `url` varchar(500) NOT NULL,
  `manager_name` varchar(500) NOT NULL,
  `hall_email_id` varchar(500) NOT NULL,
  `cost` int unsigned NOT NULL,
  `img` varchar(100) NOT NULL,
  PRIMARY KEY (`hall_id`),
  UNIQUE KEY `hall_name_UNIQUE` (`hall_name`),
  KEY `manager_idx` (`manager_name`),
  CONSTRAINT `manager` FOREIGN KEY (`manager_name`) REFERENCES `bookable1_manager` (`manager_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bookable1_hall_chk_1` CHECK ((`cost` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookable1_hall`
--

LOCK TABLES `bookable1_hall` WRITE;
/*!40000 ALTER TABLE `bookable1_hall` DISABLE KEYS */;
INSERT INTO `bookable1_hall` VALUES (3,'Waterlily','Indore','Nipania','The décor of this place is very lively with splashes of color on its walls and furniture and random art installations. One can find all the modern facilities, be it their décor or interior design. This same liveliness has been carried forward in their rooms where they have used adequate colors and perfectly matched beds and sofa sets. The hotel’s driveway is lined with well-kept and green shrubs, which when lit during the evenings give a beautiful effect on the overall look of the location.','7987291207','2000','waterlily@gmail.com','Gurdeep','kirandevi5147@gmail.com',150000,'Photos/waterlily-nipania-7s1c.webp'),(7,'mam','Dewas','Napania ,Indore','afva','07771 825577','455001','dwfwf','Ashish ','ashishbagdi1234@gmail.com',65161,'Photos/the-chandra-leela-nipania-qp0g_aYs94NY.webp');
/*!40000 ALTER TABLE `bookable1_hall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookable1_manager`
--

DROP TABLE IF EXISTS `bookable1_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookable1_manager` (
  `manager_id` int NOT NULL AUTO_INCREMENT,
  `manager_name` varchar(500) NOT NULL,
  `password` varchar(500) NOT NULL,
  `email_id` varchar(500) NOT NULL,
  `phn_no` varchar(500) NOT NULL,
  PRIMARY KEY (`manager_id`),
  UNIQUE KEY `manager_name_UNIQUE` (`manager_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookable1_manager`
--

LOCK TABLES `bookable1_manager` WRITE;
/*!40000 ALTER TABLE `bookable1_manager` DISABLE KEYS */;
INSERT INTO `bookable1_manager` VALUES (1,'Gurdeep','12345','kirandevi5147@gmail.com','7987291207'),(2,'Ashish ','123456789','ashishbagdi1234@gmail.com','9977334564'),(3,'yash ','123456','ytitoriya12345@gmail.com','6266470770'),(4,'Sakshi  Jinju','321','jhinjhoresakshi9@gmail.com','9766156340');
/*!40000 ALTER TABLE `bookable1_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookable1_pool`
--

DROP TABLE IF EXISTS `bookable1_pool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookable1_pool` (
  `pool_id` int NOT NULL AUTO_INCREMENT,
  `pool_name` varchar(500) NOT NULL,
  `city` varchar(500) NOT NULL,
  `locality` varchar(500) NOT NULL,
  `description` varchar(1500) NOT NULL,
  `contact_no` varchar(500) NOT NULL,
  `capacity` varchar(500) NOT NULL,
  `url` varchar(500) NOT NULL,
  `manager_name` varchar(500) NOT NULL,
  `pool_email_id` varchar(500) NOT NULL,
  `cost` int unsigned NOT NULL,
  `img` varchar(100) NOT NULL,
  PRIMARY KEY (`pool_id`),
  UNIQUE KEY `pool_name_UNIQUE` (`pool_name`),
  KEY `manager2_idx` (`manager_name`),
  CONSTRAINT `manager2` FOREIGN KEY (`manager_name`) REFERENCES `bookable1_manager` (`manager_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bookable1_pool_chk_1` CHECK ((`cost` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookable1_pool`
--

LOCK TABLES `bookable1_pool` WRITE;
/*!40000 ALTER TABLE `bookable1_pool` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookable1_pool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookable1_queries`
--

DROP TABLE IF EXISTS `bookable1_queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookable1_queries` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(500) NOT NULL,
  `query` varchar(1500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookable1_queries`
--

LOCK TABLES `bookable1_queries` WRITE;
/*!40000 ALTER TABLE `bookable1_queries` DISABLE KEYS */;
INSERT INTO `bookable1_queries` VALUES (1,'fhgjg@gmail.com','gdsrsdyfyjf'),(2,'gcgj@gmail.com','qcece2ce2v2v'),(3,'dhjcvh@gmail.com','dcbwejcgycfqucgugcuqg'),(4,'dhjcvh@gmail.com','dcbwejcgycfqucgugcuqg'),(5,'dhjcvh@gmail.com','dcbwejcgycfqucgugcuqg'),(7,'kirandevi5147@gmailcom','fvvdvsdvsdv');
/*!40000 ALTER TABLE `bookable1_queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookable1_replies`
--

DROP TABLE IF EXISTS `bookable1_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookable1_replies` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(500) NOT NULL,
  `query` varchar(1500) NOT NULL,
  `reply` varchar(1500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookable1_replies`
--

LOCK TABLES `bookable1_replies` WRITE;
/*!40000 ALTER TABLE `bookable1_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookable1_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookable1_requested_community_hall`
--

DROP TABLE IF EXISTS `bookable1_requested_community_hall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookable1_requested_community_hall` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cus_name` varchar(500) NOT NULL,
  `phn_no` varchar(500) NOT NULL,
  `eid` varchar(500) NOT NULL,
  `address` varchar(750) NOT NULL,
  `vname` varchar(500) NOT NULL,
  `type` varchar(200) NOT NULL,
  `dateend` date NOT NULL,
  `datestart` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name_idx` (`vname`),
  CONSTRAINT `name` FOREIGN KEY (`vname`) REFERENCES `bookable1_community_hall` (`community_hall_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookable1_requested_community_hall`
--

LOCK TABLES `bookable1_requested_community_hall` WRITE;
/*!40000 ALTER TABLE `bookable1_requested_community_hall` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookable1_requested_community_hall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookable1_requested_garden`
--

DROP TABLE IF EXISTS `bookable1_requested_garden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookable1_requested_garden` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cus_name` varchar(500) NOT NULL,
  `phn_no` varchar(500) NOT NULL,
  `eid` varchar(500) NOT NULL,
  `address` varchar(750) NOT NULL,
  `vname` varchar(500) NOT NULL,
  `type` varchar(200) NOT NULL,
  `dateend` date NOT NULL,
  `datestart` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name1_idx` (`vname`),
  CONSTRAINT `name1` FOREIGN KEY (`vname`) REFERENCES `bookable1_garden` (`garden_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookable1_requested_garden`
--

LOCK TABLES `bookable1_requested_garden` WRITE;
/*!40000 ALTER TABLE `bookable1_requested_garden` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookable1_requested_garden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookable1_requested_hall`
--

DROP TABLE IF EXISTS `bookable1_requested_hall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookable1_requested_hall` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cus_name` varchar(500) NOT NULL,
  `phn_no` varchar(500) NOT NULL,
  `eid` varchar(500) NOT NULL,
  `address` varchar(750) NOT NULL,
  `vname` varchar(500) NOT NULL,
  `type` varchar(200) NOT NULL,
  `dateend` date NOT NULL,
  `datestart` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name_idx` (`vname`),
  KEY `n_idx` (`vname`),
  CONSTRAINT `n` FOREIGN KEY (`vname`) REFERENCES `bookable1_hall` (`hall_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookable1_requested_hall`
--

LOCK TABLES `bookable1_requested_hall` WRITE;
/*!40000 ALTER TABLE `bookable1_requested_hall` DISABLE KEYS */;
INSERT INTO `bookable1_requested_hall` VALUES (6,'CACASC',' 1435','mustkeem1310hussain@gmail.com','VSVSDV','Waterlily','Hall','2022-11-23','2022-11-21'),(7,'CACASC',' 1435','mustkeem1310hussain@gmail.com','VSVSDV','Waterlily','Hall','2022-11-23','2022-11-21'),(8,'CASF','23116544','gs2011007@sgsitsindore.in','FASFAF','Waterlily','Hall','2022-11-21','2022-11-20'),(9,'Golu','79694931366','mustkeem1310hussain@gmail.com','vjhvhjvhj','mam','Hall','2022-11-22','2022-11-20'),(10,'gtt5g','07771 825577','kirandevi5147@gmail.com','Pahnawa sukarwariya hat','Waterlily','Hall','2022-11-22','2022-11-30'),(11,'Golu','eryy','kirandevi5147@gmail.com','yrr','Waterlily','Hall','2023-01-27','2023-01-20'),(12,'bvsvj','vdsv','kirandevi5147@gmail.com','j bsjk bsj','Waterlily','Hall','2023-01-28','2023-02-11');
/*!40000 ALTER TABLE `bookable1_requested_hall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookable1_requested_pool`
--

DROP TABLE IF EXISTS `bookable1_requested_pool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookable1_requested_pool` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cus_name` varchar(500) NOT NULL,
  `phn_no` varchar(500) NOT NULL,
  `eid` varchar(500) NOT NULL,
  `address` varchar(750) NOT NULL,
  `vname` varchar(500) NOT NULL,
  `type` varchar(200) NOT NULL,
  `dateend` date NOT NULL,
  `datestart` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name3_idx` (`vname`),
  CONSTRAINT `name3` FOREIGN KEY (`vname`) REFERENCES `bookable1_pool` (`pool_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookable1_requested_pool`
--

LOCK TABLES `bookable1_requested_pool` WRITE;
/*!40000 ALTER TABLE `bookable1_requested_pool` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookable1_requested_pool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'bookable1','admin'),(14,'bookable1','booked_community_halls'),(15,'bookable1','booked_gardens'),(17,'bookable1','booked_halls'),(16,'bookable1','booked_pools'),(8,'bookable1','community_hall'),(9,'bookable1','customer'),(10,'bookable1','garden'),(11,'bookable1','hall'),(12,'bookable1','manager'),(13,'bookable1','pool'),(22,'bookable1','queries'),(23,'bookable1','replies'),(18,'bookable1','requested_community_hall'),(19,'bookable1','requested_garden'),(20,'bookable1','requested_hall'),(21,'bookable1','requested_pool'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-11-17 16:00:11.644339'),(2,'auth','0001_initial','2022-11-17 16:00:12.035009'),(3,'admin','0001_initial','2022-11-17 16:00:12.144401'),(4,'admin','0002_logentry_remove_auto_add','2022-11-17 16:00:12.160028'),(5,'admin','0003_logentry_add_action_flag_choices','2022-11-17 16:00:12.175657'),(6,'contenttypes','0002_remove_content_type_name','2022-11-17 16:00:12.253793'),(7,'auth','0002_alter_permission_name_max_length','2022-11-17 16:00:12.300675'),(8,'auth','0003_alter_user_email_max_length','2022-11-17 16:00:12.331929'),(9,'auth','0004_alter_user_username_opts','2022-11-17 16:00:12.331929'),(10,'auth','0005_alter_user_last_login_null','2022-11-17 16:00:12.394437'),(11,'auth','0006_require_contenttypes_0002','2022-11-17 16:00:12.410064'),(12,'auth','0007_alter_validators_add_error_messages','2022-11-17 16:00:12.410064'),(13,'auth','0008_alter_user_username_max_length','2022-11-17 16:00:12.456947'),(14,'auth','0009_alter_user_last_name_max_length','2022-11-17 16:00:12.503829'),(15,'auth','0010_alter_group_name_max_length','2022-11-17 16:00:12.535083'),(16,'auth','0011_update_proxy_permissions','2022-11-17 16:00:12.535083'),(17,'auth','0012_alter_user_first_name_max_length','2022-11-17 16:00:12.597605'),(18,'bookable1','0001_initial','2022-11-17 16:00:12.722622'),(19,'bookable1','0002_booked_community_hall_booked_garden_booked_pool_and_more','2022-11-17 16:00:12.800761'),(20,'bookable1','0003_alter_booked_community_hall_dateb_and_more','2022-11-17 16:00:12.910245'),(21,'bookable1','0004_booked_community_halls_booked_gardens_booked_pools_and_more','2022-11-17 16:00:13.050803'),(22,'bookable1','0005_booked_community_halls_type_booked_gardens_type_and_more','2022-11-17 16:00:13.144561'),(23,'sessions','0001_initial','2022-11-17 16:00:13.175810'),(24,'bookable1','0006_remove_booked_community_halls_dateb_and_more','2022-11-19 16:32:38.592222'),(25,'bookable1','0007_remove_booked_community_halls_dateb_and_more','2022-11-20 14:19:06.358142'),(26,'bookable1','0008_remove_booked_community_halls_dateb_and_more','2022-11-20 14:33:49.629038'),(27,'bookable1','0009_queries_replies_remove_booked_halls_dateb_and_more','2022-11-20 15:40:38.732835');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-14 11:57:03
