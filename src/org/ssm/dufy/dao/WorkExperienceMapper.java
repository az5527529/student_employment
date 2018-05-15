package org.ssm.dufy.dao;

import org.ssm.dufy.entity.WorkExperience;

public interface WorkExperienceMapper {
    int deleteByPrimaryKey(Integer workExperienceId);

    int insert(WorkExperience record);

    int insertSelective(WorkExperience record);

    WorkExperience selectByPrimaryKey(Integer workExperienceId);

    int updateByPrimaryKeySelective(WorkExperience record);

    int updateByPrimaryKey(WorkExperience record);
}