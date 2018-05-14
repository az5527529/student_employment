/*
SQLyog  v12.2.6 (64 bit)
MySQL - 5.5.37 : Database - student
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`student` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `student`;

/*Table structure for table `clazz` */

DROP TABLE IF EXISTS `clazz`;

CREATE TABLE `clazz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clazzname` varchar(20) DEFAULT NULL,
  `major` varchar(20) DEFAULT NULL,
  `xueyuan` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `clazz` */

insert  into `clazz`(`id`,`clazzname`,`major`,`xueyuan`) values 
(1,'制药1班','生物制药','生命科学系'),
(2,'制药2班','生物制药','生命科学系'),
(3,'物教1班','物理教育','物电系'),
(4,'物教2班','物理教育','物电系'),
(8,'外语翻译1班','外语翻译','外语系'),
(9,'外语翻译2班','外语翻译','外语系'),
(10,'外语翻译3班','外语翻译','外语系'),
(11,'海洋环境1班','海洋环境治理','海洋港口系');

/*Table structure for table `dormitory` */

DROP TABLE IF EXISTS `dormitory`;

CREATE TABLE `dormitory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roomname` varchar(20) DEFAULT NULL COMMENT '房间号',
  `type` varchar(1) DEFAULT NULL COMMENT '1男生2女士',
  `building` varchar(20) DEFAULT NULL COMMENT '哪栋',
  `floor` varchar(10) DEFAULT NULL COMMENT '哪层',
  `total` int(10) DEFAULT NULL COMMENT '几人间',
  `surplus` int(10) DEFAULT NULL COMMENT '剩余房间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `dormitory` */

insert  into `dormitory`(`id`,`roomname`,`type`,`building`,`floor`,`total`,`surplus`) values 
(1,'101','1','一栋','一层',4,1),
(2,'102','1','一栋','一层',4,2),
(3,'201','1','一栋','二层',4,2),
(4,'101','2','一栋','一层',4,2),
(5,'102','2','一栋','一层',4,1),
(6,'203','1','一栋','二层',4,2),
(7,'305','2','一栋','三层',4,2),
(15,'101','1','一栋','一层',4,4),
(16,'101','1','一栋','一层',4,3),
(17,'301','2','五栋','三层',8,8);

/*Table structure for table `pay` */

DROP TABLE IF EXISTS `pay`;

CREATE TABLE `pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL COMMENT '学生ID',
  `book` varchar(10) DEFAULT '200' COMMENT '书本费',
  `peiyang` varchar(10) DEFAULT '3000' COMMENT '培养费',
  `zhusu` varchar(10) DEFAULT '1000' COMMENT '住宿',
  `total` varchar(10) DEFAULT '4200' COMMENT '合计',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `pay` */

insert  into `pay`(`id`,`userid`,`book`,`peiyang`,`zhusu`,`total`) values 
(2,3,'200','3000','1000','4200'),
(3,4,'200','3000','1000','4200'),
(4,2,'200','3000','1000','4200'),
(5,8,'200','3000','1000','4200');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(100) DEFAULT NULL,
  `sex` varchar(100) DEFAULT NULL,
  `pwd` varchar(100) DEFAULT NULL,
  `utype` varchar(100) DEFAULT NULL COMMENT '1管理员 2学生3宿舍管理员4',
  `age` varchar(100) DEFAULT NULL,
  `mbanswer` varchar(100) DEFAULT NULL,
  `tname` varchar(100) DEFAULT NULL,
  `major` varchar(100) DEFAULT NULL,
  `isdel` varchar(10) DEFAULT NULL COMMENT '1审核已通过 2未通过3：密码修改',
  `pubtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `editpwd` varchar(1) DEFAULT NULL COMMENT '修改后的密码',
  `status` varchar(1) DEFAULT '1' COMMENT '1已注册2已缴费3已分宿舍4已分班结束',
  `clazzid` int(11) DEFAULT NULL COMMENT '班级ID',
  `roomid` int(11) DEFAULT NULL COMMENT '宿舍ID',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`uid`,`uname`,`sex`,`pwd`,`utype`,`age`,`mbanswer`,`tname`,`major`,`isdel`,`pubtime`,`editpwd`,`status`,`clazzid`,`roomid`) values 
(1,'admin','男','123','1',NULL,NULL,'admin',NULL,'1','2018-03-30 15:05:48',NULL,'1',NULL,NULL),
(2,'王夏丽','女','123','2','1','20180001','王夏丽','1','1','2018-04-08 13:22:15',NULL,'1',NULL,NULL),
(3,'张三','男','123','2','18','20180002','张三','生物制药','1','2018-04-07 16:10:36',NULL,'2',2,NULL),
(4,'王涛','男','123','2','19','20180003','王涛','生物制药','1','2018-04-07 22:48:29',NULL,'4',3,5),
(5,'测试用户注册','男','123','2','18','20180090','测试用户注册','冶金','1','2018-04-07 16:10:53',NULL,'3',NULL,NULL),
(6,'test','男','123','2','19','20190087','test','冶金专业','1','2018-04-07 16:06:05',NULL,'4',NULL,NULL),
(7,'小儿子','男','123','2','18','20180001','小儿子','第三方','1','2018-04-07 21:44:20',NULL,'2',NULL,NULL),
(8,'王小二','男','123','2','18','20180076','王小二','海洋轮船','1','2018-04-08 13:55:22',NULL,'4',11,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
