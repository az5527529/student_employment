package org.ssm.dufy.dao;

import org.ssm.dufy.entity.ResumeInfo;

import java.util.List;
import java.util.Map;

public interface ResumeInfoMapper {
    int deleteByPrimaryKey(Integer resumeInfoId);

    int insert(ResumeInfo record);

    int insertSelective(ResumeInfo record);

    ResumeInfo selectByPrimaryKey(Integer resumeInfoId);

    int updateByPrimaryKeySelective(ResumeInfo record);

    int updateByPrimaryKey(ResumeInfo record);

    //分页
    public List<ResumeInfo> getByPage(Map<String, Object> map);

    //获取总数
    public int getCount(Map<String, Object> map);

    List<ResumeInfo> getByUserId(Integer userId);
}