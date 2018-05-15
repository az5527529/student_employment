package org.ssm.dufy.dao;

import org.ssm.dufy.entity.WorkExperience;

import java.util.List;

public interface WorkExperienceMapper {
    int deleteByPrimaryKey(Integer workExperienceId);

    int insert(WorkExperience record);

    int insertSelective(WorkExperience record);

    WorkExperience selectByPrimaryKey(Integer workExperienceId);

    int updateByPrimaryKeySelective(WorkExperience record);

    int updateByPrimaryKey(WorkExperience record);

    List<WorkExperience> getByResumeId(Integer resumeInfoId);

    int deleteByResumeId(Integer resumeInfoId);
}