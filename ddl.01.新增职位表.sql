CREATE TABLE `job_info` (
  `job_info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '职位名称',
  `hire_num` int NOT NULL DEFAULT 0 COMMENT '招聘人数',
  `requirement` varchar(1024) NOT NULL DEFAULT '' COMMENT '需求',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '职位状态,1:招聘中,2:已结束',
  `created_time` varchar(32) NOT NULL DEFAULT '' COMMENT '发布时间',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '企业id',
  PRIMARY KEY (job_info_id),
  key job_info_user_id(user_id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
