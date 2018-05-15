package org.ssm.dufy.dao;

import org.ssm.dufy.entity.ResumeInfo;

public interface ResumeInfoMapper {
    int deleteByPrimaryKey(Integer resumeInfoId);

    int insert(ResumeInfo record);

    int insertSelective(ResumeInfo record);

    ResumeInfo selectByPrimaryKey(Integer resumeInfoId);

    int updateByPrimaryKeySelective(ResumeInfo record);

    int updateByPrimaryKey(ResumeInfo record);
}