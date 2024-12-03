-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: recicla_usat
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `brandmodels`
--

DROP TABLE IF EXISTS `brandmodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brandmodels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `brand_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `brandmodels_brand_id_foreign` (`brand_id`),
  CONSTRAINT `brandmodels_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brandmodels`
--

LOCK TABLES `brandmodels` WRITE;
/*!40000 ALTER TABLE `brandmodels` DISABLE KEYS */;
INSERT INTO `brandmodels` VALUES (1,'HILUX',NULL,'4X4',1,'2024-11-19 01:35:20','2024-11-19 01:35:20'),(2,'RIO',NULL,'ULTIMO MODELO',2,'2024-11-19 01:35:35','2024-11-19 01:38:20'),(6,'YARIS',NULL,'Modelo nuevo',1,'2024-11-19 02:05:14','2024-11-19 02:05:14');
/*!40000 ALTER TABLE `brandmodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'TOYOTA','2024','/storage/brand_logo/ymfZgKzKedKYXuGQ7GfSvWVpcKvMGU3DNQTeLo8o.png','2024-11-19 00:23:40','2024-11-19 01:48:19'),(2,'KIA','kia','/storage/brand_logo/26cND6u6kkrsVaCZ9G6B4Y5LS9gxSDeMihssEi4m.png','2024-11-19 00:23:54','2024-11-22 12:38:43');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'LAMBAYEQUE','10001','2024-11-18 22:30:33','2024-11-18 22:30:33');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `districts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `department_id` bigint(20) unsigned NOT NULL,
  `province_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `districts_department_id_foreign` (`department_id`),
  KEY `districts_province_id_foreign` (`province_id`),
  CONSTRAINT `districts_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `districts_province_id_foreign` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,'CHICLAYO','14001',1,1,'2024-11-18 22:30:33','2024-11-18 22:30:33');
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenances`
--

DROP TABLE IF EXISTS `maintenances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenances` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `startdate` date NOT NULL,
  `lastdate` date NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenances`
--

LOCK TABLES `maintenances` WRITE;
/*!40000 ALTER TABLE `maintenances` DISABLE KEYS */;
INSERT INTO `maintenances` VALUES (1,'MANTENIMIENTO NOVIEMBRE 2024','2024-11-01','2024-11-30',NULL,'2024-11-30 00:03:32','2024-11-30 00:03:32'),(2,'MANTENIMIENTO DICIEMBRE 2024','2024-12-01','2024-12-31',NULL,'2024-11-30 00:04:34','2024-11-30 00:04:34');
/*!40000 ALTER TABLE `maintenances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenanceschedules`
--

DROP TABLE IF EXISTS `maintenanceschedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenanceschedules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `time_start` time NOT NULL,
  `time_end` time NOT NULL,
  `maintenance_id` bigint(20) unsigned NOT NULL,
  `vehicle_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `maintenancetype_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `maintenanceschedules_maintenance_id_foreign` (`maintenance_id`),
  KEY `maintenanceschedules_vehicle_id_foreign` (`vehicle_id`),
  KEY `maintenanceschedules_user_id_foreign` (`user_id`),
  KEY `maintenanceschedules_maintenancetype_id_foreign` (`maintenancetype_id`),
  CONSTRAINT `maintenanceschedules_maintenance_id_foreign` FOREIGN KEY (`maintenance_id`) REFERENCES `maintenances` (`id`),
  CONSTRAINT `maintenanceschedules_maintenancetype_id_foreign` FOREIGN KEY (`maintenancetype_id`) REFERENCES `maintenancetypes` (`id`),
  CONSTRAINT `maintenanceschedules_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `maintenanceschedules_vehicle_id_foreign` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenanceschedules`
--

LOCK TABLES `maintenanceschedules` WRITE;
/*!40000 ALTER TABLE `maintenanceschedules` DISABLE KEYS */;
INSERT INTO `maintenanceschedules` VALUES (1,'Lunes','08:00:00','09:00:00',1,1,4,2,'2024-11-30 00:38:33','2024-11-30 00:38:33'),(2,'Martes','10:00:00','11:00:00',1,3,10,2,'2024-11-30 01:34:51','2024-11-30 01:34:51');
/*!40000 ALTER TABLE `maintenanceschedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenancestatus`
--

DROP TABLE IF EXISTS `maintenancestatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenancestatus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenancestatus`
--

LOCK TABLES `maintenancestatus` WRITE;
/*!40000 ALTER TABLE `maintenancestatus` DISABLE KEYS */;
INSERT INTO `maintenancestatus` VALUES (1,'Iniciado',NULL,'2024-11-29 23:40:23','2024-11-29 23:40:23'),(2,'Finalizado',NULL,'2024-11-29 23:40:23','2024-11-29 23:40:23');
/*!40000 ALTER TABLE `maintenancestatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenancetypes`
--

DROP TABLE IF EXISTS `maintenancetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenancetypes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenancetypes`
--

LOCK TABLES `maintenancetypes` WRITE;
/*!40000 ALTER TABLE `maintenancetypes` DISABLE KEYS */;
INSERT INTO `maintenancetypes` VALUES (1,'Limpieza',NULL,'2024-11-29 23:40:23','2024-11-29 23:40:23'),(2,'Reparación',NULL,'2024-11-29 23:40:23','2024-11-29 23:40:23');
/*!40000 ALTER TABLE `maintenancetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2012_10_31_003627_create_departments_table',1),(2,'2012_10_31_003651_create_provinces_table',1),(3,'2012_10_31_003714_create_districts_table',1),(4,'2013_10_31_003754_create_sectors_table',1),(5,'2013_10_31_003802_create_zones_table',1),(6,'2013_10_31_013935_create_usertypes_table',1),(7,'2014_10_12_000000_create_users_table',1),(8,'2014_10_12_100000_create_password_reset_tokens_table',1),(9,'2014_10_12_200000_add_two_factor_columns_to_users_table',1),(10,'2019_08_19_000000_create_failed_jobs_table',1),(11,'2019_12_14_000001_create_personal_access_tokens_table',1),(12,'2024_09_28_003930_create_sessions_table',1),(13,'2024_09_28_014520_create_brands_table',1),(14,'2024_10_05_015437_create_brandmodels_table',1),(15,'2024_10_19_025011_create_vehicletypes_table',1),(16,'2024_10_19_025022_create_vehiclecolors_table',1),(17,'2024_10_24_003025_create_vehicles_table',1),(18,'2024_10_26_003617_create_vehicleimages_table',1),(19,'2024_10_31_003821_create_zonecoords_table',1),(20,'2024_10_31_012000_create_schedules_table',1),(21,'2024_10_31_012054_create_routes_table',1),(22,'2024_10_31_012105_create_routezones_table',1),(23,'2024_10_31_012125_create_routestatus_table',1),(24,'2024_10_31_012145_create_vehicleroutes_table',1),(25,'2024_10_31_012657_create_routepaths_table',1),(26,'2024_10_31_014411_create_vehicleocuppants_table',1),(27,'2024_11_29_182753_create_maintenancetypes_table',2),(28,'2024_11_29_182857_create_maintenancestatus_table',2),(29,'2024_11_29_182912_create_maintenances_table',2),(30,'2024_11_29_182931_create_maintenanceschedules_table',2),(31,'2024_11_29_183020_create_schedulesdates_table',2),(32,'2024_11_30_232203_create_programmings_table',3),(33,'2024_11_30_232751_create_vehicleroutes_table',4),(34,'2024_11_30_233524_create_vehicleroutes_table',5),(35,'2024_11_30_233547_create_routepaths_table',5),(36,'2024_12_01_061350_create_programmings_table',6),(37,'2024_12_01_061437_create_vehicleroutes_table',6),(38,'2024_12_01_061514_create_routepaths_table',6),(39,'2024_12_01_190646_create_programmings_table',7),(40,'2024_12_01_190727_create_vehicleroutes_table',7),(41,'2024_12_01_190733_create_routepaths_table',7);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programmings`
--

DROP TABLE IF EXISTS `programmings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programmings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `startdate` date NOT NULL,
  `lastdate` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programmings`
--

LOCK TABLES `programmings` WRITE;
/*!40000 ALTER TABLE `programmings` DISABLE KEYS */;
INSERT INTO `programmings` VALUES (4,'2024-12-01','2024-12-06','2024-12-02 02:16:06','2024-12-02 02:16:06'),(5,'2024-12-06','2024-12-08','2024-12-02 02:19:38','2024-12-02 02:19:38'),(6,'2024-12-09','2024-12-13','2024-12-02 05:09:42','2024-12-02 05:09:42'),(7,'2024-12-14','2024-12-15','2024-12-02 05:12:06','2024-12-02 05:12:06'),(8,'2024-11-25','2024-11-29','2024-12-02 05:16:37','2024-12-02 05:16:37'),(9,'2024-11-30','2024-12-01','2024-12-02 05:32:11','2024-12-02 05:32:11'),(10,'2024-11-23','2024-11-24','2024-12-02 05:37:15','2024-12-02 05:37:15'),(11,'2024-11-25','2024-11-25','2024-12-02 08:07:00','2024-12-02 08:07:00'),(12,'2024-11-01','2024-11-02','2024-12-02 08:44:46','2024-12-02 08:44:46'),(13,'2024-11-03','2024-11-11','2024-12-02 08:46:55','2024-12-02 08:46:55'),(14,'2024-10-18','2024-10-28','2024-12-02 08:59:38','2024-12-02 08:59:38'),(16,'2024-01-01','2024-01-08','2024-12-02 09:34:06','2024-12-02 09:34:06'),(17,'2024-10-01','2024-10-10','2024-12-02 09:42:36','2024-12-02 09:42:36'),(18,'2024-10-10','2024-10-14','2024-12-02 09:44:38','2024-12-02 09:44:38'),(19,'2024-12-01','2024-12-10','2024-12-02 11:27:00','2024-12-02 11:27:00'),(20,'2024-11-01','2024-11-11','2024-12-02 11:28:09','2024-12-02 11:28:09'),(21,'2025-01-01','2025-01-03','2024-12-03 02:30:30','2024-12-03 02:30:30'),(22,'2024-01-01','2024-01-05','2024-12-03 09:22:11','2024-12-03 09:30:50'),(23,'2025-02-01','2025-02-28','2024-12-03 09:33:08','2024-12-03 09:34:50'),(24,'2024-03-01','2024-03-20','2024-12-03 09:52:53','2024-12-03 09:54:56');
/*!40000 ALTER TABLE `programmings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provinces`
--

DROP TABLE IF EXISTS `provinces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provinces` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `department_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `provinces_department_id_foreign` (`department_id`),
  CONSTRAINT `provinces_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provinces`
--

LOCK TABLES `provinces` WRITE;
/*!40000 ALTER TABLE `provinces` DISABLE KEYS */;
INSERT INTO `provinces` VALUES (1,'CHICLAYO','14001',1,'2024-11-18 22:30:33','2024-11-18 22:30:33');
/*!40000 ALTER TABLE `provinces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routepaths`
--

DROP TABLE IF EXISTS `routepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routepaths` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `vehicleroute_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `routepaths_vehicleroute_id_foreign` (`vehicleroute_id`),
  CONSTRAINT `routepaths_vehicleroute_id_foreign` FOREIGN KEY (`vehicleroute_id`) REFERENCES `vehicleroutes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routepaths`
--

LOCK TABLES `routepaths` WRITE;
/*!40000 ALTER TABLE `routepaths` DISABLE KEYS */;
INSERT INTO `routepaths` VALUES (1,-6.776030800057156,-79.84275402806358,2,'2024-12-02 10:38:40','2024-12-02 10:38:40'),(2,-6.775418200725618,-79.84091939709779,2,'2024-12-02 10:38:49','2024-12-02 10:38:49'),(3,-6.775631278842218,-79.83878435872214,2,'2024-12-02 10:39:03','2024-12-02 10:39:03'),(4,-6.776861803123914,-79.83890774033667,2,'2024-12-02 10:39:14','2024-12-02 10:39:14'),(5,-6.776861803123914,-79.83890774033667,2,'2024-12-02 10:39:14','2024-12-02 10:39:14'),(6,-6.776514066100252,-79.83719534275112,2,'2024-12-02 10:39:29','2024-12-02 10:39:29'),(7,-6.776828355575097,-79.83720607158706,2,'2024-12-02 10:39:49','2024-12-02 10:39:49'),(8,-6.776641912691028,-79.83530706760446,2,'2024-12-02 10:40:01','2024-12-02 10:40:01'),(9,-6.776552840612489,-79.844089768153,3,'2024-12-03 11:25:01','2024-12-03 11:25:01'),(10,-6.776073415633872,-79.84278085015373,3,'2024-12-03 11:25:32','2024-12-03 11:25:32'),(11,-6.7772613233192684,-79.84280230782613,3,'2024-12-03 11:25:55','2024-12-03 11:25:55'),(12,-6.77687245700012,-79.83973386071297,3,'2024-12-03 11:26:05','2024-12-03 11:26:05'),(13,-6.776925726377422,-79.83959438584422,3,'2024-12-03 11:26:14','2024-12-03 11:26:14'),(14,-6.776840495370866,-79.83884873173785,3,'2024-12-03 11:26:25','2024-12-03 11:26:25'),(15,-6.776515552020184,-79.83721258423891,3,'2024-12-03 11:26:34','2024-12-03 11:26:34'),(16,-6.775892299406835,-79.83719649098491,3,'2024-12-03 11:26:49','2024-12-03 11:26:49'),(17,-6.776110704260425,-79.83562471650228,3,'2024-12-03 11:26:59','2024-12-03 11:26:59'),(18,-6.776947034126664,-79.83554425023154,3,'2024-12-03 11:27:25','2024-12-03 11:27:25');
/*!40000 ALTER TABLE `routepaths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `latitud_start` double NOT NULL,
  `latitude_end` double NOT NULL,
  `longitude_start` double NOT NULL,
  `longitude_end` double NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes`
--

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes` DISABLE KEYS */;
INSERT INTO `routes` VALUES (1,'RUTA 01',-6.776371724565482,-6.776851149247505,-79.84444918416138,-79.8351477472599,1,'2024-12-01 12:02:49','2024-12-01 12:05:00');
/*!40000 ALTER TABLE `routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routestatus`
--

DROP TABLE IF EXISTS `routestatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routestatus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routestatus`
--

LOCK TABLES `routestatus` WRITE;
/*!40000 ALTER TABLE `routestatus` DISABLE KEYS */;
INSERT INTO `routestatus` VALUES (1,'Iniciado',NULL,'2024-12-02 02:15:22','2024-12-02 02:15:22'),(2,'Finalizado',NULL,'2024-12-02 02:15:22','2024-12-02 02:15:22');
/*!40000 ALTER TABLE `routestatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routezones`
--

DROP TABLE IF EXISTS `routezones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routezones` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `route_id` bigint(20) unsigned NOT NULL,
  `zone_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `routezones_route_id_foreign` (`route_id`),
  KEY `routezones_zone_id_foreign` (`zone_id`),
  CONSTRAINT `routezones_route_id_foreign` FOREIGN KEY (`route_id`) REFERENCES `routes` (`id`),
  CONSTRAINT `routezones_zone_id_foreign` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routezones`
--

LOCK TABLES `routezones` WRITE;
/*!40000 ALTER TABLE `routezones` DISABLE KEYS */;
INSERT INTO `routezones` VALUES (1,1,5,'2024-12-01 12:11:31','2024-12-01 12:11:31'),(2,1,6,'2024-12-01 12:11:39','2024-12-01 12:11:39');
/*!40000 ALTER TABLE `routezones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedules`
--

DROP TABLE IF EXISTS `schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `time_start` time NOT NULL,
  `time_end` time NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules`
--

LOCK TABLES `schedules` WRITE;
/*!40000 ALTER TABLE `schedules` DISABLE KEYS */;
INSERT INTO `schedules` VALUES (1,'Turno Mañana','06:00:00','14:00:00','Horario laboral mañana','2024-11-20 07:10:00','2024-11-20 07:18:03'),(2,'Turno Tarde','14:00:00','22:00:00','Horario laboral tarde','2024-11-20 07:33:31','2024-11-20 07:39:03'),(3,'Turno Noche','22:00:00','06:00:00','Horario laboral noche','2024-11-20 07:55:58','2024-11-20 08:03:49');
/*!40000 ALTER TABLE `schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedulesdates`
--

DROP TABLE IF EXISTS `schedulesdates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedulesdates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `description` text DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `maintenanceschedules_id` bigint(20) unsigned NOT NULL,
  `maintenances_id` bigint(20) unsigned NOT NULL,
  `maintenancestatus_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `schedulesdates_maintenanceschedules_id_foreign` (`maintenanceschedules_id`),
  KEY `schedulesdates_maintenances_id_foreign` (`maintenances_id`),
  KEY `schedulesdates_maintenancestatus_id_foreign` (`maintenancestatus_id`),
  CONSTRAINT `schedulesdates_maintenances_id_foreign` FOREIGN KEY (`maintenances_id`) REFERENCES `maintenances` (`id`),
  CONSTRAINT `schedulesdates_maintenanceschedules_id_foreign` FOREIGN KEY (`maintenanceschedules_id`) REFERENCES `maintenanceschedules` (`id`),
  CONSTRAINT `schedulesdates_maintenancestatus_id_foreign` FOREIGN KEY (`maintenancestatus_id`) REFERENCES `maintenancestatus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedulesdates`
--

LOCK TABLES `schedulesdates` WRITE;
/*!40000 ALTER TABLE `schedulesdates` DISABLE KEYS */;
INSERT INTO `schedulesdates` VALUES (1,'2024-11-25',NULL,'/storage/scheduledates_logo/QXWekBeph3dpiZHJk553UzP7wrwkNM8fcZys4apy.jpg',1,1,2,'2024-11-30 00:39:30','2024-11-30 00:39:43'),(2,'2024-11-18',NULL,'',1,1,2,'2024-11-30 00:39:51','2024-11-30 00:40:42'),(3,'2024-11-12',NULL,'/storage/scheduledates_logo/FMvmyJ2FYYzeagXqiQR9oPV3NTRCsCe8dFWMFHx8.jpg',2,1,1,'2024-11-30 01:35:17','2024-11-30 01:35:17');
/*!40000 ALTER TABLE `schedulesdates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sectors`
--

DROP TABLE IF EXISTS `sectors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sectors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `area` double DEFAULT NULL,
  `description` text DEFAULT NULL,
  `district_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sectors_district_id_foreign` (`district_id`),
  CONSTRAINT `sectors_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sectors`
--

LOCK TABLES `sectors` WRITE;
/*!40000 ALTER TABLE `sectors` DISABLE KEYS */;
INSERT INTO `sectors` VALUES (1,'Sector 01',100,NULL,1,'2024-11-18 22:30:33','2024-11-18 22:30:33'),(2,'Sector 02',100,NULL,1,'2024-11-18 22:30:33','2024-11-18 22:30:33'),(3,'Sector 03',100,NULL,1,'2024-11-18 22:30:33','2024-11-18 22:30:33');
/*!40000 ALTER TABLE `sectors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('IO6sC4FnLwxdJjKgpMsdEIFRZ8EKL9oJjqClcCNd',57,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiUUNHenhEWUtJdzZEeVFoY0NBT2V2S2F5VnNNdFdCOFM4a2NmRUs3aCI7czozOiJ1cmwiO2E6MDp7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM1OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYWNjZXNzLWRlbmllZCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjU3O30=',1733245451),('jwkCDVchIfNvrzHGQ14hBpPAiogpKUudtzS9vrG0',12,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiUVYzcUJ2TW83N1AzUDN1RHptcVdlaFkyd3VmdVlyamJ3Sm5CMTY1YyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM1OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYWNjZXNzLWRlbmllZCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjEyO30=',1733247919),('mZJR3H6rg8kyeJDX3Ee2f7F0HeMw19ltelSSnVHm',8,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','YTo1OntzOjY6Il90b2tlbiI7czo0MDoic3Q4MDlaRk1DWDA0eWx4SUVjZ3cxV0hTN3Z6THdUYW1tS2llOEhWNiI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM1OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYWNjZXNzLWRlbmllZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjg7fQ==',1733244090),('R7eVzDVkI7Ia9rF1dekUkXVmtjkI4RCKs2gQtyJD',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoibGJwMlpFbEVDbkZMTHBBRmFpb0tSaEV2SUZpWExZVHBhWFhSemxtcSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMzOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYWRtaW4vdXNlcnMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=',1733247905);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dni` varchar(20) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `license` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) unsigned DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `usertype_id` bigint(20) unsigned DEFAULT NULL,
  `zone_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_usertype_id_foreign` (`usertype_id`),
  KEY `users_zone_id_foreign` (`zone_id`),
  CONSTRAINT `users_usertype_id_foreign` FOREIGN KEY (`usertype_id`) REFERENCES `usertypes` (`id`),
  CONSTRAINT `users_zone_id_foreign` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Roberto Carlos Montero López','72390067','1999-10-23',NULL,'Florencio Mori Rocha','admin@gmail.com','2024-12-01 03:34:33','$2y$12$Rmaa21RN43WKHx245GQYo.qZfwwgez5HMr0t2IiyaLxx1h7Q0ao8.',NULL,NULL,NULL,NULL,NULL,'/storage/user_logo/X438ihgbPwUQB34a0w2f6vEK2fOpNFTDeGM5tbKs.jpg',1,NULL,'2024-11-18 22:39:11','2024-12-03 22:44:05'),(2,'Diego','99887766',NULL,NULL,NULL,'diego@gmail.com',NULL,'$2y$12$WYQd1MResnGoCPgTk3urAe.2o2tE0WC8hHNMRt4eDZzX9aPRqCkRi',NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2024-11-19 05:13:10','2024-12-03 22:12:58'),(3,'Carlos Lopez','77884455',NULL,NULL,NULL,'carlos@gmail.com',NULL,'$2y$12$welCgATdJp5NBn0ZVWNG1u/gnSVlz5lUxFgZ0nR2DT52rUocytCA2',NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2024-11-19 05:40:41','2024-12-03 22:13:09'),(4,'Diego Gamonal Veliz','72390069','2000-11-20','D72390067','Avenida Vianey','gamonal12345@gmail.com',NULL,'$2y$12$tKLtRMndEPTRBoKrJmFlouP0U5SFgzmsEaZ.PmHaFsjUz0t0CVE9e',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2024-11-19 08:15:14','2024-12-03 22:13:18'),(5,'Roberto Lopez','72390000',NULL,'A72390000','Luis Oyarce','roberto@gmail.com',NULL,'$2y$12$QVj2AD3Zb3nZxqZHlawMw.IEALghpHIAHd0DYgBV5gE7wPQEb6F76',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2024-11-19 08:25:48','2024-12-03 22:15:07'),(6,'Nilton Lizarzaburu','72390060','2000-09-26','A72390060','Luis Oyarce','nilton@gmail.com',NULL,'$2y$12$hlkJMJJSshwkYNqv9JexneUb8QmMp8s7fxvML9RS9lUtAzPBZhZ9G',NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2024-11-19 08:31:12','2024-12-03 22:13:29'),(7,'Nick Bravo','11223344',NULL,NULL,NULL,'nickbravo@gmail.com',NULL,'$2y$12$hCd/WaQljrFROUECMYyu8.A7g7WPhYzEDLvTtFR.VMo8wCU7Dwlh.',NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2024-11-19 10:08:33','2024-12-03 22:13:42'),(8,'Carlos L','57868922',NULL,NULL,'Corales','carlosc@gmail.com',NULL,'$2y$12$0QE28zuCPogVa17OPpEK..XsF.yVa9JEw4aw/7BH.vyxgPQgYW5B6',NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2024-11-19 10:18:55','2024-12-03 21:41:13'),(9,'Robin','82112233','1990-02-01',NULL,'Florencio Mori','robin@gmail.com',NULL,'$2y$12$GZpOnxXdAezxh0GkVCHxoO74/gWjwiwHBPlWf.pFrDmifxcWrDduK',NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2024-11-20 03:59:53','2024-12-01 04:40:51'),(10,'Santos Suxe','12455966','2000-12-10','S12455966','Pariñas','santos@hotmail.com',NULL,'$2y$12$voCVYq7wJdZuVM1j2yxeYefVFX3Waj.OaJ6u93YUtvIGcm95VszOe',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2024-11-20 04:08:00','2024-12-03 12:26:42'),(12,'Ricardo','01010101',NULL,NULL,NULL,'ricardo@gmail.com',NULL,'$2y$12$74Cr5ZgkAIDrP0YLEujIzua.gyS8UrQPBIIR7MRMVFS5mLybWBEz.',NULL,NULL,NULL,NULL,NULL,'/storage/user_logo/x1zbzDypNIhtxxHXjls7vkErGtgb46CsxM37W1sV.png',3,NULL,'2024-11-22 12:21:44','2024-12-03 22:45:04'),(13,'Roberto Carlos',NULL,NULL,NULL,NULL,'montero@gmail.com',NULL,'$2y$12$yYV/vVbYsdn6JqzMRMR1U.FDD9QEn0cEGfzyN3Lr3y12mJjwnNMHi',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2024-11-23 02:58:45','2024-12-03 22:06:21'),(14,'Rodrigo','22222222','2001-09-10',NULL,'Av. Victoria 201','rodrigo@gmail.com',NULL,'$2y$12$bFHGtnGDyAJLlANKTABVNen2Joc4cp5w5E/WW4Sf0VwQXcFOouTYm',NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2024-11-23 08:46:03','2024-11-23 08:51:22'),(52,'Roberto Montero López',NULL,NULL,NULL,NULL,'adminlte@gmail.com','2024-12-01 03:57:46','$2y$12$3mZPg5gQzTFHBcagUHzzk.Ybz/fmbNU.jZ2yMNO9nipc2MBNT/C0i',NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2024-12-01 03:55:17','2024-12-03 22:15:34'),(53,'Cristiano Ronaldo',NULL,NULL,NULL,NULL,'ronaldo@gmail.com','2024-12-01 23:54:41','$2y$12$thzaRTJiLS7yajtbdkDl0uBrmmgXpCyXFYQRARJ8HvVBklqLh2eQC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-01 23:53:36','2024-12-03 22:18:38'),(54,'Hector','00112244',NULL,NULL,NULL,'hector@gmail.com',NULL,'$2y$12$j.uMawVNlJwMQGK0JzzpK.OAsswrvhJG9W2lhxB27UqYz8FPCjFIi',NULL,NULL,NULL,NULL,NULL,'/storage/user_logo/9sWlEKQChU0sbJc4j1UNMy1cNQprrfJ0vxSmjGDg.jpg',3,NULL,'2024-12-03 12:49:55','2024-12-03 22:32:31'),(55,'Jesús','77881122',NULL,'J77881122','Avenida Trebol','jesus@hotmail.com',NULL,'$2y$12$9w8cb10OdFhuI.k/ULNOnuNuS9y1fdXeHaz70Xep44sQMeYb5eSpm',NULL,NULL,NULL,NULL,NULL,'/storage/user_logo/RMvOfVTYamqGyTKgWQxl0cKtMcGOnAtY9uMz6iC2.jpg',2,NULL,'2024-12-03 13:01:34','2024-12-03 22:34:26'),(57,'Jose','74125836',NULL,NULL,'Avenida','jose@gmail.com',NULL,'$2y$12$7ZHyvhb/UTDJw6vavDxilOEJJRqyI5e6wFniaZU1WI4ufXSRXjD2m',NULL,NULL,NULL,NULL,NULL,'/storage/user_logo/AxCtwq0QayGGBZUIE75CRVz6U9j1OZdgnxlU0ZMA.jpg',4,NULL,'2024-12-03 13:31:53','2024-12-03 13:31:53');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertypes`
--

DROP TABLE IF EXISTS `usertypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usertypes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertypes`
--

LOCK TABLES `usertypes` WRITE;
/*!40000 ALTER TABLE `usertypes` DISABLE KEYS */;
INSERT INTO `usertypes` VALUES (1,'Administrador',NULL,'2024-11-19 03:20:13','2024-11-19 03:20:13'),(2,'Conductor',NULL,'2024-11-19 03:20:13','2024-11-19 03:20:13'),(3,'Recolector',NULL,'2024-11-19 03:20:13','2024-11-19 03:20:13'),(4,'Ciudadano',NULL,'2024-11-19 03:20:13','2024-11-19 03:20:13');
/*!40000 ALTER TABLE `usertypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiclecolors`
--

DROP TABLE IF EXISTS `vehiclecolors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiclecolors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `color_code` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiclecolors`
--

LOCK TABLES `vehiclecolors` WRITE;
/*!40000 ALTER TABLE `vehiclecolors` DISABLE KEYS */;
INSERT INTO `vehiclecolors` VALUES (1,'Rojo','#ff0000','2024-11-18 23:30:59','2024-11-18 23:30:59'),(3,'Negro','#000000','2024-11-18 23:46:12','2024-11-18 23:46:12'),(4,'Blanco','#ffffff','2024-11-19 00:19:36','2024-11-19 00:19:36'),(6,'Azul','#0011ff','2024-11-19 09:04:07','2024-11-19 09:04:07'),(7,'Verde','#00ff1e','2024-11-23 07:22:59','2024-11-23 07:22:59');
/*!40000 ALTER TABLE `vehiclecolors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicleimages`
--

DROP TABLE IF EXISTS `vehicleimages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicleimages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  `profile` int(11) NOT NULL,
  `vehicle_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vehicleimages_vehicle_id_foreign` (`vehicle_id`),
  CONSTRAINT `vehicleimages_vehicle_id_foreign` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicleimages`
--

LOCK TABLES `vehicleimages` WRITE;
/*!40000 ALTER TABLE `vehicleimages` DISABLE KEYS */;
INSERT INTO `vehicleimages` VALUES (1,'/storage/vehicles_images/1/wHFkpBEjeSfME5hPIOxj26oALnniRsOlhxwoRCNr.jpg',1,1,'2024-11-19 02:06:41','2024-11-19 02:06:41'),(5,'/storage/vehicles_images/4/yHiQRHMau3u3dK83HyGSkfakRTZEg76yXjrL4gYP.jpg',1,4,'2024-11-21 06:20:39','2024-11-21 06:20:39'),(11,'/storage/vehicles_images/5/wQNqxvVg8SzMaD42oaEBdodAZNuJUiIx1pHCMFCS.jpg',1,5,'2024-11-21 06:36:20','2024-11-21 06:36:20');
/*!40000 ALTER TABLE `vehicleimages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicleocuppants`
--

DROP TABLE IF EXISTS `vehicleocuppants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicleocuppants` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL,
  `vehicle_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `usertype_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vehicleocuppants_vehicle_id_foreign` (`vehicle_id`),
  KEY `vehicleocuppants_user_id_foreign` (`user_id`),
  KEY `vehicleocuppants_usertype_id_foreign` (`usertype_id`),
  CONSTRAINT `vehicleocuppants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `vehicleocuppants_usertype_id_foreign` FOREIGN KEY (`usertype_id`) REFERENCES `usertypes` (`id`),
  CONSTRAINT `vehicleocuppants_vehicle_id_foreign` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicleocuppants`
--

LOCK TABLES `vehicleocuppants` WRITE;
/*!40000 ALTER TABLE `vehicleocuppants` DISABLE KEYS */;
INSERT INTO `vehicleocuppants` VALUES (1,0,1,6,3,'2024-11-21 10:16:45','2024-11-21 22:38:38'),(2,0,1,8,3,'2024-11-21 10:55:55','2024-11-22 00:01:32'),(3,0,1,4,2,'2024-11-21 10:58:50','2024-11-21 11:06:47'),(4,0,1,10,2,'2024-11-21 11:09:54','2024-11-22 00:01:26'),(5,0,3,4,2,'2024-11-21 11:13:57','2024-11-21 11:17:36'),(6,0,1,6,3,'2024-11-21 22:39:15','2024-11-21 23:58:42'),(7,0,3,4,2,'2024-11-21 22:50:24','2024-11-22 06:36:11'),(8,0,1,6,3,'2024-11-22 00:02:01','2024-11-22 00:04:34'),(9,0,1,6,3,'2024-11-22 00:09:18','2024-11-22 00:09:21'),(10,0,1,6,3,'2024-11-22 00:09:47','2024-11-22 00:10:08'),(11,0,1,6,3,'2024-11-22 00:14:58','2024-11-22 00:18:02'),(12,0,1,6,3,'2024-11-22 00:21:09','2024-11-22 06:49:26'),(13,0,1,10,2,'2024-11-22 04:55:53','2024-11-22 06:36:24'),(14,0,1,3,3,'2024-11-22 04:57:45','2024-11-22 06:57:38'),(15,0,3,4,2,'2024-11-22 06:37:23','2024-11-22 06:37:44'),(16,0,1,4,2,'2024-11-22 06:37:44','2024-11-22 06:43:50'),(17,0,3,10,2,'2024-11-22 06:40:55','2024-11-22 06:45:40'),(18,0,3,8,3,'2024-11-22 06:43:29','2024-11-22 06:52:32'),(19,0,3,4,2,'2024-11-22 06:43:50','2024-11-22 07:02:51'),(20,0,1,10,2,'2024-11-22 06:45:40','2024-11-22 07:07:23'),(21,0,3,6,3,'2024-11-22 06:49:26','2024-11-22 08:15:15'),(22,0,1,8,3,'2024-11-22 06:52:32','2024-11-22 07:49:43'),(23,0,3,3,3,'2024-11-22 06:57:38','2024-11-22 08:19:35'),(24,0,1,4,2,'2024-11-22 07:02:51','2024-11-22 08:36:51'),(25,0,3,10,2,'2024-11-22 07:07:23','2024-11-22 07:11:41'),(26,0,1,10,2,'2024-11-22 07:11:41','2024-11-22 07:56:17'),(27,0,3,5,2,'2024-11-22 07:48:39','2024-11-22 07:50:14'),(28,0,1,5,2,'2024-11-22 07:50:14','2024-11-22 07:59:29'),(29,0,1,8,3,'2024-11-22 07:51:52','2024-11-22 08:19:32'),(30,0,3,10,2,'2024-11-22 08:03:07','2024-11-22 08:14:31'),(31,0,1,7,3,'2024-11-22 08:12:12','2024-11-22 08:51:59'),(32,0,3,10,2,'2024-11-22 08:16:14','2024-11-22 08:16:37'),(33,0,1,10,2,'2024-11-22 08:16:37','2024-11-22 08:18:01'),(34,0,3,8,3,'2024-11-22 08:19:32','2024-11-22 08:40:09'),(35,0,3,3,3,'2024-11-22 08:23:11','2024-11-22 08:23:18'),(36,0,3,3,3,'2024-11-22 08:23:25','2024-11-22 08:23:35'),(37,1,1,3,3,'2024-11-22 08:23:35','2024-11-22 08:23:35'),(38,0,1,6,3,'2024-11-22 08:36:35','2024-11-22 08:40:38'),(39,0,3,4,2,'2024-11-22 08:36:51','2024-11-22 08:52:21'),(40,1,1,8,3,'2024-11-22 08:40:34','2024-11-22 08:40:34'),(41,0,1,10,2,'2024-11-22 08:40:46','2024-11-22 08:42:45'),(42,0,1,6,3,'2024-11-22 08:43:04','2024-11-22 08:43:08'),(43,0,1,6,3,'2024-11-22 08:44:06','2024-11-22 08:47:10'),(44,0,1,6,3,'2024-11-22 08:47:16','2024-11-22 08:48:37'),(45,0,1,6,3,'2024-11-22 08:48:44','2024-11-22 08:51:30'),(46,0,1,10,2,'2024-11-22 08:52:06','2024-11-22 08:55:44'),(47,0,1,4,2,'2024-11-22 08:52:21','2024-11-22 08:52:41'),(48,0,3,4,2,'2024-11-22 08:52:50','2024-11-22 08:52:58'),(49,0,3,4,2,'2024-11-22 08:53:01','2024-11-22 09:01:38'),(50,0,3,10,2,'2024-11-22 08:55:44','2024-11-22 08:58:58'),(51,0,1,10,2,'2024-11-22 08:59:10','2024-11-22 09:05:38'),(52,0,1,4,2,'2024-11-22 09:01:38','2024-11-22 09:04:45'),(53,0,3,4,2,'2024-11-22 09:04:45','2024-11-23 07:28:50'),(54,0,3,6,3,'2024-11-22 09:06:01','2024-11-22 09:06:09'),(55,0,1,6,3,'2024-11-22 09:06:09','2024-11-22 09:06:37'),(56,0,3,7,3,'2024-11-22 09:06:19','2024-11-22 09:06:26'),(57,0,1,7,3,'2024-11-22 09:06:26','2024-11-22 09:07:01'),(58,0,3,7,3,'2024-11-22 09:07:01','2024-11-22 09:07:41'),(59,1,1,7,3,'2024-11-22 09:07:41','2024-11-22 09:07:41'),(60,0,1,6,3,'2024-11-22 09:07:48','2024-11-22 09:07:52'),(61,0,3,6,3,'2024-11-22 09:10:25','2024-11-22 09:18:34'),(62,0,1,10,2,'2024-11-22 09:14:41','2024-11-22 09:16:25'),(63,0,1,10,2,'2024-11-22 09:22:17','2024-11-23 08:11:45'),(64,1,3,6,3,'2024-11-23 07:29:29','2024-11-23 07:29:29'),(65,0,3,4,2,'2024-11-23 07:30:43','2024-11-23 07:30:57'),(66,1,3,10,2,'2024-11-23 08:11:45','2024-11-23 08:11:45'),(67,1,1,4,2,'2024-11-23 08:12:26','2024-11-23 08:12:26');
/*!40000 ALTER TABLE `vehicleocuppants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicleroutes`
--

DROP TABLE IF EXISTS `vehicleroutes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicleroutes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date_route` date NOT NULL,
  `time_route` time NOT NULL,
  `description` text DEFAULT NULL,
  `vehicle_id` bigint(20) unsigned NOT NULL,
  `route_id` bigint(20) unsigned NOT NULL,
  `schedule_id` bigint(20) unsigned NOT NULL,
  `routestatus_id` bigint(20) unsigned NOT NULL,
  `programming_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vehicleroutes_vehicle_id_foreign` (`vehicle_id`),
  KEY `vehicleroutes_route_id_foreign` (`route_id`),
  KEY `vehicleroutes_schedule_id_foreign` (`schedule_id`),
  KEY `vehicleroutes_routestatus_id_foreign` (`routestatus_id`),
  KEY `vehicleroutes_programming_id_foreign` (`programming_id`),
  CONSTRAINT `vehicleroutes_programming_id_foreign` FOREIGN KEY (`programming_id`) REFERENCES `programmings` (`id`),
  CONSTRAINT `vehicleroutes_route_id_foreign` FOREIGN KEY (`route_id`) REFERENCES `routes` (`id`),
  CONSTRAINT `vehicleroutes_routestatus_id_foreign` FOREIGN KEY (`routestatus_id`) REFERENCES `routestatus` (`id`),
  CONSTRAINT `vehicleroutes_schedule_id_foreign` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`),
  CONSTRAINT `vehicleroutes_vehicle_id_foreign` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicleroutes`
--

LOCK TABLES `vehicleroutes` WRITE;
/*!40000 ALTER TABLE `vehicleroutes` DISABLE KEYS */;
INSERT INTO `vehicleroutes` VALUES (2,'2024-12-01','12:00:00',NULL,1,1,1,1,4,'2024-12-02 02:16:06','2024-12-03 08:05:36'),(3,'2024-12-02','12:00:00',NULL,1,1,1,1,4,'2024-12-02 02:16:06','2024-12-03 08:05:36'),(4,'2024-12-03','12:00:00',NULL,1,1,1,1,4,'2024-12-02 02:16:06','2024-12-03 08:05:36'),(5,'2024-12-04','12:00:00',NULL,1,1,1,1,4,'2024-12-02 02:16:06','2024-12-03 08:05:36'),(6,'2024-12-05','12:00:00',NULL,1,1,1,1,4,'2024-12-02 02:16:06','2024-12-03 08:05:36'),(7,'2024-12-06','12:00:00',NULL,1,1,1,1,4,'2024-12-02 02:16:06','2024-12-03 08:05:36'),(8,'2024-12-06','08:00:00','',3,1,1,1,5,'2024-12-02 02:19:38','2024-12-02 02:19:38'),(9,'2024-12-07','08:00:00','',3,1,1,1,5,'2024-12-02 02:19:38','2024-12-02 02:19:38'),(10,'2024-12-08','08:00:00','',3,1,1,1,5,'2024-12-02 02:19:38','2024-12-02 02:19:38'),(11,'2024-12-09','10:00:00','',1,1,1,1,6,'2024-12-02 05:09:42','2024-12-02 05:09:42'),(12,'2024-12-10','10:00:00','',1,1,1,1,6,'2024-12-02 05:09:42','2024-12-02 05:09:42'),(13,'2024-12-11','10:00:00','',1,1,1,1,6,'2024-12-02 05:09:42','2024-12-02 05:09:42'),(14,'2024-12-12','10:00:00','',1,1,1,1,6,'2024-12-02 05:09:42','2024-12-02 05:09:42'),(15,'2024-12-13','10:00:00','',1,1,1,1,6,'2024-12-02 05:09:42','2024-12-02 05:09:42'),(16,'2024-12-14','15:00:00','',4,1,2,1,7,'2024-12-02 05:12:06','2024-12-02 05:12:06'),(17,'2024-12-15','15:00:00','',4,1,2,1,7,'2024-12-02 05:12:06','2024-12-02 05:12:06'),(18,'2024-11-25','08:00:00','',1,1,1,1,8,'2024-12-02 05:16:37','2024-12-02 05:16:37'),(19,'2024-11-26','08:00:00','',1,1,1,1,8,'2024-12-02 05:16:37','2024-12-02 05:16:37'),(20,'2024-11-27','08:00:00','',1,1,1,1,8,'2024-12-02 05:16:37','2024-12-02 05:16:37'),(21,'2024-11-28','08:00:00','',1,1,1,1,8,'2024-12-02 05:16:37','2024-12-02 05:16:37'),(22,'2024-11-29','08:00:00','',1,1,1,1,8,'2024-12-02 05:16:37','2024-12-02 05:16:37'),(23,'2024-11-30','16:00:00','',3,1,2,1,9,'2024-12-02 05:32:11','2024-12-02 05:32:11'),(24,'2024-12-01','16:00:00','',3,1,2,1,9,'2024-12-02 05:32:11','2024-12-02 05:32:11'),(25,'2024-11-23','20:00:00','SE CAMBIO PORQUE VEHICULO 03 ESTABA EN MANTENIMIENTO',1,1,3,2,10,'2024-12-02 05:37:15','2024-12-02 05:47:59'),(26,'2024-11-25','15:00:00','prueba',4,1,2,2,10,'2024-12-02 05:37:15','2024-12-02 11:15:27'),(27,'2024-11-25','08:00:00','',5,1,1,1,11,'2024-12-02 08:07:00','2024-12-02 08:07:00'),(28,'2024-11-01','15:00:00','',1,1,2,1,12,'2024-12-02 08:44:46','2024-12-02 08:44:46'),(29,'2024-11-02','15:00:00','',1,1,2,1,12,'2024-12-02 08:44:46','2024-12-02 08:44:46'),(30,'2024-11-04','10:00:00','',1,1,1,1,13,'2024-12-02 08:46:55','2024-12-02 08:46:55'),(31,'2024-11-05','10:00:00','',1,1,1,1,13,'2024-12-02 08:46:55','2024-12-02 08:46:55'),(32,'2024-11-06','10:00:00','',1,1,1,1,13,'2024-12-02 08:46:55','2024-12-02 08:46:55'),(33,'2024-11-07','10:00:00','',1,1,1,1,13,'2024-12-02 08:46:55','2024-12-02 08:46:55'),(34,'2024-11-08','10:00:00','',1,1,1,1,13,'2024-12-02 08:46:55','2024-12-02 08:46:55'),(35,'2024-11-11','10:00:00','',1,1,1,1,13,'2024-12-02 08:46:55','2024-12-02 08:46:55'),(36,'2024-10-18','15:00:00','',1,1,2,1,14,'2024-12-02 08:59:38','2024-12-02 08:59:38'),(37,'2024-10-21','15:00:00','',1,1,2,1,14,'2024-12-02 08:59:38','2024-12-02 08:59:38'),(38,'2024-10-22','15:00:00','',1,1,2,1,14,'2024-12-02 08:59:38','2024-12-02 08:59:38'),(39,'2024-10-23','15:00:00','',1,1,2,1,14,'2024-12-02 08:59:38','2024-12-02 08:59:38'),(40,'2024-10-24','15:00:00','',1,1,2,1,14,'2024-12-02 08:59:38','2024-12-02 08:59:38'),(41,'2024-10-25','15:00:00','',1,1,2,1,14,'2024-12-02 08:59:38','2024-12-02 08:59:38'),(42,'2024-10-28','15:00:00','',1,1,2,1,14,'2024-12-02 08:59:38','2024-12-02 08:59:38'),(43,'2024-01-01','20:00:00','',1,1,3,1,16,'2024-12-02 09:34:06','2024-12-02 09:34:06'),(44,'2024-01-02','20:00:00','',1,1,3,1,16,'2024-12-02 09:34:06','2024-12-02 09:34:06'),(45,'2024-01-03','20:00:00','',1,1,3,1,16,'2024-12-02 09:34:06','2024-12-02 09:34:06'),(46,'2024-01-04','20:00:00','',1,1,3,1,16,'2024-12-02 09:34:06','2024-12-02 09:34:06'),(47,'2024-01-05','20:00:00','',1,1,3,1,16,'2024-12-02 09:34:06','2024-12-02 09:34:06'),(48,'2024-01-08','20:00:00','',1,1,3,1,16,'2024-12-02 09:34:06','2024-12-02 09:34:06'),(49,'2024-10-01','15:00:00','',4,1,2,1,17,'2024-12-02 09:42:36','2024-12-02 09:42:36'),(50,'2024-10-03','15:00:00','',4,1,2,1,17,'2024-12-02 09:42:36','2024-12-02 09:42:36'),(51,'2024-10-05','15:00:00','',4,1,2,1,17,'2024-12-02 09:42:36','2024-12-02 09:42:36'),(52,'2024-10-07','15:00:00','',4,1,2,1,17,'2024-12-02 09:42:36','2024-12-02 09:42:36'),(53,'2024-10-09','15:00:00','',4,1,2,1,17,'2024-12-02 09:42:36','2024-12-02 09:42:36'),(54,'2024-10-10','15:00:00','',4,1,2,1,18,'2024-12-02 09:44:38','2024-12-02 09:44:38'),(55,'2024-10-12','15:00:00','',4,1,2,1,18,'2024-12-02 09:44:38','2024-12-02 09:44:38'),(56,'2024-10-14','15:00:00','',4,1,2,1,18,'2024-12-02 09:44:38','2024-12-02 09:44:38'),(57,'2024-12-01','20:00:00',NULL,7,1,1,1,19,'2024-12-02 11:27:00','2024-12-03 09:52:08'),(58,'2024-12-03','20:00:00',NULL,7,1,1,1,19,'2024-12-02 11:27:00','2024-12-03 09:52:08'),(59,'2024-12-05','20:00:00',NULL,7,1,1,1,19,'2024-12-02 11:27:00','2024-12-03 09:52:08'),(60,'2024-12-07','20:00:00',NULL,7,1,1,1,19,'2024-12-02 11:27:00','2024-12-03 09:52:08'),(61,'2024-12-09','20:00:00',NULL,7,1,1,1,19,'2024-12-02 11:27:00','2024-12-03 09:52:08'),(62,'2024-11-01','09:00:00',NULL,1,1,1,1,20,'2024-12-02 11:28:09','2024-12-03 07:59:01'),(63,'2024-11-04','09:00:00',NULL,1,1,1,1,20,'2024-12-02 11:28:09','2024-12-03 07:59:01'),(64,'2024-11-05','09:00:00',NULL,1,1,1,1,20,'2024-12-02 11:28:09','2024-12-03 07:59:01'),(65,'2024-11-06','09:00:00',NULL,1,1,1,1,20,'2024-12-02 11:28:09','2024-12-03 07:59:01'),(66,'2024-11-07','09:00:00',NULL,1,1,1,1,20,'2024-12-02 11:28:09','2024-12-03 07:59:01'),(67,'2024-11-08','09:00:00',NULL,1,1,1,1,20,'2024-12-02 11:28:09','2024-12-03 07:59:01'),(68,'2024-11-11','09:00:00',NULL,1,1,1,1,20,'2024-12-02 11:28:09','2024-12-03 07:59:01'),(69,'2025-01-01','20:00:00',NULL,1,1,1,2,21,'2024-12-03 02:30:30','2024-12-03 07:55:48'),(70,'2025-01-02','20:00:00',NULL,1,1,1,2,21,'2024-12-03 02:30:30','2024-12-03 07:55:48'),(71,'2025-01-03','20:00:00',NULL,1,1,1,2,21,'2024-12-03 02:30:30','2024-12-03 07:55:48'),(72,'2025-01-04','20:00:00',NULL,1,1,1,2,21,'2024-12-03 02:43:49','2024-12-03 07:55:48'),(73,'2025-01-05','20:00:00',NULL,1,1,1,2,21,'2024-12-03 02:43:49','2024-12-03 07:55:48'),(74,'2024-11-02','09:00:00',NULL,1,1,1,1,20,'2024-12-03 02:59:13','2024-12-03 07:59:01'),(75,'2024-11-03','09:00:00',NULL,1,1,1,1,20,'2024-12-03 02:59:13','2024-12-03 07:59:01'),(76,'2024-11-09','09:00:00',NULL,1,1,1,1,20,'2024-12-03 02:59:13','2024-12-03 07:59:01'),(77,'2024-11-10','09:00:00',NULL,1,1,1,1,20,'2024-12-03 02:59:13','2024-12-03 07:59:01'),(78,'2024-12-02','20:00:00',NULL,7,1,1,1,19,'2024-12-03 03:04:03','2024-12-03 09:52:08'),(79,'2024-12-04','20:00:00',NULL,7,1,1,1,19,'2024-12-03 03:04:03','2024-12-03 09:52:08'),(80,'2024-12-06','20:00:00',NULL,7,1,1,1,19,'2024-12-03 03:04:03','2024-12-03 09:52:08'),(81,'2024-12-08','20:00:00',NULL,7,1,1,1,19,'2024-12-03 03:04:03','2024-12-03 09:52:08'),(82,'2024-12-10','20:00:00',NULL,7,1,1,1,19,'2024-12-03 03:04:03','2024-12-03 09:52:08'),(83,'2025-01-06','20:00:00',NULL,1,1,1,2,21,'2024-12-03 03:05:45','2024-12-03 07:55:48'),(84,'2025-01-07','20:00:00',NULL,1,1,1,2,21,'2024-12-03 03:05:45','2024-12-03 07:55:48'),(85,'2025-01-08','20:00:00',NULL,1,1,1,2,21,'2024-12-03 03:05:45','2024-12-03 07:55:48'),(86,'2025-01-09','20:00:00',NULL,1,1,1,2,21,'2024-12-03 03:05:45','2024-12-03 07:55:48'),(87,'2025-01-10','20:00:00',NULL,1,1,1,2,21,'2024-12-03 03:05:45','2024-12-03 07:55:48'),(88,'2025-01-11','20:00:00',NULL,1,1,1,2,21,'2024-12-03 03:05:45','2024-12-03 07:55:48'),(89,'2025-01-12','20:00:00',NULL,1,1,1,2,21,'2024-12-03 03:05:45','2024-12-03 07:55:48'),(90,'2025-01-13','20:00:00',NULL,1,1,1,2,21,'2024-12-03 03:05:45','2024-12-03 07:55:48'),(91,'2025-01-14','20:00:00',NULL,1,1,1,2,21,'2024-12-03 03:05:45','2024-12-03 07:55:48'),(92,'2025-01-15','20:00:00',NULL,1,1,1,2,21,'2024-12-03 03:05:45','2024-12-03 07:55:48'),(93,'2025-01-16','20:00:00',NULL,1,1,1,2,21,'2024-12-03 03:05:45','2024-12-03 07:55:48'),(94,'2025-01-17','20:00:00',NULL,1,1,1,2,21,'2024-12-03 03:05:45','2024-12-03 07:55:48'),(95,'2025-01-18','20:00:00',NULL,1,1,1,2,21,'2024-12-03 03:05:45','2024-12-03 07:55:48'),(96,'2025-01-19','20:00:00',NULL,1,1,1,2,21,'2024-12-03 03:05:45','2024-12-03 07:55:48'),(97,'2025-01-20','20:00:00',NULL,1,1,1,2,21,'2024-12-03 03:05:45','2024-12-03 07:55:48'),(98,'2025-01-21','20:00:00',NULL,1,1,1,2,21,'2024-12-03 03:05:45','2024-12-03 07:55:48'),(99,'2025-01-22','20:00:00',NULL,1,1,1,2,21,'2024-12-03 03:05:45','2024-12-03 07:55:48'),(100,'2025-01-23','20:00:00',NULL,1,1,1,2,21,'2024-12-03 03:05:45','2024-12-03 07:55:48'),(101,'2025-01-24','20:00:00',NULL,1,1,1,2,21,'2024-12-03 03:05:45','2024-12-03 07:55:48'),(102,'2025-01-25','20:00:00',NULL,1,1,1,2,21,'2024-12-03 03:05:45','2024-12-03 07:55:48'),(103,'2025-01-26','20:00:00',NULL,1,1,1,2,21,'2024-12-03 03:05:45','2024-12-03 07:55:48'),(104,'2025-01-27','20:00:00',NULL,1,1,1,2,21,'2024-12-03 03:05:45','2024-12-03 07:55:48'),(105,'2025-01-28','20:00:00',NULL,1,1,1,2,21,'2024-12-03 03:05:45','2024-12-03 07:55:48'),(106,'2025-01-29','20:00:00',NULL,1,1,1,2,21,'2024-12-03 03:05:45','2024-12-03 07:55:48'),(107,'2025-01-30','20:00:00',NULL,1,1,1,2,21,'2024-12-03 03:05:45','2024-12-03 07:55:48'),(108,'2025-01-31','20:00:00',NULL,1,1,1,2,21,'2024-12-03 03:05:45','2024-12-03 07:55:48'),(109,'2024-01-01','20:00:00','',7,1,3,1,22,'2024-12-03 09:22:11','2024-12-03 09:22:11'),(110,'2024-01-02','20:00:00','',7,1,3,1,22,'2024-12-03 09:22:11','2024-12-03 09:22:11'),(111,'2024-01-03','20:00:00','',7,1,3,1,22,'2024-12-03 09:22:11','2024-12-03 09:22:11'),(112,'2024-01-04','20:00:00','',7,1,3,1,22,'2024-12-03 09:30:50','2024-12-03 09:30:50'),(113,'2024-01-05','20:00:00','',7,1,3,1,22,'2024-12-03 09:30:50','2024-12-03 09:30:50'),(114,'2025-02-03','15:00:00','',7,1,2,1,23,'2024-12-03 09:33:08','2024-12-03 09:33:08'),(115,'2025-02-04','15:00:00','',7,1,2,1,23,'2024-12-03 09:33:08','2024-12-03 09:33:08'),(116,'2025-02-05','15:00:00','',7,1,2,1,23,'2024-12-03 09:33:08','2024-12-03 09:33:08'),(117,'2025-02-06','15:00:00','',7,1,2,1,23,'2024-12-03 09:33:08','2024-12-03 09:33:08'),(118,'2025-02-07','15:00:00','',7,1,2,1,23,'2024-12-03 09:33:08','2024-12-03 09:33:08'),(119,'2025-02-10','15:00:00','',7,1,2,1,23,'2024-12-03 09:33:08','2024-12-03 09:33:08'),(120,'2025-02-11','15:00:00','',7,1,2,1,23,'2024-12-03 09:33:08','2024-12-03 09:33:08'),(121,'2025-02-12','15:00:00','',7,1,2,1,23,'2024-12-03 09:33:08','2024-12-03 09:33:08'),(122,'2025-02-13','15:00:00','',7,1,2,1,23,'2024-12-03 09:33:08','2024-12-03 09:33:08'),(123,'2025-02-14','15:00:00','',7,1,2,1,23,'2024-12-03 09:33:08','2024-12-03 09:33:08'),(124,'2025-02-01','15:00:00','',7,1,2,1,23,'2024-12-03 09:34:50','2024-12-03 09:34:50'),(125,'2025-02-02','15:00:00','',7,1,2,1,23,'2024-12-03 09:34:50','2024-12-03 09:34:50'),(126,'2025-02-08','15:00:00','',7,1,2,1,23,'2024-12-03 09:34:50','2024-12-03 09:34:50'),(127,'2025-02-09','15:00:00','',7,1,2,1,23,'2024-12-03 09:34:50','2024-12-03 09:34:50'),(128,'2025-02-15','15:00:00','',7,1,2,1,23,'2024-12-03 09:34:50','2024-12-03 09:34:50'),(129,'2025-02-16','15:00:00','',7,1,2,1,23,'2024-12-03 09:34:50','2024-12-03 09:34:50'),(130,'2025-02-17','15:00:00','',7,1,2,1,23,'2024-12-03 09:34:50','2024-12-03 09:34:50'),(131,'2025-02-18','15:00:00','',7,1,2,1,23,'2024-12-03 09:34:50','2024-12-03 09:34:50'),(132,'2025-02-19','15:00:00','',7,1,2,1,23,'2024-12-03 09:34:50','2024-12-03 09:34:50'),(133,'2025-02-20','15:00:00','',7,1,2,1,23,'2024-12-03 09:34:50','2024-12-03 09:34:50'),(134,'2025-02-21','15:00:00','',7,1,2,1,23,'2024-12-03 09:34:50','2024-12-03 09:34:50'),(135,'2025-02-22','15:00:00','',7,1,2,1,23,'2024-12-03 09:34:50','2024-12-03 09:34:50'),(136,'2025-02-23','15:00:00','',7,1,2,1,23,'2024-12-03 09:34:50','2024-12-03 09:34:50'),(137,'2025-02-24','15:00:00','',7,1,2,1,23,'2024-12-03 09:34:50','2024-12-03 09:34:50'),(138,'2025-02-25','15:00:00','',7,1,2,1,23,'2024-12-03 09:34:50','2024-12-03 09:34:50'),(139,'2025-02-26','15:00:00','',7,1,2,1,23,'2024-12-03 09:34:50','2024-12-03 09:34:50'),(140,'2025-02-27','15:00:00','',7,1,2,1,23,'2024-12-03 09:34:50','2024-12-03 09:34:50'),(141,'2025-02-28','15:00:00','',7,1,2,1,23,'2024-12-03 09:34:50','2024-12-03 09:34:50'),(142,'2024-03-01','15:00:00','',1,1,2,1,24,'2024-12-03 09:52:53','2024-12-03 09:52:53'),(143,'2024-03-03','15:00:00','',1,1,2,1,24,'2024-12-03 09:52:53','2024-12-03 09:52:53'),(144,'2024-03-05','15:00:00','',1,1,2,1,24,'2024-12-03 09:52:53','2024-12-03 09:52:53'),(145,'2024-03-07','15:00:00','',1,1,2,1,24,'2024-12-03 09:52:53','2024-12-03 09:52:53'),(146,'2024-03-09','15:00:00','',1,1,2,1,24,'2024-12-03 09:52:53','2024-12-03 09:52:53'),(147,'2024-03-11','15:00:00','',1,1,2,1,24,'2024-12-03 09:52:53','2024-12-03 09:52:53'),(148,'2024-03-13','15:00:00','',1,1,2,1,24,'2024-12-03 09:52:53','2024-12-03 09:52:53'),(149,'2024-03-15','15:00:00','',1,1,2,1,24,'2024-12-03 09:52:53','2024-12-03 09:52:53'),(150,'2024-03-02','15:00:00','',1,1,2,1,24,'2024-12-03 09:53:53','2024-12-03 09:53:53'),(151,'2024-03-04','15:00:00','',1,1,2,1,24,'2024-12-03 09:53:53','2024-12-03 09:53:53'),(152,'2024-03-06','15:00:00','',1,1,2,1,24,'2024-12-03 09:53:53','2024-12-03 09:53:53'),(153,'2024-03-08','15:00:00','',1,1,2,1,24,'2024-12-03 09:53:53','2024-12-03 09:53:53'),(154,'2024-03-10','15:00:00','',1,1,2,1,24,'2024-12-03 09:53:53','2024-12-03 09:53:53'),(155,'2024-03-12','15:00:00','',1,1,2,1,24,'2024-12-03 09:53:53','2024-12-03 09:53:53'),(156,'2024-03-14','15:00:00','',1,1,2,1,24,'2024-12-03 09:53:53','2024-12-03 09:53:53'),(157,'2024-03-16','15:00:00','',1,1,2,1,24,'2024-12-03 09:54:56','2024-12-03 09:54:56'),(158,'2024-03-17','15:00:00','',1,1,2,1,24,'2024-12-03 09:54:56','2024-12-03 09:54:56'),(159,'2024-03-18','15:00:00','',1,1,2,1,24,'2024-12-03 09:54:56','2024-12-03 09:54:56'),(160,'2024-03-19','15:00:00','',1,1,2,1,24,'2024-12-03 09:54:56','2024-12-03 09:54:56'),(161,'2024-03-20','15:00:00','',1,1,2,1,24,'2024-12-03 09:54:56','2024-12-03 09:54:56');
/*!40000 ALTER TABLE `vehicleroutes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `code` varchar(100) DEFAULT NULL,
  `plate` varchar(10) NOT NULL,
  `year` varchar(10) NOT NULL,
  `occupant_capacity` int(11) NOT NULL,
  `load_capacity` double NOT NULL,
  `description` text DEFAULT NULL,
  `status` int(11) NOT NULL,
  `brand_id` bigint(20) unsigned NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  `type_id` bigint(20) unsigned NOT NULL,
  `color_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vehicles_brand_id_foreign` (`brand_id`),
  KEY `vehicles_model_id_foreign` (`model_id`),
  KEY `vehicles_type_id_foreign` (`type_id`),
  KEY `vehicles_color_id_foreign` (`color_id`),
  CONSTRAINT `vehicles_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  CONSTRAINT `vehicles_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `vehiclecolors` (`id`),
  CONSTRAINT `vehicles_model_id_foreign` FOREIGN KEY (`model_id`) REFERENCES `brandmodels` (`id`),
  CONSTRAINT `vehicles_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `vehicletypes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicles`
--

LOCK TABLES `vehicles` WRITE;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` VALUES (1,'VEHICULO 01','VH001','VTH-001','2024',4,1,'Nuevo camión',1,1,1,2,4,'2024-11-19 02:06:41','2024-11-22 07:51:29'),(3,'VEHICULO 02','VH002','VKR-002','2023',2,2,NULL,1,2,2,2,4,'2024-11-19 02:13:23','2024-11-22 08:14:57'),(4,'VEHICULO 03','VH003','VVV-001','1970',2,1,NULL,0,1,6,3,4,'2024-11-19 02:59:08','2024-11-21 05:14:02'),(5,'VEHICULO 04','VH004','FGV-004','1971',2,1,NULL,0,2,2,1,1,'2024-11-19 03:49:05','2024-11-19 03:55:16'),(6,'VEHICULO 05','VH005','VT5-005','2024',2,1,NULL,0,1,1,1,6,'2024-11-19 09:06:23','2024-11-21 03:21:27'),(7,'vehiculo 06','VH006','ADC-006','2023',2,1,NULL,0,1,1,1,1,'2024-11-23 07:25:38','2024-11-23 07:25:38');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicletypes`
--

DROP TABLE IF EXISTS `vehicletypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicletypes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicletypes`
--

LOCK TABLES `vehicletypes` WRITE;
/*!40000 ALTER TABLE `vehicletypes` DISABLE KEYS */;
INSERT INTO `vehicletypes` VALUES (1,'Carga lateral','lateral','2024-11-18 22:30:33','2024-11-19 01:36:15'),(2,'Carga trasera',NULL,'2024-11-18 22:30:33','2024-11-18 22:30:33'),(3,'Carga trasera con grúa',NULL,'2024-11-18 22:30:33','2024-11-18 22:30:33');
/*!40000 ALTER TABLE `vehicletypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonecoords`
--

DROP TABLE IF EXISTS `zonecoords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zonecoords` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `zone_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `zonecoords_zone_id_foreign` (`zone_id`),
  CONSTRAINT `zonecoords_zone_id_foreign` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonecoords`
--

LOCK TABLES `zonecoords` WRITE;
/*!40000 ALTER TABLE `zonecoords` DISABLE KEYS */;
INSERT INTO `zonecoords` VALUES (1,-6.759132788108285,-79.83917835581968,1,'2024-11-19 09:14:04','2024-11-19 09:14:04'),(2,-6.759159423776388,-79.83870092261536,1,'2024-11-19 09:14:13','2024-11-19 09:14:13'),(3,-6.760027745752294,-79.8388082109756,1,'2024-11-19 09:14:25','2024-11-19 09:14:25'),(4,-6.760001110132052,-79.83926955092656,1,'2024-11-19 09:14:34','2024-11-19 09:14:34'),(5,-6.759921203262513,-79.83978989947508,2,'2024-11-19 09:15:22','2024-11-19 09:15:22'),(6,-6.759979801634793,-79.8393017374343,2,'2024-11-19 09:15:29','2024-11-19 09:15:29'),(7,-6.760821486561943,-79.83939829695854,2,'2024-11-19 09:15:40','2024-11-19 09:15:40'),(8,-6.7607841967544,-79.83984890807349,2,'2024-11-19 09:15:48','2024-11-19 09:15:48'),(13,-6.771364371626274,-79.84372184155579,5,'2024-12-01 12:07:11','2024-12-01 12:07:11'),(14,-6.781144642366901,-79.84500930188317,5,'2024-12-01 12:07:30','2024-12-01 12:07:30'),(15,-6.781938348444233,-79.84270796654822,5,'2024-12-01 12:07:46','2024-12-01 12:07:46'),(16,-6.779551899381723,-79.84245047448258,5,'2024-12-01 12:07:59','2024-12-01 12:07:59'),(17,-6.779605168462953,-79.84074458954952,5,'2024-12-01 12:08:09','2024-12-01 12:08:09'),(18,-6.778667631773112,-79.83901724694441,5,'2024-12-01 12:08:19','2024-12-01 12:08:19'),(19,-6.771881090238806,-79.83845934746891,5,'2024-12-01 12:08:39','2024-12-01 12:08:39'),(20,-6.778619689507,-79.83897969601746,6,'2024-12-01 12:09:36','2024-12-01 12:09:36'),(21,-6.776771245166942,-79.83564839242051,6,'2024-12-01 12:09:52','2024-12-01 12:09:52'),(22,-6.779157707997539,-79.83476862786412,6,'2024-12-01 12:10:07','2024-12-01 12:10:07'),(23,-6.77902986207394,-79.83396932957754,6,'2024-12-01 12:10:15','2024-12-01 12:10:15'),(24,-6.776291820405355,-79.83386204121739,6,'2024-12-01 12:10:32','2024-12-01 12:10:32'),(25,-6.776291820405355,-79.83386204121739,6,'2024-12-01 12:10:33','2024-12-01 12:10:33'),(26,-6.775631278842143,-79.83878657696835,6,'2024-12-01 12:10:48','2024-12-01 12:10:48');
/*!40000 ALTER TABLE `zonecoords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zones`
--

DROP TABLE IF EXISTS `zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zones` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `area` double DEFAULT NULL,
  `description` text DEFAULT NULL,
  `sector_id` bigint(20) unsigned NOT NULL,
  `district_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `zones_sector_id_foreign` (`sector_id`),
  KEY `zones_district_id_foreign` (`district_id`),
  CONSTRAINT `zones_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`),
  CONSTRAINT `zones_sector_id_foreign` FOREIGN KEY (`sector_id`) REFERENCES `sectors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zones`
--

LOCK TABLES `zones` WRITE;
/*!40000 ALTER TABLE `zones` DISABLE KEYS */;
INSERT INTO `zones` VALUES (1,'ZONA 01',250,NULL,1,1,'2024-11-19 09:13:44','2024-11-19 09:32:28'),(2,'ZONA 02',100,NULL,1,1,'2024-11-19 09:15:04','2024-11-19 09:15:04'),(5,'ZONA 03',1000,NULL,1,1,'2024-12-01 12:06:33','2024-12-01 12:08:58'),(6,'ZONA 04',300,NULL,1,1,'2024-12-01 12:09:16','2024-12-01 12:09:16');
/*!40000 ALTER TABLE `zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'recicla_usat'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_assignmenthistorical` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_assignmenthistorical`(IN _operacion INT)
begin
	IF _operacion = 1 THEN
		SELECT v.id, u.name AS uname, u2.name AS utname,
		CASE 
			WHEN v.status = 1 THEN 'Activo'
			ELSE 'Inactivo' 
		END AS status, v2.name AS vname, v.created_at 
		FROM vehicleocuppants v INNER JOIN vehicles v2 ON v.vehicle_id = v2.id
		INNER JOIN users u ON v.user_id = u.id
		INNER JOIN usertypes u2 ON v.usertype_id = u2.id;
	END IF;

	IF _operacion = 2 THEN
		SELECT v.id, u.name AS uname, u2.name AS utname,
		CASE 
			WHEN v.status = 1 THEN 'Activo'
			ELSE 'Inactivo' 
		END AS status, v2.name AS vname, v.created_at
		FROM vehicleocuppants v INNER JOIN vehicles v2 ON v.vehicle_id = v2.id
		INNER JOIN users u ON v.user_id = u.id
		INNER JOIN usertypes u2 ON v.usertype_id = u2.id
		where v.status = 1;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dates` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_dates`(IN _id BIGINT)
begin
	select s.id as id, s.`date` as date, s.description as description, m3.name as status, s.logo as logo
	from schedulesdates s inner join maintenanceschedules m on s.maintenanceschedules_id = m.id
	inner join maintenances m2 on s.maintenances_id = m2.id 
	inner join maintenancestatus m3 on s.maintenancestatus_id = m3.id 
	where m.id = _id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_maintenaces` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_maintenaces`()
begin
	select m.name as mname, m.startdate as startdate, m.lastdate as lastdate, m2.name as sname, s.`date` as date, 
	m2.time_start as time_start, m2.time_end as time_end, m3.name as tname, v.name as vname, u.name as uname
	from maintenances m inner join maintenanceschedules m2 on m.id = m2.maintenance_id
	inner join maintenancetypes m3 on m2.maintenancetype_id = m3.id 
	inner join vehicles v on m2.vehicle_id = v.id 
	left join users u on m2.user_id = u.id
	inner join schedulesdates s on m2.id = s.maintenanceschedules_id 
	inner join maintenancestatus m4 on s.maintenancestatus_id = m4.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_programming` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_programming`()
begin
	select p.id as id, p.startdate as startdate, p.lastdate as lastdate, v.name as vehicle, r.name as route, 
	vr.time_route as time_route, s.name as sname, rs.name as status, vr.description as description
	from vehicleroutes vr
	inner join routes r on vr.route_id=r.id
	inner join vehicles v on vr.vehicle_id=v.id
	inner join programmings p on vr.programming_id=p.id 
	inner join routestatus rs on vr.routestatus_id=rs.id
	inner join schedules s on vr.schedule_id = s.id
	group by p.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_programmingday` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_programmingday`(IN _id BIGINT)
begin
	select vr.id as id, vr.date_route as date_route , v.name as vehicle, r.name as route, 
	vr.time_route as time_route, s.name as sname, rs.name as status, vr.description as description
	from vehicleroutes vr
	inner join routes r on vr.route_id=r.id
	inner join vehicles v on vr.vehicle_id=v.id
	inner join programmings p on vr.programming_id=p.id 
	inner join routestatus rs on vr.routestatus_id=rs.id
	inner join schedules s on vr.schedule_id = s.id
	where p.id = _id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_programmingsearch` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_programmingsearch`(IN _vehicle_id INT, IN _route_id INT, IN _startdate DATE, IN _lastdate DATE)
begin
	select vr.id as id, vr.date_route as date_route, v.name as vehicle, r.name as route, 
	vr.time_route as time_route, s.name as sname, rs.name as status, vr.description as description
	from vehicleroutes vr
	inner join routes r on vr.route_id=r.id
	inner join vehicles v on vr.vehicle_id=v.id
	inner join programmings p on vr.programming_id=p.id 
	inner join routestatus rs on vr.routestatus_id=rs.id
	inner join schedules s on vr.schedule_id = s.id 
	WHERE vr.vehicle_id = _vehicle_id AND vr.route_id = _route_id AND vr.date_route BETWEEN _startdate  AND _lastdate;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_routezones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_routezones`(IN _operacion INT, IN _id BIGINT)
begin
	if _operacion = 1 then 
		SELECT zones.id, zones.name
		FROM zones
		LEFT JOIN routezones ON zones.id = routezones.zone_id AND routezones.route_id = _id
		WHERE routezones.id IS NULL;
	end if;
	
	if _operacion = 2 then 
		select r2.id as routezone_id, z.name as zone_name
		from routes r inner join routezones r2 ON r.id  = r2.route_id inner join zones z on r2.zone_id = z.id 
		where r.id = _id;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_schedules` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_schedules`(IN _operacion INT, IN _id BIGINT)
begin
	IF _operacion = 1 THEN
		select m.id, m.name as name, v.name as vehiclenames, u.name as usernames, m3.name as maintenancetypes, 
        m.time_start as time_start, m.time_end as time_end
        from maintenanceschedules m inner join maintenances m2 on m.maintenance_id = m2.id
        inner join vehicles v on m.vehicle_id = v.id 
        left join users u on m.user_id = u.id 
        inner join maintenancetypes m3 on m.maintenancetype_id = m3.id
        where m2.id = _id;
    END IF;
   
   IF _operacion = 2 then
   		select m.id as id, m.name as name, m.time_start as time_start, m.time_end as time_end,
	   	m2.id as maintenance_id, m2.name as mname, m2.startdate as startdate, m2.lastdate as lastdate, m3.name as tname
	   	from maintenanceschedules m inner join maintenances m2 on m.maintenance_id = m2.id 
	   	inner join vehicles v on m.vehicle_id = v.id 
	   	left join users u on m.user_id = u.id 
	   	inner join maintenancetypes m3 on m.maintenancetype_id = m3.id 
	   	where m.id = _id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_searchmassedition` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_searchmassedition`(IN _vehicle_id INT, IN _route_id INT, IN _startdate DATE, IN _lastdate DATE)
begin
	select vr.id as id, p.startdate as startdate, p.lastdate as lastdate, v.name as vehicle, r.name as route, 
	vr.time_route as time_route, s.name as sname, rs.name as status, vr.description as description
	from vehicleroutes vr
	inner join routes r on vr.route_id=r.id
	inner join vehicles v on vr.vehicle_id=v.id
	inner join programmings p on vr.programming_id=p.id 
	inner join routestatus rs on vr.routestatus_id=rs.id
	inner join schedules s on vr.schedule_id = s.id 
	where vr.vehicle_id= _vehicle_id and vr.route_id= _route_id and vr.date_route between _startdate and _lastdate
	group by p.startdate = _startdate and p.lastdate = _lastdate;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_search_if_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_search_if_exist`(IN p_vehicle_id INT,
    IN p_route_id INT,
    IN p_startdate DATE,
    IN p_lastdate DATE,
    OUT p_exist INT)
begin
	-- Contar las filas que coincidan con los parámetros
    SELECT COUNT(*) INTO p_exist
    FROM vehicleroutes
    WHERE vehicle_id = p_vehicle_id
    AND route_id = p_route_id
    AND date_route BETWEEN p_startdate AND p_lastdate;

    -- Si existen registros, p_exist será 1, de lo contrario será 0
    IF p_exist > 0 THEN
        SET p_exist = 1;
    ELSE
        SET p_exist = 0;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_users` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_users`()
begin
	SELECT u.id as id, u.name as name, u.dni as dni, u.profile_photo_path as logo,
	u.license as license, u.email as email, u2.name AS tname
	FROM users u LEFT JOIN usertypes u2 ON u.usertype_id = u2.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_vehicles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_vehicles`(IN _operacion INT, IN _id BIGINT)
begin
	IF _operacion = 1 THEN
		select v.id,v3.image as logo, v.name as name, b.name as brand, b2.name as model, 
		v2.name as vtype, v.plate as plate, v.status as status  
		from vehicles v 
		inner join brands b on v.brand_id = b.id 
		inner join brandmodels b2 on v.model_id = b2.id 
		inner join vehicletypes v2 on v.type_id = v2.id 
		left join vehicleimages v3 on (v.id = v3.vehicle_id and v3.profile=1);
	END IF;

	IF _operacion = 2 then
		select v.id, v.name as name, v.plate as plate, b.name as brand, b2.name as model,
		v2.name as vtype, v.occupant_capacity, v.load_capacity, v.status as status
		from vehicles v
		inner join brands b on v.brand_id = b.id 
		inner join brandmodels b2 on v.model_id = b2.id
		inner join vehicletypes v2 on v.type_id = v2.id
		WHERE v.id = _id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_zones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_zones`(IN _operacion INT, IN _id BIGINT)
begin
	IF _operacion = 1 THEN
        SELECT z.id AS id, z.name AS name, z.area AS area, s.name AS sector, z.description AS description 
        FROM zones z 
        INNER JOIN sectors s ON z.sector_id = s.id;
    END IF;

    IF _operacion = 2 THEN
        SELECT z.id AS id, z.name AS name, z.area AS area, s.name AS sector, z.description AS description 
        FROM zones z 
        INNER JOIN sectors s ON z.sector_id = s.id
        WHERE z.id = _id;
    END IF;

    IF _operacion = 3 THEN
        SELECT s.name AS name, z.name as zone, z2.latitude AS latitude, z2.longitude AS longitude
        FROM sectors s
        INNER JOIN zones z ON s.id = z.sector_id
        INNER JOIN zonecoords z2 ON z.id = z2.zone_id
        WHERE s.id = _id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-03 12:46:38
