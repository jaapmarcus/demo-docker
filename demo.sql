-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: localhost    Database: exampledb
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `activity_admin_history`
--

DROP TABLE IF EXISTS `activity_admin_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_admin_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `admin_id` bigint DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id_idx` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_admin_history`
--

LOCK TABLES `activity_admin_history` WRITE;
/*!40000 ALTER TABLE `activity_admin_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_admin_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_client_email`
--

DROP TABLE IF EXISTS `activity_client_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_client_email` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `client_id` bigint DEFAULT NULL,
  `sender` varchar(255) DEFAULT NULL,
  `recipients` text,
  `subject` varchar(255) DEFAULT NULL,
  `content_html` text,
  `content_text` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id_idx` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_client_email`
--

LOCK TABLES `activity_client_email` WRITE;
/*!40000 ALTER TABLE `activity_client_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_client_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_client_history`
--

DROP TABLE IF EXISTS `activity_client_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_client_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `client_id` bigint DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id_idx` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_client_history`
--

LOCK TABLES `activity_client_history` WRITE;
/*!40000 ALTER TABLE `activity_client_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_client_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_system`
--

DROP TABLE IF EXISTS `activity_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_system` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `priority` tinyint DEFAULT NULL,
  `admin_id` bigint DEFAULT NULL,
  `client_id` bigint DEFAULT NULL,
  `message` text,
  `ip` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id_idx` (`admin_id`),
  KEY `client_id_idx` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_system`
--

LOCK TABLES `activity_system` WRITE;
/*!40000 ALTER TABLE `activity_system` DISABLE KEYS */;
INSERT INTO `activity_system` VALUES (60,6,1,NULL,'Activated extension \"demo\"',NULL,'2022-12-10 21:46:52','2022-12-10 21:46:52');
/*!40000 ALTER TABLE `activity_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role` varchar(30) DEFAULT 'staff' COMMENT 'admin, staff',
  `admin_group_id` bigint DEFAULT '1',
  `email` varchar(255) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `protected` tinyint(1) DEFAULT '0',
  `status` varchar(30) DEFAULT 'active' COMMENT 'active, inactive',
  `api_token` varchar(128) DEFAULT NULL,
  `permissions` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `admin_group_id_idx` (`admin_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin',1,'demo@fossbilling.org','$2y$10$GXx1g0yyfA0gc/mpo5.oQe/rNeqc.CIBexr3Fs1fVFiNSjZQLiOOu',NULL,'Demo',NULL,1,'active',NULL,NULL,'2022-12-10 21:41:29','2022-12-10 21:41:29'),(2,'cron',1,'to8H4nfn@kolOlHk8.com','$2y$10$IY12R4NOFeawgIxKvuCAY.l5Y11JYzoN3i2MkgP8FSGGEFgSPmNN2',NULL,'System Cron Job','',1,'active',NULL,NULL,'2022-12-10 21:41:52','2022-12-10 21:41:52');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_group`
--

DROP TABLE IF EXISTS `admin_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_group` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_group`
--

LOCK TABLES `admin_group` WRITE;
/*!40000 ALTER TABLE `admin_group` DISABLE KEYS */;
INSERT INTO `admin_group` VALUES (1,'Administrators','2022-12-01 12:00:00','2022-12-01 12:00:00'),(2,'Support','2022-12-01 12:00:00','2022-12-01 12:00:00');
/*!40000 ALTER TABLE `admin_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_request`
--

DROP TABLE IF EXISTS `api_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_request` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ip` varchar(45) DEFAULT NULL,
  `request` text,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_request`
--

LOCK TABLES `api_request` WRITE;
/*!40000 ALTER TABLE `api_request` DISABLE KEYS */;
INSERT INTO `api_request` VALUES (1,'84.82.33.184','/api/guest/staff/login','2022-12-10 21:41:51'),(2,'84.82.33.184','/api/admin/client/create','2022-12-10 21:42:50'),(3,'84.82.33.184','/index.php?_url=/api/admin/activity/batch_delete','2022-12-10 21:43:04'),(4,'84.82.33.184','/index.php?_url=/api/admin/activity/batch_delete','2022-12-10 21:43:11'),(5,'84.82.33.184','/api/admin/extension/activate?type=mod&id=demo&CSRFToken=cffad972e1f9521f690db86a700fee93','2022-12-10 21:46:52');
/*!40000 ALTER TABLE `api_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `session_id` varchar(32) DEFAULT NULL,
  `currency_id` bigint DEFAULT NULL,
  `promo_id` bigint DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `session_id_idx` (`session_id`),
  KEY `currency_id_idx` (`currency_id`),
  KEY `promo_id_idx` (`promo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_product`
--

DROP TABLE IF EXISTS `cart_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cart_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `config` text,
  PRIMARY KEY (`id`),
  KEY `cart_id_idx` (`cart_id`),
  KEY `product_id_idx` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_product`
--

LOCK TABLES `cart_product` WRITE;
/*!40000 ALTER TABLE `cart_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `aid` varchar(255) DEFAULT NULL COMMENT 'Alternative id for foreign systems',
  `client_group_id` bigint DEFAULT NULL,
  `role` varchar(30) NOT NULL DEFAULT 'client' COMMENT 'client',
  `auth_type` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `status` varchar(30) DEFAULT 'active' COMMENT 'active, suspended, canceled',
  `email_approved` tinyint(1) DEFAULT NULL,
  `tax_exempt` tinyint(1) DEFAULT '0',
  `type` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `phone_cc` varchar(10) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `company_vat` varchar(100) DEFAULT NULL,
  `company_number` varchar(255) DEFAULT NULL,
  `address_1` varchar(100) DEFAULT NULL,
  `address_2` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `document_type` varchar(100) DEFAULT NULL,
  `document_nr` varchar(20) DEFAULT NULL,
  `notes` text,
  `currency` varchar(10) DEFAULT NULL,
  `lang` varchar(10) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `api_token` varchar(128) DEFAULT NULL,
  `referred_by` varchar(255) DEFAULT NULL,
  `custom_1` text,
  `custom_2` text,
  `custom_3` text,
  `custom_4` text,
  `custom_5` text,
  `custom_6` text,
  `custom_7` text,
  `custom_8` text,
  `custom_9` text,
  `custom_10` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `alternative_id_idx` (`aid`),
  KEY `client_group_id_idx` (`client_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,NULL,NULL,'client',NULL,'client@fossbilling.org','$2y$10$6/nj2ugVoH41gEXpxmEkPO.zoCdKZiPw6HjhMcIi3TqRjUGC911ca',NULL,'active',NULL,0,NULL,'Client','Fossbilling.org',NULL,NULL,'1','123456789','Fossbilling.org',NULL,NULL,'Demo',NULL,'Demo','Demo','1234','AF',NULL,NULL,NULL,'USD',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-10 21:42:50','2022-12-10 21:42:50');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_balance`
--

DROP TABLE IF EXISTS `client_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_balance` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `client_id` bigint DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `rel_id` varchar(20) DEFAULT NULL,
  `amount` decimal(18,2) DEFAULT '0.00',
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id_idx` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_balance`
--

LOCK TABLES `client_balance` WRITE;
/*!40000 ALTER TABLE `client_balance` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_balance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_group`
--

DROP TABLE IF EXISTS `client_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_group` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_group`
--

LOCK TABLES `client_group` WRITE;
/*!40000 ALTER TABLE `client_group` DISABLE KEYS */;
INSERT INTO `client_group` VALUES (1,'Default','2022-12-01 12:00:00','2022-12-01 12:00:00');
/*!40000 ALTER TABLE `client_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_order`
--

DROP TABLE IF EXISTS `client_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `client_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `form_id` bigint DEFAULT NULL,
  `promo_id` bigint DEFAULT NULL,
  `promo_recurring` tinyint(1) DEFAULT NULL,
  `promo_used` bigint DEFAULT NULL,
  `group_id` varchar(255) DEFAULT NULL,
  `group_master` tinyint(1) DEFAULT '0',
  `invoice_option` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `unpaid_invoice_id` bigint DEFAULT NULL,
  `service_id` bigint DEFAULT NULL,
  `service_type` varchar(100) DEFAULT NULL,
  `period` varchar(20) DEFAULT NULL,
  `quantity` bigint DEFAULT '1',
  `unit` varchar(100) DEFAULT NULL,
  `price` double(18,2) DEFAULT NULL,
  `discount` double(18,2) DEFAULT NULL COMMENT 'first invoice discount',
  `status` varchar(50) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL COMMENT 'suspend/cancel reason',
  `notes` text,
  `config` text,
  `referred_by` varchar(255) DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `activated_at` datetime DEFAULT NULL,
  `suspended_at` datetime DEFAULT NULL,
  `unsuspended_at` datetime DEFAULT NULL,
  `canceled_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id_idx` (`client_id`),
  KEY `product_id_idx` (`product_id`),
  KEY `form_id_idx` (`form_id`),
  KEY `promo_id_idx` (`promo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_order`
--

LOCK TABLES `client_order` WRITE;
/*!40000 ALTER TABLE `client_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_order_meta`
--

DROP TABLE IF EXISTS `client_order_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_order_meta` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `client_order_id` bigint DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_order_id_idx` (`client_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_order_meta`
--

LOCK TABLES `client_order_meta` WRITE;
/*!40000 ALTER TABLE `client_order_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_order_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_order_status`
--

DROP TABLE IF EXISTS `client_order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_order_status` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `client_order_id` bigint DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `notes` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_order_id_idx` (`client_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_order_status`
--

LOCK TABLES `client_order_status` WRITE;
/*!40000 ALTER TABLE `client_order_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_password_reset`
--

DROP TABLE IF EXISTS `client_password_reset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_password_reset` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `client_id` bigint DEFAULT NULL,
  `hash` varchar(100) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id_idx` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_password_reset`
--

LOCK TABLES `client_password_reset` WRITE;
/*!40000 ALTER TABLE `client_password_reset` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_password_reset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `code` varchar(3) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  `conversion_rate` decimal(13,6) DEFAULT '1.000000',
  `format` varchar(30) DEFAULT NULL,
  `price_format` varchar(50) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES (1,'US Dollar','USD',1,1.000000,'${{price}}','1','2022-12-01 12:00:00','2022-12-01 12:00:00');
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_template`
--

DROP TABLE IF EXISTS `email_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_template` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `action_code` varchar(255) DEFAULT NULL,
  `category` varchar(30) DEFAULT NULL COMMENT 'general, domain, invoice, hosting, support, download, custom, license',
  `enabled` tinyint(1) DEFAULT '1',
  `subject` varchar(255) DEFAULT NULL,
  `content` text,
  `description` text,
  `vars` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `action_code` (`action_code`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_template`
--

LOCK TABLES `email_template` WRITE;
/*!40000 ALTER TABLE `email_template` DISABLE KEYS */;
INSERT INTO `email_template` VALUES (1,'mod_client_confirm.html','client',0,'Mod Client Confirm.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(2,'mod_client_password_reset_approve.html','client',0,'Mod Client Password Reset Approve.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(3,'mod_client_password_reset_request.html','client',0,'Mod Client Password Reset Request.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(4,'mod_client_signup.html','client',0,'Mod Client Signup.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(5,'mod_email_test.html','email',0,'Mod Email Test.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(6,'mod_invoice_created.html','invoice',0,'Mod Invoice Created.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(7,'mod_invoice_due_after.html','invoice',0,'Mod Invoice Due After.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(8,'mod_invoice_paid.html','invoice',0,'Mod Invoice Paid.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(9,'mod_invoice_payment_reminder.html','invoice',0,'Mod Invoice Payment Reminder.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(10,'mod_servicecustom_activated.html','servicecustom',0,'Mod Servicecustom Activated.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(11,'mod_servicecustom_canceled.html','servicecustom',0,'Mod Servicecustom Canceled.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(12,'mod_servicecustom_renewed.html','servicecustom',0,'Mod Servicecustom Renewed.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(13,'mod_servicecustom_suspended.html','servicecustom',0,'Mod Servicecustom Suspended.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(14,'mod_servicecustom_unsuspended.html','servicecustom',0,'Mod Servicecustom Unsuspended.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(15,'mod_servicedomain_activated.html','servicedomain',0,'Mod Servicedomain Activated.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(16,'mod_servicedomain_renewed.html','servicedomain',0,'Mod Servicedomain Renewed.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(17,'mod_servicedomain_suspended.html','servicedomain',0,'Mod Servicedomain Suspended.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(18,'mod_servicedomain_unsuspended.html','servicedomain',0,'Mod Servicedomain Unsuspended.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(19,'mod_servicedownloadable_activated.html','servicedownloadable',0,'Mod Servicedownloadable Activated.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(20,'mod_servicehosting_activated.html','servicehosting',0,'Mod Servicehosting Activated.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(21,'mod_servicehosting_canceled.html','servicehosting',0,'Mod Servicehosting Canceled.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(22,'mod_servicehosting_renewed.html','servicehosting',0,'Mod Servicehosting Renewed.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(23,'mod_servicehosting_suspended.html','servicehosting',0,'Mod Servicehosting Suspended.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(24,'mod_servicehosting_unsuspended.html','servicehosting',0,'Mod Servicehosting Unsuspended.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(25,'mod_servicelicense_activated.html','servicelicense',0,'Mod Servicelicense Activated.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(26,'mod_servicelicense_canceled.html','servicelicense',0,'Mod Servicelicense Canceled.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(27,'mod_servicelicense_renewed.html','servicelicense',0,'Mod Servicelicense Renewed.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(28,'mod_servicelicense_suspended.html','servicelicense',0,'Mod Servicelicense Suspended.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(29,'mod_servicelicense_unsuspended.html','servicelicense',0,'Mod Servicelicense Unsuspended.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(30,'mod_staff_client_order.html','staff',0,'Mod Staff Client Order.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(31,'mod_staff_client_signup.html','staff',0,'Mod Staff Client Signup.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(32,'mod_staff_pticket_close.html','staff',0,'Mod Staff Pticket Close.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(33,'mod_staff_pticket_open.html','staff',0,'Mod Staff Pticket Open.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(34,'mod_staff_pticket_reply.html','staff',0,'Mod Staff Pticket Reply.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(35,'mod_staff_ticket_close.html','staff',0,'Mod Staff Ticket Close.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(36,'mod_staff_ticket_open.html','staff',0,'Mod Staff Ticket Open.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(37,'mod_staff_ticket_reply.html','staff',0,'Mod Staff Ticket Reply.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(38,'mod_support_helpdesk_ticket_open.html','support',0,'Mod Support Helpdesk Ticket Open.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(39,'mod_support_pticket_open.html','support',0,'Mod Support Pticket Open.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(40,'mod_support_pticket_staff_close.html','support',0,'Mod Support Pticket Staff Close.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(41,'mod_support_pticket_staff_open.html','support',0,'Mod Support Pticket Staff Open.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(42,'mod_support_pticket_staff_reply.html','support',0,'Mod Support Pticket Staff Reply.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(43,'mod_support_ticket_open.html','support',0,'Mod Support Ticket Open.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(44,'mod_support_ticket_staff_close.html','support',0,'Mod Support Ticket Staff Close.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(45,'mod_support_ticket_staff_open.html','support',0,'Mod Support Ticket Staff Open.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL),(46,'mod_support_ticket_staff_reply.html','support',0,'Mod Support Ticket Staff Reply.html','{% apply markdown %}\n\nThis email template was automatically generated by FOSSBilling extension.   \nTemplate is ready to be modified.   \nEmail template is just like FOSSBilling theme file.   \nUse **admin** and **guest** API calls to get additional information using variables passed to template.\n\nExample API usage in email template:\n\n{{ guest.system_version }}\n\n{{ now|date(\'Y-m-d\') }}\n\n{% endapply %}',NULL,NULL);
/*!40000 ALTER TABLE `email_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extension`
--

DROP TABLE IF EXISTS `extension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `version` varchar(100) DEFAULT NULL,
  `manifest` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extension`
--

LOCK TABLES `extension` WRITE;
/*!40000 ALTER TABLE `extension` DISABLE KEYS */;
INSERT INTO `extension` VALUES (1,'mod','kb','installed','1.0.0','{\"id\":\"kb\",\"type\":\"mod\",\"name\":\"Knowledge base\",\"description\":\"Knowledge base module for FOSSBilling\",\"homepage_url\":\"https:\\/\\/github.com\\/FOSSBilling\\/\",\"author\":\"FOSSBilling\",\"author_url\":\"https:\\/\\/fossbilling.org\\/\",\"license\":\"https:\\/\\/www.fossbilling.org\\/license.txt\",\"version\":\"1.0.0\",\"icon_url\":null,\"download_url\":null,\"project_url\":\"https:\\/\\/fossbilling.org\\/\",\"minimum_boxbilling_version\":null,\"maximum_boxbilling_version\":null}\n'),(2,'mod','news','installed','1.0.0','{\"id\":\"news\",\"type\":\"mod\",\"name\":\"News\",\"description\":\"News module for FOSSBilling\",\"homepage_url\":\"https:\\/\\/github.com\\/FOSSBilling\\/\",\"author\":\"FOSSBilling\",\"author_url\":\"https:\\/\\/fossbilling.org\\/\",\"license\":\"https:\\/\\/www.fossbilling.org\\/license.txt\",\"version\":\"1.0.0\",\"icon_url\":null,\"download_url\":null,\"project_url\":\"https:\\/\\/fossbilling.org\\/\",\"minimum_boxbilling_version\":null,\"maximum_boxbilling_version\":null}\n'),(3,'mod','branding','installed','1.0.0','{\"id\":\"branding\",\"type\":\"mod\",\"name\":\"Branding\",\"description\":\"FOSSBilling branding module.\",\"homepage_url\":\"https:\\/\\/github.com\\/FOSSBilling\\/\",\"author\":\"FOSSBilling\",\"author_url\":\"https:\\/\\/fossbilling.org\\/\",\"license\":\"https:\\/\\/www.fossbilling.org\\/license.txt\",\"version\":\"1.0.0\",\"icon_url\":null,\"download_url\":null,\"project_url\":\"https:\\/\\/fossbilling.org\\/\",\"minimum_boxbilling_version\":null,\"maximum_boxbilling_version\":null}\n'),(4,'mod','redirect','installed','1.0.0','{\"id\":\"redirect\",\"type\":\"mod\",\"name\":\"Redirect\",\"description\":\"Manage redirects\",\"homepage_url\":\"https:\\/\\/github.com\\/FOSSBilling\\/\",\"author\":\"FOSSBilling\",\"author_url\":\"https:\\/\\/www.fossbilling.org\",\"license\":\"GPL version 2 or later - https:\\/\\/www.gnu.org\\/licenses\\/old-licenses\\/gpl-2.0.html\",\"version\":\"1.0.0\",\"icon_url\":null,\"download_url\":null,\"project_url\":\"https:\\/\\/fossbilling.org\\/\",\"minimum_boxbilling_version\":null,\"maximum_boxbilling_version\":null}\n'),(5,'mod','wysiwyg','installed','4.22','{\"id\":\"wysiwyg\",\"type\":\"mod\",\"name\":\"WYSIWYG\",\"description\":\"Integrates a What You See Is What You Get (WYSIWYG) editor to your admin panel.\",\"homepage_url\":\"https://github.com/FOSSBilling/\",\"author\":\"FOSSBilling\",\"author_url\":\"https://fossbilling.org/\",\"license\":\"GPL version 2 or later - https://www.gnu.org/licenses/old-licenses/gpl-2.0.html\",\"version\":\"4.22\",\"icon_url\":\"/modules/Wysiwyg/icon.png\",\"download_url\":null,\"project_url\":\"https://fossbilling.org/\",\"minimum_boxbilling_version\":null,\"maximum_boxbilling_version\":null}'),(6,'mod','demo','installed','0.0.1','{\"id\":\"demo\",\"type\":\"mod\",\"name\":\"Demo\",\"description\":\"Extension to disable critical settings, generally used for public demo instances. \",\"homepage_url\":\"https:\\/\\/github.com\\/FOSSBilling\\/ext_demo\",\"author\":\"FOSSBilling\",\"author_url\":\"https:\\/\\/fossbilling.org\\/\",\"license\":\"Apache License 2.0\",\"version\":\"0.0.1\",\"icon_url\":\"\\/modules\\/Demo\\/icon.png\",\"download_url\":null,\"project_url\":\"https:\\/\\/extensions.fossbilling.org\\/\",\"minimum_boxbilling_version\":null,\"maximum_boxbilling_version\":null}');
/*!40000 ALTER TABLE `extension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extension_meta`
--

DROP TABLE IF EXISTS `extension_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension_meta` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `client_id` bigint DEFAULT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `rel_type` varchar(255) DEFAULT NULL,
  `rel_id` varchar(255) DEFAULT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id_idx` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=362 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extension_meta`
--

LOCK TABLES `extension_meta` WRITE;
/*!40000 ALTER TABLE `extension_meta` DISABLE KEYS */;
INSERT INTO `extension_meta` VALUES (1,NULL,'mod_theme','preset','current','huraga','Test','2022-12-10 21:41:33','2022-12-10 21:41:33'),(2,NULL,'mod_hook','mod','activity','listener','onAfterClientLogin','2022-12-10 21:41:52','2022-12-10 21:41:52'),(3,NULL,'mod_hook','mod','activity','listener','onAfterAdminLogin','2022-12-10 21:41:52','2022-12-10 21:41:52'),(4,NULL,'mod_hook','mod','activity','listener','toApiArray','2022-12-10 21:41:52','2022-12-10 21:41:52'),(5,NULL,'mod_hook','mod','activity','listener','rmByClient','2022-12-10 21:41:52','2022-12-10 21:41:52'),(6,NULL,'mod_hook','mod','cart','listener','addItem','2022-12-10 21:41:52','2022-12-10 21:41:52'),(7,NULL,'mod_hook','mod','cart','listener','isStockAvailable','2022-12-10 21:41:52','2022-12-10 21:41:52'),(8,NULL,'mod_hook','mod','cart','listener','isRecurrentPricing','2022-12-10 21:41:52','2022-12-10 21:41:52'),(9,NULL,'mod_hook','mod','cart','listener','isPeriodEnabledForProduct','2022-12-10 21:41:52','2022-12-10 21:41:52'),(10,NULL,'mod_hook','mod','cart','listener','removeProduct','2022-12-10 21:41:52','2022-12-10 21:41:52'),(11,NULL,'mod_hook','mod','cart','listener','changeCartCurrency','2022-12-10 21:41:52','2022-12-10 21:41:52'),(12,NULL,'mod_hook','mod','cart','listener','resetCart','2022-12-10 21:41:52','2022-12-10 21:41:52'),(13,NULL,'mod_hook','mod','cart','listener','removePromo','2022-12-10 21:41:52','2022-12-10 21:41:52'),(14,NULL,'mod_hook','mod','cart','listener','applyPromo','2022-12-10 21:41:52','2022-12-10 21:41:52'),(15,NULL,'mod_hook','mod','cart','listener','rm','2022-12-10 21:41:52','2022-12-10 21:41:52'),(16,NULL,'mod_hook','mod','cart','listener','toApiArray','2022-12-10 21:41:52','2022-12-10 21:41:52'),(17,NULL,'mod_hook','mod','cart','listener','isClientAbleToUsePromo','2022-12-10 21:41:52','2022-12-10 21:41:52'),(18,NULL,'mod_hook','mod','cart','listener','promoCanBeApplied','2022-12-10 21:41:52','2022-12-10 21:41:52'),(19,NULL,'mod_hook','mod','cart','listener','isPromoAvailableForClientGroup','2022-12-10 21:41:52','2022-12-10 21:41:52'),(20,NULL,'mod_hook','mod','cart','listener','getCartProducts','2022-12-10 21:41:52','2022-12-10 21:41:52'),(21,NULL,'mod_hook','mod','cart','listener','checkoutCart','2022-12-10 21:41:52','2022-12-10 21:41:52'),(22,NULL,'mod_hook','mod','cart','listener','createFromCart','2022-12-10 21:41:52','2022-12-10 21:41:52'),(23,NULL,'mod_hook','mod','cart','listener','usePromo','2022-12-10 21:41:52','2022-12-10 21:41:52'),(24,NULL,'mod_hook','mod','cart','listener','getItemConfig','2022-12-10 21:41:52','2022-12-10 21:41:52'),(25,NULL,'mod_hook','mod','cart','listener','cartProductToApiArray','2022-12-10 21:41:52','2022-12-10 21:41:52'),(26,NULL,'mod_hook','mod','cart','listener','getProductDiscount','2022-12-10 21:41:52','2022-12-10 21:41:52'),(27,NULL,'mod_hook','mod','client','listener','onAfterClientSignUp','2022-12-10 21:41:52','2022-12-10 21:41:52'),(28,NULL,'mod_hook','mod','client','listener','toSessionArray','2022-12-10 21:41:52','2022-12-10 21:41:52'),(29,NULL,'mod_hook','mod','client','listener','canChangeCurrency','2022-12-10 21:41:52','2022-12-10 21:41:52'),(30,NULL,'mod_hook','mod','client','listener','addFunds','2022-12-10 21:41:52','2022-12-10 21:41:52'),(31,NULL,'mod_hook','mod','client','listener','toApiArray','2022-12-10 21:41:52','2022-12-10 21:41:52'),(32,NULL,'mod_hook','mod','client','listener','getClientBalance','2022-12-10 21:41:52','2022-12-10 21:41:52'),(33,NULL,'mod_hook','mod','client','listener','isClientTaxable','2022-12-10 21:41:52','2022-12-10 21:41:52'),(34,NULL,'mod_hook','mod','client','listener','deleteGroup','2022-12-10 21:41:52','2022-12-10 21:41:52'),(35,NULL,'mod_hook','mod','client','listener','remove','2022-12-10 21:41:52','2022-12-10 21:41:52'),(36,NULL,'mod_hook','mod','client','listener','canChangeEmail','2022-12-10 21:41:52','2022-12-10 21:41:52'),(37,NULL,'mod_hook','mod','currency','listener','setAsDefault','2022-12-10 21:41:52','2022-12-10 21:41:52'),(38,NULL,'mod_hook','mod','currency','listener','rm','2022-12-10 21:41:52','2022-12-10 21:41:52'),(39,NULL,'mod_hook','mod','currency','listener','toApiArray','2022-12-10 21:41:52','2022-12-10 21:41:52'),(40,NULL,'mod_hook','mod','currency','listener','onBeforeAdminCronRun','2022-12-10 21:41:52','2022-12-10 21:41:52'),(41,NULL,'mod_hook','mod','email','listener','findOneForClientById','2022-12-10 21:41:52','2022-12-10 21:41:52'),(42,NULL,'mod_hook','mod','email','listener','rmByClient','2022-12-10 21:41:52','2022-12-10 21:41:52'),(43,NULL,'mod_hook','mod','email','listener','rm','2022-12-10 21:41:52','2022-12-10 21:41:52'),(44,NULL,'mod_hook','mod','email','listener','toApiArray','2022-12-10 21:41:52','2022-12-10 21:41:52'),(45,NULL,'mod_hook','mod','email','listener','resend','2022-12-10 21:41:52','2022-12-10 21:41:52'),(46,NULL,'mod_hook','mod','email','listener','templateToApiArray','2022-12-10 21:41:52','2022-12-10 21:41:52'),(47,NULL,'mod_hook','mod','email','listener','updateTemplate','2022-12-10 21:41:52','2022-12-10 21:41:52'),(48,NULL,'mod_hook','mod','extension','listener','onBeforeAdminCronRun','2022-12-10 21:41:52','2022-12-10 21:41:52'),(49,NULL,'mod_hook','mod','extension','listener','update','2022-12-10 21:41:52','2022-12-10 21:41:52'),(50,NULL,'mod_hook','mod','extension','listener','activate','2022-12-10 21:41:52','2022-12-10 21:41:52'),(51,NULL,'mod_hook','mod','extension','listener','deactivate','2022-12-10 21:41:52','2022-12-10 21:41:52'),(52,NULL,'mod_hook','mod','extension','listener','uninstall','2022-12-10 21:41:52','2022-12-10 21:41:52'),(53,NULL,'mod_hook','mod','hook','listener','onAfterAdminActivateExtension','2022-12-10 21:41:52','2022-12-10 21:41:52'),(54,NULL,'mod_hook','mod','hook','listener','onAfterAdminDeactivateExtension','2022-12-10 21:41:52','2022-12-10 21:41:52'),(55,NULL,'mod_hook','mod','invoice','listener','toApiArray','2022-12-10 21:41:52','2022-12-10 21:41:52'),(56,NULL,'mod_hook','mod','invoice','listener','onAfterAdminInvoicePaymentReceived','2022-12-10 21:41:52','2022-12-10 21:41:52'),(57,NULL,'mod_hook','mod','invoice','listener','onAfterAdminInvoiceApprove','2022-12-10 21:41:52','2022-12-10 21:41:52'),(58,NULL,'mod_hook','mod','invoice','listener','onAfterAdminInvoiceReminderSent','2022-12-10 21:41:52','2022-12-10 21:41:52'),(59,NULL,'mod_hook','mod','invoice','listener','onAfterAdminCronRun','2022-12-10 21:41:52','2022-12-10 21:41:52'),(60,NULL,'mod_hook','mod','invoice','listener','onEventAfterInvoiceIsDue','2022-12-10 21:41:52','2022-12-10 21:41:52'),(61,NULL,'mod_hook','mod','invoice','listener','markAsPaid','2022-12-10 21:41:52','2022-12-10 21:41:52'),(62,NULL,'mod_hook','mod','invoice','listener','getNextInvoiceNumber','2022-12-10 21:41:52','2022-12-10 21:41:52'),(63,NULL,'mod_hook','mod','invoice','listener','countIncome','2022-12-10 21:41:52','2022-12-10 21:41:52'),(64,NULL,'mod_hook','mod','invoice','listener','prepareInvoice','2022-12-10 21:41:52','2022-12-10 21:41:52'),(65,NULL,'mod_hook','mod','invoice','listener','setInvoiceDefaults','2022-12-10 21:41:52','2022-12-10 21:41:52'),(66,NULL,'mod_hook','mod','invoice','listener','approveInvoice','2022-12-10 21:41:52','2022-12-10 21:41:52'),(67,NULL,'mod_hook','mod','invoice','listener','tryPayWithCredits','2022-12-10 21:41:52','2022-12-10 21:41:52'),(68,NULL,'mod_hook','mod','invoice','listener','getTotalWithTax','2022-12-10 21:41:52','2022-12-10 21:41:52'),(69,NULL,'mod_hook','mod','invoice','listener','getTax','2022-12-10 21:41:52','2022-12-10 21:41:52'),(70,NULL,'mod_hook','mod','invoice','listener','getTotal','2022-12-10 21:41:52','2022-12-10 21:41:52'),(71,NULL,'mod_hook','mod','invoice','listener','refundInvoice','2022-12-10 21:41:52','2022-12-10 21:41:52'),(72,NULL,'mod_hook','mod','invoice','listener','updateInvoice','2022-12-10 21:41:52','2022-12-10 21:41:52'),(73,NULL,'mod_hook','mod','invoice','listener','rmInvoice','2022-12-10 21:41:52','2022-12-10 21:41:52'),(74,NULL,'mod_hook','mod','invoice','listener','deleteInvoiceByAdmin','2022-12-10 21:41:52','2022-12-10 21:41:52'),(75,NULL,'mod_hook','mod','invoice','listener','deleteInvoiceByClient','2022-12-10 21:41:52','2022-12-10 21:41:52'),(76,NULL,'mod_hook','mod','invoice','listener','renewInvoice','2022-12-10 21:41:52','2022-12-10 21:41:52'),(77,NULL,'mod_hook','mod','invoice','listener','payInvoiceWithCredits','2022-12-10 21:41:52','2022-12-10 21:41:52'),(78,NULL,'mod_hook','mod','invoice','listener','generateForOrder','2022-12-10 21:41:52','2022-12-10 21:41:52'),(79,NULL,'mod_hook','mod','invoice','listener','sendInvoiceReminder','2022-12-10 21:41:52','2022-12-10 21:41:52'),(80,NULL,'mod_hook','mod','invoice','listener','generateFundsInvoice','2022-12-10 21:41:52','2022-12-10 21:41:52'),(81,NULL,'mod_hook','mod','invoice','listener','addNote','2022-12-10 21:41:52','2022-12-10 21:41:52'),(82,NULL,'mod_hook','mod','invoice','listener','getPaymentInvoice','2022-12-10 21:41:52','2022-12-10 21:41:52'),(83,NULL,'mod_hook','mod','invoice','listener','getBuyer','2022-12-10 21:41:52','2022-12-10 21:41:52'),(84,NULL,'mod_hook','mod','invoice','listener','rmByClient','2022-12-10 21:41:52','2022-12-10 21:41:52'),(85,NULL,'mod_hook','mod','invoice','listener','isInvoiceTypeDeposit','2022-12-10 21:41:52','2022-12-10 21:41:52'),(86,NULL,'mod_hook','mod','kb','listener','hitView','2022-12-10 21:41:52','2022-12-10 21:41:52'),(87,NULL,'mod_hook','mod','kb','listener','rm','2022-12-10 21:41:52','2022-12-10 21:41:52'),(88,NULL,'mod_hook','mod','kb','listener','toApiArray','2022-12-10 21:41:52','2022-12-10 21:41:52'),(89,NULL,'mod_hook','mod','kb','listener','categoryRm','2022-12-10 21:41:52','2022-12-10 21:41:52'),(90,NULL,'mod_hook','mod','kb','listener','categoryToApiArray','2022-12-10 21:41:52','2022-12-10 21:41:52'),(91,NULL,'mod_hook','mod','kb','listener','updateCategory','2022-12-10 21:41:52','2022-12-10 21:41:52'),(92,NULL,'mod_hook','mod','order','listener','onAfterAdminOrderActivate','2022-12-10 21:41:52','2022-12-10 21:41:52'),(93,NULL,'mod_hook','mod','order','listener','onAfterAdminOrderRenew','2022-12-10 21:41:52','2022-12-10 21:41:52'),(94,NULL,'mod_hook','mod','order','listener','onAfterAdminOrderSuspend','2022-12-10 21:41:52','2022-12-10 21:41:52'),(95,NULL,'mod_hook','mod','order','listener','onAfterAdminOrderUnsuspend','2022-12-10 21:41:52','2022-12-10 21:41:52'),(96,NULL,'mod_hook','mod','order','listener','onAfterAdminOrderCancel','2022-12-10 21:41:52','2022-12-10 21:41:52'),(97,NULL,'mod_hook','mod','order','listener','onAfterAdminOrderUncancel','2022-12-10 21:41:52','2022-12-10 21:41:52'),(98,NULL,'mod_hook','mod','order','listener','getOrderService','2022-12-10 21:41:52','2022-12-10 21:41:52'),(99,NULL,'mod_hook','mod','order','listener','getConfig','2022-12-10 21:41:52','2022-12-10 21:41:52'),(100,NULL,'mod_hook','mod','order','listener','productHasOrders','2022-12-10 21:41:52','2022-12-10 21:41:52'),(101,NULL,'mod_hook','mod','order','listener','getLogger','2022-12-10 21:41:52','2022-12-10 21:41:52'),(102,NULL,'mod_hook','mod','order','listener','saveStatusChange','2022-12-10 21:41:52','2022-12-10 21:41:52'),(103,NULL,'mod_hook','mod','order','listener','toApiArray','2022-12-10 21:41:52','2022-12-10 21:41:52'),(104,NULL,'mod_hook','mod','order','listener','createOrder','2022-12-10 21:41:52','2022-12-10 21:41:52'),(105,NULL,'mod_hook','mod','order','listener','getMasterOrderForClient','2022-12-10 21:41:52','2022-12-10 21:41:52'),(106,NULL,'mod_hook','mod','order','listener','activateOrderAddons','2022-12-10 21:41:52','2022-12-10 21:41:52'),(107,NULL,'mod_hook','mod','order','listener','activateOrder','2022-12-10 21:41:52','2022-12-10 21:41:52'),(108,NULL,'mod_hook','mod','order','listener','createFromOrder','2022-12-10 21:41:52','2022-12-10 21:41:52'),(109,NULL,'mod_hook','mod','order','listener','getOrderAddonsList','2022-12-10 21:41:52','2022-12-10 21:41:52'),(110,NULL,'mod_hook','mod','order','listener','stockSale','2022-12-10 21:41:52','2022-12-10 21:41:52'),(111,NULL,'mod_hook','mod','order','listener','updatePeriod','2022-12-10 21:41:52','2022-12-10 21:41:52'),(112,NULL,'mod_hook','mod','order','listener','updateOrderMeta','2022-12-10 21:41:52','2022-12-10 21:41:52'),(113,NULL,'mod_hook','mod','order','listener','updateOrder','2022-12-10 21:41:52','2022-12-10 21:41:52'),(114,NULL,'mod_hook','mod','order','listener','renewOrder','2022-12-10 21:41:52','2022-12-10 21:41:52'),(115,NULL,'mod_hook','mod','order','listener','renewFromOrder','2022-12-10 21:41:52','2022-12-10 21:41:52'),(116,NULL,'mod_hook','mod','order','listener','suspendFromOrder','2022-12-10 21:41:52','2022-12-10 21:41:52'),(117,NULL,'mod_hook','mod','order','listener','unsuspendFromOrder','2022-12-10 21:41:52','2022-12-10 21:41:52'),(118,NULL,'mod_hook','mod','order','listener','cancelFromOrder','2022-12-10 21:41:52','2022-12-10 21:41:52'),(119,NULL,'mod_hook','mod','order','listener','uncancelFromOrder','2022-12-10 21:41:52','2022-12-10 21:41:52'),(120,NULL,'mod_hook','mod','order','listener','rmInvoiceItemByOrder','2022-12-10 21:41:52','2022-12-10 21:41:52'),(121,NULL,'mod_hook','mod','order','listener','rmClientOrderStatusByOrder','2022-12-10 21:41:52','2022-12-10 21:41:52'),(122,NULL,'mod_hook','mod','order','listener','rmOrder','2022-12-10 21:41:52','2022-12-10 21:41:52'),(123,NULL,'mod_hook','mod','order','listener','deleteFromOrder','2022-12-10 21:41:52','2022-12-10 21:41:52'),(124,NULL,'mod_hook','mod','order','listener','updateOrderConfig','2022-12-10 21:41:52','2022-12-10 21:41:52'),(125,NULL,'mod_hook','mod','order','listener','orderStatusAdd','2022-12-10 21:41:52','2022-12-10 21:41:52'),(126,NULL,'mod_hook','mod','order','listener','findForClientById','2022-12-10 21:41:52','2022-12-10 21:41:52'),(127,NULL,'mod_hook','mod','order','listener','getOrderServiceData','2022-12-10 21:41:52','2022-12-10 21:41:52'),(128,NULL,'mod_hook','mod','order','listener','getTotal','2022-12-10 21:41:52','2022-12-10 21:41:52'),(129,NULL,'mod_hook','mod','order','listener','setUnpaidInvoice','2022-12-10 21:41:52','2022-12-10 21:41:52'),(130,NULL,'mod_hook','mod','order','listener','unsetUnpaidInvoice','2022-12-10 21:41:52','2022-12-10 21:41:52'),(131,NULL,'mod_hook','mod','order','listener','getRelatedOrderIdByType','2022-12-10 21:41:52','2022-12-10 21:41:52'),(132,NULL,'mod_hook','mod','order','listener','rmByClient','2022-12-10 21:41:52','2022-12-10 21:41:52'),(133,NULL,'mod_hook','mod','product','listener','toApiArray','2022-12-10 21:41:52','2022-12-10 21:41:52'),(134,NULL,'mod_hook','mod','product','listener','updateProduct','2022-12-10 21:41:52','2022-12-10 21:41:52'),(135,NULL,'mod_hook','mod','product','listener','updateConfig','2022-12-10 21:41:52','2022-12-10 21:41:52'),(136,NULL,'mod_hook','mod','product','listener','deleteProduct','2022-12-10 21:41:52','2022-12-10 21:41:52'),(137,NULL,'mod_hook','mod','product','listener','updateCategory','2022-12-10 21:41:52','2022-12-10 21:41:52'),(138,NULL,'mod_hook','mod','product','listener','removeProductCategory','2022-12-10 21:41:52','2022-12-10 21:41:52'),(139,NULL,'mod_hook','mod','product','listener','toPromoApiArray','2022-12-10 21:41:52','2022-12-10 21:41:52'),(140,NULL,'mod_hook','mod','product','listener','updatePromo','2022-12-10 21:41:52','2022-12-10 21:41:52'),(141,NULL,'mod_hook','mod','product','listener','deletePromo','2022-12-10 21:41:52','2022-12-10 21:41:52'),(142,NULL,'mod_hook','mod','product','listener','toProductCategoryApiArray','2022-12-10 21:41:52','2022-12-10 21:41:52'),(143,NULL,'mod_hook','mod','product','listener','getStartingFromPrice','2022-12-10 21:41:52','2022-12-10 21:41:52'),(144,NULL,'mod_hook','mod','product','listener','getUpgradablePairs','2022-12-10 21:41:52','2022-12-10 21:41:52'),(145,NULL,'mod_hook','mod','product','listener','canUpgradeTo','2022-12-10 21:41:52','2022-12-10 21:41:52'),(146,NULL,'mod_hook','mod','product','listener','getCategoryProducts','2022-12-10 21:41:52','2022-12-10 21:41:52'),(147,NULL,'mod_hook','mod','product','listener','toProductPaymentApiArray','2022-12-10 21:41:52','2022-12-10 21:41:52'),(148,NULL,'mod_hook','mod','product','listener','getStartingPrice','2022-12-10 21:41:52','2022-12-10 21:41:52'),(149,NULL,'mod_hook','mod','product','listener','getProductDiscount','2022-12-10 21:41:52','2022-12-10 21:41:52'),(150,NULL,'mod_hook','mod','product','listener','isPromoLinkedToProduct','2022-12-10 21:41:52','2022-12-10 21:41:52'),(151,NULL,'mod_hook','mod','product','listener','isPromoLinkedToTld','2022-12-10 21:41:52','2022-12-10 21:41:52'),(152,NULL,'mod_hook','mod','product','listener','getProductAddons','2022-12-10 21:41:52','2022-12-10 21:41:52'),(153,NULL,'mod_hook','mod','product','listener','toAddonArray','2022-12-10 21:41:52','2022-12-10 21:41:52'),(154,NULL,'mod_hook','mod','profile','listener','changeAdminPassword','2022-12-10 21:41:52','2022-12-10 21:41:52'),(155,NULL,'mod_hook','mod','profile','listener','generateNewApiKey','2022-12-10 21:41:52','2022-12-10 21:41:52'),(156,NULL,'mod_hook','mod','profile','listener','updateAdmin','2022-12-10 21:41:52','2022-12-10 21:41:52'),(157,NULL,'mod_hook','mod','profile','listener','getAdminIdentityArray','2022-12-10 21:41:52','2022-12-10 21:41:52'),(158,NULL,'mod_hook','mod','profile','listener','updateClient','2022-12-10 21:41:52','2022-12-10 21:41:52'),(159,NULL,'mod_hook','mod','profile','listener','resetApiKey','2022-12-10 21:41:52','2022-12-10 21:41:52'),(160,NULL,'mod_hook','mod','profile','listener','changeClientPassword','2022-12-10 21:41:52','2022-12-10 21:41:52'),(161,NULL,'mod_hook','mod','servicecustom','listener','action_create','2022-12-10 21:41:52','2022-12-10 21:41:52'),(162,NULL,'mod_hook','mod','servicecustom','listener','action_activate','2022-12-10 21:41:52','2022-12-10 21:41:52'),(163,NULL,'mod_hook','mod','servicecustom','listener','action_renew','2022-12-10 21:41:52','2022-12-10 21:41:52'),(164,NULL,'mod_hook','mod','servicecustom','listener','action_suspend','2022-12-10 21:41:52','2022-12-10 21:41:52'),(165,NULL,'mod_hook','mod','servicecustom','listener','action_unsuspend','2022-12-10 21:41:52','2022-12-10 21:41:52'),(166,NULL,'mod_hook','mod','servicecustom','listener','action_cancel','2022-12-10 21:41:52','2022-12-10 21:41:52'),(167,NULL,'mod_hook','mod','servicecustom','listener','action_uncancel','2022-12-10 21:41:52','2022-12-10 21:41:52'),(168,NULL,'mod_hook','mod','servicecustom','listener','action_delete','2022-12-10 21:41:52','2022-12-10 21:41:52'),(169,NULL,'mod_hook','mod','servicecustom','listener','getConfig','2022-12-10 21:41:52','2022-12-10 21:41:52'),(170,NULL,'mod_hook','mod','servicecustom','listener','toApiArray','2022-12-10 21:41:52','2022-12-10 21:41:52'),(171,NULL,'mod_hook','mod','servicecustom','listener','customCall','2022-12-10 21:41:52','2022-12-10 21:41:52'),(172,NULL,'mod_hook','mod','servicedomain','listener','action_create','2022-12-10 21:41:52','2022-12-10 21:41:52'),(173,NULL,'mod_hook','mod','servicedomain','listener','action_activate','2022-12-10 21:41:52','2022-12-10 21:41:52'),(174,NULL,'mod_hook','mod','servicedomain','listener','action_renew','2022-12-10 21:41:52','2022-12-10 21:41:52'),(175,NULL,'mod_hook','mod','servicedomain','listener','action_suspend','2022-12-10 21:41:52','2022-12-10 21:41:52'),(176,NULL,'mod_hook','mod','servicedomain','listener','action_unsuspend','2022-12-10 21:41:52','2022-12-10 21:41:52'),(177,NULL,'mod_hook','mod','servicedomain','listener','action_cancel','2022-12-10 21:41:52','2022-12-10 21:41:52'),(178,NULL,'mod_hook','mod','servicedomain','listener','action_uncancel','2022-12-10 21:41:52','2022-12-10 21:41:52'),(179,NULL,'mod_hook','mod','servicedomain','listener','action_delete','2022-12-10 21:41:52','2022-12-10 21:41:52'),(180,NULL,'mod_hook','mod','servicedomain','listener','updateNameservers','2022-12-10 21:41:52','2022-12-10 21:41:52'),(181,NULL,'mod_hook','mod','servicedomain','listener','updateContacts','2022-12-10 21:41:52','2022-12-10 21:41:52'),(182,NULL,'mod_hook','mod','servicedomain','listener','getTransferCode','2022-12-10 21:41:52','2022-12-10 21:41:52'),(183,NULL,'mod_hook','mod','servicedomain','listener','lock','2022-12-10 21:41:52','2022-12-10 21:41:52'),(184,NULL,'mod_hook','mod','servicedomain','listener','unlock','2022-12-10 21:41:52','2022-12-10 21:41:52'),(185,NULL,'mod_hook','mod','servicedomain','listener','enablePrivacyProtection','2022-12-10 21:41:52','2022-12-10 21:41:52'),(186,NULL,'mod_hook','mod','servicedomain','listener','disablePrivacyProtection','2022-12-10 21:41:52','2022-12-10 21:41:52'),(187,NULL,'mod_hook','mod','servicedomain','listener','canBeTransferred','2022-12-10 21:41:52','2022-12-10 21:41:52'),(188,NULL,'mod_hook','mod','servicedomain','listener','isDomainAvailable','2022-12-10 21:41:52','2022-12-10 21:41:52'),(189,NULL,'mod_hook','mod','servicedomain','listener','toApiArray','2022-12-10 21:41:52','2022-12-10 21:41:52'),(190,NULL,'mod_hook','mod','servicedomain','listener','onBeforeAdminCronRun','2022-12-10 21:41:52','2022-12-10 21:41:52'),(191,NULL,'mod_hook','mod','servicedomain','listener','tldUpdate','2022-12-10 21:41:52','2022-12-10 21:41:52'),(192,NULL,'mod_hook','mod','servicedomain','listener','tldRm','2022-12-10 21:41:52','2022-12-10 21:41:52'),(193,NULL,'mod_hook','mod','servicedomain','listener','tldToApiArray','2022-12-10 21:41:52','2022-12-10 21:41:52'),(194,NULL,'mod_hook','mod','servicedomain','listener','registrarGetConfiguration','2022-12-10 21:41:52','2022-12-10 21:41:52'),(195,NULL,'mod_hook','mod','servicedomain','listener','registrarGetRegistrarAdapterConfig','2022-12-10 21:41:52','2022-12-10 21:41:52'),(196,NULL,'mod_hook','mod','servicedomain','listener','registrarGetRegistrarAdapter','2022-12-10 21:41:52','2022-12-10 21:41:52'),(197,NULL,'mod_hook','mod','servicedomain','listener','registrarCopy','2022-12-10 21:41:52','2022-12-10 21:41:52'),(198,NULL,'mod_hook','mod','servicedomain','listener','registrarUpdate','2022-12-10 21:41:52','2022-12-10 21:41:52'),(199,NULL,'mod_hook','mod','servicedomain','listener','registrarRm','2022-12-10 21:41:52','2022-12-10 21:41:52'),(200,NULL,'mod_hook','mod','servicedomain','listener','registrarToApiArray','2022-12-10 21:41:52','2022-12-10 21:41:52'),(201,NULL,'mod_hook','mod','servicedomain','listener','updateDomain','2022-12-10 21:41:52','2022-12-10 21:41:52'),(202,NULL,'mod_hook','mod','servicedownloadable','listener','attachOrderConfig','2022-12-10 21:41:52','2022-12-10 21:41:52'),(203,NULL,'mod_hook','mod','servicedownloadable','listener','action_create','2022-12-10 21:41:52','2022-12-10 21:41:52'),(204,NULL,'mod_hook','mod','servicedownloadable','listener','action_activate','2022-12-10 21:41:52','2022-12-10 21:41:52'),(205,NULL,'mod_hook','mod','servicedownloadable','listener','action_renew','2022-12-10 21:41:52','2022-12-10 21:41:52'),(206,NULL,'mod_hook','mod','servicedownloadable','listener','action_suspend','2022-12-10 21:41:52','2022-12-10 21:41:52'),(207,NULL,'mod_hook','mod','servicedownloadable','listener','action_unsuspend','2022-12-10 21:41:52','2022-12-10 21:41:52'),(208,NULL,'mod_hook','mod','servicedownloadable','listener','action_cancel','2022-12-10 21:41:52','2022-12-10 21:41:52'),(209,NULL,'mod_hook','mod','servicedownloadable','listener','action_uncancel','2022-12-10 21:41:52','2022-12-10 21:41:52'),(210,NULL,'mod_hook','mod','servicedownloadable','listener','action_delete','2022-12-10 21:41:52','2022-12-10 21:41:52'),(211,NULL,'mod_hook','mod','servicedownloadable','listener','hitDownload','2022-12-10 21:41:52','2022-12-10 21:41:52'),(212,NULL,'mod_hook','mod','servicedownloadable','listener','toApiArray','2022-12-10 21:41:52','2022-12-10 21:41:52'),(213,NULL,'mod_hook','mod','servicedownloadable','listener','uploadProductFile','2022-12-10 21:41:52','2022-12-10 21:41:52'),(214,NULL,'mod_hook','mod','servicedownloadable','listener','updateProductFile','2022-12-10 21:41:52','2022-12-10 21:41:52'),(215,NULL,'mod_hook','mod','servicedownloadable','listener','sendFile','2022-12-10 21:41:52','2022-12-10 21:41:52'),(216,NULL,'mod_hook','mod','servicehosting','listener','action_create','2022-12-10 21:41:52','2022-12-10 21:41:52'),(217,NULL,'mod_hook','mod','servicehosting','listener','action_activate','2022-12-10 21:41:52','2022-12-10 21:41:52'),(218,NULL,'mod_hook','mod','servicehosting','listener','action_renew','2022-12-10 21:41:52','2022-12-10 21:41:52'),(219,NULL,'mod_hook','mod','servicehosting','listener','action_suspend','2022-12-10 21:41:52','2022-12-10 21:41:52'),(220,NULL,'mod_hook','mod','servicehosting','listener','action_unsuspend','2022-12-10 21:41:52','2022-12-10 21:41:52'),(221,NULL,'mod_hook','mod','servicehosting','listener','action_cancel','2022-12-10 21:41:52','2022-12-10 21:41:52'),(222,NULL,'mod_hook','mod','servicehosting','listener','action_uncancel','2022-12-10 21:41:52','2022-12-10 21:41:52'),(223,NULL,'mod_hook','mod','servicehosting','listener','action_delete','2022-12-10 21:41:52','2022-12-10 21:41:52'),(224,NULL,'mod_hook','mod','servicehosting','listener','changeAccountPlan','2022-12-10 21:41:52','2022-12-10 21:41:52'),(225,NULL,'mod_hook','mod','servicehosting','listener','changeAccountUsername','2022-12-10 21:41:52','2022-12-10 21:41:52'),(226,NULL,'mod_hook','mod','servicehosting','listener','changeAccountIp','2022-12-10 21:41:52','2022-12-10 21:41:52'),(227,NULL,'mod_hook','mod','servicehosting','listener','changeAccountDomain','2022-12-10 21:41:52','2022-12-10 21:41:52'),(228,NULL,'mod_hook','mod','servicehosting','listener','changeAccountPassword','2022-12-10 21:41:52','2022-12-10 21:41:52'),(229,NULL,'mod_hook','mod','servicehosting','listener','sync','2022-12-10 21:41:52','2022-12-10 21:41:52'),(230,NULL,'mod_hook','mod','servicehosting','listener','_getAM','2022-12-10 21:41:52','2022-12-10 21:41:52'),(231,NULL,'mod_hook','mod','servicehosting','listener','toApiArray','2022-12-10 21:41:52','2022-12-10 21:41:52'),(232,NULL,'mod_hook','mod','servicehosting','listener','toHostingServerApiArray','2022-12-10 21:41:52','2022-12-10 21:41:52'),(233,NULL,'mod_hook','mod','servicehosting','listener','update','2022-12-10 21:41:52','2022-12-10 21:41:52'),(234,NULL,'mod_hook','mod','servicehosting','listener','deleteServer','2022-12-10 21:41:52','2022-12-10 21:41:52'),(235,NULL,'mod_hook','mod','servicehosting','listener','updateServer','2022-12-10 21:41:52','2022-12-10 21:41:52'),(236,NULL,'mod_hook','mod','servicehosting','listener','getServerManager','2022-12-10 21:41:52','2022-12-10 21:41:52'),(237,NULL,'mod_hook','mod','servicehosting','listener','testConnection','2022-12-10 21:41:52','2022-12-10 21:41:52'),(238,NULL,'mod_hook','mod','servicehosting','listener','deleteHp','2022-12-10 21:41:52','2022-12-10 21:41:52'),(239,NULL,'mod_hook','mod','servicehosting','listener','toHostingHpApiArray','2022-12-10 21:41:52','2022-12-10 21:41:52'),(240,NULL,'mod_hook','mod','servicehosting','listener','updateHp','2022-12-10 21:41:52','2022-12-10 21:41:52'),(241,NULL,'mod_hook','mod','servicehosting','listener','getServerPackage','2022-12-10 21:41:52','2022-12-10 21:41:52'),(242,NULL,'mod_hook','mod','servicehosting','listener','getServerManagerWithLog','2022-12-10 21:41:52','2022-12-10 21:41:52'),(243,NULL,'mod_hook','mod','servicehosting','listener','getMangerUrls','2022-12-10 21:41:52','2022-12-10 21:41:52'),(244,NULL,'mod_hook','mod','servicehosting','listener','prependOrderConfig','2022-12-10 21:41:52','2022-12-10 21:41:52'),(245,NULL,'mod_hook','mod','servicehosting','listener','getDomainProductFromConfig','2022-12-10 21:41:52','2022-12-10 21:41:52'),(246,NULL,'mod_hook','mod','servicehosting','listener','getFreeTlds','2022-12-10 21:41:52','2022-12-10 21:41:52'),(247,NULL,'mod_hook','mod','servicelicense','listener','attachOrderConfig','2022-12-10 21:41:52','2022-12-10 21:41:52'),(248,NULL,'mod_hook','mod','servicelicense','listener','action_create','2022-12-10 21:41:52','2022-12-10 21:41:52'),(249,NULL,'mod_hook','mod','servicelicense','listener','action_activate','2022-12-10 21:41:52','2022-12-10 21:41:52'),(250,NULL,'mod_hook','mod','servicelicense','listener','action_renew','2022-12-10 21:41:52','2022-12-10 21:41:52'),(251,NULL,'mod_hook','mod','servicelicense','listener','action_suspend','2022-12-10 21:41:52','2022-12-10 21:41:52'),(252,NULL,'mod_hook','mod','servicelicense','listener','action_unsuspend','2022-12-10 21:41:52','2022-12-10 21:41:52'),(253,NULL,'mod_hook','mod','servicelicense','listener','action_cancel','2022-12-10 21:41:52','2022-12-10 21:41:52'),(254,NULL,'mod_hook','mod','servicelicense','listener','action_uncancel','2022-12-10 21:41:52','2022-12-10 21:41:52'),(255,NULL,'mod_hook','mod','servicelicense','listener','action_delete','2022-12-10 21:41:52','2022-12-10 21:41:52'),(256,NULL,'mod_hook','mod','servicelicense','listener','reset','2022-12-10 21:41:52','2022-12-10 21:41:52'),(257,NULL,'mod_hook','mod','servicelicense','listener','isLicenseActive','2022-12-10 21:41:52','2022-12-10 21:41:52'),(258,NULL,'mod_hook','mod','servicelicense','listener','isValidIp','2022-12-10 21:41:52','2022-12-10 21:41:52'),(259,NULL,'mod_hook','mod','servicelicense','listener','isValidVersion','2022-12-10 21:41:52','2022-12-10 21:41:52'),(260,NULL,'mod_hook','mod','servicelicense','listener','isValidPath','2022-12-10 21:41:52','2022-12-10 21:41:52'),(261,NULL,'mod_hook','mod','servicelicense','listener','isValidHost','2022-12-10 21:41:52','2022-12-10 21:41:52'),(262,NULL,'mod_hook','mod','servicelicense','listener','getAdditionalParams','2022-12-10 21:41:52','2022-12-10 21:41:52'),(263,NULL,'mod_hook','mod','servicelicense','listener','getOwnerName','2022-12-10 21:41:52','2022-12-10 21:41:52'),(264,NULL,'mod_hook','mod','servicelicense','listener','getExpirationDate','2022-12-10 21:41:52','2022-12-10 21:41:52'),(265,NULL,'mod_hook','mod','servicelicense','listener','toApiArray','2022-12-10 21:41:52','2022-12-10 21:41:52'),(266,NULL,'mod_hook','mod','servicelicense','listener','update','2022-12-10 21:41:52','2022-12-10 21:41:52'),(267,NULL,'mod_hook','mod','staff','listener','onAfterClientOrderCreate','2022-12-10 21:41:52','2022-12-10 21:41:52'),(268,NULL,'mod_hook','mod','staff','listener','onAfterClientOpenTicket','2022-12-10 21:41:52','2022-12-10 21:41:52'),(269,NULL,'mod_hook','mod','staff','listener','onAfterClientReplyTicket','2022-12-10 21:41:52','2022-12-10 21:41:52'),(270,NULL,'mod_hook','mod','staff','listener','onAfterClientCloseTicket','2022-12-10 21:41:52','2022-12-10 21:41:52'),(271,NULL,'mod_hook','mod','staff','listener','onAfterGuestPublicTicketOpen','2022-12-10 21:41:52','2022-12-10 21:41:52'),(272,NULL,'mod_hook','mod','staff','listener','onAfterClientSignUp','2022-12-10 21:41:52','2022-12-10 21:41:52'),(273,NULL,'mod_hook','mod','staff','listener','onAfterGuestPublicTicketReply','2022-12-10 21:41:52','2022-12-10 21:41:52'),(274,NULL,'mod_hook','mod','staff','listener','onAfterGuestPublicTicketClose','2022-12-10 21:41:52','2022-12-10 21:41:52'),(275,NULL,'mod_hook','mod','staff','listener','toModel_AdminApiArray','2022-12-10 21:41:52','2022-12-10 21:41:52'),(276,NULL,'mod_hook','mod','staff','listener','update','2022-12-10 21:41:52','2022-12-10 21:41:52'),(277,NULL,'mod_hook','mod','staff','listener','delete','2022-12-10 21:41:52','2022-12-10 21:41:52'),(278,NULL,'mod_hook','mod','staff','listener','changePassword','2022-12-10 21:41:52','2022-12-10 21:41:52'),(279,NULL,'mod_hook','mod','staff','listener','toAdminGroupApiArray','2022-12-10 21:41:52','2022-12-10 21:41:52'),(280,NULL,'mod_hook','mod','staff','listener','deleteGroup','2022-12-10 21:41:52','2022-12-10 21:41:52'),(281,NULL,'mod_hook','mod','staff','listener','updateGroup','2022-12-10 21:41:52','2022-12-10 21:41:52'),(282,NULL,'mod_hook','mod','staff','listener','toActivityAdminHistoryApiArray','2022-12-10 21:41:52','2022-12-10 21:41:52'),(283,NULL,'mod_hook','mod','staff','listener','deleteLoginHistory','2022-12-10 21:41:52','2022-12-10 21:41:52'),(284,NULL,'mod_hook','mod','support','listener','onAfterClientOpenTicket','2022-12-10 21:41:52','2022-12-10 21:41:52'),(285,NULL,'mod_hook','mod','support','listener','onAfterAdminOpenTicket','2022-12-10 21:41:52','2022-12-10 21:41:52'),(286,NULL,'mod_hook','mod','support','listener','onAfterAdminCloseTicket','2022-12-10 21:41:52','2022-12-10 21:41:52'),(287,NULL,'mod_hook','mod','support','listener','onAfterAdminReplyTicket','2022-12-10 21:41:52','2022-12-10 21:41:52'),(288,NULL,'mod_hook','mod','support','listener','onAfterGuestPublicTicketOpen','2022-12-10 21:41:52','2022-12-10 21:41:52'),(289,NULL,'mod_hook','mod','support','listener','onAfterAdminPublicTicketOpen','2022-12-10 21:41:52','2022-12-10 21:41:52'),(290,NULL,'mod_hook','mod','support','listener','onAfterAdminPublicTicketReply','2022-12-10 21:41:52','2022-12-10 21:41:52'),(291,NULL,'mod_hook','mod','support','listener','onAfterAdminPublicTicketClose','2022-12-10 21:41:52','2022-12-10 21:41:52'),(292,NULL,'mod_hook','mod','support','listener','findOneByClient','2022-12-10 21:41:52','2022-12-10 21:41:52'),(293,NULL,'mod_hook','mod','support','listener','getActiveTicketsCountForOrder','2022-12-10 21:41:52','2022-12-10 21:41:52'),(294,NULL,'mod_hook','mod','support','listener','checkIfTaskAlreadyExists','2022-12-10 21:41:52','2022-12-10 21:41:52'),(295,NULL,'mod_hook','mod','support','listener','closeTicket','2022-12-10 21:41:52','2022-12-10 21:41:52'),(296,NULL,'mod_hook','mod','support','listener','autoClose','2022-12-10 21:41:52','2022-12-10 21:41:52'),(297,NULL,'mod_hook','mod','support','listener','canBeReopened','2022-12-10 21:41:52','2022-12-10 21:41:52'),(298,NULL,'mod_hook','mod','support','listener','rmByClient','2022-12-10 21:41:52','2022-12-10 21:41:52'),(299,NULL,'mod_hook','mod','support','listener','rm','2022-12-10 21:41:52','2022-12-10 21:41:52'),(300,NULL,'mod_hook','mod','support','listener','toApiArray','2022-12-10 21:41:52','2022-12-10 21:41:52'),(301,NULL,'mod_hook','mod','support','listener','getClientApiArrayForTicket','2022-12-10 21:41:52','2022-12-10 21:41:52'),(302,NULL,'mod_hook','mod','support','listener','noteGetAuthorDetails','2022-12-10 21:41:52','2022-12-10 21:41:52'),(303,NULL,'mod_hook','mod','support','listener','noteRm','2022-12-10 21:41:52','2022-12-10 21:41:52'),(304,NULL,'mod_hook','mod','support','listener','noteToApiArray','2022-12-10 21:41:52','2022-12-10 21:41:52'),(305,NULL,'mod_hook','mod','support','listener','helpdeskRm','2022-12-10 21:41:52','2022-12-10 21:41:52'),(306,NULL,'mod_hook','mod','support','listener','helpdeskToApiArray','2022-12-10 21:41:52','2022-12-10 21:41:52'),(307,NULL,'mod_hook','mod','support','listener','messageGetTicketMessages','2022-12-10 21:41:52','2022-12-10 21:41:52'),(308,NULL,'mod_hook','mod','support','listener','messageGetRepliesCount','2022-12-10 21:41:52','2022-12-10 21:41:52'),(309,NULL,'mod_hook','mod','support','listener','messageGetAuthorDetails','2022-12-10 21:41:52','2022-12-10 21:41:52'),(310,NULL,'mod_hook','mod','support','listener','messageToApiArray','2022-12-10 21:41:52','2022-12-10 21:41:52'),(311,NULL,'mod_hook','mod','support','listener','ticketUpdate','2022-12-10 21:41:52','2022-12-10 21:41:52'),(312,NULL,'mod_hook','mod','support','listener','ticketMessageUpdate','2022-12-10 21:41:52','2022-12-10 21:41:52'),(313,NULL,'mod_hook','mod','support','listener','ticketReply','2022-12-10 21:41:52','2022-12-10 21:41:52'),(314,NULL,'mod_hook','mod','support','listener','ticketCreateForAdmin','2022-12-10 21:41:52','2022-12-10 21:41:52'),(315,NULL,'mod_hook','mod','support','listener','canClientSubmitNewTicket','2022-12-10 21:41:52','2022-12-10 21:41:52'),(316,NULL,'mod_hook','mod','support','listener','ticketCreateForClient','2022-12-10 21:41:52','2022-12-10 21:41:52'),(317,NULL,'mod_hook','mod','support','listener','messageCreateForTicket','2022-12-10 21:41:52','2022-12-10 21:41:52'),(318,NULL,'mod_hook','mod','support','listener','publicCloseTicket','2022-12-10 21:41:52','2022-12-10 21:41:52'),(319,NULL,'mod_hook','mod','support','listener','publicAutoClose','2022-12-10 21:41:52','2022-12-10 21:41:52'),(320,NULL,'mod_hook','mod','support','listener','publicRm','2022-12-10 21:41:52','2022-12-10 21:41:52'),(321,NULL,'mod_hook','mod','support','listener','publicToApiArray','2022-12-10 21:41:52','2022-12-10 21:41:52'),(322,NULL,'mod_hook','mod','support','listener','publicMessageGetAuthorDetails','2022-12-10 21:41:52','2022-12-10 21:41:52'),(323,NULL,'mod_hook','mod','support','listener','publicMessageToApiArray','2022-12-10 21:41:52','2022-12-10 21:41:52'),(324,NULL,'mod_hook','mod','support','listener','publicTicketUpdate','2022-12-10 21:41:52','2022-12-10 21:41:52'),(325,NULL,'mod_hook','mod','support','listener','publicTicketReply','2022-12-10 21:41:52','2022-12-10 21:41:52'),(326,NULL,'mod_hook','mod','support','listener','publicTicketReplyForGuest','2022-12-10 21:41:52','2022-12-10 21:41:52'),(327,NULL,'mod_hook','mod','support','listener','helpdeskUpdate','2022-12-10 21:41:52','2022-12-10 21:41:52'),(328,NULL,'mod_hook','mod','support','listener','cannedRm','2022-12-10 21:41:52','2022-12-10 21:41:52'),(329,NULL,'mod_hook','mod','support','listener','cannedToApiArray','2022-12-10 21:41:52','2022-12-10 21:41:52'),(330,NULL,'mod_hook','mod','support','listener','cannedCategoryRm','2022-12-10 21:41:52','2022-12-10 21:41:52'),(331,NULL,'mod_hook','mod','support','listener','cannedCategoryToApiArray','2022-12-10 21:41:52','2022-12-10 21:41:52'),(332,NULL,'mod_hook','mod','support','listener','cannedUpdate','2022-12-10 21:41:52','2022-12-10 21:41:52'),(333,NULL,'mod_hook','mod','support','listener','cannedCategoryUpdate','2022-12-10 21:41:52','2022-12-10 21:41:52'),(334,NULL,'mod_hook','mod','support','listener','noteCreate','2022-12-10 21:41:52','2022-12-10 21:41:52'),(335,NULL,'mod_hook','mod','support','listener','ticketTaskComplete','2022-12-10 21:41:52','2022-12-10 21:41:52'),(336,NULL,'mod_hook','mod','theme','listener','getCurrentThemePreset','2022-12-10 21:41:52','2022-12-10 21:41:52'),(337,NULL,'mod_hook','mod','theme','listener','setCurrentThemePreset','2022-12-10 21:41:52','2022-12-10 21:41:52'),(338,NULL,'mod_hook','mod','theme','listener','deletePreset','2022-12-10 21:41:52','2022-12-10 21:41:52'),(339,NULL,'mod_hook','mod','theme','listener','getThemePresets','2022-12-10 21:41:52','2022-12-10 21:41:52'),(340,NULL,'mod_hook','mod','theme','listener','getThemeSettings','2022-12-10 21:41:52','2022-12-10 21:41:52'),(341,NULL,'mod_hook','mod','theme','listener','uploadAssets','2022-12-10 21:41:52','2022-12-10 21:41:52'),(342,NULL,'mod_hook','mod','theme','listener','updateSettings','2022-12-10 21:41:52','2022-12-10 21:41:52'),(343,NULL,'mod_hook','mod','theme','listener','regenerateThemeSettingsDataFile','2022-12-10 21:41:52','2022-12-10 21:41:52'),(344,NULL,'mod_hook','mod','theme','listener','regenerateThemeCssAndJsFiles','2022-12-10 21:41:52','2022-12-10 21:41:52'),(345,NULL,'mod_hook','mod','demo','listener','onBeforeAdminStaffUpdate','2022-12-10 21:46:52','2022-12-10 21:46:52'),(346,NULL,'mod_hook','mod','demo','listener','onBeforeAdminStaffDelete','2022-12-10 21:46:52','2022-12-10 21:46:52'),(347,NULL,'mod_hook','mod','demo','listener','onBeforeAdminStaffCreate','2022-12-10 21:46:52','2022-12-10 21:46:52'),(348,NULL,'mod_hook','mod','demo','listener','onBeforeAdminStaffPasswordChange','2022-12-10 21:46:52','2022-12-10 21:46:52'),(349,NULL,'mod_hook','mod','demo','listener','onBeforeAdminStaffProfileUpdate','2022-12-10 21:46:52','2022-12-10 21:46:52'),(350,NULL,'mod_hook','mod','demo','listener','onBeforeAdminStaffProfilePasswordChange','2022-12-10 21:46:52','2022-12-10 21:46:52'),(351,NULL,'mod_hook','mod','demo','listener','onBeforeAdminStaffApiKeyChange','2022-12-10 21:46:52','2022-12-10 21:46:52'),(352,NULL,'mod_hook','mod','demo','listener','onBeforeClientProfileUpdate','2022-12-10 21:46:52','2022-12-10 21:46:52'),(353,NULL,'mod_hook','mod','demo','listener','onBeforeClientProfilePasswordChange','2022-12-10 21:46:52','2022-12-10 21:46:52'),(354,NULL,'mod_hook','mod','demo','listener','onBeforeAdminClientCreate','2022-12-10 21:46:52','2022-12-10 21:46:52'),(355,NULL,'mod_hook','mod','demo','listener','onBeforeAdminClientDelete','2022-12-10 21:46:52','2022-12-10 21:46:52'),(356,NULL,'mod_hook','mod','demo','listener','onBeforeAdminClientUpdate','2022-12-10 21:46:52','2022-12-10 21:46:52'),(357,NULL,'mod_hook','mod','demo','listener','onBeforeAdminClientPasswordChange','2022-12-10 21:46:52','2022-12-10 21:46:52'),(358,NULL,'mod_hook','mod','demo','listener','onBeforeAdminSettingsUpdate','2022-12-10 21:46:52','2022-12-10 21:46:52'),(359,NULL,'mod_hook','mod','demo','listener','onBeforeAdminDeleteCurrency','2022-12-10 21:46:52','2022-12-10 21:46:52'),(360,NULL,'mod_hook','mod','demo','listener','onBeforeAdminUpdateCore','2022-12-10 21:46:52','2022-12-10 21:46:52'),(361,NULL,'mod_hook','mod','demo','listener','onBeforeAdminUpdateExtension','2022-12-10 21:46:52','2022-12-10 21:46:52');
/*!40000 ALTER TABLE `extension_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form`
--

DROP TABLE IF EXISTS `form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `form` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `style` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form`
--

LOCK TABLES `form` WRITE;
/*!40000 ALTER TABLE `form` DISABLE KEYS */;
/*!40000 ALTER TABLE `form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_field`
--

DROP TABLE IF EXISTS `form_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `form_field` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_id` bigint DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `hide_label` tinyint(1) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `default_value` varchar(255) DEFAULT NULL,
  `required` tinyint(1) DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT NULL,
  `readonly` tinyint(1) DEFAULT NULL,
  `is_unique` tinyint(1) DEFAULT NULL,
  `prefix` varchar(255) DEFAULT NULL,
  `suffix` varchar(255) DEFAULT NULL,
  `options` text,
  `show_initial` varchar(255) DEFAULT NULL,
  `show_middle` varchar(255) DEFAULT NULL,
  `show_prefix` varchar(255) DEFAULT NULL,
  `show_suffix` varchar(255) DEFAULT NULL,
  `text_size` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `form_id_idx` (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_field`
--

LOCK TABLES `form_field` WRITE;
/*!40000 ALTER TABLE `form_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `client_id` bigint DEFAULT NULL,
  `serie` varchar(50) DEFAULT NULL,
  `nr` varchar(255) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL COMMENT 'To access via public link',
  `currency` varchar(25) DEFAULT NULL,
  `currency_rate` decimal(13,6) DEFAULT NULL,
  `credit` double(18,2) DEFAULT NULL,
  `base_income` double(18,2) DEFAULT NULL COMMENT 'Income in default currency',
  `base_refund` double(18,2) DEFAULT NULL COMMENT 'Refund in default currency',
  `refund` double(18,2) DEFAULT NULL,
  `notes` text,
  `text_1` text,
  `text_2` text,
  `status` varchar(50) DEFAULT 'unpaid' COMMENT 'paid, unpaid',
  `seller_company` varchar(255) DEFAULT NULL,
  `seller_company_vat` varchar(255) DEFAULT NULL,
  `seller_company_number` varchar(255) DEFAULT NULL,
  `seller_address` varchar(255) DEFAULT NULL,
  `seller_phone` varchar(255) DEFAULT NULL,
  `seller_email` varchar(255) DEFAULT NULL,
  `buyer_first_name` varchar(255) DEFAULT NULL,
  `buyer_last_name` varchar(255) DEFAULT NULL,
  `buyer_company` varchar(255) DEFAULT NULL,
  `buyer_company_vat` varchar(255) DEFAULT NULL,
  `buyer_company_number` varchar(255) DEFAULT NULL,
  `buyer_address` varchar(255) DEFAULT NULL,
  `buyer_city` varchar(255) DEFAULT NULL,
  `buyer_state` varchar(255) DEFAULT NULL,
  `buyer_country` varchar(255) DEFAULT NULL,
  `buyer_zip` varchar(255) DEFAULT NULL,
  `buyer_phone` varchar(255) DEFAULT NULL,
  `buyer_phone_cc` varchar(255) DEFAULT NULL,
  `buyer_email` varchar(255) DEFAULT NULL,
  `gateway_id` int DEFAULT NULL,
  `approved` tinyint(1) DEFAULT '0',
  `taxname` varchar(255) DEFAULT NULL,
  `taxrate` varchar(35) DEFAULT NULL,
  `due_at` datetime DEFAULT NULL,
  `reminded_at` datetime DEFAULT NULL,
  `paid_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hash` (`hash`),
  KEY `client_id_idx` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_item`
--

DROP TABLE IF EXISTS `invoice_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `rel_id` text,
  `task` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `period` varchar(10) DEFAULT NULL,
  `quantity` bigint DEFAULT NULL,
  `unit` varchar(100) DEFAULT NULL,
  `price` double(18,2) DEFAULT NULL,
  `charged` tinyint(1) DEFAULT '0',
  `taxed` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_id_idx` (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_item`
--

LOCK TABLES `invoice_item` WRITE;
/*!40000 ALTER TABLE `invoice_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kb_article`
--

DROP TABLE IF EXISTS `kb_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kb_article` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `kb_article_category_id` bigint DEFAULT NULL,
  `views` int DEFAULT '0',
  `title` varchar(100) DEFAULT NULL,
  `content` text,
  `slug` varchar(255) DEFAULT NULL,
  `status` varchar(30) DEFAULT 'active' COMMENT 'active, draft',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `kb_article_category_id_idx` (`kb_article_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kb_article`
--

LOCK TABLES `kb_article` WRITE;
/*!40000 ALTER TABLE `kb_article` DISABLE KEYS */;
INSERT INTO `kb_article` VALUES (1,2,0,'How to contact support','Registered clients can contact our support team:\n------------------------------------------------------------\n\n* Login to clients area\n* Select **Support** menu item\n* Click **Submit new ticket**\n* Fill the form and press *Submit*\n\nGuests can contact our support team:\n------------------------------------------------------------\n\n* Use our contact form.\n* Fill the form and click *Submit*\n','how-to-contact-support','active','2022-12-01 12:00:00','2022-12-01 12:00:00'),(2,2,0,'How to place new order','To place new order, follow these steps:\n------------------------------------------------------------\n\n* Select our services at *Order* page.\n* Depending on selected product, you might need to provide additional information to complete order request.\n* Click \"Continue\" and your product/service is now in shopping cart.\n* If you have promo code, you can apply it and get discount.\n* Click on \"Checkout\" button to proceed with checkout process\n    * If you are already logged in, uou will be automaticaly redirected to new invoice\n    * If you are registerd client, you can provide your login details\n    * If you have never purchased any service from us, fill up client sign up form, and continue checkout\n* Choose payment method to pay for invoice. List of all avalable payment methods will be listed below invoice details.\n* Choose payment method\n* You will be redirected to payment gateway page\n* After successful payment, You will be redirected back to invoice page.\n* Depending on selected services your order will be reviewed and activated by our staff members.\n* After you receive confirmation email about order activation you are able to manage your services.\n','how-to-place-new-order','active','2022-12-01 12:00:00','2022-12-01 12:00:00'),(3,2,0,'Example article','Example article heading\n------------------------------------------------------------\n\nCursus, parturient porta dis sit? Habitasse non, sociis porttitor, sagittis dapibus scelerisque? Pid, porttitor integer, montes. Hac, in? Arcu nunc integer nascetur dis nisi. In, sed a amet? Adipiscing odio mauris mauris, porta, integer, adipiscing habitasse, elementum phasellus, turpis in? Quis magna placerat eu, cursus urna mattis egestas, a ac massa turpis mus et odio pid in, urna dapibus ridiculus in turpis cursus ac a urna magna purus etiam ac nisi porttitor! Auctor est? In adipiscing, hac platea augue vut, hac est cum sagittis! Montes nascetur pulvinar tristique porta platea? Magnis vel etiam nisi augue auctor sit pulvinar! Aliquet rhoncus, elit porta? Magnis pulvinar eu turpis purus sociis a augue? Sit, nascetur! Mattis nisi, penatibus ac ac natoque auctor turpis.\n\nExample article heading\n------------------------------------------------------------\n\nUt diam cursus, elit pulvinar, habitasse purus? Enim. Urna? Velit arcu, rhoncus sociis sed, et, ultrices nascetur lacus vut purus tempor a. Vel? Sagittis integer scelerisque, dapibus lectus mid, magnis, augue duis velit etiam tortor! Eros, a et phasellus est ultricies integer elementum in, tempor sed parturient. Dictumst rhoncus, ut sed sagittis facilisis? In, proin? Urna augue in sociis enim dignissim! Velit magna tincidunt ac. Nunc, vel auctor porta enim integer. Phasellus amet eu. Tristique lundium arcu! In? Massa penatibus arcu, rhoncus augue ut pid pulvinar, porttitor, porta, et! A sit odio, proin natoque ultrices cras cras magna porttitor! Ultrices sed magna in! Porttitor nunc, tincidunt nec, amet integer aenean. Tincidunt, placerat nec dolor parturient et ac pulvinar a.\n','example-article-slug','active','2022-12-01 12:00:00','2022-12-01 12:00:00');
/*!40000 ALTER TABLE `kb_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kb_article_category`
--

DROP TABLE IF EXISTS `kb_article_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kb_article_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `description` text,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kb_article_category`
--

LOCK TABLES `kb_article_category` WRITE;
/*!40000 ALTER TABLE `kb_article_category` DISABLE KEYS */;
INSERT INTO `kb_article_category` VALUES (1,'Frequently asked questions','Section for common issues','faq','2022-12-01 12:00:00','2022-12-01 12:00:00'),(2,'How to\'s','Section dedicated for tutorials','how-to','2022-12-01 12:00:00','2022-12-01 12:00:00');
/*!40000 ALTER TABLE `kb_article_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mod_email_queue`
--

DROP TABLE IF EXISTS `mod_email_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mod_email_queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `recipient` varchar(255) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `to_name` varchar(255) DEFAULT NULL,
  `from_name` varchar(255) DEFAULT NULL,
  `client_id` int DEFAULT NULL,
  `admin_id` int DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `tries` int NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mod_email_queue`
--

LOCK TABLES `mod_email_queue` WRITE;
/*!40000 ALTER TABLE `mod_email_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `mod_email_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mod_massmailer`
--

DROP TABLE IF EXISTS `mod_massmailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mod_massmailer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `from_email` varchar(255) DEFAULT NULL,
  `from_name` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `content` text,
  `filter` text,
  `status` varchar(255) DEFAULT NULL,
  `sent_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mod_massmailer`
--

LOCK TABLES `mod_massmailer` WRITE;
/*!40000 ALTER TABLE `mod_massmailer` DISABLE KEYS */;
/*!40000 ALTER TABLE `mod_massmailer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_gateway`
--

DROP TABLE IF EXISTS `pay_gateway`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pay_gateway` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `gateway` varchar(255) DEFAULT NULL,
  `accepted_currencies` text,
  `enabled` tinyint(1) DEFAULT '1',
  `allow_single` tinyint(1) DEFAULT '1',
  `allow_recurrent` tinyint(1) DEFAULT '1',
  `test_mode` tinyint(1) DEFAULT '0',
  `config` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_gateway`
--

LOCK TABLES `pay_gateway` WRITE;
/*!40000 ALTER TABLE `pay_gateway` DISABLE KEYS */;
INSERT INTO `pay_gateway` VALUES (1,'Custom','Custom',NULL,1,1,1,0,NULL),(2,'PayPal','PayPalEmail',NULL,0,1,1,0,NULL);
/*!40000 ALTER TABLE `pay_gateway` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `admin_id` bigint DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `content` text,
  `slug` varchar(255) DEFAULT NULL,
  `status` varchar(30) DEFAULT 'draft' COMMENT 'active, draft',
  `image` varchar(255) DEFAULT NULL,
  `section` varchar(255) DEFAULT NULL,
  `publish_at` datetime DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `admin_id_idx` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,1,'FOSSBilling needs your donations','Donations are crucial for the success and sustainability of FOSSBilling and other open-source projects. We need your help.','Donations are crucial for the success and sustainability of FOSSBilling and other open-source projects. Without financial support from users and the broader community, it is difficult for these projects to continue to grow and evolve.\nDonations help to cover the costs of development and maintenance. Developing and maintaining software requires time and resources, and without financial support, it can be challenging for open-source projects to sustain their efforts.\n\nThe FOSSBilling project has expenses such as hosting, hardware, software, and other costs associated with developing and maintaining FOSSBilling and other open-source projects. Your donations also help cover some of the maintainers\' expenses.\nClick [here](https://fossbilling.org/donate) to donate to the FOSSBilling project.','fossbilling-needs-your-donations','active',NULL,NULL,NULL,NULL,NULL,'2022-12-01 12:00:00','2022-12-01 12:00:00'),(2,1,'Check out great features of FOSSBilling','FOSSBilling supports automated billing, invoicing, product provisioning','* Supports automated billing, invoicing, product provisioning\n* Automatically create accounts as soon as the payment is received, suspend when account becomes overdue, terminate when a specified amount of time passes.\n* FOSSBilling is perfectly created to sell shared and reseller hosting accounts, software licenses and downloadable products.\n* Integrated helpdesk, knowledgebase, news and announcements system.\n','great-features-of-fossbilling','active',NULL,NULL,NULL,NULL,NULL,'2022-12-01 12:00:00','2022-12-01 12:00:00'),(3,1,'FOSSBilling is customizable','You can create your own simple or advanced hooks on FOSSBilling events.','* You can create your own simple or advanced hooks on FOSSBilling events. For example, send notification via sms when new client signs up.\n* Create custom theme for your client interface\n','fossbilling-is-customizable','active',NULL,NULL,NULL,NULL,NULL,'2022-12-01 12:00:00','2022-12-01 12:00:00');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_category_id` bigint DEFAULT NULL,
  `product_payment_id` bigint DEFAULT NULL,
  `form_id` bigint DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` text,
  `unit` varchar(50) DEFAULT 'product',
  `active` tinyint(1) DEFAULT '1',
  `status` varchar(50) DEFAULT 'enabled' COMMENT 'enabled, disabled',
  `hidden` tinyint(1) DEFAULT '0',
  `is_addon` tinyint(1) DEFAULT '0',
  `setup` varchar(50) DEFAULT 'after_payment',
  `addons` text,
  `icon_url` varchar(255) DEFAULT NULL,
  `allow_quantity_select` tinyint(1) DEFAULT '0',
  `stock_control` tinyint(1) DEFAULT '0',
  `quantity_in_stock` int DEFAULT '0',
  `plugin` varchar(255) DEFAULT NULL,
  `plugin_config` text,
  `upgrades` text,
  `priority` bigint DEFAULT NULL,
  `config` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `product_type_idx` (`type`),
  KEY `product_category_id_idx` (`product_category_id`),
  KEY `product_payment_id_idx` (`product_payment_id`),
  KEY `form_id_idx` (`form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,NULL,NULL,'Domains registration and transfer','domain-checker',NULL,'product',1,'enabled',0,0,'after_payment',NULL,NULL,0,0,0,NULL,NULL,NULL,1,NULL,'2022-12-01 12:00:00','2022-12-01 12:00:00','domain');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `description` text,
  `icon_url` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,'Default category',NULL,NULL,'2022-12-01 12:00:00','2022-12-01 12:00:00');
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_payment`
--

DROP TABLE IF EXISTS `product_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_payment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` varchar(30) DEFAULT NULL COMMENT 'free, once, recurrent',
  `once_price` decimal(18,2) DEFAULT '0.00',
  `once_setup_price` decimal(18,2) DEFAULT '0.00',
  `w_price` decimal(18,2) DEFAULT '0.00',
  `m_price` decimal(18,2) DEFAULT '0.00',
  `q_price` decimal(18,2) DEFAULT '0.00',
  `b_price` decimal(18,2) DEFAULT '0.00',
  `a_price` decimal(18,2) DEFAULT '0.00',
  `bia_price` decimal(18,2) DEFAULT '0.00',
  `tria_price` decimal(18,2) DEFAULT '0.00',
  `w_setup_price` decimal(18,2) DEFAULT '0.00',
  `m_setup_price` decimal(18,2) DEFAULT '0.00',
  `q_setup_price` decimal(18,2) DEFAULT '0.00',
  `b_setup_price` decimal(18,2) DEFAULT '0.00',
  `a_setup_price` decimal(18,2) DEFAULT '0.00',
  `bia_setup_price` decimal(18,2) DEFAULT '0.00',
  `tria_setup_price` decimal(18,2) DEFAULT '0.00',
  `w_enabled` tinyint(1) DEFAULT '1',
  `m_enabled` tinyint(1) DEFAULT '1',
  `q_enabled` tinyint(1) DEFAULT '1',
  `b_enabled` tinyint(1) DEFAULT '1',
  `a_enabled` tinyint(1) DEFAULT '1',
  `bia_enabled` tinyint(1) DEFAULT '1',
  `tria_enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_payment`
--

LOCK TABLES `product_payment` WRITE;
/*!40000 ALTER TABLE `product_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promo`
--

DROP TABLE IF EXISTS `promo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(100) DEFAULT NULL,
  `description` text,
  `type` varchar(30) NOT NULL DEFAULT 'percentage' COMMENT 'absolute, percentage, trial',
  `value` decimal(18,2) DEFAULT NULL,
  `maxuses` int DEFAULT '0',
  `used` int DEFAULT '0',
  `freesetup` tinyint(1) DEFAULT '0',
  `once_per_client` tinyint(1) DEFAULT '0',
  `recurring` tinyint(1) DEFAULT '0',
  `active` tinyint(1) DEFAULT '0',
  `products` text,
  `periods` text,
  `client_groups` text,
  `start_at` datetime DEFAULT NULL,
  `end_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `start_index_idx` (`start_at`),
  KEY `end_index_idx` (`end_at`),
  KEY `active_index_idx` (`active`),
  KEY `code_index_idx` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promo`
--

LOCK TABLES `promo` WRITE;
/*!40000 ALTER TABLE `promo` DISABLE KEYS */;
/*!40000 ALTER TABLE `promo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queue` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `module` varchar(255) DEFAULT NULL,
  `timeout` bigint DEFAULT NULL,
  `iteration` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue_message`
--

DROP TABLE IF EXISTS `queue_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queue_message` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `queue_id` bigint DEFAULT NULL,
  `handle` char(32) DEFAULT NULL,
  `handler` varchar(255) DEFAULT NULL,
  `body` longblob,
  `hash` char(32) DEFAULT NULL,
  `timeout` double(18,2) DEFAULT NULL,
  `log` text,
  `execute_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `queue_id_idx` (`queue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue_message`
--

LOCK TABLES `queue_message` WRITE;
/*!40000 ALTER TABLE `queue_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_custom`
--

DROP TABLE IF EXISTS `service_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_custom` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `client_id` bigint DEFAULT NULL,
  `plugin` varchar(255) DEFAULT NULL,
  `plugin_config` text,
  `f1` text,
  `f2` text,
  `f3` text,
  `f4` text,
  `f5` text,
  `f6` text,
  `f7` text,
  `f8` text,
  `f9` text,
  `f10` text,
  `config` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id_idx` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_custom`
--

LOCK TABLES `service_custom` WRITE;
/*!40000 ALTER TABLE `service_custom` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_domain`
--

DROP TABLE IF EXISTS `service_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_domain` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `client_id` bigint DEFAULT NULL,
  `tld_registrar_id` bigint DEFAULT NULL,
  `sld` varchar(255) DEFAULT NULL,
  `tld` varchar(100) DEFAULT NULL,
  `ns1` varchar(255) DEFAULT NULL,
  `ns2` varchar(255) DEFAULT NULL,
  `ns3` varchar(255) DEFAULT NULL,
  `ns4` varchar(255) DEFAULT NULL,
  `period` int DEFAULT NULL,
  `privacy` int DEFAULT NULL,
  `locked` tinyint(1) DEFAULT '1',
  `transfer_code` varchar(255) DEFAULT NULL,
  `action` varchar(30) DEFAULT NULL,
  `contact_email` varchar(255) DEFAULT NULL,
  `contact_company` varchar(255) DEFAULT NULL,
  `contact_first_name` varchar(255) DEFAULT NULL,
  `contact_last_name` varchar(255) DEFAULT NULL,
  `contact_address1` varchar(255) DEFAULT NULL,
  `contact_address2` varchar(255) DEFAULT NULL,
  `contact_city` varchar(255) DEFAULT NULL,
  `contact_state` varchar(255) DEFAULT NULL,
  `contact_postcode` varchar(255) DEFAULT NULL,
  `contact_country` varchar(255) DEFAULT NULL,
  `contact_phone_cc` varchar(255) DEFAULT NULL,
  `contact_phone` varchar(255) DEFAULT NULL,
  `details` text,
  `synced_at` datetime DEFAULT NULL,
  `registered_at` datetime DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id_idx` (`client_id`),
  KEY `tld_registrar_id_idx` (`tld_registrar_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_domain`
--

LOCK TABLES `service_domain` WRITE;
/*!40000 ALTER TABLE `service_domain` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_downloadable`
--

DROP TABLE IF EXISTS `service_downloadable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_downloadable` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `client_id` bigint DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL,
  `downloads` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id_idx` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_downloadable`
--

LOCK TABLES `service_downloadable` WRITE;
/*!40000 ALTER TABLE `service_downloadable` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_downloadable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_hosting`
--

DROP TABLE IF EXISTS `service_hosting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_hosting` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `client_id` bigint DEFAULT NULL,
  `service_hosting_server_id` bigint DEFAULT NULL,
  `service_hosting_hp_id` bigint DEFAULT NULL,
  `sld` varchar(255) DEFAULT NULL,
  `tld` varchar(255) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `reseller` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id_idx` (`client_id`),
  KEY `service_hosting_server_id_idx` (`service_hosting_server_id`),
  KEY `service_hosting_hp_id_idx` (`service_hosting_hp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_hosting`
--

LOCK TABLES `service_hosting` WRITE;
/*!40000 ALTER TABLE `service_hosting` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_hosting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_hosting_hp`
--

DROP TABLE IF EXISTS `service_hosting_hp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_hosting_hp` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `quota` varchar(50) DEFAULT NULL,
  `bandwidth` varchar(50) DEFAULT NULL,
  `max_ftp` varchar(50) DEFAULT NULL,
  `max_sql` varchar(50) DEFAULT NULL,
  `max_pop` varchar(50) DEFAULT NULL,
  `max_sub` varchar(50) DEFAULT NULL,
  `max_park` varchar(50) DEFAULT NULL,
  `max_addon` varchar(50) DEFAULT NULL,
  `config` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_hosting_hp`
--

LOCK TABLES `service_hosting_hp` WRITE;
/*!40000 ALTER TABLE `service_hosting_hp` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_hosting_hp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_hosting_server`
--

DROP TABLE IF EXISTS `service_hosting_server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_hosting_server` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `hostname` varchar(100) DEFAULT NULL,
  `assigned_ips` text,
  `status_url` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `max_accounts` bigint DEFAULT NULL,
  `ns1` varchar(100) DEFAULT NULL,
  `ns2` varchar(100) DEFAULT NULL,
  `ns3` varchar(100) DEFAULT NULL,
  `ns4` varchar(100) DEFAULT NULL,
  `manager` varchar(100) DEFAULT NULL,
  `username` text,
  `password` text,
  `accesshash` text,
  `port` varchar(20) DEFAULT NULL,
  `config` text,
  `secure` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_hosting_server`
--

LOCK TABLES `service_hosting_server` WRITE;
/*!40000 ALTER TABLE `service_hosting_server` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_hosting_server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_license`
--

DROP TABLE IF EXISTS `service_license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_license` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `client_id` bigint DEFAULT NULL,
  `license_key` varchar(255) DEFAULT NULL,
  `validate_ip` tinyint(1) DEFAULT '1',
  `validate_host` tinyint(1) DEFAULT '1',
  `validate_path` tinyint(1) DEFAULT '0',
  `validate_version` tinyint(1) DEFAULT '0',
  `ips` text,
  `hosts` text,
  `paths` text,
  `versions` text,
  `config` text,
  `plugin` varchar(255) DEFAULT NULL,
  `checked_at` datetime DEFAULT NULL,
  `pinged_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `license_key` (`license_key`),
  KEY `client_id_idx` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_license`
--

LOCK TABLES `service_license` WRITE;
/*!40000 ALTER TABLE `service_license` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_license` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_membership`
--

DROP TABLE IF EXISTS `service_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_membership` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `client_id` bigint DEFAULT NULL,
  `config` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id_idx` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_membership`
--

LOCK TABLES `service_membership` WRITE;
/*!40000 ALTER TABLE `service_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `modified_at` int DEFAULT NULL,
  `content` text,
  UNIQUE KEY `unique_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` VALUES ('e77615579889d6a6ab7b9028f8a47f75',1670708813,'YWRtaW58YTo0OntzOjI6ImlkIjtzOjE6IjEiO3M6NToiZW1haWwiO3M6MjA6ImRlbW9AZm9zc2JpbGxpbmcub3JnIjtzOjQ6Im5hbWUiO3M6NDoiRGVtbyI7czo0OiJyb2xlIjtzOjU6ImFkbWluIjt9');
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `param` varchar(255) DEFAULT NULL,
  `value` text,
  `public` tinyint(1) DEFAULT '0',
  `category` varchar(255) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `param` (`param`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` VALUES (1,'last_patch','25',0,NULL,NULL,'2022-12-01 12:00:00','2022-12-01 12:00:00'),(2,'company_name','Company Name',0,NULL,NULL,'2022-12-01 12:00:00','2022-12-01 12:00:00'),(3,'company_email','company@email.com',0,NULL,NULL,'2022-12-01 12:00:00','2022-12-01 12:00:00'),(4,'company_signature','FOSSBilling.org - Client Management, Invoice and Support Software',0,NULL,NULL,'2022-12-01 12:00:00','2022-12-01 12:00:00'),(5,'company_logo','themes/huraga/assets/img/logo.svg',0,NULL,NULL,'2022-12-01 12:00:00','2022-12-01 12:00:00'),(6,'company_logo_dark','themes/huraga/assets/img/logo_white.svg',0,NULL,NULL,'2022-12-01 12:00:00','2022-12-01 12:00:00'),(7,'company_address_1','Demo address line 1',0,NULL,NULL,'2022-12-01 12:00:00','2022-12-01 12:00:00'),(8,'company_address_2','Demo address line 2',0,NULL,NULL,'2022-12-01 12:00:00','2022-12-01 12:00:00'),(9,'company_address_3','Demo address line 3',0,NULL,NULL,'2022-12-01 12:00:00','2022-12-01 12:00:00'),(10,'company_tel','+123 456 12345',0,NULL,NULL,'2022-12-01 12:00:00','2022-12-01 12:00:00'),(11,'company_tos','Sit ridiculus nascetur porta purus tortor, augue natoque, pulvinar integer nisi mattis dignissim mus, elementum nascetur, augue etiam. Mus mus tortor? A mauris habitasse dictumst, scelerisque, dis nec pulvinar magnis velit, integer, nisi, aliquet, elit phasellus? Parturient odio purus tristique porttitor augue diam pulvinar magna ac lacus in. Augue tincidunt sociis ultrices parturient aliquet dapibus sit. Pulvinar mauris platea in amet penatibus augue ut non ridiculus, nunc lundium. Duis dapibus a mid proin pellentesque lundium vut mauris egestas dolor nec? Diam eu duis sociis. Dapibus porta! Proin, turpis nascetur et. Aenean tristique eu in elit dolor, montes sit nec, magna amet montes, hac diam ac, pellentesque duis sociis, est placerat? Montes ac, nunc aliquet ridiculus nisi? Dignissim. Et aliquet sed.\n\nAuctor mid, mauris placerat? Scelerisque amet a a facilisis porttitor aenean dolor, placerat dapibus, odio parturient scelerisque? In dis arcu nec mid ac in adipiscing ultricies, pulvinar purus dis. Nisi dis massa magnis, porta amet, scelerisque turpis etiam scelerisque porttitor ac dictumst, cras, enim? Placerat enim pulvinar turpis a cum! Aliquam? Urna ut facilisis diam diam lorem mattis ut, ac pid, sed pellentesque. Egestas nunc, lacus, tempor amet? Lacus, nunc dictumst, ac porttitor magna, nisi, montes scelerisque? Cum, rhoncus. Pid adipiscing porta dictumst porta amet dignissim purus, aliquet dolor non sagittis porta urna? Tortor egestas, ultricies elementum, placerat velit magnis lacus? Augue nunc? Ac et cras ut? Ac odio tortor lectus. Mattis adipiscing urna, scelerisque nec aenean adipiscing mid.\n',0,NULL,NULL,'2022-12-01 12:00:00','2022-12-01 12:00:00'),(12,'company_privacy_policy','Ac dapibus. Rhoncus integer sit aliquam a! Natoque? Lacus porttitor rhoncus, aliquam porttitor in risus turpis adipiscing! Integer, mus mattis sed enim ac velit proin est et ut, amet eros! Hac augue et vel ac sit duis facilisis purus tincidunt, porttitor eu a penatibus rhoncus platea et mauris rhoncus magnis rhoncus, montes? Et porttitor, urna, dolor, dapibus elementum porttitor aliquam.\n\nCras risus? Turpis, mus tincidunt vel dolor lectus pulvinar aliquam nascetur parturient nunc proin aenean tortor, augue aenean ac penatibus vut arcu. Augue, aenean dapibus in nec. In tempor turpis dictumst cursus, nec eros, elit non, ut integer magna. Augue placerat magnis facilisis platea ridiculus tincidunt et ut porttitor! Cursus odio, aliquet purus tristique vel tempor urna, vut enim.\n\nPorta habitasse scelerisque elementum adipiscing elit pulvinar? Cursus! Turpis! Massa ac elementum a, facilisis eu, sed ac porta massa sociis nascetur rhoncus sed, scelerisque habitasse aliquam? Velit adipiscing turpis, risus ut duis non integer rhoncus, placerat eu adipiscing, hac? Integer cursus porttitor rhoncus turpis lundium nisi, velit? Arcu tincidunt turpis, nunc integer turpis! Ridiculus enim natoque in, eros odio.\n\nScelerisque tempor dolor magnis natoque cras nascetur lorem, augue habitasse ac ut mid rhoncus? Montes tristique arcu, nisi integer? Augue? Adipiscing tempor parturient elementum nunc? Amet mid aliquam penatibus. Aliquam proin, parturient vel parturient dictumst? A porttitor rhoncus, a sit egestas massa tincidunt! Nunc purus. Hac ac! Enim placerat augue cursus augue sociis cum cras, pulvinar placerat nec platea.\n\nPenatibus et duis, urna. Massa cum porttitor elit porta, natoque etiam et turpis placerat lacus etiam scelerisque nunc, egestas, urna non tincidunt cursus odio urna tempor dictumst dignissim habitasse. Mus non et, nisi purus, pulvinar natoque in vel nascetur. Porttitor phasellus sed aenean eu quis? Nec vel, dignissim magna placerat turpis, ridiculus cum est auctor, sagittis, sit scelerisque duis.\n',0,NULL,NULL,'2022-12-01 12:00:00','2022-12-01 12:00:00'),(13,'company_note','Amet auctor, sed massa lacus phasellus turpis urna mauris dictumst, dapibus turpis? Sociis amet, mid aliquam, sagittis, risus, eros porta mid placerat eros in? Elementum porta ac pulvinar porttitor adipiscing, tristique porta pid dolor elementum? Eros, pulvinar amet auctor, urna enim amet magnis ultrices etiam? Dictumst ultrices velit eu tortor aliquet, rhoncus! Magnis porttitor. Vel parturient, ac, nascetur magnis tincidunt.\n\nQuis, pid. Lacus lorem scelerisque tortor phasellus, duis adipiscing nec mid mus purus placerat nunc porttitor placerat, risus odio pulvinar penatibus tincidunt, proin. Est tincidunt aliquam vel, ut scelerisque. Enim lorem magna tempor, auctor elit? Magnis lorem ut cursus, nunc nascetur! Est et odio nunc odio adipiscing amet nunc, ridiculus magnis egestas proin, montes nunc tristique tortor, ridiculus magna.\n',0,NULL,NULL,'2022-12-01 12:00:00','2022-12-01 12:00:00'),(14,'invoice_series','FOSS',0,NULL,NULL,'2022-12-01 12:00:00','2022-12-01 12:00:00'),(15,'invoice_due_days','5',0,NULL,NULL,'2022-12-01 12:00:00','2022-12-01 12:00:00'),(16,'invoice_auto_approval','1',0,NULL,NULL,'2022-12-01 12:00:00','2022-12-01 12:00:00'),(17,'invoice_issue_days_before_expire','14',0,NULL,NULL,'2022-12-01 12:00:00','2022-12-01 12:00:00'),(18,'theme','huraga',0,NULL,NULL,'2022-12-01 12:00:00','2022-12-01 12:00:00'),(19,'issue_invoice_days_before_expire','7',0,NULL,NULL,'2022-12-01 12:00:00','2022-12-01 12:00:00'),(20,'invoice_refund_logic','credit_note',0,NULL,NULL,'2022-12-01 12:00:00','2022-12-01 12:00:00'),(21,'invoice_cn_series','CN-',0,NULL,NULL,'2022-12-01 12:00:00','2022-12-01 12:00:00'),(22,'invoice_cn_starting_number','1',0,NULL,NULL,'2022-12-01 12:00:00','2022-12-01 12:00:00'),(23,'nameserver_1',NULL,0,NULL,NULL,'2022-12-01 12:00:00','2022-12-01 12:00:00'),(24,'nameserver_2',NULL,0,NULL,NULL,'2022-12-01 12:00:00','2022-12-01 12:00:00'),(25,'nameserver_3',NULL,0,NULL,NULL,'2022-12-01 12:00:00','2022-12-01 12:00:00'),(26,'nameserver_4',NULL,0,NULL,NULL,'2022-12-01 12:00:00','2022-12-01 12:00:00'),(27,'funds_min_amount','10',0,NULL,NULL,'2022-12-01 12:00:00','2022-12-01 12:00:00'),(28,'funds_max_amount','200',0,NULL,NULL,'2022-12-01 12:00:00','2022-12-01 12:00:00'),(29,'servicedomain_last_sync','2022-12-10 21:41:52',0,NULL,NULL,'2022-12-10 21:41:52','2022-12-10 21:41:52'),(30,'invoice_overdue_invoked','2022-12-10 21:41:52',0,NULL,NULL,'2022-12-10 21:41:52','2022-12-10 21:41:52'),(31,'last_cron_exec','2022-12-10 21:41:52',0,NULL,NULL,'2022-12-10 21:41:52','2022-12-10 21:41:52');
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription`
--

DROP TABLE IF EXISTS `subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `client_id` bigint DEFAULT NULL,
  `pay_gateway_id` bigint DEFAULT NULL,
  `sid` varchar(255) DEFAULT NULL,
  `rel_type` varchar(100) DEFAULT NULL,
  `rel_id` bigint DEFAULT NULL,
  `period` varchar(255) DEFAULT NULL,
  `amount` double(18,2) DEFAULT NULL,
  `currency` varchar(50) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id_idx` (`client_id`),
  KEY `pay_gateway_id_idx` (`pay_gateway_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription`
--

LOCK TABLES `subscription` WRITE;
/*!40000 ALTER TABLE `subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_helpdesk`
--

DROP TABLE IF EXISTS `support_helpdesk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_helpdesk` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `close_after` smallint DEFAULT '24',
  `can_reopen` tinyint(1) DEFAULT '0',
  `signature` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_helpdesk`
--

LOCK TABLES `support_helpdesk` WRITE;
/*!40000 ALTER TABLE `support_helpdesk` DISABLE KEYS */;
INSERT INTO `support_helpdesk` VALUES (1,'General','info@yourdomain.com',24,0,'It is always a pleasure to help.\nHave a Nice Day !','2022-12-01 12:00:00','2022-12-01 12:00:00');
/*!40000 ALTER TABLE `support_helpdesk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_p_ticket`
--

DROP TABLE IF EXISTS `support_p_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_p_ticket` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `hash` varchar(255) DEFAULT NULL,
  `author_name` varchar(255) DEFAULT NULL,
  `author_email` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `status` varchar(30) DEFAULT 'open',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_p_ticket`
--

LOCK TABLES `support_p_ticket` WRITE;
/*!40000 ALTER TABLE `support_p_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `support_p_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_p_ticket_message`
--

DROP TABLE IF EXISTS `support_p_ticket_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_p_ticket_message` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `support_p_ticket_id` bigint DEFAULT NULL,
  `admin_id` bigint DEFAULT NULL COMMENT 'Filled when message author is admin',
  `content` text,
  `ip` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `support_p_ticket_id_idx` (`support_p_ticket_id`),
  KEY `admin_id_idx` (`admin_id`),
  FULLTEXT KEY `content_idx` (`content`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_p_ticket_message`
--

LOCK TABLES `support_p_ticket_message` WRITE;
/*!40000 ALTER TABLE `support_p_ticket_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `support_p_ticket_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_pr`
--

DROP TABLE IF EXISTS `support_pr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_pr` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `support_pr_category_id` bigint DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `support_pr_category_id_idx` (`support_pr_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_pr`
--

LOCK TABLES `support_pr` WRITE;
/*!40000 ALTER TABLE `support_pr` DISABLE KEYS */;
INSERT INTO `support_pr` VALUES (1,1,'Hello #1','Hello,\n\n\n\nThank you for using our services.','2022-12-01 12:00:00','2022-12-01 12:00:00'),(2,1,'Hello #2','Greetings,\n\n\n\nThank you.','2022-12-01 12:00:00','2022-12-01 12:00:00'),(3,2,'It was fixed','\nIt was fixed for your account. If you have any more questions or requests, please let us to know.','2022-12-01 12:00:00','2022-12-01 12:00:00'),(4,2,'It was done as requested','\nIt\'s done as you have requested. Please let us to know if you have any further requests or questions.','2022-12-01 12:00:00','2022-12-01 12:00:00'),(5,2,'Your website works fine','\nI have just checked your website and it works fine. Please check it from your end and let us to know if you still experience any problems.','2022-12-01 12:00:00','2022-12-01 12:00:00'),(6,3,'Do you get any errors?','\nDo you get any errors and maybe you can copy/paste full error messages?','2022-12-01 12:00:00','2022-12-01 12:00:00'),(7,3,'Domain is not pointing to our server','\nYour domain is not pointing to our server. Please set our nameservers for your domain and give 24 hours until changes will apply worldwide.','2022-12-01 12:00:00','2022-12-01 12:00:00'),(8,3,'What is your domain and username?','\nWhat is your domain name and username?','2022-12-01 12:00:00','2022-12-01 12:00:00');
/*!40000 ALTER TABLE `support_pr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_pr_category`
--

DROP TABLE IF EXISTS `support_pr_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_pr_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_pr_category`
--

LOCK TABLES `support_pr_category` WRITE;
/*!40000 ALTER TABLE `support_pr_category` DISABLE KEYS */;
INSERT INTO `support_pr_category` VALUES (1,'Greetings','2022-12-01 12:00:00','2022-12-01 12:00:00'),(2,'General','2022-12-01 12:00:00','2022-12-01 12:00:00'),(3,'Accounting','2022-12-01 12:00:00','2022-12-01 12:00:00');
/*!40000 ALTER TABLE `support_pr_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_ticket`
--

DROP TABLE IF EXISTS `support_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_ticket` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `support_helpdesk_id` bigint DEFAULT NULL,
  `client_id` bigint DEFAULT NULL,
  `priority` int DEFAULT '100',
  `subject` varchar(255) DEFAULT NULL,
  `status` varchar(30) DEFAULT 'open' COMMENT 'open, closed, on_hold',
  `rel_type` varchar(100) DEFAULT NULL,
  `rel_id` bigint DEFAULT NULL,
  `rel_task` varchar(100) DEFAULT NULL,
  `rel_new_value` text,
  `rel_status` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `support_helpdesk_id_idx` (`support_helpdesk_id`),
  KEY `client_id_idx` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_ticket`
--

LOCK TABLES `support_ticket` WRITE;
/*!40000 ALTER TABLE `support_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `support_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_ticket_message`
--

DROP TABLE IF EXISTS `support_ticket_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_ticket_message` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `support_ticket_id` bigint DEFAULT NULL,
  `client_id` bigint DEFAULT NULL,
  `admin_id` bigint DEFAULT NULL,
  `content` text,
  `attachment` varchar(255) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `support_ticket_id_idx` (`support_ticket_id`),
  KEY `client_id_idx` (`client_id`),
  KEY `admin_id_idx` (`admin_id`),
  FULLTEXT KEY `content_idx` (`content`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_ticket_message`
--

LOCK TABLES `support_ticket_message` WRITE;
/*!40000 ALTER TABLE `support_ticket_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `support_ticket_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_ticket_note`
--

DROP TABLE IF EXISTS `support_ticket_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_ticket_note` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `support_ticket_id` bigint DEFAULT NULL,
  `admin_id` bigint DEFAULT NULL,
  `note` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `support_ticket_id_idx` (`support_ticket_id`),
  KEY `admin_id_idx` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_ticket_note`
--

LOCK TABLES `support_ticket_note` WRITE;
/*!40000 ALTER TABLE `support_ticket_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `support_ticket_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax`
--

DROP TABLE IF EXISTS `tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `level` bigint DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `taxrate` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax`
--

LOCK TABLES `tax` WRITE;
/*!40000 ALTER TABLE `tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tld`
--

DROP TABLE IF EXISTS `tld`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tld` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tld_registrar_id` bigint DEFAULT NULL,
  `tld` varchar(15) DEFAULT NULL,
  `price_registration` decimal(18,2) DEFAULT '0.00',
  `price_renew` decimal(18,2) DEFAULT '0.00',
  `price_transfer` decimal(18,2) DEFAULT '0.00',
  `allow_register` tinyint(1) DEFAULT NULL,
  `allow_transfer` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `min_years` tinyint DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tld` (`tld`),
  KEY `tld_registrar_id_idx` (`tld_registrar_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tld`
--

LOCK TABLES `tld` WRITE;
/*!40000 ALTER TABLE `tld` DISABLE KEYS */;
INSERT INTO `tld` VALUES (1,1,'.com',11.99,11.99,11.99,1,1,1,1,'2022-12-01 12:00:00','2022-12-01 12:00:00');
/*!40000 ALTER TABLE `tld` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tld_registrar`
--

DROP TABLE IF EXISTS `tld_registrar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tld_registrar` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `registrar` varchar(255) DEFAULT NULL,
  `test_mode` tinyint DEFAULT '0',
  `config` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tld_registrar`
--

LOCK TABLES `tld_registrar` WRITE;
/*!40000 ALTER TABLE `tld_registrar` DISABLE KEYS */;
INSERT INTO `tld_registrar` VALUES (1,'Custom','Custom',0,NULL),(2,'Reseller Club','Resellerclub',0,NULL),(3,'Internet.bs','Internetbs',0,NULL);
/*!40000 ALTER TABLE `tld_registrar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint DEFAULT NULL,
  `gateway_id` int DEFAULT NULL,
  `txn_id` varchar(255) DEFAULT NULL,
  `txn_status` varchar(255) DEFAULT NULL,
  `s_id` varchar(255) DEFAULT NULL,
  `s_period` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `currency` varchar(10) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'received',
  `ip` varchar(45) DEFAULT NULL,
  `error` text,
  `error_code` int DEFAULT NULL,
  `validate_ipn` tinyint(1) DEFAULT '1',
  `ipn` text,
  `output` text,
  `note` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_id_idx` (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-10 21:48:20