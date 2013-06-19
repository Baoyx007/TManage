-- MySQL dump 10.13  Distrib 5.6.11, for Win64 (x86_64)
--
-- Host: localhost    Database: tmanage
-- ------------------------------------------------------
-- Server version	5.6.11-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES gbk */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `answer_group`
--

DROP TABLE IF EXISTS `answer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` datetime DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `master` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_7a4ab903e2d749979fed06939a9` (`master`),
  CONSTRAINT `FK_7a4ab903e2d749979fed06939a9` FOREIGN KEY (`master`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer_group`
--

LOCK TABLES `answer_group` WRITE;
/*!40000 ALTER TABLE `answer_group` DISABLE KEYS */;
INSERT INTO `answer_group` VALUES (85,'2013-06-18 00:00:00',1,NULL),(86,'2013-06-18 00:00:00',2,NULL),(87,'2013-06-19 00:00:00',3,NULL),(88,'2013-06-19 00:00:00',4,NULL),(89,'2013-06-20 00:00:00',5,NULL),(90,'2013-06-20 00:00:00',6,NULL),(91,NULL,7,NULL);
/*!40000 ALTER TABLE `answer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archive`
--

DROP TABLE IF EXISTS `archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `subject` int(11) DEFAULT NULL,
  `thesis` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_1089d2a91e0b43f98c1af11b5c8` (`id`),
  KEY `FK_1e28244c5525416e91a9392a606` (`id`),
  KEY `FK_4e0b2aab7e324e5da10a6a11965` (`subject`),
  KEY `FK_21b95db0fef9443bb9118c64335` (`thesis`),
  CONSTRAINT `FK_1089d2a91e0b43f98c1af11b5c8` FOREIGN KEY (`id`) REFERENCES `subject` (`id`),
  CONSTRAINT `FK_1e28244c5525416e91a9392a606` FOREIGN KEY (`id`) REFERENCES `thesis` (`id`),
  CONSTRAINT `FK_21b95db0fef9443bb9118c64335` FOREIGN KEY (`thesis`) REFERENCES `thesis` (`id`),
  CONSTRAINT `FK_4e0b2aab7e324e5da10a6a11965` FOREIGN KEY (`subject`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archive`
--

LOCK TABLES `archive` WRITE;
/*!40000 ALTER TABLE `archive` DISABLE KEYS */;
INSERT INTO `archive` VALUES (6,2,97,15,29),(7,0,0,16,31),(8,1,40,19,33),(9,0,0,20,34);
/*!40000 ALTER TABLE `archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulletin`
--

DROP TABLE IF EXISTS `bulletin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulletin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic` varchar(255) DEFAULT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `content` longtext,
  `attachment` varchar(255) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ce3e7781ea0440f98d294bd080f` (`admin_id`),
  CONSTRAINT `FK_ce3e7781ea0440f98d294bd080f` FOREIGN KEY (`admin_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulletin`
--

LOCK TABLES `bulletin` WRITE;
/*!40000 ALTER TABLE `bulletin` DISABLE KEYS */;
INSERT INTO `bulletin` VALUES (6,'sdsdsd','2013-05-25 20:04:54','sdfsadfafasf',NULL,262144),(7,'sdsdsd','2013-05-25 20:04:58','sdfsadfafasf',NULL,262144),(8,'sdsdsd','2013-05-25 20:04:58','sdfsadfafasf',NULL,262144),(9,'sdsdsd','2013-05-25 20:04:58','sdfsadfafasf',NULL,262144),(10,'sdsdsd','2013-05-25 20:04:58','sdfsadfafasf',NULL,262144),(11,'sdsdsd','2013-05-25 20:04:58','sdfsadfafasf',NULL,262144),(12,'sdsdsd','2013-05-25 20:04:58','sdfsadfafasf',NULL,262144),(13,'sdsdsd','2013-05-25 20:04:58','sdfsadfafasf',NULL,262144),(14,'sdsdsd','2013-05-25 20:04:58','sdfsadfafasf',NULL,262144),(15,'sdsdsd','2013-05-25 20:04:58','sdfsadfafasf',NULL,262144),(16,'sdf','2013-05-26 03:01:00','<p>�ڴ���������</p>\r\n',NULL,262144),(17,'sadf','2013-05-28 05:27:00','<p>�ڴ���������</p>\r\n',NULL,262144),(18,'qqq','2013-06-02 17:54:01','���ް˹��쵼�˸��ض���ϰ��ƽ�������ް˹��쵼�˸��ض���ϰ��ƽ����',NULL,262144),(19,'q','2013-06-03 16:38:01','�ڴ���������',NULL,262144),(20,'���ް˹���ͳ(����)���ض���ϰ��ƽ����','2013-06-03 16:38:48','<p style=\"color: rgb(0, 0, 0); font-family: ����; font-size: 14px; line-height: 28px;\"><strong>����ǿ˫�ߺ������ƶ��мӹ�ϵ��չ</strong></p><p style=\"color: rgb(0, 0, 0); font-family: ����; font-size: 14px; line-height: 28px;\">�����»�����������6��2�յ磨���������������ޣ�������ϯϰ��ƽ1�պ�2�����������Ͷ�͸��׶��������۷ֱ���<strong>��������ͳ</strong>��Ī������<strong>����ϺͰͲ�������</strong>˹������<strong>�����������</strong>˹�����ء�<strong>�����ɴ�����</strong>���ж���<strong>�͹�������</strong>����˹�١�<strong>���������</strong>����ɭ�����գ�ͬ���Ǿͼ�ǿ˫���Ѻú������й�ͬ���ձȵ��������ϵ���������</p><p align=\"center\" style=\"color: rgb(0, 0, 0); font-family: ����; font-size: 14px; line-height: 28px;\"></p><center style=\"color: rgb(0, 0, 0); font-family: ����; font-size: 14px; line-height: 28px;\"><img id=\"1939976\" title=\"\" border=\"0\" align=\"center\" src=\"http://focus.scol.com.cn/gjyw/img/attachement/jpg/site2/20130603/002564aaaa321316589855.jpg\" sourcename=\"�����ļ�\" sourcedescription=\"�༭�ṩ�ı����ļ�\" style=\"margin: 0px; padding: 0px;\"></center><div align=\"left\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0); font-family: ����; font-size: 14px; line-height: 28px;\">&nbsp;&nbsp;&nbsp;&nbsp;<font face=\"����\">6��2�գ�������ϯϰ��ƽ���������Ͷ�͸��׶��������ۻ����������ͳ��Ī������ �»������ �İ��� ��</font>&nbsp;&nbsp;&nbsp;</div><p style=\"color: rgb(0, 0, 0); font-family: ����; font-size: 14px; line-height: 28px;\"></p><div align=\"left\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0); font-family: ����; font-size: 14px; line-height: 28px;\">�����ڻ����Ī����ʱ��ϰ��ƽ��ʾ���������ǵ�һ��ͬ�й�������Ӣ����ձȹ��ң�������ϵ�����ܺá��з�Ըͬ�緽������ǿ��������ᡢ���������������������ʩ���衢������������ũ����������������ʵ�ù緽��������������ˮ��վ����Ŀ��˫���ڹ�����ϵ������仯���������й㷺��ͬ���棬Ҫ�ڶ�߳���������ϡ�</div><p style=\"color: rgb(0, 0, 0); font-family: ����; font-size: 14px; line-height: 28px;\">������Ī������ʾ���������������Ѻý������໥֧�֡������Ǹ߶������й��ķ�չ�������й�Ϊά�������ƽ��������չ�й�����������Ҫ���ס��緽ϣ��ͬ�з���ǿ��������������������չˮƽ��</p><p style=\"color: rgb(0, 0, 0); font-family: ����; font-size: 14px; line-height: 28px;\">�����ڻ��˹����ʱ��ϰ��ƽ��ʾ������ϺͰͲ������й��ڼ��ձȵ�����Ҫ������顣�з���л�������漰�й��ش�������������ϸ���ı���֧�֡��з����Ӱ�����������������ε�����������룬Ըͬ�����ڻ�������̬�������跽�潻����������������������30���꣬ϣ��˫���Դ�Ϊ���������Ѻú����������ˮƽ����������ֵ����ʮ�˽����Ϲ������ϯ���з�Ըͬ������ǿЭ������ϡ�</p><p style=\"color: rgb(0, 0, 0); font-family: ����; font-size: 14px; line-height: 28px;\">����˹������ʾ�����͸�л�й�һ���ź�ƽ��������ԭ��ͬ���ͷ�չ��ϵ���򰲷��ṩ�˱���֧�֣�ϣ����ǿ������ó�����ġ���ߵ��������������ףԸ�й�������ʵ�֣������й���չ�������ͼ����ձȹ��Ҵ�����ͬ��չ������</p><p style=\"color: rgb(0, 0, 0); font-family: ����; font-size: 14px; line-height: 28px;\">�����ڻ��˹������ʱ��ϰ��ƽָ��������������й��ĺ����ѡ��û�飬����������������չ�����������˫��Ҫ������չũҵ��ҽ�Ƶ�������ת�ú;��鹲����ʵ��ϸ���ü���������̽�����������Դ����ͬӦ������仯��������Ա��������ǿ������Դ��ѵ������</p><p style=\"color: rgb(0, 0, 0); font-family: ����; font-size: 14px; line-height: 28px;\">����˹�����ظ�л�з����������˵İ�����ϣ����ǿ��ͨ������ʩ���衢������ҽ�Ƶ���������������෽�����з�������仯�����ϵ��������ر���֧�ֺͰ���С�������Ըͬ�з��໥֧�֣���ǿ������</p><p style=\"color: rgb(0, 0, 0); font-family: ����; font-size: 14px; line-height: 28px;\">�����ڻ�����ж�ʱ��ϰ��ƽ���͸����ɴ����漰�й���������������֧���з���8�������и��ϵ��չ˳����˫��Ҫ����δ��������Ŭ�����ƶ�������ϵ���ڽ����ȶ���չ��˫��Ҫ���ָ߲㽻�����������λ��ţ���ǿ������ʩ���衢ũҵ��������Դ���������Ļ������ε����������</p><p style=\"color: rgb(0, 0, 0); font-family: ����; font-size: 14px; line-height: 28px;\">�������ж���ʾ�������������гɹ�����ǰ��������ϵ�������û�������ϣ�����������໥���ص�ԭ��ͬ�з���ǿ����Ŧ�����ƽ��Ѻú�����ϵ��</p>',NULL,262144),(21,'2013��6��4��0:43:04','2013-06-03 16:43:11','�ڴ���������',NULL,262144),(22,'2013��6��4��0:43:29 chang','2013-06-12 05:44:28','�ڴ���������',NULL,262144),(23,'������','2013-06-15 15:06:22','����8:00 ��ʼ��磡��',NULL,262144),(24,'�������Ϣ','2013-06-15 15:06:51','��һ�飺<div><blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\"><div>������</div><div>Ǯ��</div><div>������</div></blockquote></div>',NULL,262144);
/*!40000 ALTER TABLE `bulletin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_unique_key`
--

DROP TABLE IF EXISTS `hibernate_unique_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_unique_key` (
  `next_hi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_unique_key`
--

LOCK TABLES `hibernate_unique_key` WRITE;
/*!40000 ALTER TABLE `hibernate_unique_key` DISABLE KEYS */;
INSERT INTO `hibernate_unique_key` VALUES (31);
/*!40000 ALTER TABLE `hibernate_unique_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal`
--

DROP TABLE IF EXISTS `journal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic` varchar(255) DEFAULT NULL,
  `submit_date` datetime DEFAULT NULL,
  `review_date` datetime DEFAULT NULL,
  `content` longtext,
  `opinion` varchar(255) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_e93c3f330a61451fbffd4c8d336` (`student_id`),
  KEY `FK_2b401b8c092e41579fba63fd3b0` (`teacher_id`),
  CONSTRAINT `FK_2b401b8c092e41579fba63fd3b0` FOREIGN KEY (`teacher_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_e93c3f330a61451fbffd4c8d336` FOREIGN KEY (`student_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal`
--

LOCK TABLES `journal` WRITE;
/*!40000 ALTER TABLE `journal` DISABLE KEYS */;
INSERT INTO `journal` VALUES (1,'sdfsdfsd','2013-05-31 16:28:07','2013-05-31 16:28:07','dsfasfsdf','sdfasfasdfasdf',196608,557077),(2,'sdfsdfsd','2013-05-31 16:28:32','2013-05-31 16:28:32','2',NULL,196608,NULL),(3,'�Ϳ���������ܹ���ɨ�Ȼ�','2013-06-09 01:03:13','2013-06-10 18:11:52','<div class=\"voice-photoVideo\" style=\"margin: 0px 0px 10px; padding: 0px; min-height: 1%; color: rgb(68, 68, 68); font-family: \'lucida grande\', tahoma, verdana, arial, ����, sans-serif; font-size: 12px; line-height: 14px; background-color: rgb(255, 255, 254);\"><div class=\"voice-photo\" style=\"margin: 0px; padding: 0px;\"><div class=\"small-img\" style=\"margin: 0px; padding: 0px; float: none; position: static; text-align: center;\"><img class=\"pic\" src=\"http://c1.hoopchina.com.cn/uploads/star/event/images/130608/bmiddle-86930586ea080e28575d2fe4f577e665a8bab1f1.jpg\" width=\"450\" height=\"305\" style=\"border-style: none; vertical-align: top; cursor: auto;\"></div></div></div><div class=\"voice-text\" style=\"margin: 0px 0px 10px; padding: 0px; font-size: 14px; line-height: 25px; text-indent: 2em; color: rgb(68, 68, 68); font-family: \'lucida grande\', tahoma, verdana, arial, ����, sans-serif; background-color: rgb(255, 255, 254);\"><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px;\">�������ϣ�TNT����Ա���˹-�Ϳ�����һ���ѿ����Ŀ��̸�����ܾ����Ļ��⡣</p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px;\">������ܾ������Ϳ���������̶�ڣ�������Ϊ���6���ڶ�ڣ��Ҳ���Ϊ�Ȼ���Դ�ʥ��������߳������������˵һЩ�޴��Ļ�����ʵ����˵������Ϊ����ܹ���ɨ�Ȼ𡣡�</p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px;\">�Ϳ�����ʾ����Ȼ�Ȼ��ڶ����������ߴ�ս��ʤ������ʵ���������Ѿ��������߸�ð������á�ϣ���ؿ����������Ų��ס�������̲�����һ�����������15��ʧ����˵��������������õĿ�������</p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px;\">�Ϳ�����Ϊ�����ǻ�û�п�����õ���̣�����һ����Ӧ�û����Ȼ��£��Ǿ������û��ã����������ֲ��á��Ҿ������ǵĽ��������ˡ���</p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px;\">�����ǻ��Ϸ��ղ��ʣ��ղ����������˹����ı��֣�����̲����������ױ����ġ��Ҿ�������ܹ���ɨ���ǣ�������Ĳ���Ϊ���ǻ��߳�ʥ������¡���</p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px;\">���⣬�Ϳ�����������Τ�£�����ΪΤ�������������ʣ���࣬���Ѿ���������·��</p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px;\">�Ϳ���Ҳ�ᵽ���޵�����Щʱ����Ƿ����ۣ��޵����ƣ�ղķ˹��90����������Ǹ�ƽ��ˮ׼����Ա������ͬ������˵����</p></div>','funny!',196608,327680),(4,'��־һ','2013-06-15 23:04:41','2013-06-15 23:05:44','��־��־��־��־��־��־��־��־��־��־��־��־��־��־��־��־��־��־��־','����',917504,950272);
/*!40000 ALTER TABLE `journal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail`
--

DROP TABLE IF EXISTS `mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_user` int(11) DEFAULT NULL,
  `recv_user` int(11) DEFAULT NULL,
  `topic` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `send_time` datetime DEFAULT NULL,
  `checked` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_aeeb3d0ad44c4aba96ce2871dac` (`send_user`),
  KEY `FK_a3cec008bbab477ab046de06b2b` (`recv_user`),
  CONSTRAINT `FK_a3cec008bbab477ab046de06b2b` FOREIGN KEY (`recv_user`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `FK_aeeb3d0ad44c4aba96ce2871dac` FOREIGN KEY (`send_user`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail`
--

LOCK TABLES `mail` WRITE;
/*!40000 ALTER TABLE `mail` DISABLE KEYS */;
INSERT INTO `mail` VALUES (1,65536,32768,'haha','dsfsdfsdfsdfsd',NULL,0),(2,196608,425984,'���','<p>����������������</p>\r\n',NULL,0),(3,425984,196608,'nihaoa','adsfasfsdf','2013-05-26 03:58:36',1),(4,425984,196608,'nihaoa','adsfasfsdf','2013-05-26 03:58:36',1),(5,425984,196608,'nihaoa','adsfasfsdf','2013-05-26 03:58:36',1),(6,196608,327680,'nihaoa','adsfasfsdf','2013-05-26 03:58:36',1),(7,196608,327680,'qqqq','<p>sdfsfsdadfsdfsdf</p>\r\n','2013-05-30 09:26:15',1),(8,196608,196608,'nihao','dd','2013-06-13 00:34:00',1),(9,196608,196608,'dd','d','2013-06-13 00:36:05',1),(10,196608,327680,'asdsad','sadasddasdasdasd','2013-06-13 01:09:18',1),(11,262144,327680,'dd','qqq','2013-06-13 01:17:54',1),(12,327680,196608,'qq','qqqqqqqqqqqsqsqsqsq\r\nsq\r\nqsqsq\r\ns','2013-06-13 01:53:56',1),(13,262144,262144,'dd','dd','2013-06-13 02:00:34',1),(14,NULL,262144,'sdf','adfasdfd','2013-06-13 02:13:54',1),(15,196608,327680,'��ð�','��ð�','2013-06-13 06:22:00',1),(16,262144,NULL,'��ӭʹ��','��ӭʹ��','2013-06-15 21:58:12',0),(17,262144,950272,'��ӭʹ��','��ӭʹ�ñ�ҵ��ƹ���ϵͳ','2013-06-15 22:44:17',1),(18,917504,950272,'��ʦ���','��ʦ���','2013-06-15 23:05:08',1),(19,950272,917504,'���','���','2013-06-15 23:05:32',1),(20,NULL,262144,'haha','asdasd','2013-06-15 23:18:03',1);
/*!40000 ALTER TABLE `mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qualification`
--

DROP TABLE IF EXISTS `qualification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qualification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `college` varchar(45) DEFAULT NULL,
  `degree` varchar(45) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `start_time` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qualification`
--

LOCK TABLES `qualification` WRITE;
/*!40000 ALTER TABLE `qualification` DISABLE KEYS */;
INSERT INTO `qualification` VALUES (3,'dddd','sdds',0,113),(4,'dddd','sdds',0,2013),(5,'dddd','sdds',0,2013),(6,'������','ѧʿ',4,2013),(7,'������','ѧʿ',0,2013),(8,'dddd','sdds',0,2013),(9,'������','ѧʿ',0,2013),(10,NULL,'��ʿ',0,0),(11,NULL,'��ʿ',0,0),(12,NULL,'��ʿ',0,0),(13,NULL,'��ʿ',0,0),(14,NULL,'��ʿ',0,0),(15,NULL,'��ʿ',0,0),(16,NULL,'��ʿ',0,0);
/*!40000 ALTER TABLE `qualification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `s_id` int(11) NOT NULL,
  `school_number` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `qualification_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`s_id`),
  KEY `FK8FFE823B11291F40` (`qualification_id`),
  KEY `FK8FFE823B10EDC708` (`s_id`),
  KEY `FK8FFE823BAA0D1094` (`unit_id`),
  KEY `FK_76aa037858144ae583eed7ec6a5` (`s_id`),
  CONSTRAINT `FK8FFE823B11291F40` FOREIGN KEY (`qualification_id`) REFERENCES `qualification` (`id`),
  CONSTRAINT `FK8FFE823BAA0D1094` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`),
  CONSTRAINT `FK_76aa037858144ae583eed7ec6a5` FOREIGN KEY (`s_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (32768,'',NULL,NULL,'',NULL,NULL,NULL),(65536,NULL,NULL,0,NULL,NULL,NULL,NULL),(98304,'099074016','2013-05-25',0,NULL,NULL,5,3),(131072,'099074016','2013-05-25',0,NULL,NULL,6,4),(163840,'099074016','2013-05-25',0,NULL,NULL,7,5),(196608,'099074016','2013-05-25',0,'j3#4008',NULL,8,6),(360448,NULL,'2013-05-15',1,NULL,NULL,NULL,NULL),(458752,'099074016','2013-05-28',0,NULL,NULL,10,8),(524288,'099074010','2013-06-07',0,'j3#400',NULL,11,9),(524289,'099074011','2013-06-07',0,'j3#401',NULL,11,9),(524290,'099074012','2013-06-07',0,'j3#402',NULL,11,9),(524291,'099074013','2013-06-07',0,'j3#403',NULL,11,9),(524292,'099074014','2013-06-07',0,'j3#404',NULL,11,9),(524293,'099074015','2013-06-07',0,'j3#405',NULL,11,9),(524294,'099074016','2013-06-07',0,'j3#406',NULL,11,9),(524295,'099074017','2013-06-07',0,'j3#407',NULL,11,9),(524296,'099074018','2013-06-07',0,'j3#408',NULL,11,9),(524297,'099074019','2013-06-07',0,'j3#409',NULL,11,9),(524298,'0990740110','2013-06-07',0,'j3#4010',NULL,11,9),(524299,'0990740111','2013-06-07',0,'j3#4011',NULL,11,9),(524300,'0990740112','2013-06-07',0,'j3#4012',NULL,11,9),(524301,'0990740113','2013-06-07',0,'j3#4013',NULL,11,9),(524302,'0990740114','2013-06-07',0,'j3#4014',NULL,11,9),(524303,'0990740115','2013-06-07',0,'j3#4015',NULL,11,9),(524304,'0990740116','2013-06-07',0,'j3#4016',NULL,11,9),(524305,'0990740117','2013-06-07',0,'j3#4017',NULL,11,9),(524306,'0990740118','2013-06-07',0,'j3#4018',NULL,11,9),(524307,'0990740119','2013-06-07',0,'j3#4019',NULL,11,9),(524308,'0990740120','2013-06-07',0,'j3#4020',NULL,11,9),(524309,'0990740121','2013-06-07',0,'j3#4021',NULL,11,9),(524310,'0990740122','2013-06-07',0,'j3#4022',NULL,11,9),(524311,'0990740123','2013-06-07',0,'j3#4023',NULL,11,9),(524312,'0990740124','2013-06-07',0,'j3#4024',NULL,11,9),(524313,'0990740125','2013-06-07',0,'j3#4025',NULL,11,9),(524314,'0990740126','2013-06-07',0,'j3#4026',NULL,11,9),(524315,'0990740127','2013-06-07',0,'j3#4027',NULL,11,9),(524316,'0990740128','2013-06-07',0,'j3#4028',NULL,11,9),(524317,'0990740129','2013-06-07',0,'j3#4029',NULL,11,9),(589824,NULL,NULL,NULL,'',NULL,NULL,NULL),(851968,'',NULL,0,'',NULL,12,10),(917504,'099074123','2013-06-15',0,'j3#4010',NULL,15,13),(983041,'',NULL,0,'',NULL,18,16);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext,
  `student_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `checked` tinyint(1) DEFAULT '0',
  `choosened` tinyint(1) DEFAULT '0',
  `submitDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_7ac1c03077b74721b35a4370965` (`student_id`),
  KEY `FK_a04e6f98285b43338aa23819df5` (`teacher_id`),
  CONSTRAINT `FK_7ac1c03077b74721b35a4370965` FOREIGN KEY (`student_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_a04e6f98285b43338aa23819df5` FOREIGN KEY (`teacher_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'tt','tt-----------------\r\n,�������޸ĺ����ύ---Wed Jun 12 13:56:26 CST 2013-----------------\r\n,�������޸ĺ����ύ---Thu Jun 13 01:11:42 CST 2013-----------------\r\n,�������޸ĺ����ύ---Thu Jun 13 01:11:58 CST 2013-----------------\r\n,�������޸ĺ����ύ---Thu Jun 13 01:12:04 CST 2013-----------------\r\n,�������޸ĺ����ύ---Thu Jun 13 01:12:07 CST 2013-----------------\r\n,�������޸ĺ����ύ---Thu Jun 13 08:29:36 CST 2013',196608,557064,0,0,'2013-06-13 08:29:37'),(2,'test','����˰�ķ�����ˮ���',32768,327680,1,1,'2013-05-31 14:06:20'),(3,'ttt','ttt-----------------\r\n,�������޸ĺ����ύ---Wed Jun 12 13:56:29 CST 2013-----------------\r\n,�������޸ĺ����ύ---Thu Jun 13 08:29:31 CST 2013-----------------\r\n,�������޸ĺ����ύ---Thu Jun 13 08:29:40 CST 2013',196608,557065,0,0,'2013-06-13 08:29:40'),(4,'haha','null-----------------\r\n,�������޸ĺ����ύ-----------------\r\n,�������޸ĺ����ύ-----------------\r\n,�������޸ĺ����ύ-----------------\r\n,�������޸ĺ����ύ-----------------\r\n,�������޸ĺ����ύ-----------------\r\n,�������޸ĺ����ύ-----------------\r\n,�������޸ĺ����ύ-----------------\r\n,�������޸ĺ����ύ-----------------\r\n,�������޸ĺ����ύ---Sun Jun 02 00:52:50 CST 2013-----------------\r\n,�������޸ĺ����ύ---Sun Jun 02 00:52:53 CST 2013-----------------\r\n,�������޸ĺ����ύ---Sun Jun 02 00:53:00 CST 2013-----------------\r\n,�������޸ĺ����ύ---Sun Jun 02 00:53:02 CST 2013-----------------\r\n,�������޸ĺ����ύ---Sun Jun 02 00:53:05 CST 2013-----------------\r\n,�������޸ĺ����ύ---Sun Jun 02 00:53:09 CST 2013-----------------\r\n,�������޸ĺ����ύ---Sun Jun 02 00:53:12 CST 2013-----------------\r\n,�������޸ĺ����ύ---Sun Jun 02 00:53:18 CST 2013-----------------\r\n,�������޸ĺ����ύ---Sun Jun 02 00:53:22 CST 2013-----------------\r\n,�������޸ĺ����ύ---Sun Jun 02 00:53:26 CST 2013-----------------\r\n,�������޸ĺ����ύ---Sun Jun 02 00:53:30 CST 2013-----------------\r\n,�������޸ĺ����ύ---Sun Jun 02 00:53:34 CST 2013',131072,557078,1,0,'2013-06-02 00:53:35'),(6,'t3','t4-----------------\r\n,�������޸ĺ����ύ---Wed Jun 12 13:56:30 CST 2013-----------------\r\n,�������޸ĺ����ύ---Thu Jun 13 08:29:32 CST 2013-----------------\r\n,�������޸ĺ����ύ---Thu Jun 13 08:29:42 CST 2013',196608,557066,0,0,'2013-06-13 08:29:43'),(7,'tt4','t4',NULL,557081,1,0,NULL),(8,'tt7','null-----------------\r\n,�������޸ĺ����ύ-----------------\r\n,�������޸ĺ����ύ-----------------\r\n,�������޸ĺ����ύ-----------------\r\n,�������޸ĺ����ύ-----------------\r\n,�������޸ĺ����ύ-----------------\r\n,�������޸ĺ����ύ-----------------\r\n,�������޸ĺ����ύ---Sun Jun 02 00:52:51 CST 2013-----------------\r\n,�������޸ĺ����ύ---Sun Jun 02 00:52:56 CST 2013-----------------\r\n,�������޸ĺ����ύ---Sun Jun 02 00:53:01 CST 2013-----------------\r\n,�������޸ĺ����ύ---Sun Jun 02 00:53:04 CST 2013-----------------\r\n,�������޸ĺ����ύ---Sun Jun 02 00:53:07 CST 2013-----------------\r\n,�������޸ĺ����ύ---Sun Jun 02 00:53:10 CST 2013-----------------\r\n,�������޸ĺ����ύ---Sun Jun 02 00:53:15 CST 2013-----------------\r\n,�������޸ĺ����ύ---Sun Jun 02 00:53:20 CST 2013-----------------\r\n,�������޸ĺ����ύ---Sun Jun 02 00:53:24 CST 2013-----------------\r\n,�������޸ĺ����ύ---Sun Jun 02 00:53:28 CST 2013-----------------\r\n,�������޸ĺ����ύ---Sun Jun 02 00:53:30 CST 2013-----------------\r\n,�������޸ĺ����ύ---Sun Jun 02 00:53:31 CST 2013-----------------\r\n,�������޸ĺ����ύ---Sun Jun 02 00:53:31 CST 2013-----------------\r\n,�������޸ĺ����ύ---Sun Jun 02 00:53:31 CST 2013-----------------\r\n,�������޸ĺ����ύ---Sun Jun 02 00:53:31 CST 2013-----------------\r\n,�������޸ĺ����ύ---Sun Jun 02 00:53:36 CST 2013-----------------\r\n,�������޸ĺ����ύ---Sun Jun 02 00:53:36 CST 2013-----------------\r\n,�������޸ĺ����ύ---Mon Jun 03 00:13:08 CST 2013-----------------\r\n,�������޸ĺ����ύ---Mon Jun 03 00:13:10 CST 2013',524303,557082,1,1,'2013-06-03 00:13:11'),(9,'��������ϵͳ','��Ϊ�ִ�������ҵ��������Ϣ��Ҳ����ȫ��������ҵ���󼲣������ܶԴ�ͳ������ҵ����������һ���Խ���������ʵ����ҵ������Ϣ���������ǽ�����ҵ�ɱ��������������������Ϣ����ϵͳ�����ؽ�������Ϣ����ϵͳ�͵������е�������Ϣ������������ҵ������Ϣϵͳ��������������Ϣϵͳ��������������ϵͳ��������������ϵͳ�������������ϵͳ�������ִ���Ϣϵͳ������������Ϣϵͳ�ȵ���Ҫ���ܼ����������������ϸ�µ�̽�֡����ҹ�������ҵ��Ϣ��������һ����ѧ����ֵ��Ӧ�ü�ֵ��',NULL,557077,1,0,'2013-06-08 00:00:00'),(10,'tt5','ttttttt6-----------------\r\n,�������޸ĺ����ύ---Wed Jun 12 14:02:19 CST 2013-----------------\r\n,�������޸ĺ����ύ---Thu Jun 13 08:29:33 CST 2013-----------------\r\n,�������޸ĺ����ύ---Thu Jun 13 08:29:43 CST 2013',196608,557067,0,0,'2013-06-13 08:29:44'),(11,'t6','t6-----------------\r\n,�������޸ĺ����ύ---Wed Jun 12 14:02:20 CST 2013-----------------\r\n,�������޸ĺ����ύ---Thu Jun 13 08:29:34 CST 2013-----------------\r\n,�������޸ĺ����ύ---Sat Jun 15 23:22:25 CST 2013',196608,557068,0,0,'2013-06-15 23:22:26'),(13,'sd','ds-----------------\r\n,�������޸ĺ����ύ---Wed Jun 12 14:02:21 CST 2013-----------------\r\n,�������޸ĺ����ύ---Thu Jun 13 08:29:35 CST 2013',NULL,327680,0,0,'2013-06-13 08:29:36'),(14,'���������ϵͳ','<div class=\"para\" style=\"margin-bottom: 14px; text-indent: 30px; color: rgb(0, 0, 0); font-family: arial, ����, sans-serif; font-size: 14px; line-height: 24px;\">��<a target=\"_blank\" href=\"http://baike.baidu.com/view/3226.htm\" style=\"color: rgb(19, 110, 194);\">��Ϣ����</a>�Ĵ߻�֮�£�<a target=\"_blank\" href=\"http://baike.baidu.com/view/9583.htm\" style=\"color: rgb(19, 110, 194);\">���羭��</a>�ı���Ѿ������˼���״̬������<a target=\"_blank\" href=\"http://baike.baidu.com/view/175299.htm\" style=\"color: rgb(19, 110, 194);\">����һ�廯</a>��<a target=\"_blank\" href=\"http://baike.baidu.com/view/233749.htm\" style=\"color: rgb(19, 110, 194);\">��ҵ��Ӫ</a>ȫ�򻯣��Լ���<div class=\"text_pic layoutright\" data-layout=\"right\" style=\"border: 1px solid rgb(232, 232, 232); background-color: rgb(250, 250, 250); padding: 5px 5px 3px; margin: 5px; float: right; text-indent: 0px; text-align: center; width: 220px; background-position: initial initial; background-repeat: initial initial;\"><a hidefocus=\"true\" class=\"nslog:1199\" href=\"http://baike.baidu.com/picview/568463/568463/0/4e4a20a4462309f76303d15d720e0cf3d7cad615.html\" target=\"_blank\" style=\"color: rgb(19, 110, 194);\"><img class=\"editorImg  log-set-param\" log-set-param=\"img_view\" alt=\"\" title=\"\" height=\"155\" width=\"220\" src=\"http://d.hiphotos.baidu.com/baike/s%3D220/sign=4300b1668618367aa98978df1e728b68/4e4a20a4462309f76303d15d720e0cf3d7cad615.jpg\" style=\"display: block;\"></a><p class=\"pic-info\" style=\"margin-top: 3px; margin-bottom: 0px; padding: 0px; color: rgb(102, 102, 102); font-size: 12px; font-family: ����; word-wrap: break-word; word-break: break-all; line-height: 18px; min-height: 18px; zoom: 1;\"><a class=\"nslog:1200 pic-handle\" title=\"�鿴ͼƬ\" href=\"http://baike.baidu.com/picview/568463/568463/0/4e4a20a4462309f76303d15d720e0cf3d7cad615.html\" target=\"_blank\" style=\"color: rgb(19, 110, 194); background-image: url(http://baike.bdimg.com/static/lemma/view/img/content_icon_3de36737.gif); width: 14px; height: 14px; font-size: 0px; line-height: 0; display: block; border: 1px solid rgb(246, 246, 246); float: right; margin-top: 2px; background-position: 0px -395px; background-repeat: no-repeat no-repeat;\">&nbsp;&nbsp;</a></p></div>�Ⱦ�����ɵĸ߶ȸ��Ի���Ѹ�ٸı��<a target=\"_blank\" href=\"http://baike.baidu.com/view/88584.htm\" style=\"color: rgb(19, 110, 194);\">�ͻ�</a>��������ҵ��˿͡���ҵ�빩���Ĺ�ϵ��ø������к͸��ӡ�ǿ�������淶ҵ�����̣����͸���ȣ��ӿ���Ʒ�ʽ���ת���Լ�Ϊ��ͨ������Ϣ����ȫ�����绯���»������Ǽҵ����۹�˾�����ڶ���ҵ��ҵ���������Ը����</div><div class=\"para\" style=\"margin-bottom: 14px; text-indent: 30px; color: rgb(0, 0, 0); font-family: arial, ����, sans-serif; font-size: 14px; line-height: 24px;\"><a target=\"_blank\" href=\"http://baike.baidu.com/view/58855.htm\" style=\"color: rgb(19, 110, 194);\">��С��ҵ</a>���ҹ����÷�չ�о�����Ҫ��λ�����˽��ҹ���<a target=\"_blank\" href=\"http://baike.baidu.com/view/58855.htm\" style=\"color: rgb(19, 110, 194);\">��С��ҵ</a>�����϶ࡢ�����ֲ��㷺����ҵ�ֲ���ȴ�����<a target=\"_blank\" href=\"http://baike.baidu.com/view/323580.htm\" style=\"color: rgb(19, 110, 194);\">ȫ�򾭼�һ�廯</a>�ķ�չ���й�����<a target=\"_blank\" href=\"http://baike.baidu.com/view/1249.htm\" style=\"color: rgb(19, 110, 194);\">WTO</a>����С��ҵ������������ҵ�͹����Ʒ�������Ͼ���ս���Ƚ϶��ԣ�������ҵ���и�Ϊ�ۺ���ʽ�ʵ�����ḻ�Ĺ�������Ƚ��ļ����ֶΣ���ˣ�����ҹ�����С��ҵ�������Ƚ��Ĺ���˼��ת�侭Ӫ���ʹ����Ϣ�������ҵ�Ĺ���ˮƽ�͹���Ч�ʣ��������ڽ��Ĺ��ʾ�����ȡʤ��Ȼ����ҵ�����ںܶ෽�桢�ܴ�̶��϶����������Ϣ������ɣ����ҹ�<a target=\"_blank\" href=\"http://baike.baidu.com/view/58855.htm\" style=\"color: rgb(19, 110, 194);\">��С��ҵ</a>����Ϣ��ˮƽ���ܵͣ���������ҵ��ȣ��������𲽽׶Ρ�</div>',524290,327680,1,0,NULL),(15,'��ҵ���Ĺ���ϵͳ','<div>��У���Ʊ�ҵ��ƺͱ�ҵ�������˲������ͽ�ѧ��һ���ǳ���Ҫ�Ļ��ڣ���ͨ�����飬Ŀǰ�ܶ��У���ڱ���ѧ����ҵ��ƺͱ�ҵ���ĵĹ�����ǲ��ô�ͳ���ֹ�ģʽ�����ȣ��ɷ���ָ���ʸ�Ľ�ʦ���⣬Ȼ�����ɽ�ʦָ��ѧ��ѡ�⣬ѧ�����꿪�ⱨ�����ƺ����ĵ�׫д��ָ����ʦָ����ɣ���;����ƺ����Ľ������ڼ�飬���������ĵ����ġ�����Լ����ĵĹ鵵������һ�����У�ÿһ���һ�㶼�ý�ʦ��ѧ������潻��������ѧ����������ƺ����Ĳ����ʼġ�E-Mail���绰�ȷ�ʽ���ʦ���н��������ַ�ʽ������һ�����ڽ�ʦ��ѧ��ֱ��������̽�ֺͽ�����⣬��Ҳ�����źܶ�����ԣ��ر�������Internet�ĳ��ֺ��ִ�Զ�̽����ķ�չ�Լ��ִ����ƽ���ģʽ�ķ�չ���������ô�ͳ�ֹ���</div><div>&nbsp;</div><div>��ģʽ�Ա�ҵ��ƺͱ�ҵ���Ľ��й�����Ե÷�ʱ���������ϵĹ�������Ч�ʵͣ����ڽ�ѧ��������˵���Լ�ʱ׼ȷ�����ձ�ҵ��ƺ����ĵ������չ��������������һ�����Ѷȣ���������������ս���ǵ��±�ҵ��ƺͱ�ҵ���ĵ��������Ա�֤��Ҳû�г�������޴����ڵ�Internet���ƺͷḻ��������Դ��&nbsp;</div><div>���������ʵ�ֽ�ѧ������Ϣ�������绯�����ø�ϵͳ�Ը�У���Ʊ�ҵ���Ľ��й������Խ���ֹ�ѡ���ҵ���Ĵ���������ʱ�䳤������Ч�ʵ͡�����ƽ�����󣬼���ط���ѧ����ָ����ʦ������������˹���Ч�ʡ�</div>',196608,327680,1,1,NULL),(16,'����JSP��ѧ�����Ͻ���ƽ̨�������ʵ��','<p class=\"p0\" style=\"text-indent: 24pt; margin-bottom: 0pt; margin-top: 0pt; word-break: break-all; line-height: 18pt;\"><span style=\"mso-spacerun:\'yes\'; font-size:12.0000pt; font-family:\'����\'; \">��ϵͳ��JSP��дһ���򵥵Ľ���ƽ̨�������õ���HTML��CSS��JavaScript&nbsp;��Servlet��Struts��AJAX�ȼ������õ��Ŀ���������Ҫ��MyEclipse�����ݿ��õ���MySql���������õ���Tomcat��ǰ̨��JSP��������ʾ����̨ͨ��MYSQL�������ݿ�Ĺ���</span></p><p class=\"p0\" style=\"text-indent: 24pt; margin-bottom: 0pt; margin-top: 0pt; word-break: break-all; line-height: 18pt;\"><span style=\"mso-spacerun:\'yes\'; font-size:12.0000pt; font-family:\'����\'; \">ϵͳĿ�������һ�������õĽ���ƽ̨</span><span style=\"mso-spacerun:\'yes\'; font-size:12.0000pt; font-family:\'����\'; \">��ϵͳ��Ϊ����ģ�飬��Ҫ�й���Ա���û�ģ�顣�û�ģ���ֿ��Է�Ϊ���¼���ģ�飺ע�ᡢ��½���鿴���޸ĸ�����Ϣ�����԰��ϴ������ļ��������ҡ�д�ռǡ���������ģ��ȡ�����Աģ�鹦�ܱȽϼ򵥣���Ҫ��������ϵͳ���桢�鿴�û���ɾ���û���</span><span style=\"mso-spacerun:\'yes\'; font-size:12.0000pt; font-family:\'����\'; \"><o:p></o:p></span></p>',524300,327680,1,1,NULL),(17,'������ְ��Ƹϵͳ ','<p class=\"p0\" style=\"text-indent:24.0000pt; margin-bottom:0pt; margin-top:0pt; line-height:18.0000pt; \"><span style=\"mso-spacerun:\'yes\'; font-size:12.0000pt; font-family:\'����\'; \">����ҪĿ���ǣ����ٲμ���Ƹ��λ������Ա�Ĺ���������Ƹ�ɱ�,���ٽ�����ְ����Ա��ְʱ�μ���Ƹ��Ͷ�ݼ������ķѵ�ʱ��;�����ʹ��ְ����Ƹ�Ĺ���ͨ����������ɣ��Ӷ�ʵ����Ƹʱ˫��ѡ����Զ�����</span><span style=\"mso-spacerun:\'yes\'; font-size:12.0000pt; font-family:\'����\'; \"><o:p></o:p></span></p><p class=\"p0\" style=\"text-indent:24.0000pt; margin-bottom:0pt; margin-top:0pt; line-height:18.0000pt; \"><span style=\"mso-spacerun:\'yes\'; font-size:12.0000pt; font-family:\'����\'; \">������ְ����ͻ�����ŵ㣬����Ϣ������Դ�ḻ�������ٶȿ죬��Ƹְλ��ȣ��ܷ���������ϣ�������ݡ������ķ�ʽ����������Ч��Ϣ����ְҪ�󡣱�ϵͳ����һ��ģ��������ְ��Ƹ��ϵͳ���߱���ʵ���˲��н�����Ĺ��ܡ�����Ϊ�����û��ṩ��Ҫ����ְ����Ƹ����Ϣ��Ҳ����Ϊ��λ�û��ṩ��Ҫ���˲���Ϣ������˵�����߻�����һ����Ҫ������</span><span style=\"mso-spacerun:\'yes\'; font-size:12.0000pt; font-family:\'����\'; \"><o:p></o:p></span></p><p class=\"p0\" style=\"text-indent:24.0000pt; margin-bottom:0pt; margin-top:0pt; line-height:18.0000pt; \"><span style=\"mso-spacerun:\'yes\'; font-size:12.0000pt; font-family:\'����\'; \">�˲��ڸ��и�ҵ���Ƿ�չ�Ĺؼ�����ѧ���������˲ŵĴ����ʣ�����ܹ�Ƹ���������ʵѧ�Ĵ�ѧ���Ǹ���ҵ�ǳ����ĵ����⡣���Ҳ�������Ĺ��������ܷ����Լ���������Ҳ�ô�ѧ�����գ�����̤�����ĵ�һ�ڿξ�����ְ��˵����ְ�����߿�������&nbsp;���뵽��Ƹ�ᡣ��Ȼ��Ƹ����Ŀǰ�˲Ž�������Ҫ;��֮һ����������ԶԶ����������ʵ������</span><span style=\"mso-spacerun:\'yes\'; font-size:12.0000pt; font-family:\'����\'; \"><o:p></o:p></span></p>',524301,327680,1,1,NULL),(18,'df','�ڴ���������-----------------\r\n,�������޸ĺ����ύ---Thu Jun 13 08:29:14 CST 2013-----------------\r\n,�������޸ĺ����ύ---Thu Jun 13 08:29:39 CST 2013',NULL,327680,0,0,'2013-06-13 08:29:39'),(19,'������Ϣ��','<p class=\"p15\" style=\"margin-bottom:0pt; margin-top:0pt; line-height:125%; \"><span style=\"mso-spacerun:\'yes\'; color:rgb(255,0,0); font-size:12.0000pt; font-family:\'����\'; \">1������������̵ķ�����ϵ���������վ����Ƶ�Ҫ��������������������ơ���ϸ��ơ�����Ͳ��ԣ�</span><span style=\"mso-spacerun:\'yes\'; color:rgb(255,0,0); font-size:12.0000pt; font-family:\'����\'; \"><o:p></o:p></span></p><p class=\"p15\" style=\"margin-bottom:0pt; margin-top:0pt; line-height:125%; \"><span style=\"mso-spacerun:\'yes\'; color:rgb(255,0,0); font-size:12.0000pt; font-family:\'����\'; \">2����XXXΪ�������߽���ϵͳǰ̨���(���������߾������ø߰汾)����SQL&nbsp;Server&nbsp;2005Ϊ���߽���ϵͳ��̨���ݹ���ʹ��ADO����ʵ�����ݿ�����Ӻ�ʹ�ã����ṩһ���������ã���������ǿ��������Ļ���Web�ĵ���������վϵͳ��ƣ�</span><span style=\"mso-spacerun:\'yes\'; color:rgb(255,0,0); font-size:12.0000pt; font-family:\'����\'; \"><o:p></o:p></span></p><p class=\"p15\" style=\"margin-left:-4.9350pt; text-indent:-4.9200pt; margin-left:4.9200pt; margin-bottom:0pt; margin-top:0pt; line-height:125%; \"><span style=\"mso-spacerun:\'yes\'; color:rgb(255,0,0); font-size:12.0000pt; font-family:\'����\'; \">&nbsp;3��Ҫ��ϵͳ���پ��й���Ա����ͨ�û����̼Һ��ο�����Ȩ�ޣ���ͨ�û���ע�ᡢ�����Ϣ���������Ϲ���,����Ա�ܹ����û����ϣ�</span><span style=\"mso-spacerun:\'yes\'; color:rgb(0,0,255); font-size:12.0000pt; font-family:\'����\'; \"><o:p></o:p></span></p><p class=\"p15\" style=\"margin-bottom:0pt; margin-top:0pt; line-height:125%; \"><span style=\"mso-spacerun:\'yes\'; font-size:12.0000pt; font-family:\'����\'; \">4������ṹ���ã��߱�һ���Ŀ�ά���ԺͿɿ��ԣ�</span><span style=\"mso-spacerun:\'yes\'; font-size:12.0000pt; font-family:\'����\'; \"><o:p></o:p></span></p><p class=\"p15\" style=\"margin-bottom:0pt; margin-top:0pt; line-height:125%; \"><span style=\"mso-spacerun:\'yes\'; font-size:12.0000pt; font-family:\'����\'; \">5����������1.5~2���֣���������Ӣ������5000�ֵķ��롣&nbsp;�ο��������ϲ�����8ƪ�������������ϲ�����2ƪ����Ӣ��ժҪԼ300�֣��ؼ���3-5����</span><span style=\"mso-spacerun:\'yes\'; font-size:12.0000pt; font-family:\'����\'; \"><o:p></o:p></span></p>',917504,950272,1,1,NULL),(20,'��Ŀ1','��Ŀ1��Ŀ1��Ŀ1��Ŀ1��Ŀ1��Ŀ1��Ŀ1',983041,983040,1,1,NULL),(21,'��Ŀ2','��Ŀ2��Ŀ2��Ŀ2��Ŀ2��Ŀ2',NULL,983040,1,0,NULL);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `t_id` int(11) NOT NULL,
  `school_number` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `qualification_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`t_id`),
  KEY `FKAA31CBE22B21850E` (`t_id`),
  KEY `FKAA31CBE211291F40` (`qualification_id`),
  KEY `FKAA31CBE2AA0D1094` (`unit_id`),
  CONSTRAINT `FKAA31CBE211291F40` FOREIGN KEY (`qualification_id`) REFERENCES `qualification` (`id`),
  CONSTRAINT `FKAA31CBE22B21850E` FOREIGN KEY (`t_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKAA31CBE2AA0D1094` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (327680,'09907232416','2013-05-26',0,'j3#ewrfqe',NULL,2,6),(425984,NULL,'2013-05-18',1,NULL,NULL,NULL,NULL),(557056,'09907232410','2013-06-08',0,'j3#ewrfqe0',NULL,NULL,NULL),(557057,'09907232411','2013-06-08',0,'j3#ewrfqe1',NULL,NULL,NULL),(557058,'09907232412','2013-06-08',0,'j3#ewrfqe2',NULL,NULL,NULL),(557059,'09907232413','2013-06-08',0,'j3#ewrfqe3',NULL,NULL,NULL),(557060,'09907232414','2013-06-08',0,'j3#ewrfqe4',NULL,NULL,NULL),(557061,'09907232415','2013-06-08',0,'j3#ewrfqe5',NULL,NULL,NULL),(557062,'09907232416','2013-06-08',0,'j3#ewrfqe6',NULL,NULL,NULL),(557063,'09907232417','2013-06-08',0,'j3#ewrfqe7',NULL,NULL,NULL),(557064,'09907232418','2013-06-08',0,'j3#ewrfqe8',NULL,NULL,NULL),(557065,'09907232419','2013-06-08',0,'j3#ewrfqe9',NULL,NULL,NULL),(557066,'099072324110','2013-06-08',0,'j3#ewrfqe10',NULL,NULL,NULL),(557067,'099072324111','2013-06-08',0,'j3#ewrfqe11',NULL,NULL,NULL),(557068,'099072324112','2013-06-08',0,'j3#ewrfqe12',NULL,NULL,NULL),(557069,'099072324113','2013-06-08',0,'j3#ewrfqe13',NULL,NULL,NULL),(557070,'099072324114','2013-06-08',0,'j3#ewrfqe14',NULL,NULL,NULL),(557071,'099072324115','2013-06-08',0,'j3#ewrfqe15',NULL,NULL,NULL),(557072,'099072324116','2013-06-08',0,'j3#ewrfqe16',NULL,NULL,NULL),(557073,'099072324117','2013-06-08',0,'j3#ewrfqe17',NULL,NULL,NULL),(557074,'099072324118','2013-06-08',0,'j3#ewrfqe18',NULL,NULL,NULL),(557075,'099072324119','2013-06-08',0,'j3#ewrfqe19',NULL,NULL,NULL),(557076,'099072324120','2013-06-08',0,'j3#ewrfqe20',NULL,NULL,NULL),(557077,'099072324121','2013-06-08',0,'j3#ewrfqe21',NULL,NULL,NULL),(557078,'099072324122','2013-06-08',0,'j3#ewrfqe22',NULL,NULL,NULL),(557079,'099072324123','2013-06-08',0,'j3#ewrfqe23',NULL,NULL,NULL),(557080,'099072324124','2013-06-08',0,'j3#ewrfqe24',NULL,NULL,NULL),(557081,'099072324125','2013-06-08',0,'j3#ewrfqe25',NULL,NULL,NULL),(557082,'099072324126','2013-06-08',0,'j3#ewrfqe26',NULL,NULL,NULL),(557083,'099072324127','2013-06-08',0,'j3#ewrfqe27',NULL,NULL,NULL),(557084,'099072324128','2013-06-08',0,'j3#ewrfqe28',NULL,NULL,NULL),(557085,'099072324129','2013-06-08',0,'j3#ewrfqe29',NULL,NULL,NULL),(688128,'324234','2013-06-12',NULL,'sdsad',NULL,NULL,NULL),(720896,'',NULL,NULL,'',NULL,NULL,NULL),(753664,'',NULL,NULL,'',NULL,NULL,NULL),(786432,'asdf','2013-06-12',1,'asdf',NULL,NULL,NULL),(950272,'099074114','2013-06-15',0,'j3#4010',NULL,16,14),(983040,'099074222','2013-06-16',0,'j3#4010',NULL,17,15);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thesis`
--

DROP TABLE IF EXISTS `thesis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thesis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `real_file_name` varchar(255) DEFAULT NULL,
  `uuid_file_name` varchar(255) DEFAULT NULL,
  `real_file_path` longtext,
  `submit_date` datetime DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `student_comment` longtext,
  `teacher_comment` longtext,
  PRIMARY KEY (`id`),
  KEY `FK_15a623359b1c4991a4242df5563` (`subject_id`),
  CONSTRAINT `FK_15a623359b1c4991a4242df5563` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thesis`
--

LOCK TABLES `thesis` WRITE;
/*!40000 ALTER TABLE `thesis` DISABLE KEYS */;
INSERT INTO `thesis` VALUES (1,'sd','sd',NULL,'2013-05-26 18:47:50',1,NULL,NULL),(2,'sd','sd',NULL,'2013-05-27 18:47:50',1,NULL,NULL),(3,'sdf','sdf',NULL,'2013-05-28 18:47:50',1,NULL,NULL),(4,'Bs.doc','1d839acd-31e3-45fc-b707-ed31302ea0df_Bs.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\������\\null\\094\\099074016',NULL,2,NULL,' dfasfdf'),(5,'Bs.doc','a212a75e-11f9-47dc-9378-903be01f38de_Bs.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\������\\�����ѧԺ\\094\\099074016',NULL,2,NULL,' OK'),(6,'Bs.doc','cbbad115-b36e-4925-8414-10717c9df74e_Bs.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\������\\�����ѧԺ\\094\\099074016','2013-05-30 01:40:27',2,NULL,' adasdda'),(7,'Bs.doc','3b0499cb-51b5-4e89-b177-66b4e0bb77db_Bs.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\������\\�����ѧԺ\\094\\099074016','2013-05-30 01:47:00',2,'V5\r\nd\r\n\r\nd\r\n\r\nd\r\ndd\r\n',' qwqe'),(8,'Bs.doc','4350858e-4d14-483f-af13-4a4276dee929_Bs.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\������\\�����ѧԺ\\094\\099074016','2013-05-30 01:54:26',2,'v6',' ���Ĳ���'),(9,'Bs.doc','d648fb73-d7d2-438b-81dd-0955462e43ba_Bs.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\������\\�����ѧԺ\\094\\099074016','2013-05-30 01:59:00',2,'v8',' qwe'),(10,'Bs.doc','ff8d2b97-560a-448a-9cfe-386c334e1ca4_Bs.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\������\\�����ѧԺ\\094\\099074016','2013-05-30 02:01:40',2,'v9',' qqȺ'),(11,'Bs.doc','94fe56c6-bf68-4805-a39f-08804868f37e_Bs.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\������\\�����ѧԺ\\094\\099074016','2013-05-30 02:08:02',2,'v9',' qqȺ'),(12,'Bs.doc','e4941eb0-7021-47dc-8d1a-3e56455b631d_Bs.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\������\\�����ѧԺ\\094\\099074016','2013-05-30 03:15:00',9,'V1','  mvzxcvnpodfijvpaofjapofga˶��ķ�˳��v���·��� \r\n\r\n\r\nsadfsadff '),(13,'Bs.doc','b3e54ab9-6a03-4bd4-a919-510d47967218_Bs.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\������\\�����ѧԺ\\094\\099074016','2013-05-30 04:13:57',9,'V8','  OK\r\n\r\ngood'),(14,'Bs - Copy.doc','41d25b59-50ab-49ad-a840-f9ff83cf0271_Bs - Copy.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\���չ�ҵ��ѧ\\�����ѧԺ\\111\\09907232416','2013-05-30 04:55:52',9,NULL,' dfdsfsdfsdfsdf'),(15,'Bs.doc','02cb01da-b671-4a11-b376-9908a3fff10e_Bs.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\������\\�����ѧԺ\\094\\099074016','2013-05-30 09:25:44',9,'qqqqqqqqq',' sdfsdffdf'),(16,'rr.doc','94d8361d-c043-491f-a4d9-ec55b67a3c7a_rr.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\������\\�����ѧԺ\\094\\099074016','2013-06-08 15:55:14',9,'qqqqqqqqq',NULL),(17,'rr.doc','a5dafcdc-c206-416e-b6a5-bb7575171efd_rr.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\������\\�����ѧԺ\\094\\099074016','2013-06-08 16:01:03',9,'zz',NULL),(18,'���Ķ���.docx','fa53d4fc-026b-4d9c-92ec-2298a0f11c38_���Ķ���.docx','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\������\\�����ѧԺ\\094\\099074016','2013-06-08 16:04:37',9,'zxczxcz',NULL),(19,'635060438999687500.doc','4a9855bd-f2b5-46fe-ac11-989e0b0b3638_635060438999687500.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\������\\�����ѧԺ\\094\\099074016','2013-06-08 17:13:09',9,'ttt',NULL),(20,'������.doc','9a34e696-3f6f-498a-91a5-25f742378ca5_������.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\������\\�����ѧԺ\\094\\099074016','2013-06-10 09:07:38',15,'��ҵ���� 1��',NULL),(21,'������.doc','9496da23-c5d4-4d41-b9a2-ad6f0e7c14ed_������.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\������\\�����ѧԺ\\094\\099074016','2013-06-10 09:07:58',15,'��ҵ���� 2��',NULL),(22,'������.doc','e0be63ab-01e5-4c94-babe-c6d3a7e9b6ff_������.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\������\\�����ѧԺ\\094\\099074016','2013-06-10 09:08:15',15,'��ҵ���� 3��',NULL),(23,'������.doc','4b6cd33f-ebfa-4014-a026-b5509bd13db6_������.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\������\\�����ѧԺ\\094\\099074016','2013-06-10 09:18:47',15,'���� 4��',' dasdsad'),(24,'������.doc','17a95cbe-7366-42c9-a59a-32d35f307819_������.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\������\\�����ѧԺ\\094\\099074016','2013-06-10 09:25:45',15,'���� 5��',NULL),(25,'������.doc','4153f9bf-d640-4fe1-aa64-31c9c07aef72_������.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\������\\�����ѧԺ\\094\\099074016','2013-06-10 09:28:28',15,'ss',' asdsad'),(26,'������.doc','9e2ad60b-28e8-4a50-9e35-be60980c066c_������.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\������\\�����ѧԺ\\094\\099074016','2013-06-10 09:30:38',15,'dasd',NULL),(27,'������.doc','58dbe6bb-4ab2-4c5a-a5ea-3bc5966e02d9_������.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\������\\�����ѧԺ\\094\\099074016','2013-06-10 09:32:57',15,'asdf',' OK'),(28,'������.doc','3377e5b1-4978-4bd7-bcc4-516c0f1f1d24_������.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\���չ�ҵ��ѧ\\�����ѧԺ\\111\\09907232416','2013-06-10 17:37:09',2,NULL,'xiugai'),(29,'������.doc','cb62058c-497c-4730-a367-2ebf1a85c08b_������.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\���չ�ҵ��ѧ\\�����ѧԺ\\111\\09907232416','2013-06-10 17:39:35',15,NULL,'�޸ĺ��'),(30,'������ģ��.doc','88c46e24-e8de-4b36-8834-a70722d1d275_������ģ��.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\������\\null\\094\\0990740112','2013-06-13 04:53:24',16,'����1�壬����ʦ�鿴',NULL),(31,'��ʽ�󱾿�����ҵ��ƣ����ģ�׫д�淶ϸ��.doc','d8b98ef6-c140-4b45-85ee-238a9b6d2ed9_��ʽ�󱾿�����ҵ��ƣ����ģ�׫д�淶ϸ��.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\������\\null\\094\\0990740112','2013-06-13 04:53:51',16,'���� 2 ��',' �����ˣ�'),(32,'������.doc','09a59f6b-30cf-4b14-91ec-93a518c5b900_������.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\������\\null\\094\\0990740115','2013-06-13 08:26:46',8,'����',' OK'),(33,'���Ķ���.docx','a5f2680f-07f0-419a-9cde-c5b3356ce93b_���Ķ���.docx','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\null\\null\\null\\099074123','2013-06-15 22:58:00',19,'����1��',' ����'),(34,'�����ѧԺ-���ίԱ��.doc','c41e9876-cfef-4090-9582-3030d364ce80_�����ѧԺ-���ίԱ��.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\null\\null\\null','2013-06-16 08:11:32',20,'����1��',NULL),(35,'���ڼ��Ź�Ԣ���ı�ҵ����У��������.doc','6593e2a1-786d-4e97-905d-bac6c5681c29_���ڼ��Ź�Ԣ���ı�ҵ����У��������.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\null\\null\\null','2013-06-16 08:11:47',20,'����2��',NULL);
/*!40000 ALTER TABLE `thesis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school` varchar(45) DEFAULT NULL,
  `college` varchar(45) DEFAULT NULL,
  `department` varchar(45) DEFAULT NULL,
  `class` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
INSERT INTO `unit` VALUES (1,'���չ�ҵ��ѧ','�����ѧԺ','�������ѧ�뼼��','094'),(2,'���չ�ҵ��ѧ','�����ѧԺ','�������','111'),(5,'shut',NULL,'com','094'),(6,'shut',NULL,'com','094'),(7,'shut',NULL,'com','094'),(8,'������','�����ѧԺ','�������ѧ','094'),(9,'������',NULL,'�����','094'),(10,'shut',NULL,'com','094'),(11,'������',NULL,'�����','094'),(12,NULL,NULL,'����',NULL),(13,NULL,NULL,'����',NULL),(14,NULL,NULL,'����',NULL),(15,NULL,NULL,'����',NULL),(16,NULL,NULL,'�����ѧԺ',NULL),(17,NULL,NULL,'����',NULL),(18,NULL,NULL,'����',NULL);
/*!40000 ALTER TABLE `unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `super_admin` bit(1) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_5e8cfa5a6aff4a128bf88197eda` (`group_id`),
  CONSTRAINT `FK_5e8cfa5a6aff4a128bf88197eda` FOREIGN KEY (`group_id`) REFERENCES `answer_group` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (32768,2,'�õ�','byx0','ICy5YqxZB1uWSwcVLSNLcA==','','',' ',NULL,88),(65536,2,'jess','byx1','ICy5YqxZB1uWSwcVLSNLcA==',NULL,NULL,NULL,NULL,88),(98304,2,'jess','byx2','ICy5YqxZB1uWSwcVLSNLcA==',NULL,NULL,NULL,NULL,86),(131072,2,'jess','byx3','ICy5YqxZB1uWSwcVLSNLcA==',NULL,NULL,NULL,NULL,90),(163840,2,'jess','byx4','ICy5YqxZB1uWSwcVLSNLcA==',NULL,NULL,NULL,NULL,87),(196608,2,'������','byx','ICy5YqxZB1uWSwcVLSNLcA==','baoyx007@gmail.com','','��ã���ã������ã���� ',NULL,90),(262144,1,'������','admin','ICy5YqxZB1uWSwcVLSNLcA==','bad@sedf.cd',NULL,'hhhhhhhhhhhhhhhhhhh','',NULL),(327680,3,'������','chu','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,'��Һã����Ǵ�����',NULL,90),(360448,2,'���·���','qwe','ICy5YqxZB1uWSwcVLSNLcA==','123@ahut.edu','123','���Ĺ�˾�¸¸·����ط�',NULL,88),(393216,1,'����','asd','ICy5YqxZB1uWSwcVLSNLcA==','123@ahut.edu','124314343','�ķ����÷��ɲ��͹�����','\0',NULL),(425984,3,'��','123','ICy5YqxZB1uWSwcVLSNLcA==','123@ahut.edu','234235','˵�ĸ��ķ�����˭���������',NULL,NULL),(458752,2,'jess','byx5','ICy5YqxZB1uWSwcVLSNLcA==',NULL,NULL,NULL,NULL,85),(524288,2,'������0','byx0','ICy5YqxZB1uWSwcVLSNLcA==','baoyx000@gmail.com',NULL,NULL,NULL,87),(524289,2,'������1','byx1','ICy5YqxZB1uWSwcVLSNLcA==','baoyx001@gmail.com',NULL,NULL,NULL,89),(524290,2,'������2','byx2','ICy5YqxZB1uWSwcVLSNLcA==','baoyx002@gmail.com',NULL,NULL,NULL,87),(524291,2,'������3','byx3','ICy5YqxZB1uWSwcVLSNLcA==','baoyx003@gmail.com',NULL,NULL,NULL,87),(524292,2,'������4','byx4','ICy5YqxZB1uWSwcVLSNLcA==','baoyx004@gmail.com',NULL,NULL,NULL,88),(524293,2,'������5','byx5','ICy5YqxZB1uWSwcVLSNLcA==','baoyx005@gmail.com',NULL,NULL,NULL,85),(524294,2,'������6','byx6','ICy5YqxZB1uWSwcVLSNLcA==','baoyx006@gmail.com',NULL,NULL,NULL,85),(524295,2,'������7','byx7','ICy5YqxZB1uWSwcVLSNLcA==','baoyx007@gmail.com',NULL,NULL,NULL,88),(524296,2,'������8','byx8','ICy5YqxZB1uWSwcVLSNLcA==','baoyx008@gmail.com',NULL,NULL,NULL,90),(524297,2,'������9','byx9','ICy5YqxZB1uWSwcVLSNLcA==','baoyx009@gmail.com',NULL,NULL,NULL,89),(524298,2,'������10','byx10','ICy5YqxZB1uWSwcVLSNLcA==','baoyx0010@gmail.com',NULL,NULL,NULL,86),(524299,2,'������11','byx11','ICy5YqxZB1uWSwcVLSNLcA==','baoyx0011@gmail.com',NULL,NULL,NULL,86),(524300,2,'������12','byx12','ICy5YqxZB1uWSwcVLSNLcA==','baoyx0012@gmail.com',NULL,NULL,NULL,87),(524301,2,'������13','byx13','ICy5YqxZB1uWSwcVLSNLcA==','baoyx0013@gmail.com',NULL,NULL,NULL,87),(524302,2,'������14','byx14','ICy5YqxZB1uWSwcVLSNLcA==','baoyx0014@gmail.com',NULL,NULL,NULL,86),(524303,2,'������15','byx15','ICy5YqxZB1uWSwcVLSNLcA==','baoyx0015@gmail.com',NULL,NULL,NULL,89),(524304,2,'������16','byx16','ICy5YqxZB1uWSwcVLSNLcA==','baoyx0016@gmail.com',NULL,NULL,NULL,85),(524305,2,'������17','byx17','ICy5YqxZB1uWSwcVLSNLcA==','baoyx0017@gmail.com',NULL,NULL,NULL,89),(524306,2,'������18','byx18','ICy5YqxZB1uWSwcVLSNLcA==','baoyx0018@gmail.com',NULL,NULL,NULL,86),(524307,2,'������19','byx19','ICy5YqxZB1uWSwcVLSNLcA==','baoyx0019@gmail.com',NULL,NULL,NULL,89),(524308,2,'������20','byx20','ICy5YqxZB1uWSwcVLSNLcA==','baoyx0020@gmail.com',NULL,NULL,NULL,90),(524309,2,'������21','byx21','ICy5YqxZB1uWSwcVLSNLcA==','baoyx0021@gmail.com',NULL,NULL,NULL,88),(524310,2,'������22','byx22','ICy5YqxZB1uWSwcVLSNLcA==','baoyx0022@gmail.com',NULL,NULL,NULL,90),(524311,2,'������23','byx23','ICy5YqxZB1uWSwcVLSNLcA==','baoyx0023@gmail.com',NULL,NULL,NULL,85),(524312,2,'������24','byx24','ICy5YqxZB1uWSwcVLSNLcA==','baoyx0024@gmail.com',NULL,NULL,NULL,90),(524313,2,'������25','byx25','ICy5YqxZB1uWSwcVLSNLcA==','baoyx0025@gmail.com',NULL,NULL,NULL,86),(524314,2,'������26','byx26','ICy5YqxZB1uWSwcVLSNLcA==','baoyx0026@gmail.com',NULL,NULL,NULL,89),(524315,2,'������27','byx27','ICy5YqxZB1uWSwcVLSNLcA==','baoyx0027@gmail.com',NULL,NULL,NULL,87),(524316,2,'������28','byx28','ICy5YqxZB1uWSwcVLSNLcA==','baoyx0028@gmail.com',NULL,NULL,NULL,85),(524317,2,'������29','byx29','ICy5YqxZB1uWSwcVLSNLcA==','baoyx0029@gmail.com',NULL,NULL,NULL,88),(557056,3,'������0','chu0','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557057,3,'������1','chu1','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557058,3,'������2','chu2','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557059,3,'������3','chu3','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557060,3,'������4','chu4','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557061,3,'������5','chu5','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557062,3,'������6','chu6','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557063,3,'������7','chu7','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557064,3,'������8','chu8','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557065,3,'������9','chu9','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557066,3,'������10','chu10','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557067,3,'������11','chu11','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557068,3,'������12','chu12','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557069,3,'������13','chu13','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557070,3,'������14','chu14','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557071,3,'������15','chu15','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557072,3,'������16','chu16','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557073,3,'������17','chu17','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557074,3,'������18','chu18','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557075,3,'������19','chu19','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557076,3,'������20','chu20','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557077,3,'������21','chu21','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,'��Һã����Ǵ�����',NULL,NULL),(557078,3,'������22','chu22','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557079,3,'������23','chu23','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557080,3,'������24','chu24','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557081,3,'������25','chu25','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557082,3,'������26','chu26','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,89),(557083,3,'������27','chu27','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557084,3,'������28','chu28','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557085,3,'������29','chu29','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(589824,2,'���ķ��㷨',NULL,'asd',NULL,'asd',' SDFSDF     ',NULL,89),(688128,3,'����',NULL,'123','sadf@QW','123',' sdfd',NULL,NULL),(720896,3,'����',NULL,'123','sdf@ew','1234',' sdf',NULL,NULL),(753664,3,'����',NULL,'123','ad@qwe','`213',' 123',NULL,NULL),(786432,3,'�ķ���',NULL,'123','asd@qwe','213',' asdf',NULL,NULL),(819200,1,'��','asd343','123','qwe@wq','qwe',' wqe','\0',NULL),(851968,2,'��','qwe221','123','','',' ��',NULL,90),(917504,2,'������','lrl','tGM5dP5NORebJxvRkvzSlQ==','sd@qwc.c','123',' ��Һã����Ƕ���',NULL,86),(950272,3,'���ľ�','wwj','QrMweHAZgcMgvbjn70qtsw==','sdf@qwe','123','  ��Һã�������������������Ҵ�һ�����࣡',NULL,86),(983040,3,'����־','hhz','zOccMhmI5Xx1Mz0LFmGTNQ==','ss@ww.dd','22',' ���',NULL,85),(983041,2,'����','ppp','8n9vHHxcv04+GS4KR7hTAA==','dd@q','1234',' ',NULL,85);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-06-19 15:50:46
