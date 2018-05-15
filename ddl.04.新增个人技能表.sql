CREATE TABLE `skill_info` (
  `skill_info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `skill_name` varchar(64) NOT NULL DEFAULT '' COMMENT '技能名称',
  `skill_ability` tinyint NOT NULL DEFAULT 0 COMMENT '掌握程度',

  `resume_info_id` int(11) NOT NULL DEFAULT 0 COMMENT '简历id',
  PRIMARY KEY (skill_info_id),
  key skill_info_resume_info_id(resume_info_id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
