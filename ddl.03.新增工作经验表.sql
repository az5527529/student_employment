CREATE TABLE `work_experience` (
  `work_experience_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `company` varchar(64) NOT NULL DEFAULT '' COMMENT '公司名称',
  `job` varchar(64) NOT NULL DEFAULT '' COMMENT '职位',
  `description` varchar(1024) NOT NULL DEFAULT '' COMMENT '工作描述',
  `start_time` varchar(32) NOT NULL DEFAULT '' COMMENT '开始年月',
  `end_time` varchar(32) NOT NULL DEFAULT '' COMMENT '结束年月',
  `resume_info_id` int(11) NOT NULL DEFAULT 0 COMMENT '简历id',
  PRIMARY KEY (work_experience_id),
  key work_experience_resume_info_id(resume_info_id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
