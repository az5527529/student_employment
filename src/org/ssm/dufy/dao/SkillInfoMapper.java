package org.ssm.dufy.dao;

import org.ssm.dufy.entity.SkillInfo;

public interface SkillInfoMapper {
    int deleteByPrimaryKey(Integer skillInfoId);

    int insert(SkillInfo record);

    int insertSelective(SkillInfo record);

    SkillInfo selectByPrimaryKey(Integer skillInfoId);

    int updateByPrimaryKeySelective(SkillInfo record);

    int updateByPrimaryKey(SkillInfo record);
}