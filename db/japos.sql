-- MySQL dump 10.11
--
-- Host: localhost    Database: japos
-- ------------------------------------------------------
-- Server version	5.0.77

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Root'),(2,'Admin'),(3,'Auditor'),(4,'Cashier'),(5,'Salesman');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL auto_increment,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `permission_id_refs_id_5886d21f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_message`
--

DROP TABLE IF EXISTS `auth_message`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `auth_message` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `auth_message_user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `auth_message`
--

LOCK TABLES `auth_message` WRITE;
/*!40000 ALTER TABLE `auth_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add message',4,'add_message'),(11,'Can change message',4,'change_message'),(12,'Can delete message',4,'delete_message'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry'),(22,'Can add module',8,'add_module'),(23,'Can change module',8,'change_module'),(24,'Can delete module',8,'delete_module'),(25,'Can add module type',9,'add_moduletype'),(26,'Can change module type',9,'change_moduletype'),(27,'Can delete module type',9,'delete_moduletype'),(28,'Can add root',10,'add_root'),(29,'Can change root',10,'change_root'),(30,'Can delete root',10,'delete_root'),(31,'Can add admin',11,'add_admin'),(32,'Can change admin',11,'change_admin'),(33,'Can delete admin',11,'delete_admin'),(34,'Can add auditor',12,'add_auditor'),(35,'Can change auditor',12,'change_auditor'),(36,'Can delete auditor',12,'delete_auditor'),(37,'Can add cashier',13,'add_cashier'),(38,'Can change cashier',13,'change_cashier'),(39,'Can delete cashier',13,'delete_cashier'),(40,'Can add salesman',14,'add_salesman'),(41,'Can change salesman',14,'change_salesman'),(42,'Can delete salesman',14,'delete_salesman'),(43,'Can add pos',15,'add_pos'),(44,'Can change pos',15,'change_pos'),(45,'Can delete pos',15,'delete_pos'),(46,'Can add opening',16,'add_opening'),(47,'Can change opening',16,'change_opening'),(48,'Can delete opening',16,'delete_opening'),(49,'Can add discount',17,'add_discount'),(50,'Can change discount',17,'change_discount'),(51,'Can delete discount',17,'delete_discount'),(52,'Can add group',18,'add_group'),(53,'Can change group',18,'change_group'),(54,'Can delete group',18,'delete_group'),(55,'Can add product',19,'add_product'),(56,'Can change product',19,'change_product'),(57,'Can delete product',19,'delete_product'),(58,'Can add payment form',20,'add_paymentform'),(59,'Can change payment form',20,'change_paymentform'),(60,'Can delete payment form',20,'delete_paymentform'),(61,'Can add money',21,'add_money'),(62,'Can change money',21,'change_money'),(63,'Can delete money',21,'delete_money'),(64,'Can add tax',22,'add_tax'),(65,'Can change tax',22,'change_tax'),(66,'Can delete tax',22,'delete_tax'),(67,'Can add stock room',23,'add_stockroom'),(68,'Can change stock room',23,'change_stockroom'),(69,'Can delete stock room',23,'delete_stockroom'),(70,'Can add shopping cart',24,'add_shoppingcart'),(71,'Can change shopping cart',24,'change_shoppingcart'),(72,'Can delete shopping cart',24,'delete_shoppingcart'),(73,'Can add sale',25,'add_sale'),(74,'Can change sale',25,'change_sale'),(75,'Can delete sale',25,'delete_sale'),(76,'Can add sub payment',26,'add_subpayment'),(77,'Can change sub payment',26,'change_subpayment'),(78,'Can delete sub payment',26,'delete_subpayment'),(79,'Can add commission',27,'add_commission'),(80,'Can change commission',27,'change_commission'),(81,'Can delete commission',27,'delete_commission'),(82,'Can add payment',28,'add_payment'),(83,'Can change payment',28,'change_payment'),(84,'Can delete payment',28,'delete_payment');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'admin','Jair','Gaxiola Mercado','admin@admin.com','sha1$0637a$662ca9eef2d473ec196dd2a157f0ee68c14070fb',1,1,1,'2009-09-27 23:33:33','2009-09-27 19:42:37'),(2,'ana','Ana','Pavon','','sha1$f0615$62389f45775ad92e2a5ec4c6febb8419bf014704',0,1,0,'2009-09-27 19:45:32','2009-09-27 19:45:32'),(3,'Christian','','','','sha1$2a587$d3ac1229cd4c1e8812b178787450133920587eb6',1,1,0,'2009-09-27 19:45:50','2009-09-27 19:45:50'),(6,'eli','','','','sha1$1e580$58e186ab63de5435348c2960acfd10dfcf2441c3',1,1,0,'2009-09-27 19:46:49','2009-09-27 19:46:49'),(8,'leean','','','','sha1$4c8df$a56ea8266dbf86fde266d3268500a0ff85ec4174',1,1,0,'2009-09-27 19:47:55','2009-09-27 19:47:55'),(9,'melissa','','','','sha1$7ee51$765365b070b56613422c73c39d84be69204bb745',0,1,0,'2009-09-27 19:48:09','2009-09-27 19:48:09'),(10,'roman','','','','sha1$0f624$125be4d16949f33ebfb9fd73ba29bd992145bdd8',0,1,0,'2009-09-27 19:48:27','2009-09-27 19:48:27'),(11,'sabrina','','','','sha1$9d333$4b511f1f03a4fb8f8d4f057cf7a454b7464e5259',0,1,0,'2009-09-27 19:48:51','2009-09-27 19:48:51'),(12,'Saul','','','','sha1$ed37b$254bfc284bfe25acee44105d74758173b94f895b',0,1,0,'2009-09-27 19:49:10','2009-09-27 19:49:10'),(14,'fabiola','','','','sha1$53574$bd9a1e496bf5bb60f5f5ecdd9efb213473825d74',0,1,0,'2009-09-27 19:58:22','2009-09-27 19:58:22');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `group_id_refs_id_f116770` (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,1,1),(2,2,4),(3,2,5),(4,3,3),(5,3,4),(6,3,5),(7,6,4),(8,6,5),(9,8,3),(10,9,4),(11,9,5),(12,10,4),(13,10,5),(14,11,4),(15,11,5),(16,12,4),(17,12,5),(18,14,4),(19,14,5);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `permission_id_refs_id_67e79cb` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cancellations_cancellation`
--

DROP TABLE IF EXISTS `cancellations_cancellation`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `cancellations_cancellation` (
  `id` int(11) NOT NULL auto_increment,
  `sku` varchar(10) default NULL,
  `sale_id` int(11) NOT NULL,
  `reason_id` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `sale_id` (`sale_id`),
  UNIQUE KEY `sku` (`sku`),
  KEY `cancellations_cancellation_reason_id` (`reason_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `cancellations_cancellation`
--

LOCK TABLES `cancellations_cancellation` WRITE;
/*!40000 ALTER TABLE `cancellations_cancellation` DISABLE KEYS */;
/*!40000 ALTER TABLE `cancellations_cancellation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cancellations_reason`
--

DROP TABLE IF EXISTS `cancellations_reason`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `cancellations_reason` (
  `id` int(11) NOT NULL auto_increment,
  `sku` varchar(10) default NULL,
  `motive` varchar(45) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `sku` (`sku`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `cancellations_reason`
--

LOCK TABLES `cancellations_reason` WRITE;
/*!40000 ALTER TABLE `cancellations_reason` DISABLE KEYS */;
/*!40000 ALTER TABLE `cancellations_reason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coins_money`
--

DROP TABLE IF EXISTS `coins_money`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `coins_money` (
  `id` int(11) NOT NULL auto_increment,
  `initials` varchar(10) NOT NULL,
  `value` decimal(9,3) default NULL,
  `currency` varchar(45) NOT NULL,
  `is_enabled` tinyint(1) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `initials` (`initials`),
  UNIQUE KEY `currency` (`currency`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `coins_money`
--

LOCK TABLES `coins_money` WRITE;
/*!40000 ALTER TABLE `coins_money` DISABLE KEYS */;
/*!40000 ALTER TABLE `coins_money` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crews_employee`
--

DROP TABLE IF EXISTS `crews_employee`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `crews_employee` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `number` int(10) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `number` (`number`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `crews_employee`
--

LOCK TABLES `crews_employee` WRITE;
/*!40000 ALTER TABLE `crews_employee` DISABLE KEYS */;
INSERT INTO `crews_employee` VALUES (1,2,1,'2009-09-27 22:55:02','2009-09-27 22:55:02'),(2,3,2,'2009-09-27 22:55:07','2009-09-27 22:55:07'),(3,6,3,'2009-09-27 22:55:14','2009-09-27 22:55:14'),(4,8,4,'2009-09-27 22:55:20','2009-09-27 22:55:20'),(5,9,5,'2009-09-27 22:55:27','2009-09-27 22:55:27'),(6,10,6,'2009-09-27 22:55:36','2009-09-27 22:55:36'),(7,11,7,'2009-09-27 22:55:42','2009-09-27 22:55:42'),(8,12,8,'2009-09-27 22:55:48','2009-09-27 22:55:48'),(9,14,9,'2009-09-27 22:55:53','2009-09-27 22:55:53');
/*!40000 ALTER TABLE `crews_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts_discount`
--

DROP TABLE IF EXISTS `discounts_discount`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `discounts_discount` (
  `id` int(11) NOT NULL auto_increment,
  `percentage` decimal(9,3) default NULL,
  `type` varchar(45) NOT NULL,
  `is_enabled` tinyint(1) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `discounts_discount`
--

LOCK TABLES `discounts_discount` WRITE;
/*!40000 ALTER TABLE `discounts_discount` DISABLE KEYS */;
INSERT INTO `discounts_discount` VALUES (1,'10.000','D',1,0,'2009-09-28 17:11:15','2009-09-28 17:11:15');
/*!40000 ALTER TABLE `discounts_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL auto_increment,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) default NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `django_admin_log_user_id` (`user_id`),
  KEY `django_admin_log_content_type_id` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2009-09-27 23:35:03',1,14,'1','Unisex',1,''),(2,'2009-09-27 23:35:15',1,14,'2','Accesorios',1,''),(3,'2009-09-27 23:35:32',1,14,'3','Gorras',1,''),(4,'2009-09-27 23:35:46',1,14,'4','Playera niño',1,''),(5,'2009-09-27 23:35:59',1,14,'5','Playera mujer',1,''),(6,'2009-09-27 23:36:08',1,14,'6','Playera hombre',1,''),(7,'2009-09-27 23:37:02',1,15,'1','(07SBOLGLOBOPYA) bolsa globo estampada - 30',1,''),(8,'2009-09-27 23:37:42',1,15,'2','(07HBEATMASC) playera bittlejuice adulto - 69',1,''),(9,'2009-09-27 23:38:15',1,15,'3','(07HDISCMASCARA) playera disco hombre - 27',1,''),(10,'2009-09-27 23:38:51',1,15,'4','(07NMASCDISCO) playera mascara disco niño - 25',1,''),(11,'2009-09-27 23:39:24',1,15,'5','(07FFOTOIMAN) Iman - 45',1,''),(12,'2009-09-27 23:39:54',1,15,'6','(07FENCENDE) Encendedor - 50',1,''),(13,'2009-09-27 23:40:34',1,15,'7','(07HDESGASTADO) playera desgastada - 10',1,''),(14,'2009-09-27 23:41:18',1,15,'8','(07HCOCOBOXER) Coco boxer - 20',1,''),(15,'2009-09-27 23:42:04',1,15,'9','(07HESTABLI) Established adulto - 60',1,''),(16,'2009-09-27 23:46:18',1,18,'1','IVA - 15',1,''),(17,'2009-09-27 23:46:31',1,19,'1','Boutique - (07SBOLGLOBOPYA) bolsa globo estampada - 30',1,''),(18,'2009-09-27 23:47:21',1,19,'2','Boutique - (07HBEATMASC) playera bittlejuice adulto - 69',1,''),(19,'2009-09-27 23:48:25',1,19,'3','Boutique - (07HDISCMASCARA) playera disco hombre - 27',1,''),(20,'2009-09-28 00:18:41',1,20,'2','Boutique - (07SBOLGLOBOPYA) bolsa globo estampada - 30',3,''),(21,'2009-09-28 00:18:46',1,20,'1','Boutique - (07SBOLGLOBOPYA) bolsa globo estampada - 30',3,''),(22,'2009-09-28 00:20:34',1,12,'1','BO1 - Boutique',1,''),(23,'2009-09-28 00:20:47',1,20,'3','Boutique - (07SBOLGLOBOPYA) bolsa globo estampada - 30',1,''),(24,'2009-09-28 00:22:28',1,21,'1','Sale object',1,''),(25,'2009-09-28 00:22:59',1,20,'4','Boutique - (07HBEATMASC) playera bittlejuice adulto - 69',1,''),(26,'2009-09-28 00:23:08',1,20,'5','Boutique - (07HDISCMASCARA) playera disco hombre - 27',1,''),(27,'2009-09-28 00:24:54',1,20,'7','Boutique - (07NMASCDISCO) playera mascara disco niño - 25',1,''),(28,'2009-09-28 00:24:59',1,21,'2','Sale object',1,''),(29,'2009-09-28 00:26:35',1,20,'6','Boutique - (07NMASCDISCO) playera mascara disco niño - 25',3,''),(30,'2009-09-28 15:21:41',1,18,'1','IVA - 10',2,'Changed percentage and is_enabled.'),(31,'2009-09-28 16:00:16',1,19,'1','Boutique - (07SBOLGLOBOPYA) bolsa globo estampada - 30',2,'Changed tax.'),(32,'2009-09-28 16:03:50',1,19,'1','Boutique - (07SBOLGLOBOPYA) bolsa globo estampada - 30',2,'Changed tax.'),(33,'2009-09-28 16:03:56',1,19,'3','Boutique - (07HDISCMASCARA) playera disco hombre - 27',2,'Changed tax.'),(34,'2009-09-28 16:04:25',1,19,'3','Boutique - (07HDISCMASCARA) playera disco hombre - 27',2,'Changed tax.'),(35,'2009-09-28 16:38:01',1,19,'1','Boutique - (07SBOLGLOBOPYA) bolsa globo estampada - 30',2,'Changed tax.'),(36,'2009-09-28 16:38:28',1,19,'1','Boutique - (07SBOLGLOBOPYA) bolsa globo estampada - 30',2,'Changed tax.'),(37,'2009-09-28 17:11:15',1,13,'1','10.000 %',1,''),(38,'2009-09-28 17:11:19',1,19,'1','Boutique - (07SBOLGLOBOPYA) bolsa globo estampada - 30',2,'Changed discount.'),(39,'2009-09-28 17:13:02',1,21,'1','TICKET TCK01',2,'Changed discount.'),(40,'2009-09-28 17:13:19',1,19,'1','Boutique - (07SBOLGLOBOPYA) bolsa globo estampada - 30',2,'Changed discount.'),(41,'2009-09-28 17:15:34',1,19,'1','Boutique - (07SBOLGLOBOPYA) bolsa globo estampada - 30',2,'Changed discount.'),(42,'2009-09-28 17:15:50',1,21,'1','TICKET TCK01',2,'Changed discount.'),(43,'2009-09-28 21:00:33',1,19,'1','Boutique - (07SBOLGLOBOPYA) bolsa globo estampada - 30',2,'Changed discount.'),(44,'2009-09-28 21:01:05',1,19,'1','Boutique - (07SBOLGLOBOPYA) bolsa globo estampada - 30',2,'Changed tax.'),(45,'2009-09-28 21:01:30',1,19,'1','Boutique - (07SBOLGLOBOPYA) bolsa globo estampada - 30',2,'Changed discount.'),(46,'2009-09-28 21:06:43',1,19,'1','Boutique - (07SBOLGLOBOPYA) bolsa globo estampada - 30',2,'Changed discount.'),(47,'2009-09-28 21:17:09',1,19,'2','Boutique - (07HBEATMASC) playera bittlejuice adulto - 69',2,'Changed discount.'),(48,'2009-09-28 21:20:22',1,19,'3','Boutique - (07HDISCMASCARA) playera disco hombre - 27',2,'Changed tax.'),(49,'2009-09-28 21:21:15',1,19,'2','Boutique - (07HBEATMASC) playera bittlejuice adulto - 69',2,'Changed discount.'),(50,'2009-09-28 21:22:03',1,19,'3','Boutique - (07HDISCMASCARA) playera disco hombre - 27',2,'Changed discount and tax.'),(51,'2009-09-28 21:26:59',1,19,'3','Boutique - (07HDISCMASCARA) playera disco hombre - 27',2,'Changed discount.'),(52,'2009-09-28 21:27:02',1,19,'2','Boutique - (07HBEATMASC) playera bittlejuice adulto - 69',2,'No fields changed.'),(53,'2009-09-28 21:27:06',1,19,'1','Boutique - (07SBOLGLOBOPYA) bolsa globo estampada - 30',2,'Changed tax.');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'message','auth','message'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'log entry','admin','logentry'),(8,'module','modules','module'),(9,'module type','modules','moduletype'),(10,'employee','crews','employee'),(11,'pos','pos','pos'),(12,'opening','openings','opening'),(13,'discount','discounts','discount'),(14,'group','goods','group'),(15,'product','goods','product'),(16,'payment form','paymentforms','paymentform'),(17,'money','coins','money'),(18,'tax','taxes','tax'),(19,'stock room','stockrooms','stockroom'),(20,'shopping cart','sales','shoppingcart'),(21,'sale','sales','sale'),(22,'sub payment','payments','subpayment'),(23,'commission','payments','commission'),(24,'payment','payments','payment'),(25,'transfer','transfers','transfer'),(26,'transfer stock room','transfers','transferstockroom'),(27,'reason','cancellations','reason'),(28,'cancellation','cancellations','cancellation');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY  (`session_key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1ecf6b3452b337bc1552d6fae9727a74','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS40Zjc5ZTliYzcxODM5MWI1NGZk\nM2UzOTYzMzY3Mjg1MA==\n','2009-10-11 23:33:34');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_group`
--

DROP TABLE IF EXISTS `goods_group`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `goods_group` (
  `id` int(11) NOT NULL auto_increment,
  `sku` varchar(15) default NULL,
  `name` varchar(45) default NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `sku` (`sku`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `goods_group`
--

LOCK TABLES `goods_group` WRITE;
/*!40000 ALTER TABLE `goods_group` DISABLE KEYS */;
INSERT INTO `goods_group` VALUES (1,'GRO1','Unisex','2009-09-27 23:35:02','2009-09-27 23:35:02'),(2,'GRO2','Accesorios','2009-09-27 23:35:15','2009-09-27 23:35:15'),(3,'GRO3','Gorras','2009-09-27 23:35:32','2009-09-27 23:35:32'),(4,'GR04','Playera niño','2009-09-27 23:35:46','2009-09-27 23:35:46'),(5,'GRO5','Playera mujer','2009-09-27 23:35:59','2009-09-27 23:35:59'),(6,'GRO6','Playera hombre','2009-09-27 23:36:08','2009-09-27 23:36:08');
/*!40000 ALTER TABLE `goods_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_product`
--

DROP TABLE IF EXISTS `goods_product`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `goods_product` (
  `id` int(11) NOT NULL auto_increment,
  `sku` varchar(15) default NULL,
  `barcode` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` longtext,
  `stock` int(11) default NULL,
  `group_id` int(11) NOT NULL,
  `purchase_price` decimal(9,3) NOT NULL,
  `discount_id` int(11) default NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `barcode` (`barcode`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `sku` (`sku`),
  KEY `goods_product_group_id` (`group_id`),
  KEY `goods_product_discount_id` (`discount_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `goods_product`
--

LOCK TABLES `goods_product` WRITE;
/*!40000 ALTER TABLE `goods_product` DISABLE KEYS */;
INSERT INTO `goods_product` VALUES (1,'07SBOLGLOBOPYA','07SBOLGLOBOPYA','bolsa globo estampada','',30,2,'181.810',NULL,'2009-09-27 23:37:02','2009-09-27 23:37:02'),(2,'07HBEATMASC','07HBEATMASC','playera bittlejuice adulto','',69,6,'280.800',NULL,'2009-09-27 23:37:42','2009-09-27 23:37:42'),(3,'07HDISCMASCARA','07HDISCMASCARA','playera disco hombre','',27,6,'280.800',NULL,'2009-09-27 23:38:15','2009-09-27 23:38:15'),(4,'07NMASCDISCO','07NMASCDISCO','playera mascara disco niño','',25,4,'198.900',NULL,'2009-09-27 23:38:51','2009-09-27 23:38:51'),(5,'07FFOTOIMAN','07FFOTOIMAN','Iman','',45,2,'40.000',NULL,'2009-09-27 23:39:24','2009-09-27 23:39:24'),(6,'07FENCENDE','07FENCENDE','Encendedor','',50,2,'55.000',NULL,'2009-09-27 23:39:54','2009-09-27 23:39:54'),(7,'07HDESGASTADO','07HDESGASTADO','playera desgastada','playera hombre',10,6,'281.000',NULL,'2009-09-27 23:40:34','2009-09-27 23:40:34'),(8,'07HCOCOBOXER','07HCOCOBOXER','Coco boxer','Coco boxer',20,6,'163.800',NULL,'2009-09-27 23:41:18','2009-09-27 23:41:18'),(9,'07HESTABLI','07HESTABLI','Established adulto','',60,6,'196.560',NULL,'2009-09-27 23:42:04','2009-09-27 23:42:04');
/*!40000 ALTER TABLE `goods_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules_module`
--

DROP TABLE IF EXISTS `modules_module`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `modules_module` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(45) default NULL,
  `is_enabled` tinyint(1) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `modules_module`
--

LOCK TABLES `modules_module` WRITE;
/*!40000 ALTER TABLE `modules_module` DISABLE KEYS */;
/*!40000 ALTER TABLE `modules_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules_moduletype`
--

DROP TABLE IF EXISTS `modules_moduletype`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `modules_moduletype` (
  `id` int(11) NOT NULL auto_increment,
  `module_id` int(11) NOT NULL,
  `availability` smallint(6) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `modules_moduletype_module_id` (`module_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `modules_moduletype`
--

LOCK TABLES `modules_moduletype` WRITE;
/*!40000 ALTER TABLE `modules_moduletype` DISABLE KEYS */;
/*!40000 ALTER TABLE `modules_moduletype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openings_opening`
--

DROP TABLE IF EXISTS `openings_opening`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `openings_opening` (
  `id` int(11) NOT NULL auto_increment,
  `pos_id` int(11) NOT NULL,
  `auditor_id` int(11) NOT NULL,
  `cashier_id` int(11) NOT NULL,
  `initial_fund` decimal(9,3) NOT NULL,
  `exchange_rate` decimal(9,3) default NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `openings_opening_pos_id` (`pos_id`),
  KEY `openings_opening_auditor_id` (`auditor_id`),
  KEY `openings_opening_cashier_id` (`cashier_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `openings_opening`
--

LOCK TABLES `openings_opening` WRITE;
/*!40000 ALTER TABLE `openings_opening` DISABLE KEYS */;
INSERT INTO `openings_opening` VALUES (1,1,4,1,'1000.000',NULL,'2009-09-28 00:20:34','2009-09-28 00:20:34');
/*!40000 ALTER TABLE `openings_opening` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentforms_paymentform`
--

DROP TABLE IF EXISTS `paymentforms_paymentform`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `paymentforms_paymentform` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(45) NOT NULL,
  `percentage` double default NULL,
  `is_enabled` tinyint(1) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `is_change` tinyint(1) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `paymentforms_paymentform`
--

LOCK TABLES `paymentforms_paymentform` WRITE;
/*!40000 ALTER TABLE `paymentforms_paymentform` DISABLE KEYS */;
/*!40000 ALTER TABLE `paymentforms_paymentform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments_commission`
--

DROP TABLE IF EXISTS `payments_commission`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `payments_commission` (
  `id` int(11) NOT NULL auto_increment,
  `percentage` decimal(9,3) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `payments_commission`
--

LOCK TABLES `payments_commission` WRITE;
/*!40000 ALTER TABLE `payments_commission` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments_commission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments_payment`
--

DROP TABLE IF EXISTS `payments_payment`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `payments_payment` (
  `id` int(11) NOT NULL auto_increment,
  `sku` varchar(10) default NULL,
  `sale_id` int(11) NOT NULL,
  `change` double default NULL,
  `subtotal` double NOT NULL,
  `total` double NOT NULL,
  `salesman_id` int(11) default NULL,
  `commission_id` int(11) default NULL,
  `date_printing` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `sale_id` (`sale_id`),
  UNIQUE KEY `sku` (`sku`),
  KEY `payments_payment_salesman_id` (`salesman_id`),
  KEY `payments_payment_commission_id` (`commission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `payments_payment`
--

LOCK TABLES `payments_payment` WRITE;
/*!40000 ALTER TABLE `payments_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments_payment_subpayment`
--

DROP TABLE IF EXISTS `payments_payment_subpayment`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `payments_payment_subpayment` (
  `id` int(11) NOT NULL auto_increment,
  `payment_id` int(11) NOT NULL,
  `subpayment_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `payment_id` (`payment_id`,`subpayment_id`),
  KEY `subpayment_id_refs_id_4862297c` (`subpayment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `payments_payment_subpayment`
--

LOCK TABLES `payments_payment_subpayment` WRITE;
/*!40000 ALTER TABLE `payments_payment_subpayment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments_payment_subpayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments_subpayment`
--

DROP TABLE IF EXISTS `payments_subpayment`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `payments_subpayment` (
  `id` int(11) NOT NULL auto_increment,
  `sku` varchar(10) default NULL,
  `payment_form_id` int(11) NOT NULL,
  `received` decimal(9,3) default NULL,
  `money_id` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `sku` (`sku`),
  KEY `payments_subpayment_payment_form_id` (`payment_form_id`),
  KEY `payments_subpayment_money_id` (`money_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `payments_subpayment`
--

LOCK TABLES `payments_subpayment` WRITE;
/*!40000 ALTER TABLE `payments_subpayment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments_subpayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_pos`
--

DROP TABLE IF EXISTS `pos_pos`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `pos_pos` (
  `id` int(11) NOT NULL auto_increment,
  `sku` varchar(10) default NULL,
  `name` varchar(45) default NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `sku` (`sku`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `pos_pos`
--

LOCK TABLES `pos_pos` WRITE;
/*!40000 ALTER TABLE `pos_pos` DISABLE KEYS */;
INSERT INTO `pos_pos` VALUES (1,'BO1','Boutique','2009-09-27 23:08:49','2009-09-27 23:08:49'),(2,'TER01','Terraza','2009-09-27 23:09:02','2009-09-27 23:09:02');
/*!40000 ALTER TABLE `pos_pos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_sale`
--

DROP TABLE IF EXISTS `sales_sale`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `sales_sale` (
  `id` int(11) NOT NULL auto_increment,
  `sku` varchar(10) default NULL,
  `opening_id` int(11) NOT NULL,
  `discount_id` int(11) default NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `sku` (`sku`),
  KEY `sales_sale_opening_id` (`opening_id`),
  KEY `sales_sale_discount_id` (`discount_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `sales_sale`
--

LOCK TABLES `sales_sale` WRITE;
/*!40000 ALTER TABLE `sales_sale` DISABLE KEYS */;
INSERT INTO `sales_sale` VALUES (1,'TCK01',1,NULL,'2009-09-28 00:22:28','2009-09-28 17:15:50'),(2,'TCK02',1,NULL,'2009-09-28 00:24:59','2009-09-28 00:24:59');
/*!40000 ALTER TABLE `sales_sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_sale_shopping_cart`
--

DROP TABLE IF EXISTS `sales_sale_shopping_cart`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `sales_sale_shopping_cart` (
  `id` int(11) NOT NULL auto_increment,
  `sale_id` int(11) NOT NULL,
  `shoppingcart_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `sale_id` (`sale_id`,`shoppingcart_id`),
  KEY `shoppingcart_id_refs_id_f8e863c` (`shoppingcart_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `sales_sale_shopping_cart`
--

LOCK TABLES `sales_sale_shopping_cart` WRITE;
/*!40000 ALTER TABLE `sales_sale_shopping_cart` DISABLE KEYS */;
INSERT INTO `sales_sale_shopping_cart` VALUES (6,1,3),(2,2,4),(3,2,5),(4,2,7);
/*!40000 ALTER TABLE `sales_sale_shopping_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_shoppingcart`
--

DROP TABLE IF EXISTS `sales_shoppingcart`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `sales_shoppingcart` (
  `id` int(11) NOT NULL auto_increment,
  `stock_room_id` int(11) NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `sales_shoppingcart_stock_room_id` (`stock_room_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `sales_shoppingcart`
--

LOCK TABLES `sales_shoppingcart` WRITE;
/*!40000 ALTER TABLE `sales_shoppingcart` DISABLE KEYS */;
INSERT INTO `sales_shoppingcart` VALUES (3,1,2,'2009-09-28 00:20:47','2009-09-28 00:20:47'),(4,2,1,'2009-09-28 00:22:59','2009-09-28 00:22:59'),(5,3,2,'2009-09-28 00:23:08','2009-09-28 00:23:08'),(7,4,2,'2009-09-28 00:24:54','2009-09-28 00:24:54');
/*!40000 ALTER TABLE `sales_shoppingcart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stockrooms_stockroom`
--

DROP TABLE IF EXISTS `stockrooms_stockroom`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `stockrooms_stockroom` (
  `id` int(11) NOT NULL auto_increment,
  `pos_id` int(11) default NULL,
  `barcode` varchar(45) NOT NULL,
  `product_id` int(11) default NULL,
  `stock` int(10) unsigned default NULL,
  `price` double default NULL,
  `discount_id` int(11) default NULL,
  `tax_id` int(11) default NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `barcode` (`barcode`),
  KEY `stockrooms_stockroom_pos_id` (`pos_id`),
  KEY `stockrooms_stockroom_product_id` (`product_id`),
  KEY `stockrooms_stockroom_discount_id` (`discount_id`),
  KEY `stockrooms_stockroom_tax_id` (`tax_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `stockrooms_stockroom`
--

LOCK TABLES `stockrooms_stockroom` WRITE;
/*!40000 ALTER TABLE `stockrooms_stockroom` DISABLE KEYS */;
INSERT INTO `stockrooms_stockroom` VALUES (1,1,'07SBOLGLOBOPYA',1,9,180,NULL,1,'2009-09-27 23:46:31','2009-09-28 21:27:06'),(2,1,'07HBEATMASC',2,69,280.8,NULL,1,'2009-09-27 23:47:21','2009-09-28 21:27:02'),(3,1,'07HDISCMASCARA',3,23,280.8,NULL,1,'2009-09-27 23:48:25','2009-09-28 21:26:59'),(4,1,'07NMASCDISCO',4,25,198.9,NULL,1,'2009-09-27 23:49:10','2009-09-27 23:49:10');
/*!40000 ALTER TABLE `stockrooms_stockroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxes_tax`
--

DROP TABLE IF EXISTS `taxes_tax`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `taxes_tax` (
  `id` int(11) NOT NULL auto_increment,
  `initials` varchar(45) NOT NULL,
  `percentage` decimal(9,3) default NULL,
  `is_enabled` tinyint(1) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `initials` (`initials`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `taxes_tax`
--

LOCK TABLES `taxes_tax` WRITE;
/*!40000 ALTER TABLE `taxes_tax` DISABLE KEYS */;
INSERT INTO `taxes_tax` VALUES (1,'IVA','10.000',1,0,'2009-09-27 23:46:18','2009-09-28 15:21:41');
/*!40000 ALTER TABLE `taxes_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfers_transfer`
--

DROP TABLE IF EXISTS `transfers_transfer`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `transfers_transfer` (
  `id` int(11) NOT NULL auto_increment,
  `sku` varchar(10) default NULL,
  `pos_origin_id` int(11) NOT NULL,
  `pos_destiny_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `units` int(10) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `sku` (`sku`),
  KEY `transfers_transfer_pos_origin_id` (`pos_origin_id`),
  KEY `transfers_transfer_pos_destiny_id` (`pos_destiny_id`),
  KEY `transfers_transfer_product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `transfers_transfer`
--

LOCK TABLES `transfers_transfer` WRITE;
/*!40000 ALTER TABLE `transfers_transfer` DISABLE KEYS */;
/*!40000 ALTER TABLE `transfers_transfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfers_transferstockroom`
--

DROP TABLE IF EXISTS `transfers_transferstockroom`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `transfers_transferstockroom` (
  `id` int(11) NOT NULL auto_increment,
  `sku` varchar(10) default NULL,
  `pos_id` int(11) default NULL,
  `product_id` int(11) default NULL,
  `units` int(10) unsigned default NULL,
  `refunds` tinyint(1) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `sku` (`sku`),
  KEY `transfers_transferstockroom_pos_id` (`pos_id`),
  KEY `transfers_transferstockroom_product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `transfers_transferstockroom`
--

LOCK TABLES `transfers_transferstockroom` WRITE;
/*!40000 ALTER TABLE `transfers_transferstockroom` DISABLE KEYS */;
/*!40000 ALTER TABLE `transfers_transferstockroom` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2009-09-29 15:05:20
