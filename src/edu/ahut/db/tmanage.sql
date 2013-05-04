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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `comment` text,
  `role` enum('SUPER','STUDENT','TEACHER','MANAGER') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('0e45a5be-3e33-47f6-8df0-9cfc6045da09','������','ICy5YqxZB1uWSwcVLSNLcA==','asd',NULL,NULL,NULL,NULL),('1','123','ICy5YqxZB1uWSwcVLSNLcA==','123','123@ww.cc','1234456','test','SUPER'),('9b13e06f-967a-406e-a0d7-5b016649b2d7','�õ�','ICy5YqxZB1uWSwcVLSNLcA==','qwe',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
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
  `Duration` int(11) DEFAULT NULL,
  `start_time` year(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qualification`
--

LOCK TABLES `qualification` WRITE;
/*!40000 ALTER TABLE `qualification` DISABLE KEYS */;
INSERT INTO `qualification` VALUES (1,'������','��ѧѧʿ',4,2009),(2,'�廪','��ʿ',4,2000);
/*!40000 ALTER TABLE `qualification` ENABLE KEYS */;
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
  `student_id` varchar(45) DEFAULT NULL,
  `teacher_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sid_FK_idx` (`student_id`),
  KEY `tid_FK_idx` (`teacher_id`),
  CONSTRAINT `fk_student_id` FOREIGN KEY (`student_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES ('1','��ҵ��ƹ���ϵͳ','������','1','3'),('2','����˰��','sdsdsdsds���Ĺ��¸�','2','4'),('89941ebe-4dfc-4b9f-9f47-ba82d8bee447','sdfsdfasdf','��̺�ɨ���˽����ڶ��ֽ������ݣ������ٿ�ɱ��\r\n���������᣺���������ں������һս|�Ʊ��ֳ���ս����ο������\r\n������2�μ������汻�������|�׼�-���գ����������ڲ�ֵ�ö�н\r\n���˽��꼾�����عˣ���������սȫ��|�°����᣺���˶�����õ�\r\n����ɭ�����Ǵ�δ�л�ѧ��Ӧ|ħ�ޣ�����������һ���Ѳ�����ج��\r\n4-0���Ȼ��ɨ��¹�����ڶ��ֿ������˾ܾ�����ɨ\r\n�þò�������Ͻ��մ�����̳���||���������ܲɷã��Ժ���˵\r\n�Ȼ�����ͷ����״κ�ɨ���ֽ���|ղķ˹���ҵĶ���רΪ����������\r\nħ��ʦ���������������ˣ��ÿ���|����ά�棺�ͺ��˵�ϵ��������ƽ\r\n Τ�£���ʵ�����ں��ۣ�|������գ��������ǽ�����˸�����','1','3');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
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
INSERT INTO `thesis` VALUES ('3db22eb2-76a9-4a7d-a8cf-4187f781362b','testThesis.doc','c13b4a39-d18e-4f36-9a90-573173e50d71_testThesis.doc','2013-05-03 13:29:07','v3',NULL,'1'),('9dad4a80-b71c-4511-93b4-225f37492e93','testThesis.doc','d7c2f166-dfc3-4409-b368-5a3f1643af63_testThesis.doc','2013-05-03 13:29:00','v2',NULL,'1'),('b3673860-fc1a-4cb1-bd58-12bd560b65cd','testThesis.doc','cdc4ef5a-2e3e-4b71-ada5-bdc8f0841373_testThesis.doc','2013-05-03 13:28:52','v1','����Ŭ��','1');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
INSERT INTO `unit` VALUES (1,'���չ�ҵ��ѧ','�����ѧԺ','�������ѧ�뼼��','094'),(2,'���չ�ҵ��ѧ','�����ѧԺ','�������','111');
/*!40000 ALTER TABLE `unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` enum('MALE','FEMALE') DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `photo` varchar(80) DEFAULT NULL,
  `comment` text,
  `title` varchar(45) DEFAULT NULL COMMENT '副教授，学生',
  `role` enum('STUDENT','TEACHER') DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `qualification_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_unit_id_idx` (`unit_id`),
  KEY `fk_qualif_id_idx` (`qualification_id`),
  CONSTRAINT `fk_unit_id` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_qualif_id` FOREIGN KEY (`qualification_id`) REFERENCES `qualification` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('1','������','1991-12-08','MALE','ICy5YqxZB1uWSwcVLSNLcA==','byx','baoyx007@gmail.com','110','j3#4010',NULL,'hah','ѧ��','STUDENT',1,1),('2','sdfasdf',NULL,'FEMALE','ICy5YqxZB1uWSwcVLSNLcA==','zxc',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('3','������',NULL,'MALE','ICy5YqxZB1uWSwcVLSNLcA==','chu',NULL,NULL,NULL,NULL,'��ʦ','������','TEACHER',2,1),('4','��ѧ��',NULL,'MALE','ICy5YqxZB1uWSwcVLSNLcA==','chen',NULL,NULL,NULL,NULL,NULL,'������','TEACHER',2,2);
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

-- Dump completed on 2013-05-05  0:19:45
