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
INSERT INTO `bulletin` VALUES (6,'sdsdsd','2013-05-25 20:04:54','sdfsadfafasf',NULL,262144),(7,'sdsdsd','2013-05-25 20:04:58','sdfsadfafasf',NULL,262144),(8,'sdsdsd','2013-05-25 20:04:58','sdfsadfafasf',NULL,262144),(9,'sdsdsd','2013-05-25 20:04:58','sdfsadfafasf',NULL,262144),(10,'sdsdsd','2013-05-25 20:04:58','sdfsadfafasf',NULL,262144),(11,'sdsdsd','2013-05-25 20:04:58','sdfsadfafasf',NULL,262144),(12,'sdsdsd','2013-05-25 20:04:58','sdfsadfafasf',NULL,262144),(13,'sdsdsd','2013-05-25 20:04:58','sdfsadfafasf',NULL,262144),(14,'sdsdsd','2013-05-25 20:04:58','sdfsadfafasf',NULL,262144),(15,'sdsdsd','2013-05-25 20:04:58','sdfsadfafasf',NULL,262144),(16,'sdf','2013-05-26 03:01:00','<p>在此输入内容</p>\r\n',NULL,262144),(17,'sadf','2013-05-28 05:27:00','<p>在此输入内容</p>\r\n',NULL,262144),(18,'qqq','2013-06-02 17:54:01','美洲八国领导人赴特多与习近平会晤美洲八国领导人赴特多与习近平会晤',NULL,262144),(19,'q','2013-06-03 16:38:01','在此输入内容',NULL,262144),(20,'美洲八国总统(总理)赴特多与习近平会晤','2013-06-03 16:38:48','<p style=\"color: rgb(0, 0, 0); font-family: 宋体; font-size: 14px; line-height: 28px;\"><strong>　加强双边合作，推动中加关系发展</strong></p><p style=\"color: rgb(0, 0, 0); font-family: 宋体; font-size: 14px; line-height: 28px;\">　　新华网西班牙港6月2日电（记者吴黎明　陈贽）国家主席习近平1日和2日在特立尼达和多巴哥首都西班牙港分别会见<strong>圭亚那总统</strong>拉莫塔尔、<strong>安提瓜和巴布达总理</strong>斯潘塞、<strong>多米尼克总理</strong>斯凯里特、<strong>格林纳达总理</strong>米切尔、<strong>巴哈马总理</strong>克里斯蒂、<strong>牙买加总理</strong>辛普森－米勒，同他们就加强双边友好合作及中国同加勒比地区整体关系交换意见。</p><p align=\"center\" style=\"color: rgb(0, 0, 0); font-family: 宋体; font-size: 14px; line-height: 28px;\"></p><center style=\"color: rgb(0, 0, 0); font-family: 宋体; font-size: 14px; line-height: 28px;\"><img id=\"1939976\" title=\"\" border=\"0\" align=\"center\" src=\"http://focus.scol.com.cn/gjyw/img/attachement/jpg/site2/20130603/002564aaaa321316589855.jpg\" sourcename=\"本地文件\" sourcedescription=\"编辑提供的本地文件\" style=\"margin: 0px; padding: 0px;\"></center><div align=\"left\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0); font-family: 宋体; font-size: 14px; line-height: 28px;\">&nbsp;&nbsp;&nbsp;&nbsp;<font face=\"楷体\">6月2日，国家主席习近平在特立尼达和多巴哥首都西班牙港会见圭亚那总统拉莫塔尔。 新华社记者 饶爱民 摄</font>&nbsp;&nbsp;&nbsp;</div><p style=\"color: rgb(0, 0, 0); font-family: 宋体; font-size: 14px; line-height: 28px;\"></p><div align=\"left\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0); font-family: 宋体; font-size: 14px; line-height: 28px;\">　　在会见拉莫塔尔时，习近平表示，圭亚那是第一个同中国建交的英语加勒比国家，两国关系基础很好。中方愿同圭方继续加强政府、议会、政党交流合作，深化基础设施建设、铝矾土开发、农林渔等领域合作，落实好圭方机场、电子政务、水电站等项目。双方在国际体系变革、气候变化等问题上有广泛共同利益，要在多边场合密切配合。</div><p style=\"color: rgb(0, 0, 0); font-family: 宋体; font-size: 14px; line-height: 28px;\">　　拉莫塔尔表示，圭中两国长期友好交往，相互支持。圭亚那高度评价中国的发展，赞赏中国为维护世界和平、帮助发展中国家作出的重要贡献。圭方希望同中方加强交流合作，提升本国发展水平。</p><p style=\"color: rgb(0, 0, 0); font-family: 宋体; font-size: 14px; line-height: 28px;\">　　在会见斯潘塞时，习近平表示，安提瓜和巴布达是中国在加勒比地区重要合作伙伴。中方感谢安方在涉及中国重大核心利益问题上给予的宝贵支持。中方重视安方提出的民生、旅游等领域合作设想，愿同安方在环保和生态文明建设方面交流互鉴。今年是两国建交30周年，希望双方以此为契机，将友好合作推向更高水平。安方将轮值第六十八届联合国大会主席，中方愿同安方加强协调和配合。</p><p style=\"color: rgb(0, 0, 0); font-family: 宋体; font-size: 14px; line-height: 28px;\">　　斯潘塞表示，安巴感谢中国一向本着和平共处五项原则同安巴发展关系，向安方提供了宝贵支持，希望加强两国经贸、人文、多边等领域合作。安巴祝愿中国梦早日实现，相信中国发展将给安巴及加勒比国家带来共同发展机遇。</p><p style=\"color: rgb(0, 0, 0); font-family: 宋体; font-size: 14px; line-height: 28px;\">　　在会见斯凯里特时，习近平指出，多米尼克是中国的好朋友、好伙伴，两国在民生等领域开展了有益合作。双方要继续开展农业、医疗等领域技术转让和经验共享，做实做细经济技术合作，探索开发清洁能源，共同应对气候变化，扩大人员往来，加强人力资源培训合作。</p><p style=\"color: rgb(0, 0, 0); font-family: 宋体; font-size: 14px; line-height: 28px;\">　　斯凯里特感谢中方给予多米尼克的帮助，希望加强交通基础设施建设、教育、医疗等民生领域合作。多方赞赏中方在气候变化问题上的立场，特别是支持和帮助小岛屿国，愿同中方相互支持，加强合作。</p><p style=\"color: rgb(0, 0, 0); font-family: 宋体; font-size: 14px; line-height: 28px;\">　　在会见米切尔时，习近平赞赏格林纳达在涉及中国核心利益问题上支持中方。8年来，中格关系发展顺利。双方要着眼未来、继续努力，推动两国关系长期健康稳定发展。双方要保持高层交往，巩固政治互信，加强基础设施建设、农业、人力资源、教育、文化、旅游等领域合作。</p><p style=\"color: rgb(0, 0, 0); font-family: 宋体; font-size: 14px; line-height: 28px;\">　　米切尔表示，两国合作富有成果。当前，两国关系面临良好机遇。格方希望继续本着相互尊重的原则同中方加强友谊纽带，推进友好合作关系。</p>',NULL,262144),(21,'2013年6月4日0:43:04','2013-06-03 16:43:11','在此输入内容',NULL,262144),(22,'2013年6月4日0:43:29 chang','2013-06-12 05:44:28','在此输入内容',NULL,262144),(23,'明天答辩','2013-06-15 15:06:22','明天8:00 开始答辩！！',NULL,262144),(24,'答辩组信息','2013-06-15 15:06:51','第一组：<div><blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\"><div>鲍勇翔</div><div>钱磊</div><div>代静静</div></blockquote></div>',NULL,262144);
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
INSERT INTO `journal` VALUES (1,'sdfsdfsd','2013-05-31 16:28:07','2013-05-31 16:28:07','dsfasfsdf','sdfasfasdfasdf',196608,557077),(2,'sdfsdfsd','2013-05-31 16:28:32','2013-05-31 16:28:32','2',NULL,196608,NULL),(3,'巴克利：马刺能够横扫热火','2013-06-09 01:03:13','2013-06-10 18:11:52','<div class=\"voice-photoVideo\" style=\"margin: 0px 0px 10px; padding: 0px; min-height: 1%; color: rgb(68, 68, 68); font-family: \'lucida grande\', tahoma, verdana, arial, 宋体, sans-serif; font-size: 12px; line-height: 14px; background-color: rgb(255, 255, 254);\"><div class=\"voice-photo\" style=\"margin: 0px; padding: 0px;\"><div class=\"small-img\" style=\"margin: 0px; padding: 0px; float: none; position: static; text-align: center;\"><img class=\"pic\" src=\"http://c1.hoopchina.com.cn/uploads/star/event/images/130608/bmiddle-86930586ea080e28575d2fe4f577e665a8bab1f1.jpg\" width=\"450\" height=\"305\" style=\"border-style: none; vertical-align: top; cursor: auto;\"></div></div></div><div class=\"voice-text\" style=\"margin: 0px 0px 10px; padding: 0px; font-size: 14px; line-height: 25px; text-indent: 2em; color: rgb(68, 68, 68); font-family: \'lucida grande\', tahoma, verdana, arial, 宋体, sans-serif; background-color: rgb(255, 255, 254);\"><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px;\">今天早上，TNT评述员查尔斯-巴克利在一档脱口秀节目中谈到了总决赛的话题。</p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px;\">今年的总决赛，巴克利看好马刺夺冠，“我认为马刺6场内夺冠，我不认为热火可以从圣安东尼奥走出来。我真的想说一些愚蠢的话，老实跟你说，我认为马刺能够横扫热火。”</p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px;\">巴克利表示，虽然热火在东部决赛抢七大战中胜出，但实质上他们已经被步行者搞得半死，让“希伯特看起来就像张伯伦”，“马刺不会在一场比赛里出现15次失误，再说，帕克是联盟最好的控卫。”</p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px;\">巴克利认为，我们还没有看到最好的马刺，“有一件事应该会让热火害怕，那就是马刺没打好，马刺昨晚表现不好。我觉得他们的进攻生锈了。”</p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px;\">“他们会严防勒布朗，勒布朗昨晚打出了怪物般的表现，但马刺不会让他主宰比赛的。我觉得马刺能够横扫他们，但我真的不认为他们会走出圣安东尼奥。”</p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px;\">此外，巴克利还评价了韦德，他认为韦德油箱里的油所剩不多，他已经在走下坡路。</p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px;\">巴克利也提到了罗德曼早些时候的那番言论，罗德曼称，詹姆斯在90年代充其量是个平均水准的球员。他不同意这种说法。</p></div>','funny!',196608,327680),(4,'周志一','2013-06-15 23:04:41','2013-06-15 23:05:44','周志周志周志周志周志周志周志周志周志周志周志周志周志周志周志周志周志周志周志','无聊',917504,950272);
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
INSERT INTO `mail` VALUES (1,65536,32768,'haha','dsfsdfsdfsdfsd',NULL,0),(2,196608,425984,'你好','<p>三大发生发生法撒的</p>\r\n',NULL,0),(3,425984,196608,'nihaoa','adsfasfsdf','2013-05-26 03:58:36',1),(4,425984,196608,'nihaoa','adsfasfsdf','2013-05-26 03:58:36',1),(5,425984,196608,'nihaoa','adsfasfsdf','2013-05-26 03:58:36',1),(6,196608,327680,'nihaoa','adsfasfsdf','2013-05-26 03:58:36',1),(7,196608,327680,'qqqq','<p>sdfsfsdadfsdfsdf</p>\r\n','2013-05-30 09:26:15',1),(8,196608,196608,'nihao','dd','2013-06-13 00:34:00',1),(9,196608,196608,'dd','d','2013-06-13 00:36:05',1),(10,196608,327680,'asdsad','sadasddasdasdasd','2013-06-13 01:09:18',1),(11,262144,327680,'dd','qqq','2013-06-13 01:17:54',1),(12,327680,196608,'qq','qqqqqqqqqqqsqsqsqsq\r\nsq\r\nqsqsq\r\ns','2013-06-13 01:53:56',1),(13,262144,262144,'dd','dd','2013-06-13 02:00:34',1),(14,NULL,262144,'sdf','adfasdfd','2013-06-13 02:13:54',1),(15,196608,327680,'你好啊','你好啊','2013-06-13 06:22:00',1),(16,262144,NULL,'欢迎使用','欢迎使用','2013-06-15 21:58:12',0),(17,262144,950272,'欢迎使用','欢迎使用毕业设计管理系统','2013-06-15 22:44:17',1),(18,917504,950272,'老师你好','老师你好','2013-06-15 23:05:08',1),(19,950272,917504,'你好','你好','2013-06-15 23:05:32',1),(20,NULL,262144,'haha','asdasd','2013-06-15 23:18:03',1);
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
INSERT INTO `qualification` VALUES (3,'dddd','sdds',0,113),(4,'dddd','sdds',0,2013),(5,'dddd','sdds',0,2013),(6,'安工大','学士',4,2013),(7,'安工大','学士',0,2013),(8,'dddd','sdds',0,2013),(9,'安工大','学士',0,2013),(10,NULL,'博士',0,0),(11,NULL,'博士',0,0),(12,NULL,'博士',0,0),(13,NULL,'博士',0,0),(14,NULL,'博士',0,0),(15,NULL,'博士',0,0),(16,NULL,'博士',0,0);
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
INSERT INTO `subject` VALUES (1,'tt','tt-----------------\r\n,请重新修改后在提交---Wed Jun 12 13:56:26 CST 2013-----------------\r\n,请重新修改后在提交---Thu Jun 13 01:11:42 CST 2013-----------------\r\n,请重新修改后在提交---Thu Jun 13 01:11:58 CST 2013-----------------\r\n,请重新修改后在提交---Thu Jun 13 01:12:04 CST 2013-----------------\r\n,请重新修改后在提交---Thu Jun 13 01:12:07 CST 2013-----------------\r\n,请重新修改后在提交---Thu Jun 13 08:29:36 CST 2013',196608,557064,0,0,'2013-06-13 08:29:37'),(2,'test','所得税的发生的水电费',32768,327680,1,1,'2013-05-31 14:06:20'),(3,'ttt','ttt-----------------\r\n,请重新修改后在提交---Wed Jun 12 13:56:29 CST 2013-----------------\r\n,请重新修改后在提交---Thu Jun 13 08:29:31 CST 2013-----------------\r\n,请重新修改后在提交---Thu Jun 13 08:29:40 CST 2013',196608,557065,0,0,'2013-06-13 08:29:40'),(4,'haha','null-----------------\r\n,请重新修改后在提交-----------------\r\n,请重新修改后在提交-----------------\r\n,请重新修改后在提交-----------------\r\n,请重新修改后在提交-----------------\r\n,请重新修改后在提交-----------------\r\n,请重新修改后在提交-----------------\r\n,请重新修改后在提交-----------------\r\n,请重新修改后在提交-----------------\r\n,请重新修改后在提交---Sun Jun 02 00:52:50 CST 2013-----------------\r\n,请重新修改后在提交---Sun Jun 02 00:52:53 CST 2013-----------------\r\n,请重新修改后在提交---Sun Jun 02 00:53:00 CST 2013-----------------\r\n,请重新修改后在提交---Sun Jun 02 00:53:02 CST 2013-----------------\r\n,请重新修改后在提交---Sun Jun 02 00:53:05 CST 2013-----------------\r\n,请重新修改后在提交---Sun Jun 02 00:53:09 CST 2013-----------------\r\n,请重新修改后在提交---Sun Jun 02 00:53:12 CST 2013-----------------\r\n,请重新修改后在提交---Sun Jun 02 00:53:18 CST 2013-----------------\r\n,请重新修改后在提交---Sun Jun 02 00:53:22 CST 2013-----------------\r\n,请重新修改后在提交---Sun Jun 02 00:53:26 CST 2013-----------------\r\n,请重新修改后在提交---Sun Jun 02 00:53:30 CST 2013-----------------\r\n,请重新修改后在提交---Sun Jun 02 00:53:34 CST 2013',131072,557078,1,0,'2013-06-02 00:53:35'),(6,'t3','t4-----------------\r\n,请重新修改后在提交---Wed Jun 12 13:56:30 CST 2013-----------------\r\n,请重新修改后在提交---Thu Jun 13 08:29:32 CST 2013-----------------\r\n,请重新修改后在提交---Thu Jun 13 08:29:42 CST 2013',196608,557066,0,0,'2013-06-13 08:29:43'),(7,'tt4','t4',NULL,557081,1,0,NULL),(8,'tt7','null-----------------\r\n,请重新修改后在提交-----------------\r\n,请重新修改后在提交-----------------\r\n,请重新修改后在提交-----------------\r\n,请重新修改后在提交-----------------\r\n,请重新修改后在提交-----------------\r\n,请重新修改后在提交-----------------\r\n,请重新修改后在提交---Sun Jun 02 00:52:51 CST 2013-----------------\r\n,请重新修改后在提交---Sun Jun 02 00:52:56 CST 2013-----------------\r\n,请重新修改后在提交---Sun Jun 02 00:53:01 CST 2013-----------------\r\n,请重新修改后在提交---Sun Jun 02 00:53:04 CST 2013-----------------\r\n,请重新修改后在提交---Sun Jun 02 00:53:07 CST 2013-----------------\r\n,请重新修改后在提交---Sun Jun 02 00:53:10 CST 2013-----------------\r\n,请重新修改后在提交---Sun Jun 02 00:53:15 CST 2013-----------------\r\n,请重新修改后在提交---Sun Jun 02 00:53:20 CST 2013-----------------\r\n,请重新修改后在提交---Sun Jun 02 00:53:24 CST 2013-----------------\r\n,请重新修改后在提交---Sun Jun 02 00:53:28 CST 2013-----------------\r\n,请重新修改后在提交---Sun Jun 02 00:53:30 CST 2013-----------------\r\n,请重新修改后在提交---Sun Jun 02 00:53:31 CST 2013-----------------\r\n,请重新修改后在提交---Sun Jun 02 00:53:31 CST 2013-----------------\r\n,请重新修改后在提交---Sun Jun 02 00:53:31 CST 2013-----------------\r\n,请重新修改后在提交---Sun Jun 02 00:53:31 CST 2013-----------------\r\n,请重新修改后在提交---Sun Jun 02 00:53:36 CST 2013-----------------\r\n,请重新修改后在提交---Sun Jun 02 00:53:36 CST 2013-----------------\r\n,请重新修改后在提交---Mon Jun 03 00:13:08 CST 2013-----------------\r\n,请重新修改后在提交---Mon Jun 03 00:13:10 CST 2013',524303,557082,1,1,'2013-06-03 00:13:11'),(9,'物流管理系统','作为现代物流企业，物流信息化也不能全面治愈企业的痼疾，更不能对传统物流企业的所有问题一次性解决。但如何实现企业管理信息化，无疑是降低企业成本的最佳良方。《物流信息管理系统》着重介绍了信息管理系统和当今流行的物流信息管理技术。对企业物流信息系统、第三方物流信息系统、回收物流管理系统、生产物流管理系统、库存物流管理系统、物流仓储信息系统、物流配送信息系统等的主要功能及解决方案做了深入细致的探讨。对我国物流企业信息化建设有一定的学术价值和应用价值。',NULL,557077,1,0,'2013-06-08 00:00:00'),(10,'tt5','ttttttt6-----------------\r\n,请重新修改后在提交---Wed Jun 12 14:02:19 CST 2013-----------------\r\n,请重新修改后在提交---Thu Jun 13 08:29:33 CST 2013-----------------\r\n,请重新修改后在提交---Thu Jun 13 08:29:43 CST 2013',196608,557067,0,0,'2013-06-13 08:29:44'),(11,'t6','t6-----------------\r\n,请重新修改后在提交---Wed Jun 12 14:02:20 CST 2013-----------------\r\n,请重新修改后在提交---Thu Jun 13 08:29:34 CST 2013-----------------\r\n,请重新修改后在提交---Sat Jun 15 23:22:25 CST 2013',196608,557068,0,0,'2013-06-15 23:22:26'),(13,'sd','ds-----------------\r\n,请重新修改后在提交---Wed Jun 12 14:02:21 CST 2013-----------------\r\n,请重新修改后在提交---Thu Jun 13 08:29:35 CST 2013',NULL,327680,0,0,'2013-06-13 08:29:36'),(14,'进销存管理系统','<div class=\"para\" style=\"margin-bottom: 14px; text-indent: 30px; color: rgb(0, 0, 0); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px;\">在<a target=\"_blank\" href=\"http://baike.baidu.com/view/3226.htm\" style=\"color: rgb(19, 110, 194);\">信息技术</a>的催化之下，<a target=\"_blank\" href=\"http://baike.baidu.com/view/9583.htm\" style=\"color: rgb(19, 110, 194);\">世界经济</a>的变革已经进入了加速状态。世界<a target=\"_blank\" href=\"http://baike.baidu.com/view/175299.htm\" style=\"color: rgb(19, 110, 194);\">经济一体化</a>，<a target=\"_blank\" href=\"http://baike.baidu.com/view/233749.htm\" style=\"color: rgb(19, 110, 194);\">企业经营</a>全球化，以及高<div class=\"text_pic layoutright\" data-layout=\"right\" style=\"border: 1px solid rgb(232, 232, 232); background-color: rgb(250, 250, 250); padding: 5px 5px 3px; margin: 5px; float: right; text-indent: 0px; text-align: center; width: 220px; background-position: initial initial; background-repeat: initial initial;\"><a hidefocus=\"true\" class=\"nslog:1199\" href=\"http://baike.baidu.com/picview/568463/568463/0/4e4a20a4462309f76303d15d720e0cf3d7cad615.html\" target=\"_blank\" style=\"color: rgb(19, 110, 194);\"><img class=\"editorImg  log-set-param\" log-set-param=\"img_view\" alt=\"\" title=\"\" height=\"155\" width=\"220\" src=\"http://d.hiphotos.baidu.com/baike/s%3D220/sign=4300b1668618367aa98978df1e728b68/4e4a20a4462309f76303d15d720e0cf3d7cad615.jpg\" style=\"display: block;\"></a><p class=\"pic-info\" style=\"margin-top: 3px; margin-bottom: 0px; padding: 0px; color: rgb(102, 102, 102); font-size: 12px; font-family: 宋体; word-wrap: break-word; word-break: break-all; line-height: 18px; min-height: 18px; zoom: 1;\"><a class=\"nslog:1200 pic-handle\" title=\"查看图片\" href=\"http://baike.baidu.com/picview/568463/568463/0/4e4a20a4462309f76303d15d720e0cf3d7cad615.html\" target=\"_blank\" style=\"color: rgb(19, 110, 194); background-image: url(http://baike.bdimg.com/static/lemma/view/img/content_icon_3de36737.gif); width: 14px; height: 14px; font-size: 0px; line-height: 0; display: block; border: 1px solid rgb(246, 246, 246); float: right; margin-top: 2px; background-position: 0px -395px; background-repeat: no-repeat no-repeat;\">&nbsp;&nbsp;</a></p></div>度竞争造成的高度个性化与迅速改变的<a target=\"_blank\" href=\"http://baike.baidu.com/view/88584.htm\" style=\"color: rgb(19, 110, 194);\">客户</a>需求，令企业与顾客、企业与供方的关系变得更加密切和复杂。强化管理，规范业务流程，提高透明度，加快商品资金周转，以及为流通领域信息管理全面网络化打下基础，是家电销售公司乃至众多商业企业梦寐以求的愿望。</div><div class=\"para\" style=\"margin-bottom: 14px; text-indent: 30px; color: rgb(0, 0, 0); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px;\"><a target=\"_blank\" href=\"http://baike.baidu.com/view/58855.htm\" style=\"color: rgb(19, 110, 194);\">中小企业</a>在我国经济发展中具有重要地位，据了解我国的<a target=\"_blank\" href=\"http://baike.baidu.com/view/58855.htm\" style=\"color: rgb(19, 110, 194);\">中小企业</a>数量较多、地区分布广泛、行业分布跨度大，随着<a target=\"_blank\" href=\"http://baike.baidu.com/view/323580.htm\" style=\"color: rgb(19, 110, 194);\">全球经济一体化</a>的发展及中国加入<a target=\"_blank\" href=\"http://baike.baidu.com/view/1249.htm\" style=\"color: rgb(19, 110, 194);\">WTO</a>，中小企业将面临外资企业和国外产品与服务的严峻挑战，比较而言，外资企业具有更为雄厚的资金实力、丰富的管理经验和先进的技术手段，因此，如果我国的中小企业不借助先进的管理思想转变经营观念、使用信息化提高企业的管理水平和工作效率，将很难在今后的国际竞争中取胜。然而企业管理在很多方面、很大程度上都必须借助信息化来完成，而我国<a target=\"_blank\" href=\"http://baike.baidu.com/view/58855.htm\" style=\"color: rgb(19, 110, 194);\">中小企业</a>的信息化水平还很低，与外资企业相比，还处于起步阶段。</div>',524290,327680,1,0,NULL),(15,'毕业论文管理系统','<div>高校本科毕业设计和毕业论文是人才培养和教学中一个非常重要的环节，而通过调查，目前很多高校对于本科学生毕业设计和毕业论文的管理均是采用传统的手工模式，首先，由符合指导资格的教师出题，然后再由教师指导学生选题，学生做完开题报告后，设计和论文的撰写由指导教师指导完成，中途对设计和论文进行中期检查，最后进行论文的批改、答辩以及论文的归档，在这一过程中，每一项工作一般都得教师与学生面对面交流，或者学生所做的设计和论文采用邮寄、E-Mail、电话等方式与教师进行交流。这种方式积极的一面在于教师和学生直接面对面的探讨和解决问题，但也存在着很多局限性，特别是随着Internet的出现和现代远程教育的发展以及现代本科教育模式的发展，继续采用传统手工管</div><div>&nbsp;</div><div>理模式对毕业设计和毕业论文进行管理就显得费时，整理资料的工作量大，效率低，对于教学管理者来说难以及时准确地掌握毕业设计和论文的整体进展情况，给管理带来一定的难度，而这种情况的最终结果是导致毕业设计和毕业论文的质量难以保证，也没有充分利用无处不在的Internet优势和丰富的网络资源。&nbsp;</div><div>此软件可以实现教学管理信息化、网络化。采用该系统对高校本科毕业论文进行管理，可以解决手工选择毕业论文带来的消耗时间长、工作效率低、不公平等现象，极大地方便学生和指导教师，显著地提高了工作效率。</div>',196608,327680,1,1,NULL),(16,'基于JSP大学生网上交友平台的设计与实现','<p class=\"p0\" style=\"text-indent: 24pt; margin-bottom: 0pt; margin-top: 0pt; word-break: break-all; line-height: 18pt;\"><span style=\"mso-spacerun:\'yes\'; font-size:12.0000pt; font-family:\'宋体\'; \">本系统用JSP编写一个简单的交友平台，里面用到了HTML、CSS、JavaScript&nbsp;、Servlet、Struts、AJAX等技术。用到的开发工具主要有MyEclipse，数据库用的是MySql，服务器用的是Tomcat。前台用JSP来进行显示，后台通过MYSQL进行数据库的管理。</span></p><p class=\"p0\" style=\"text-indent: 24pt; margin-bottom: 0pt; margin-top: 0pt; word-break: break-all; line-height: 18pt;\"><span style=\"mso-spacerun:\'yes\'; font-size:12.0000pt; font-family:\'宋体\'; \">系统目的是设计一个简单易用的交友平台</span><span style=\"mso-spacerun:\'yes\'; font-size:12.0000pt; font-family:\'宋体\'; \">。系统分为几个模块，主要有管理员和用户模块。用户模块又可以分为以下几个模块：注册、登陆、查看或修改个人信息、留言板上传下载文件、聊天室、写日记、公共交流模块等。管理员模块功能比较简单，主要请来发布系统公告、查看用户、删除用户。</span><span style=\"mso-spacerun:\'yes\'; font-size:12.0000pt; font-family:\'宋体\'; \"><o:p></o:p></span></p>',524300,327680,1,1,NULL),(17,'网上求职招聘系统 ','<p class=\"p0\" style=\"text-indent:24.0000pt; margin-bottom:0pt; margin-top:0pt; line-height:18.0000pt; \"><span style=\"mso-spacerun:\'yes\'; font-size:12.0000pt; font-family:\'宋体\'; \">其主要目的是：减少参加招聘单位工作人员的工作量和招聘成本,减少进行求职的人员求职时参加招聘会投递简历所耗费的时间和精力，使求职和招聘的过程通过互连网完成，从而实现招聘时双向选择的自动化。</span><span style=\"mso-spacerun:\'yes\'; font-size:12.0000pt; font-family:\'宋体\'; \"><o:p></o:p></span></p><p class=\"p0\" style=\"text-indent:24.0000pt; margin-bottom:0pt; margin-top:0pt; line-height:18.0000pt; \"><span style=\"mso-spacerun:\'yes\'; font-size:12.0000pt; font-family:\'宋体\'; \">网络求职有其突出的优点，即信息量大，资源丰富，更新速度快，招聘职位多等，很符合年轻人希望以最快捷、便利的方式获得最多最有效信息的求职要求。本系统就是一个模拟网上求职招聘的系统，具备现实中人才中介机构的功能。可以为个人用户提供需要的求职与招聘的信息，也可以为单位用户提供需要的人才信息，可以说是两者互动的一种重要渠道。</span><span style=\"mso-spacerun:\'yes\'; font-size:12.0000pt; font-family:\'宋体\'; \"><o:p></o:p></span></p><p class=\"p0\" style=\"text-indent:24.0000pt; margin-bottom:0pt; margin-top:0pt; line-height:18.0000pt; \"><span style=\"mso-spacerun:\'yes\'; font-size:12.0000pt; font-family:\'宋体\'; \">人才在各行各业都是发展的关键，大学生就像是人才的代名词，如何能够聘到具有真才实学的大学生是各企业非常关心的问题。而找不到理想的工作、不能发挥自己聪明才智也让大学生烦恼，他们踏入社会的第一节课就是求职。说到求职，读者可能首先&nbsp;会想到招聘会。虽然招聘会是目前人才交流的主要途径之一，但是它还远远不能满足现实的需求：</span><span style=\"mso-spacerun:\'yes\'; font-size:12.0000pt; font-family:\'宋体\'; \"><o:p></o:p></span></p>',524301,327680,1,1,NULL),(18,'df','在此输入内容-----------------\r\n,请重新修改后在提交---Thu Jun 13 08:29:14 CST 2013-----------------\r\n,请重新修改后在提交---Thu Jun 13 08:29:39 CST 2013',NULL,327680,0,0,'2013-06-13 08:29:39'),(19,'物流信息网','<p class=\"p15\" style=\"margin-bottom:0pt; margin-top:0pt; line-height:125%; \"><span style=\"mso-spacerun:\'yes\'; color:rgb(255,0,0); font-size:12.0000pt; font-family:\'宋体\'; \">1）按照软件工程的方法结合电子商务网站的设计的要求进行需求分析、总体设计、详细设计、编码和测试；</span><span style=\"mso-spacerun:\'yes\'; color:rgb(255,0,0); font-size:12.0000pt; font-family:\'宋体\'; \"><o:p></o:p></span></p><p class=\"p15\" style=\"margin-bottom:0pt; margin-top:0pt; line-height:125%; \"><span style=\"mso-spacerun:\'yes\'; color:rgb(255,0,0); font-size:12.0000pt; font-family:\'宋体\'; \">2）以XXX为开发工具进行系统前台设计(各开发工具尽可能用高版本)，以SQL&nbsp;Server&nbsp;2005为工具进行系统后台数据管理，使用ADO技术实现数据库的连接和使用，能提供一个界面良好，交互功能强，管理方便的基于Web的电子商务网站系统设计；</span><span style=\"mso-spacerun:\'yes\'; color:rgb(255,0,0); font-size:12.0000pt; font-family:\'宋体\'; \"><o:p></o:p></span></p><p class=\"p15\" style=\"margin-left:-4.9350pt; text-indent:-4.9200pt; margin-left:4.9200pt; margin-bottom:0pt; margin-top:0pt; line-height:125%; \"><span style=\"mso-spacerun:\'yes\'; color:rgb(255,0,0); font-size:12.0000pt; font-family:\'宋体\'; \">&nbsp;3）要求系统至少具有管理员、普通用户、商家和游客四种权限，普通用户能注册、浏览信息，个人资料管理,管理员能管理用户资料；</span><span style=\"mso-spacerun:\'yes\'; color:rgb(0,0,255); font-size:12.0000pt; font-family:\'宋体\'; \"><o:p></o:p></span></p><p class=\"p15\" style=\"margin-bottom:0pt; margin-top:0pt; line-height:125%; \"><span style=\"mso-spacerun:\'yes\'; font-size:12.0000pt; font-family:\'宋体\'; \">4）软件结构良好，具备一定的可维护性和可靠性；</span><span style=\"mso-spacerun:\'yes\'; font-size:12.0000pt; font-family:\'宋体\'; \"><o:p></o:p></span></p><p class=\"p15\" style=\"margin-bottom:0pt; margin-top:0pt; line-height:125%; \"><span style=\"mso-spacerun:\'yes\'; font-size:12.0000pt; font-family:\'宋体\'; \">5）论文字数1.5~2万字，并完成相关英文资料5000字的翻译。&nbsp;参考文献资料不少于8篇，其中外文资料不少于2篇，中英文摘要约300字，关键词3-5个。</span><span style=\"mso-spacerun:\'yes\'; font-size:12.0000pt; font-family:\'宋体\'; \"><o:p></o:p></span></p>',917504,950272,1,1,NULL),(20,'题目1','题目1题目1题目1题目1题目1题目1题目1',983041,983040,1,1,NULL),(21,'题目2','题目2题目2题目2题目2题目2',NULL,983040,1,0,NULL);
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
INSERT INTO `thesis` VALUES (1,'sd','sd',NULL,'2013-05-26 18:47:50',1,NULL,NULL),(2,'sd','sd',NULL,'2013-05-27 18:47:50',1,NULL,NULL),(3,'sdf','sdf',NULL,'2013-05-28 18:47:50',1,NULL,NULL),(4,'Bs.doc','1d839acd-31e3-45fc-b707-ed31302ea0df_Bs.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\安工大\\null\\094\\099074016',NULL,2,NULL,' dfasfdf'),(5,'Bs.doc','a212a75e-11f9-47dc-9378-903be01f38de_Bs.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\安工大\\计算机学院\\094\\099074016',NULL,2,NULL,' OK'),(6,'Bs.doc','cbbad115-b36e-4925-8414-10717c9df74e_Bs.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\安工大\\计算机学院\\094\\099074016','2013-05-30 01:40:27',2,NULL,' adasdda'),(7,'Bs.doc','3b0499cb-51b5-4e89-b177-66b4e0bb77db_Bs.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\安工大\\计算机学院\\094\\099074016','2013-05-30 01:47:00',2,'V5\r\nd\r\n\r\nd\r\n\r\nd\r\ndd\r\n',' qwqe'),(8,'Bs.doc','4350858e-4d14-483f-af13-4a4276dee929_Bs.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\安工大\\计算机学院\\094\\099074016','2013-05-30 01:54:26',2,'v6',' 做的不错！'),(9,'Bs.doc','d648fb73-d7d2-438b-81dd-0955462e43ba_Bs.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\安工大\\计算机学院\\094\\099074016','2013-05-30 01:59:00',2,'v8',' qwe'),(10,'Bs.doc','ff8d2b97-560a-448a-9cfe-386c334e1ca4_Bs.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\安工大\\计算机学院\\094\\099074016','2013-05-30 02:01:40',2,'v9',' qq群'),(11,'Bs.doc','94fe56c6-bf68-4805-a39f-08804868f37e_Bs.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\安工大\\计算机学院\\094\\099074016','2013-05-30 02:08:02',2,'v9',' qq群'),(12,'Bs.doc','e4941eb0-7021-47dc-8d1a-3e56455b631d_Bs.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\安工大\\计算机学院\\094\\099074016','2013-05-30 03:15:00',9,'V1','  mvzxcvnpodfijvpaofjapofga硕大的发顺丰v阿德发表 \r\n\r\n\r\nsadfsadff '),(13,'Bs.doc','b3e54ab9-6a03-4bd4-a919-510d47967218_Bs.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\安工大\\计算机学院\\094\\099074016','2013-05-30 04:13:57',9,'V8','  OK\r\n\r\ngood'),(14,'Bs - Copy.doc','41d25b59-50ab-49ad-a840-f9ff83cf0271_Bs - Copy.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\安徽工业大学\\计算机学院\\111\\09907232416','2013-05-30 04:55:52',9,NULL,' dfdsfsdfsdfsdf'),(15,'Bs.doc','02cb01da-b671-4a11-b376-9908a3fff10e_Bs.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\安工大\\计算机学院\\094\\099074016','2013-05-30 09:25:44',9,'qqqqqqqqq',' sdfsdffdf'),(16,'rr.doc','94d8361d-c043-491f-a4d9-ec55b67a3c7a_rr.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\安工大\\计算机学院\\094\\099074016','2013-06-08 15:55:14',9,'qqqqqqqqq',NULL),(17,'rr.doc','a5dafcdc-c206-416e-b6a5-bb7575171efd_rr.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\安工大\\计算机学院\\094\\099074016','2013-06-08 16:01:03',9,'zz',NULL),(18,'论文二稿.docx','fa53d4fc-026b-4d9c-92ec-2298a0f11c38_论文二稿.docx','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\安工大\\计算机学院\\094\\099074016','2013-06-08 16:04:37',9,'zxczxcz',NULL),(19,'635060438999687500.doc','4a9855bd-f2b5-46fe-ac11-989e0b0b3638_635060438999687500.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\安工大\\计算机学院\\094\\099074016','2013-06-08 17:13:09',9,'ttt',NULL),(20,'鲍勇翔.doc','9a34e696-3f6f-498a-91a5-25f742378ca5_鲍勇翔.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\安工大\\计算机学院\\094\\099074016','2013-06-10 09:07:38',15,'毕业论文 1稿',NULL),(21,'鲍勇翔.doc','9496da23-c5d4-4d41-b9a2-ad6f0e7c14ed_鲍勇翔.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\安工大\\计算机学院\\094\\099074016','2013-06-10 09:07:58',15,'毕业论文 2稿',NULL),(22,'鲍勇翔.doc','e0be63ab-01e5-4c94-babe-c6d3a7e9b6ff_鲍勇翔.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\安工大\\计算机学院\\094\\099074016','2013-06-10 09:08:15',15,'毕业论文 3稿',NULL),(23,'鲍勇翔.doc','4b6cd33f-ebfa-4014-a026-b5509bd13db6_鲍勇翔.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\安工大\\计算机学院\\094\\099074016','2013-06-10 09:18:47',15,'论文 4稿',' dasdsad'),(24,'鲍勇翔.doc','17a95cbe-7366-42c9-a59a-32d35f307819_鲍勇翔.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\安工大\\计算机学院\\094\\099074016','2013-06-10 09:25:45',15,'论文 5稿',NULL),(25,'鲍勇翔.doc','4153f9bf-d640-4fe1-aa64-31c9c07aef72_鲍勇翔.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\安工大\\计算机学院\\094\\099074016','2013-06-10 09:28:28',15,'ss',' asdsad'),(26,'鲍勇翔.doc','9e2ad60b-28e8-4a50-9e35-be60980c066c_鲍勇翔.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\安工大\\计算机学院\\094\\099074016','2013-06-10 09:30:38',15,'dasd',NULL),(27,'鲍勇翔.doc','58dbe6bb-4ab2-4c5a-a5ea-3bc5966e02d9_鲍勇翔.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\安工大\\计算机学院\\094\\099074016','2013-06-10 09:32:57',15,'asdf',' OK'),(28,'鲍勇翔.doc','3377e5b1-4978-4bd7-bcc4-516c0f1f1d24_鲍勇翔.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\安徽工业大学\\计算机学院\\111\\09907232416','2013-06-10 17:37:09',2,NULL,'xiugai'),(29,'鲍勇翔.doc','cb62058c-497c-4730-a367-2ebf1a85c08b_鲍勇翔.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\安徽工业大学\\计算机学院\\111\\09907232416','2013-06-10 17:39:35',15,NULL,'修改后的'),(30,'任务书模板.doc','88c46e24-e8de-4b36-8834-a70722d1d275_任务书模板.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\安工大\\null\\094\\0990740112','2013-06-13 04:53:24',16,'论文1稿，请老师查看',NULL),(31,'安式大本科生毕业设计（论文）撰写规范细则.doc','d8b98ef6-c140-4b45-85ee-238a9b6d2ed9_安式大本科生毕业设计（论文）撰写规范细则.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\安工大\\null\\094\\0990740112','2013-06-13 04:53:51',16,'论文 2 稿',' 可以了！'),(32,'鲍勇翔.doc','09a59f6b-30cf-4b14-91ec-93a518c5b900_鲍勇翔.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\安工大\\null\\094\\0990740115','2013-06-13 08:26:46',8,'初稿',' OK'),(33,'论文二稿.docx','a5f2680f-07f0-419a-9cde-c5b3356ce93b_论文二稿.docx','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\null\\null\\null\\099074123','2013-06-15 22:58:00',19,'论文1稿',' 可以'),(34,'计算机学院-答辩委员会.doc','c41e9876-cfef-4090-9582-3030d364ce80_计算机学院-答辩委员会.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\null\\null\\null','2013-06-16 08:11:32',20,'论文1稿',NULL),(35,'后勤集团公寓中心毕业生离校工作安排.doc','6593e2a1-786d-4e97-905d-bac6c5681c29_后勤集团公寓中心毕业生离校工作安排.doc','F:\\Java\\Drill\\TManage\\build\\web\\WEB-INF\\upload\\student\\null\\null\\null','2013-06-16 08:11:47',20,'论文2稿',NULL);
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
INSERT INTO `unit` VALUES (1,'安徽工业大学','计算机学院','计算机科学与技术','094'),(2,'安徽工业大学','计算机学院','软件工程','111'),(5,'shut',NULL,'com','094'),(6,'shut',NULL,'com','094'),(7,'shut',NULL,'com','094'),(8,'安工大','计算机学院','计算机科学','094'),(9,'安工大',NULL,'计算机','094'),(10,'shut',NULL,'com','094'),(11,'安工大',NULL,'计算机','094'),(12,NULL,NULL,'电气',NULL),(13,NULL,NULL,'电气',NULL),(14,NULL,NULL,'电气',NULL),(15,NULL,NULL,'电气',NULL),(16,NULL,NULL,'计算机学院',NULL),(17,NULL,NULL,'电气',NULL),(18,NULL,NULL,'电气',NULL);
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
INSERT INTO `user` VALUES (32768,2,'得到','byx0','ICy5YqxZB1uWSwcVLSNLcA==','','',' ',NULL,88),(65536,2,'jess','byx1','ICy5YqxZB1uWSwcVLSNLcA==',NULL,NULL,NULL,NULL,88),(98304,2,'jess','byx2','ICy5YqxZB1uWSwcVLSNLcA==',NULL,NULL,NULL,NULL,86),(131072,2,'jess','byx3','ICy5YqxZB1uWSwcVLSNLcA==',NULL,NULL,NULL,NULL,90),(163840,2,'jess','byx4','ICy5YqxZB1uWSwcVLSNLcA==',NULL,NULL,NULL,NULL,87),(196608,2,'鲍勇翔','byx','ICy5YqxZB1uWSwcVLSNLcA==','baoyx007@gmail.com','','你好，你好，你好你好，你好 ',NULL,90),(262144,1,'鲍勇翔','admin','ICy5YqxZB1uWSwcVLSNLcA==','bad@sedf.cd',NULL,'hhhhhhhhhhhhhhhhhhh','',NULL),(327680,3,'储岳中','chu','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,'大家好，我是储岳中',NULL,90),(360448,2,'范德法特','qwe','ICy5YqxZB1uWSwcVLSNLcA==','123@ahut.edu','123','发的公司嘎嘎嘎发噶地方',NULL,88),(393216,1,'公告','asd','ICy5YqxZB1uWSwcVLSNLcA==','123@ahut.edu','124314343','的发布该法律不送过来呢','\0',NULL),(425984,3,'飞','123','ICy5YqxZB1uWSwcVLSNLcA==','123@ahut.edu','234235','说的噶的发生率谁让你和任务',NULL,NULL),(458752,2,'jess','byx5','ICy5YqxZB1uWSwcVLSNLcA==',NULL,NULL,NULL,NULL,85),(524288,2,'鲍勇翔0','byx0','ICy5YqxZB1uWSwcVLSNLcA==','baoyx000@gmail.com',NULL,NULL,NULL,87),(524289,2,'鲍勇翔1','byx1','ICy5YqxZB1uWSwcVLSNLcA==','baoyx001@gmail.com',NULL,NULL,NULL,89),(524290,2,'鲍勇翔2','byx2','ICy5YqxZB1uWSwcVLSNLcA==','baoyx002@gmail.com',NULL,NULL,NULL,87),(524291,2,'鲍勇翔3','byx3','ICy5YqxZB1uWSwcVLSNLcA==','baoyx003@gmail.com',NULL,NULL,NULL,87),(524292,2,'鲍勇翔4','byx4','ICy5YqxZB1uWSwcVLSNLcA==','baoyx004@gmail.com',NULL,NULL,NULL,88),(524293,2,'鲍勇翔5','byx5','ICy5YqxZB1uWSwcVLSNLcA==','baoyx005@gmail.com',NULL,NULL,NULL,85),(524294,2,'鲍勇翔6','byx6','ICy5YqxZB1uWSwcVLSNLcA==','baoyx006@gmail.com',NULL,NULL,NULL,85),(524295,2,'鲍勇翔7','byx7','ICy5YqxZB1uWSwcVLSNLcA==','baoyx007@gmail.com',NULL,NULL,NULL,88),(524296,2,'鲍勇翔8','byx8','ICy5YqxZB1uWSwcVLSNLcA==','baoyx008@gmail.com',NULL,NULL,NULL,90),(524297,2,'鲍勇翔9','byx9','ICy5YqxZB1uWSwcVLSNLcA==','baoyx009@gmail.com',NULL,NULL,NULL,89),(524298,2,'鲍勇翔10','byx10','ICy5YqxZB1uWSwcVLSNLcA==','baoyx0010@gmail.com',NULL,NULL,NULL,86),(524299,2,'鲍勇翔11','byx11','ICy5YqxZB1uWSwcVLSNLcA==','baoyx0011@gmail.com',NULL,NULL,NULL,86),(524300,2,'鲍勇翔12','byx12','ICy5YqxZB1uWSwcVLSNLcA==','baoyx0012@gmail.com',NULL,NULL,NULL,87),(524301,2,'鲍勇翔13','byx13','ICy5YqxZB1uWSwcVLSNLcA==','baoyx0013@gmail.com',NULL,NULL,NULL,87),(524302,2,'鲍勇翔14','byx14','ICy5YqxZB1uWSwcVLSNLcA==','baoyx0014@gmail.com',NULL,NULL,NULL,86),(524303,2,'鲍勇翔15','byx15','ICy5YqxZB1uWSwcVLSNLcA==','baoyx0015@gmail.com',NULL,NULL,NULL,89),(524304,2,'鲍勇翔16','byx16','ICy5YqxZB1uWSwcVLSNLcA==','baoyx0016@gmail.com',NULL,NULL,NULL,85),(524305,2,'鲍勇翔17','byx17','ICy5YqxZB1uWSwcVLSNLcA==','baoyx0017@gmail.com',NULL,NULL,NULL,89),(524306,2,'鲍勇翔18','byx18','ICy5YqxZB1uWSwcVLSNLcA==','baoyx0018@gmail.com',NULL,NULL,NULL,86),(524307,2,'鲍勇翔19','byx19','ICy5YqxZB1uWSwcVLSNLcA==','baoyx0019@gmail.com',NULL,NULL,NULL,89),(524308,2,'鲍勇翔20','byx20','ICy5YqxZB1uWSwcVLSNLcA==','baoyx0020@gmail.com',NULL,NULL,NULL,90),(524309,2,'鲍勇翔21','byx21','ICy5YqxZB1uWSwcVLSNLcA==','baoyx0021@gmail.com',NULL,NULL,NULL,88),(524310,2,'鲍勇翔22','byx22','ICy5YqxZB1uWSwcVLSNLcA==','baoyx0022@gmail.com',NULL,NULL,NULL,90),(524311,2,'鲍勇翔23','byx23','ICy5YqxZB1uWSwcVLSNLcA==','baoyx0023@gmail.com',NULL,NULL,NULL,85),(524312,2,'鲍勇翔24','byx24','ICy5YqxZB1uWSwcVLSNLcA==','baoyx0024@gmail.com',NULL,NULL,NULL,90),(524313,2,'鲍勇翔25','byx25','ICy5YqxZB1uWSwcVLSNLcA==','baoyx0025@gmail.com',NULL,NULL,NULL,86),(524314,2,'鲍勇翔26','byx26','ICy5YqxZB1uWSwcVLSNLcA==','baoyx0026@gmail.com',NULL,NULL,NULL,89),(524315,2,'鲍勇翔27','byx27','ICy5YqxZB1uWSwcVLSNLcA==','baoyx0027@gmail.com',NULL,NULL,NULL,87),(524316,2,'鲍勇翔28','byx28','ICy5YqxZB1uWSwcVLSNLcA==','baoyx0028@gmail.com',NULL,NULL,NULL,85),(524317,2,'鲍勇翔29','byx29','ICy5YqxZB1uWSwcVLSNLcA==','baoyx0029@gmail.com',NULL,NULL,NULL,88),(557056,3,'储岳中0','chu0','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557057,3,'储岳中1','chu1','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557058,3,'储岳中2','chu2','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557059,3,'储岳中3','chu3','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557060,3,'储岳中4','chu4','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557061,3,'储岳中5','chu5','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557062,3,'储岳中6','chu6','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557063,3,'储岳中7','chu7','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557064,3,'储岳中8','chu8','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557065,3,'储岳中9','chu9','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557066,3,'储岳中10','chu10','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557067,3,'储岳中11','chu11','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557068,3,'储岳中12','chu12','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557069,3,'储岳中13','chu13','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557070,3,'储岳中14','chu14','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557071,3,'储岳中15','chu15','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557072,3,'储岳中16','chu16','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557073,3,'储岳中17','chu17','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557074,3,'储岳中18','chu18','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557075,3,'储岳中19','chu19','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557076,3,'储岳中20','chu20','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557077,3,'储岳中21','chu21','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,'大家好，我是储岳中',NULL,NULL),(557078,3,'储岳中22','chu22','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557079,3,'储岳中23','chu23','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557080,3,'储岳中24','chu24','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557081,3,'储岳中25','chu25','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557082,3,'储岳中26','chu26','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,89),(557083,3,'储岳中27','chu27','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557084,3,'储岳中28','chu28','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(557085,3,'储岳中29','chu29','ICy5YqxZB1uWSwcVLSNLcA==','e@sdf.com',NULL,NULL,NULL,NULL),(589824,2,'撒的发算法',NULL,'asd',NULL,'asd',' SDFSDF     ',NULL,89),(688128,3,'方法',NULL,'123','sadf@QW','123',' sdfd',NULL,NULL),(720896,3,'都是',NULL,'123','sdf@ew','1234',' sdf',NULL,NULL),(753664,3,'范瑞芳',NULL,'123','ad@qwe','`213',' 123',NULL,NULL),(786432,3,'的冯绍',NULL,'123','asd@qwe','213',' asdf',NULL,NULL),(819200,1,'的','asd343','123','qwe@wq','qwe',' wqe','\0',NULL),(851968,2,'的','qwe221','123','','',' 是',NULL,90),(917504,2,'廖荣亮','lrl','tGM5dP5NORebJxvRkvzSlQ==','sd@qwc.c','123',' 大家好，我是鹅神！',NULL,86),(950272,3,'王文静','wwj','QrMweHAZgcMgvbjn70qtsw==','sdf@qwe','123','  大家好，我是鼠大王！今天给大家带一波节奏！',NULL,86),(983040,3,'胡宏志','hhz','zOccMhmI5Xx1Mz0LFmGTNQ==','ss@ww.dd','22',' 你好',NULL,85),(983041,2,'琵琶','ppp','8n9vHHxcv04+GS4KR7hTAA==','dd@q','1234',' ',NULL,85);
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
