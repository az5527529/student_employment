CREATE TABLE `deliver_record` (
  `deliver_record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `job_info_id` int(11) NOT NULL DEFAULT 0 COMMENT '职位id',
  `resume_info_id` int(11) NOT NULL DEFAULT 0 COMMENT '简历id',
  `deliver_time` varchar(32) NOT NULL DEFAULT 0 COMMENT '投递时间',
  PRIMARY KEY (deliver_record_id),
  key deliver_record_job_info_id(job_info_id),
  key deliver_record_resume_info_id(resume_info_id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
