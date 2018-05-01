CREATE DATABASE  IF NOT EXISTS `ads` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ads`;
-- MySQL dump 10.16  Distrib 10.1.26-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: ads
-- ------------------------------------------------------
-- Server version	10.1.26-MariaDB

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
-- Temporary table structure for view `ads_all`
--

DROP TABLE IF EXISTS `ads_all`;
/*!50001 DROP VIEW IF EXISTS `ads_all`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `ads_all` (
  `id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `created_at` tinyint NOT NULL,
  `published` tinyint NOT NULL,
  `login` tinyint NOT NULL,
  `user_name` tinyint NOT NULL,
  `user_active` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `site_ads`
--

DROP TABLE IF EXISTS `site_ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_ads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(5) unsigned NOT NULL,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `published` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `site_ads_users_id_fk` (`user_id`),
  CONSTRAINT `site_ads_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_ads`
--

LOCK TABLES `site_ads` WRITE;
/*!40000 ALTER TABLE `site_ads` DISABLE KEYS */;
INSERT INTO `site_ads` VALUES (1,7,'vehicula condimentum curabitur in','Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt.','2018-04-14 20:10:22',1),(2,4,'convallis eget','Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis.','2018-04-21 02:43:30',1),(3,1,'est et','Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.','2017-06-13 06:55:20',1),(5,10,'penatibus et magnis dis parturient','Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.','2017-06-18 07:56:33',1),(6,2,'sed tincidunt eu felis fusce','Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.','2017-07-12 19:10:03',1),(7,9,'magna vestibulum','In eleifend quam a odio. In hac habitasse platea dictumst.','2018-03-05 12:08:21',1),(8,6,'laoreet ut rhoncus aliquet','Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis.','2018-01-20 14:33:46',1),(9,8,'est quam pharetra','Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.','2017-06-28 11:21:13',1),(10,9,'quam pharetra magna ac consequat','Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque.','2018-02-19 22:44:46',1),(11,10,'amet consectetuer adipiscing elit proin','Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.','2017-05-20 15:42:52',1),(12,8,'maecenas leo odio','Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.','2018-02-25 05:44:09',0),(13,1,'turpis nec euismod','Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.','2017-07-22 11:59:43',1),(14,5,'potenti nullam porttitor lacus at','Vestibulum sed magna at nunc commodo placerat. Praesent blandit.','2018-02-15 20:48:40',1),(16,10,'curae nulla dapibus dolor vel','Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.','2018-03-27 21:28:01',1),(17,4,'congue','Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.','2017-08-28 06:17:34',1),(18,7,'a suscipit nulla elit ac','Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique.','2017-11-29 20:19:12',1),(19,3,'in tempus','Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus.','2018-01-07 15:27:20',1),(20,4,'molestie','Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.','2017-11-24 21:51:58',1),(21,2,'nulla tempus vivamus','In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.','2017-12-07 00:24:31',1),(22,8,'metus sapien ut nunc vestibulum','Phasellus sit amet erat.','2017-11-26 03:34:09',1),(23,2,'praesent id massa id nisl','In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.','2017-06-20 09:10:12',1),(24,4,'pellentesque viverra pede ac diam','Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt.','2017-07-22 13:49:59',0),(25,3,'ornare consequat','Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum.','2018-02-14 15:31:43',1),(26,1,'morbi porttitor lorem','In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.','2017-07-27 03:09:33',1),(27,3,'sit amet','Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.','2018-02-07 03:10:14',1),(28,2,'aliquam lacus morbi quis','Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat.','2017-10-08 05:44:16',1),(29,10,'in lectus','Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.','2018-03-05 21:14:54',1),(30,7,'sapien','Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.','2017-10-05 13:30:21',1),(31,4,'lacus purus aliquet at feugiat','Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros.','2017-12-14 18:12:20',1),(32,6,'ultrices posuere','Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla.','2017-07-30 22:34:11',1),(33,1,'augue vestibulum','Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.','2017-08-08 23:07:24',1),(34,7,'adipiscing elit','Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti.','2017-05-07 20:35:38',1),(35,7,'consequat in','Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo.','2017-06-18 01:01:06',1),(36,8,'felis','In eleifend quam a odio.','2017-10-30 03:28:22',0),(37,9,'nulla','Suspendisse accumsan tortor quis turpis. Sed ante.','2017-06-05 20:29:12',1),(38,9,'nam ultrices libero non','Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.','2017-10-19 08:18:37',1),(39,10,'ut','Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.','2017-11-09 18:59:55',1),(40,2,'neque aenean auctor gravida','Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum.','2018-03-16 01:01:21',1),(41,7,'quis justo maecenas rhoncus aliquam','Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.','2017-12-02 01:31:12',1),(42,4,'cursus id turpis integer aliquet','Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.','2017-10-11 15:05:32',1),(43,7,'sem praesent id massa id','Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.','2017-06-02 09:27:27',1),(44,2,'ultrices enim lorem ipsum','Nulla tellus. In sagittis dui vel nisl. Duis ac nibh.','2017-06-13 04:01:40',1),(45,9,'iaculis','Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.','2017-08-21 01:53:44',1),(47,6,'tortor quis turpis sed ante','Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.','2018-02-27 12:07:41',1),(48,2,'lacus at velit','Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.','2017-11-11 18:46:35',0),(49,2,'hac habitasse platea dictumst etiam','Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.','2017-08-24 13:56:57',1),(50,5,'integer','Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.','2017-11-08 09:51:01',1),(51,4,'dapibus dolor vel','In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.','2017-10-04 13:18:04',1),(52,4,'aliquet','Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.','2017-10-14 10:26:51',1),(53,7,'tempus sit','Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.','2017-05-14 20:30:59',1),(54,10,'massa volutpat convallis','Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam. Nam tristique tortor eu pede.','2018-04-09 03:34:25',1),(55,7,'id turpis integer aliquet','Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo.','2018-04-16 06:25:59',1),(56,3,'posuere cubilia curae mauris viverra','Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.','2017-08-11 14:19:55',1),(58,7,'suscipit ligula in lacus curabitur','Mauris ullamcorper purus sit amet nulla.','2017-10-24 21:28:54',1),(59,10,'libero non','Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.','2018-02-13 13:19:01',1),(60,6,'a nibh','Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat.','2017-08-17 04:24:19',0),(61,3,'eu nibh','Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus.','2017-07-20 01:01:48',1),(62,4,'orci','Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum.','2017-06-28 18:43:32',1),(63,1,'in consequat ut nulla','Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue','2017-12-06 03:04:11',1),(65,5,'maecenas pulvinar lobortis','Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien.','2017-12-30 23:41:06',1),(66,2,'ante vivamus tortor duis','Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.','2017-11-15 03:18:09',1),(67,8,'luctus et','Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.','2017-12-30 23:20:31',1),(68,6,'congue vivamus metus arcu adipiscing','Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.','2017-10-13 04:27:35',1),(69,2,'adipiscing elit proin interdum mauris','Nunc purus.','2018-03-16 01:55:43',1),(70,4,'vulputate','Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum.','2017-07-06 21:47:09',1),(71,8,'posuere','Fusce consequat. Nulla nisl. Nunc nisl.','2018-04-07 16:58:12',1),(72,8,'nulla sed vel','Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue.','2018-04-09 20:31:55',0),(73,7,'vivamus metus arcu','Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.','2017-06-04 14:58:21',1),(74,7,'facilisi','Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.','2017-09-26 02:47:58',1),(75,6,'est','Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus.','2017-12-04 18:53:50',1),(77,4,'vel','Mauris lacinia sapien quis libero.','2017-06-20 10:12:51',1),(78,6,'volutpat quam pede','Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.','2017-08-05 18:17:46',1),(79,3,'luctus et ultrices posuere cubilia','Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat.','2018-01-16 03:56:01',1),(80,3,'nibh in','Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.','2017-05-21 08:34:52',1),(81,4,'sapien arcu sed augue','Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus.','2018-03-01 10:02:54',1),(82,1,'neque aenean auctor','Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.','2017-07-02 23:39:08',1),(83,3,'rutrum nulla nunc','Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero.','2018-03-11 20:04:44',1),(84,6,'ultrices erat tortor','Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.','2017-05-28 07:54:16',0),(85,4,'non mi','Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum.','2017-07-15 15:11:47',1),(86,5,'convallis duis consequat','Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.','2017-07-07 10:50:08',1),(87,2,'erat quisque erat','Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.','2017-12-12 20:57:59',1),(88,4,'dolor','Etiam pretium iaculis justo. In hac habitasse platea dictumst.','2017-06-09 03:23:50',1),(89,1,'id','Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.','2017-11-20 10:16:37',1),(90,8,'suspendisse accumsan tortor quis turpis','Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat.','2017-09-25 19:20:06',1),(91,2,'a odio','Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.','2017-10-14 10:26:40',1),(92,10,'lacinia aenean','In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti.','2017-08-09 20:43:35',1),(93,1,'justo sit amet sapien dignissim','In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.','2017-07-17 17:10:43',1),(94,8,'quisque porta volutpat erat quisque','Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat.','2017-10-29 10:18:03',1),(95,2,'in hac habitasse','Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.','2017-11-22 04:42:22',1),(96,5,'tellus semper interdum','Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.','2017-12-14 19:18:56',0),(97,5,'in quam fringilla rhoncus','Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla.','2017-10-14 11:43:22',1),(98,9,'justo','Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.','2017-10-30 00:16:20',1),(99,7,'eget tincidunt','Vivamus in felis eu sapien cursus vestibulum.','2017-07-05 18:11:45',1),(100,10,'integer aliquet massa id lobortis','Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.','2018-01-06 10:59:58',1),(101,1,'Дополнительные требования (не обязательные к выполнению)','Авторизованные пользователи на стартовой странице и на странице просмотра объявления (uri = ‘/$id’, где $id - id объявления) должны также видеть кнопку edit (uri = ‘/edit/$id’, где $id - id объявления). При нажатие на данную кнопку, они должны быть перенаправлены на страницу редактирования объявления (uri = ‘/edit/$id’, где $id - id объявления). Страницы редактирования и создания объявлений должны иметь одинаковый функционал. Страница редактирования объявления должна иметь кнопку save вместо кнопки create, которая располагается на странице создания объявления.\r\n\r\nНа стартовой странице сайта title объявления нужно сделать ссылкой, которая будет вести на страницу просмотра объявления (uri = ‘/$id’, где $id - id объявления).','2018-05-01 21:12:00',1),(102,15,'Страница создания объявления','Страница создания объявления (uri = ‘/edit’) позволяет авторизованным юзерам создавать объявления. Данная страница представляет собой форму создания объявления. Данная форма состоит из поля title, description и кнопки create. Title и description должны быть не пустыми. При нажатии на кнопку create, объявление должно быть создано, а юзер должен быть перенаправлен на страницу просмотра объявления (uri = ‘/$id’, где $id - id объявления).','2018-05-01 22:03:45',1),(103,1,'stupid ad','stupid ad description','2018-05-01 22:10:06',1);
/*!40000 ALTER TABLE `site_ads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'ur7ez','4a37dcec451ceccabae948df294119c0','Mike Nykytenko','ur7ez@ukr.net',1),(2,'egaynsford0','b9b575dc16143b778a1da4cd11de81a5','Evangeline Gaynsford','egaynsford0@so-net.ne.jp',1),(3,'gmcmillian1','c067ea09dc2589c52812841bbd2a5fac','Gabie McMillian','gmcmillian1@psu.edu',1),(4,'jtrueman2','ef009befa1632d7b089e14fa1ed86baa','Jaynell Trueman','jtrueman2@psu.edu',1),(5,'nterrett3','f92214dfb53987a4ec1faf871f24ddd6','Nata Terrett','nterrett3@wikipedia.org',1),(6,'nmoen4','a81a5dca28662098f382aca30bc2af43','Neile Moen','nmoen4@blogspot.com',1),(7,'goxenbury5','99b7be79dcf3fe0a97b8bb3b3e2f2332','Gerrie Oxenbury','goxenbury5@google.ru',1),(8,'ptraske6','cf9424366ce06a1bdd7fac747276c783','Pavla Traske','ptraske6@weibo.com',0),(9,'amattke7','f763ef8ec716524733a35c0f0667f184','Arlana Mattke','amattke7@bbc.co.uk',1),(10,'rwalsh8','66d4e16d4ada44d4acc69c788d82a173','Rosanne Walsh','rwalsh8@purevolume.com',1),(11,'dfearick9','723261f0298b4d2552a08fc165b96772','Dinny Fearick','dfearick9@hao123.com',1),(15,'test','5eb2b55e8c292e58d588ad6280cf8524',NULL,NULL,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `ads_all`
--

/*!50001 DROP TABLE IF EXISTS `ads_all`*/;
/*!50001 DROP VIEW IF EXISTS `ads_all`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ads_all` AS select `a`.`id` AS `id`,`a`.`user_id` AS `user_id`,`a`.`title` AS `title`,`a`.`description` AS `description`,`a`.`created_at` AS `created_at`,`a`.`published` AS `published`,`u`.`login` AS `login`,`u`.`name` AS `user_name`,`u`.`active` AS `user_active` from (`site_ads` `a` left join `users` `u` on((`a`.`user_id` = `u`.`id`))) order by `a`.`created_at` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-02  1:20:07
