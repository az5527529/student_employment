package org.ssm.dufy.dao;

import org.ssm.dufy.entity.SkillInfo;

import java.util.List;

public interface SkillInfoMapper {
    int deleteByPrimaryKey(Integer skillInfoId);

    int insert(SkillInfo record);

    int insertSelective(SkillInfo record);

    SkillInfo selectByPrimaryKey(Integer skillInfoId);

    int updateByPrimaryKeySelective(SkillInfo record);

    int updateByPrimaryKey(SkillInfo record);

    List<SkillInfo> getByResumeId(Integer resumeInfoId);

    int deleteByResumeId(Integer resumeInfoId);
}