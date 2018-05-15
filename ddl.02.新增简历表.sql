drop table if exists resume_info;
CREATE TABLE `resume_info` (
  `resume_info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `resume_name` varchar(64) NOT NULL DEFAULT '' COMMENT '简历名称',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '姓名',
  `telephone` varchar(20) NOT NULL DEFAULT '' COMMENT '电话',
  `major` varchar(64) NOT NULL DEFAULT '' COMMENT '专业',
  `school` varchar(64) NOT NULL DEFAULT '' COMMENT '毕业学校',
  `birthday` varchar(32) NOT NULL DEFAULT '' COMMENT '出生年月',
  `graduate_time` varchar(32) NOT NULL DEFAULT '' COMMENT '毕业时间',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '学生id',
  PRIMARY KEY (resume_info_id),
  key resume_info_user_id(user_id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
