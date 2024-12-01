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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2012_10_31_003627_create_departments_table',1),(2,'2012_10_31_003651_create_provinces_table',1),(3,'2012_10_31_003714_create_districts_table',1),(4,'2013_10_31_003754_create_sectors_table',1),(5,'2013_10_31_003802_create_zones_table',1),(6,'2013_10_31_013935_create_usertypes_table',1),(7,'2014_10_12_000000_create_users_table',1),(8,'2014_10_12_100000_create_password_reset_tokens_table',1),(9,'2014_10_12_200000_add_two_factor_columns_to_users_table',1),(10,'2019_08_19_000000_create_failed_jobs_table',1),(11,'2019_12_14_000001_create_personal_access_tokens_table',1),(12,'2024_09_28_003930_create_sessions_table',1),(13,'2024_09_28_014520_create_brands_table',1),(14,'2024_10_05_015437_create_brandmodels_table',1),(15,'2024_10_19_025011_create_vehicletypes_table',1),(16,'2024_10_19_025022_create_vehiclecolors_table',1),(17,'2024_10_24_003025_create_vehicles_table',1),(18,'2024_10_26_003617_create_vehicleimages_table',1),(19,'2024_10_31_003821_create_zonecoords_table',1),(20,'2024_10_31_012000_create_schedules_table',1),(21,'2024_10_31_012054_create_routes_table',1),(22,'2024_10_31_012105_create_routezones_table',1),(23,'2024_10_31_012125_create_routestatus_table',1),(24,'2024_10_31_012145_create_vehicleroutes_table',1),(25,'2024_10_31_012657_create_routepaths_table',1),(26,'2024_10_31_014411_create_vehicleocuppants_table',1),(27,'2024_11_29_182753_create_maintenancetypes_table',2),(28,'2024_11_29_182857_create_maintenancestatus_table',2),(29,'2024_11_29_182912_create_maintenances_table',2),(30,'2024_11_29_182931_create_maintenanceschedules_table',2),(31,'2024_11_29_183020_create_schedulesdates_table',2);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routepaths`
--

LOCK TABLES `routepaths` WRITE;
/*!40000 ALTER TABLE `routepaths` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes`
--

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routestatus`
--

LOCK TABLES `routestatus` WRITE;
/*!40000 ALTER TABLE `routestatus` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routezones`
--

LOCK TABLES `routezones` WRITE;
/*!40000 ALTER TABLE `routezones` DISABLE KEYS */;
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
INSERT INTO `sessions` VALUES ('5ZnBTWNIWgC5xxDaUm23JZiBOrBoRuAHbZC1AR8a',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoicGRZeHM3WXNwZU9TZWRLUHNnSkpxMkJQWDg1ZkpYdzhWelF6VHNXViI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fX0=',1732941489),('aZjHHLAqTkS02BJcQ6L5gitGBVOYFLw9PBmC1gMv',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZk8wR0ZSTzc1bWhBUlRMU0VjNEh4cG5IYW82aEFaN3JwN2ViRUZhcSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1732940275),('WvsYfW8DqK3FgyZilZ8JEhIKVli9nuDhZ4P0A2ZB',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','YTo2OntzOjY6Il90b2tlbiI7czo0MDoiTmQxdnQ2ZjhaMTgzUjZ4VUNVOHl0UlBkRGtQRndpMjQ4SlVZUGJQTCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQyOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYWRtaW4vc2NoZWR1bGVzZGF0ZXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTg6ImFkbWlubHRlX2RhcmtfbW9kZSI7YjowO30=',1732941802);
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Roberto Carlos Montero Lopez','72390067','1999-10-23',NULL,'Florencio Mori Rocha 159','admin@gmail.com',NULL,'$2y$12$ia8rsZq71qIa4OT1CGuH6.U7Dq9gw/vca9fCB.je9OdEZiI3X2uxq',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2024-11-18 22:39:11','2024-11-23 06:29:08'),(2,'Diego','99887766',NULL,NULL,NULL,'diego@gmail.com',NULL,'$2y$12$21NX9p8h7UepBeJTQ372qODkINztcXj7jm8K6Y8Mksre7xYFYSpQq',NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2024-11-19 05:13:10','2024-11-22 08:14:08'),(3,'Carlos Lopez','77884455',NULL,NULL,NULL,'carlos@gmail.com',NULL,'$2y$12$n6nBp9czNIMFsr0CMgS5nOOh7HJTgcxNgGoEbW.wnplgXFlf8osfS',NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2024-11-19 05:40:41','2024-11-20 04:09:32'),(4,'Diego Gamonal Veliz','72390069','2000-11-20','D72390067','Avenida Vianey','gamonal12345@gmail.com',NULL,'$2y$12$.0Hi5WL0GEaC7DOhvd8wHOuvZIONnjGSRUuh/.gLR6YCsblONesiG',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2024-11-19 08:15:14','2024-11-20 03:39:46'),(5,'Roberto Lopez','72390000',NULL,'A72390000','Luis Oyarce','roberto@gmail.com',NULL,'$2y$12$QJ1AsGi/c9exdl7BeekpKewYRlOKgoiAu1j5CXghyuCPEIkAZ5SeS',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2024-11-19 08:25:48','2024-11-20 04:05:15'),(6,'Nilton Lizarzaburu','72390060','2000-09-26','A72390060','Luis Oyarce','nilton@gmail.com',NULL,'$2y$12$B7JNFxRrvliuYMZMwzDO6OqYpUHGBgCVJxOwAJHzNeAXaGnvDMOse',NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2024-11-19 08:31:12','2024-11-20 04:09:56'),(7,'Nick Bravo','11223344',NULL,NULL,NULL,'nickbravo@gmail.com',NULL,'$2y$12$SVhyLsRLW6/ccqhfy7ajWOiD1bBHvTvICIRmsksztx8vSBQsYYQ/K',NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2024-11-19 10:08:33','2024-11-23 03:15:54'),(8,'Carlos L','57868922',NULL,NULL,'Corales','carlosc@gmail.com',NULL,'$2y$12$w0MMVDMEUPx/wkievBT8BuP4LK.C0q13BNXXEYgpxtKj9aVbwP8Fy',NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2024-11-19 10:18:55','2024-11-23 04:53:11'),(9,'Robin','82112233','1990-02-01',NULL,'Florencio Mori','robin@gmail.com',NULL,'$2y$12$co0CsB2mfxc9H0H7q7j9..4yh.0OzSZluBOpM.StXDJFk1qsVfGQK',NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2024-11-20 03:59:53','2024-11-23 06:36:36'),(10,'Santos Suxe','12455966','2000-12-10','S12455966','Pariñas','santos@hotmail.com',NULL,'$2y$12$FwZLqZOsNL419nTsBn76ruKznUWfQC6JzgX5K1ShMVAx3LylpHJKi',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2024-11-20 04:08:00','2024-11-20 04:08:00'),(12,'Ricardo','01010101',NULL,NULL,NULL,'ricardo@gmail.com',NULL,'$2y$12$74Cr5ZgkAIDrP0YLEujIzua.gyS8UrQPBIIR7MRMVFS5mLybWBEz.',NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2024-11-22 12:21:44','2024-11-23 06:35:32'),(13,'Roberto Montero López',NULL,NULL,NULL,NULL,'montero@gmail.com',NULL,'$2y$12$yep8dGLjfjymkl2gFXz4mugyio4pISRKWx0drj8JzYn9SOjFwDgf.',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2024-11-23 02:58:45','2024-11-23 04:51:58'),(14,'Rodrigo','22222222','2001-09-10',NULL,'Av. Victoria 201','rodrigo@gmail.com',NULL,'$2y$12$bFHGtnGDyAJLlANKTABVNen2Joc4cp5w5E/WW4Sf0VwQXcFOouTYm',NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2024-11-23 08:46:03','2024-11-23 08:51:22');
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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vehicleroutes_vehicle_id_foreign` (`vehicle_id`),
  KEY `vehicleroutes_route_id_foreign` (`route_id`),
  KEY `vehicleroutes_schedule_id_foreign` (`schedule_id`),
  CONSTRAINT `vehicleroutes_route_id_foreign` FOREIGN KEY (`route_id`) REFERENCES `routes` (`id`),
  CONSTRAINT `vehicleroutes_schedule_id_foreign` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`),
  CONSTRAINT `vehicleroutes_vehicle_id_foreign` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicleroutes`
--

LOCK TABLES `vehicleroutes` WRITE;
/*!40000 ALTER TABLE `vehicleroutes` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonecoords`
--

LOCK TABLES `zonecoords` WRITE;
/*!40000 ALTER TABLE `zonecoords` DISABLE KEYS */;
INSERT INTO `zonecoords` VALUES (1,-6.759132788108285,-79.83917835581968,1,'2024-11-19 09:14:04','2024-11-19 09:14:04'),(2,-6.759159423776388,-79.83870092261536,1,'2024-11-19 09:14:13','2024-11-19 09:14:13'),(3,-6.760027745752294,-79.8388082109756,1,'2024-11-19 09:14:25','2024-11-19 09:14:25'),(4,-6.760001110132052,-79.83926955092656,1,'2024-11-19 09:14:34','2024-11-19 09:14:34'),(5,-6.759921203262513,-79.83978989947508,2,'2024-11-19 09:15:22','2024-11-19 09:15:22'),(6,-6.759979801634793,-79.8393017374343,2,'2024-11-19 09:15:29','2024-11-19 09:15:29'),(7,-6.760821486561943,-79.83939829695854,2,'2024-11-19 09:15:40','2024-11-19 09:15:40'),(8,-6.7607841967544,-79.83984890807349,2,'2024-11-19 09:15:48','2024-11-19 09:15:48');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zones`
--

LOCK TABLES `zones` WRITE;
/*!40000 ALTER TABLE `zones` DISABLE KEYS */;
INSERT INTO `zones` VALUES (1,'ZONA 01',250,NULL,1,1,'2024-11-19 09:13:44','2024-11-19 09:32:28'),(2,'ZONA 02',100,NULL,1,1,'2024-11-19 09:15:04','2024-11-19 09:15:04');
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
	SELECT u.id as id, u.name as name, u.dni as dni,
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

-- Dump completed on 2024-11-29 23:44:56
