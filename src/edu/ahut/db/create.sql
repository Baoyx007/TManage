
delimiter $$

CREATE TABLE `manager` (
  `id` varchar(45) DEFAULT NULL,
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
  `role` enum('SUPER','NORMAL') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$


delimiter $$
use TManage$$

CREATE TABLE `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `description` text,
  `sid` varchar(45) DEFAULT NULL,
  `tid` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tid_FK_idx` (`tid`),
  KEY `sid_FK_idx` (`sid`),
  CONSTRAINT `sid_FK` FOREIGN KEY (`sid`) REFERENCES `student` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tid_FK` FOREIGN KEY (`tid`) REFERENCES `teacher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

delimiter $$

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

CREATE  TABLE `tmanage`.`thesis` (
  `id` VARCHAR(45) NOT NULL ,
  `real_file_name` VARCHAR(45) NULL ,
  `uuid_file_name` VARCHAR(45) NULL ,
  `submit_date` DATE NULL ,
  `stu_comment` TEXT NULL ,
  `tea_comment` TEXT NULL ,
  `subject_id` INT(11) NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `sbjid_FK_idx` (`subject_id` ASC) ,
  CONSTRAINT `subject_id_FK`
    FOREIGN KEY (`subject_id` )
    REFERENCES `tmanage`.`subject` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
COMMENT = 'id,real_file_name,uuid_file_name,submit_date,stu_comment,subject_id,tea_comment';
