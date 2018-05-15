/*
SQLyog  v12.2.6 (64 bit)
MySQL - 5.5.37 : Database - student_employment
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`student_employment` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `student_employment`;


/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(100) DEFAULT NULL,
  `sex` varchar(100) DEFAULT NULL,
  `pwd` varchar(100) DEFAULT NULL,
  `utype` varchar(100) DEFAULT NULL COMMENT '1管理员 2学生3公司',
  `age` varchar(100) DEFAULT NULL,
  `mbanswer` varchar(100) DEFAULT NULL,
  `tname` varchar(100) DEFAULT NULL,
  `major` varchar(100) DEFAULT NULL,
  `isdel` varchar(10) DEFAULT NULL COMMENT '1审核已通过 2未通过3：密码修改',
  `pubtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `editpwd` text COMMENT '修改后的密码',
  `status` varchar(1) DEFAULT '1' COMMENT '1已注册2已缴费3已分宿舍4已分班结束',
  `clazzid` int(11) DEFAULT NULL COMMENT '班级ID',
  `roomid` int(11) DEFAULT NULL COMMENT '宿舍ID',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`uid`,`uname`,`sex`,`pwd`,`utype`,`age`,`mbanswer`,`tname`,`major`,`isdel`,`pubtime`,`editpwd`,`status`,`clazzid`,`roomid`) values 
(1,'admin','男','123','1',NULL,NULL,'admin',NULL,'1','2018-03-30 15:05:48',NULL,'1',NULL,NULL),
(2,'王夏丽','女','123','2','1','20180001','王夏丽','2','1','2018-04-17 13:47:44',NULL,'1',NULL,NULL),
(3,'张三','男','123','2','18','20180002','张三','生物制药','1','2018-04-07 16:10:36',NULL,'2',2,NULL),
(4,'王涛','男','123','2','19','20180003','王涛','生物制药','1','2018-04-07 22:48:29',NULL,'4',3,5),
(5,'测试用户注册','男','123','2','18','20180090','测试用户注册','冶金','1','2018-04-07 16:10:53',NULL,'3',NULL,NULL),
(7,'小儿子','男','123','3','18','20180001','小儿子','第三方','1','2018-04-17 14:31:09',NULL,'2',NULL,NULL),
(8,'王小二','男','123','3','18','20180076','王小二','海洋轮船','1','2018-04-17 14:31:02',NULL,'4',11,1),
(14,'zsh',NULL,'123','3','水电费是否发111',NULL,'中石化','','1','2018-04-17 15:10:10',NULL,'1',NULL,NULL),
(16,'qiye',NULL,'123','3','企业文化渊源刘畅1111111',NULL,'qiye','','1','2018-04-17 15:19:19',NULL,'1',NULL,NULL),
(17,'admin11',NULL,'123','1','29',NULL,'admin11',NULL,'1','2018-04-17 15:19:47',NULL,'1',NULL,NULL),
(18,'wsxs','男','123','2','27',NULL,'wsxs','学生本科专业2222','1','2018-04-17 15:26:38',NULL,'1',NULL,NULL),
(19,'我是企业',NULL,'123','3','我是企业我是企业我是企业1111',NULL,'我是企业','','1','2018-04-17 15:25:57',NULL,'1',NULL,NULL),
(20,'admin111',NULL,'123','1','26',NULL,'admin111',NULL,'1','2018-04-17 15:26:18',NULL,'1',NULL,NULL);



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
