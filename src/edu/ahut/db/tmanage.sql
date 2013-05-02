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
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager` (
  `id` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` enum('MALE','FEMALE') DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `photo` blob,
  `comment` text,
  `role` enum('SUPER','NORMAL') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES ('0e45a5be-3e33-47f6-8df0-9cfc6045da09','������','2013-04-03','FEMALE','eBVpbsvxyW5olLd5RW0zDg==','asd',NULL,NULL,NULL,NULL,NULL,NULL),('1','123',NULL,NULL,'123',NULL,NULL,NULL,NULL,NULL,NULL,'SUPER'),('9b13e06f-967a-406e-a0d7-5b016649b2d7','�õ�','2013-04-18','FEMALE','dtgCJGEfyRml1U8P+fukRg==','qwe',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `id` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` enum('MALE','FEMALE') DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `photo` blob,
  `comment` text,
  `college` varchar(45) DEFAULT NULL,
  `major` varchar(45) DEFAULT NULL,
  `stuClass` varchar(45) DEFAULT NULL,
  `degree` varchar(45) DEFAULT NULL,
  `courseYear` year(4) DEFAULT NULL,
  `enterYear` year(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('1','������',NULL,'MALE','ICy5YqxZB1uWSwcVLSNLcA==','byx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('2','sdfasdf',NULL,'FEMALE','ICy5YqxZB1uWSwcVLSNLcA==','zxc',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `id` varchar(45) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `description` text,
  `sid` varchar(45) DEFAULT NULL,
  `tid` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sid_FK_idx` (`sid`),
  KEY `tid_FK_idx` (`tid`),
  CONSTRAINT `sid_FK` FOREIGN KEY (`sid`) REFERENCES `student` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tid_FK` FOREIGN KEY (`tid`) REFERENCES `teacher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES ('1','��ҵ��ƹ���ϵͳ','������','1','1'),('2','����˰��','sdsdsdsds���Ĺ��¸�','1','2'),('89941ebe-4dfc-4b9f-9f47-ba82d8bee447','sdfsdfasdf','��̺�ɨ���˽����ڶ��ֽ������ݣ������ٿ�ɱ��\r\n���������᣺���������ں������һս|�Ʊ��ֳ���ս����ο������\r\n������2�μ������汻�������|�׼�-���գ����������ڲ�ֵ�ö�н\r\n���˽��꼾�����عˣ���������սȫ��|�°����᣺���˶�����õ�\r\n����ɭ�����Ǵ�δ�л�ѧ��Ӧ|ħ�ޣ�����������һ���Ѳ�����ج��\r\n4-0���Ȼ��ɨ��¹�����ڶ��ֿ������˾ܾ�����ɨ\r\n�þò�������Ͻ��մ�����̳���||���������ܲɷã��Ժ���˵\r\n�Ȼ�����ͷ����״κ�ɨ���ֽ���|ղķ˹���ҵĶ���רΪ����������\r\nħ��ʦ���������������ˣ��ÿ���|����ά�棺�ͺ��˵�ϵ��������ƽ\r\n Τ�£���ʵ�����ں��ۣ�|������գ��������ǽ�����˸�����','1','1');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `id` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` enum('MALE','FEMALE') DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `photo` blob,
  `comment` text,
  `college` varchar(45) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `faculty` varchar(45) DEFAULT NULL,
  `enterYear` year(4) DEFAULT NULL,
  `degree` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES ('1','������',NULL,'MALE','ICy5YqxZB1uWSwcVLSNLcA==','chu',NULL,NULL,NULL,NULL,NULL,NULL,'������',NULL,NULL,NULL),('2','��ѧ��',NULL,'MALE','ICy5YqxZB1uWSwcVLSNLcA==','chen',NULL,NULL,NULL,NULL,NULL,NULL,'������',NULL,NULL,NULL);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thesis`
--

DROP TABLE IF EXISTS `thesis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thesis` (
  `id` varchar(45) NOT NULL,
  `real_file_name` varchar(45) DEFAULT NULL,
  `uuid_file_name` varchar(80) DEFAULT NULL,
  `submit_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `stu_comment` text,
  `tea_comment` text,
  `subject_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject_id_FK_idx` (`subject_id`),
  CONSTRAINT `subject_id_FK` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='id,real_file_name,uuid_file_name,submit_date,stu_comment,subject_id,tea_comment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thesis`
--

LOCK TABLES `thesis` WRITE;
/*!40000 ALTER TABLE `thesis` DISABLE KEYS */;
INSERT INTO `thesis` VALUES ('2b344a24-71ae-4a72-a4e2-45038be4735c','testThesis.doc','fb6bd6e1-8267-48f3-8fad-a86f8a5f1481_testThesis.doc','2013-05-02 16:04:37','dfvasdfafvadsfsdf',NULL,'1'),('a89082e0-ddb9-4bec-bb28-9aa9e0ec3e46','sd','sd','2013-05-02 15:39:06','sd',NULL,'2'),('dde80c20-cc7b-4056-9b49-963b615c4f4d','testThesis.doc','38da5a5f-27f5-4b07-831a-06f8296684c1_testThesis.doc','2013-04-28 16:00:00','qq',NULL,'89941ebe-4dfc-4b9f-9f47-ba82d8bee447'),('f944c0f6-e830-46e1-b30a-24b38cc9caca','testThesis.doc','22e893b4-bbd3-4343-842d-61a2c35bfa44_testThesis.doc','2013-04-28 16:00:00','haha',NULL,'1');
/*!40000 ALTER TABLE `thesis` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-05-03  0:10:01
