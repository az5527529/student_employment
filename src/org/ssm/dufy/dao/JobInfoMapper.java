package org.ssm.dufy.dao;

import org.ssm.dufy.entity.JobInfo;

import java.util.List;
import java.util.Map;

public interface JobInfoMapper {
    int deleteByPrimaryKey(Integer jobInfoId);

    int insert(JobInfo record);

    int insertSelective(JobInfo record);

    JobInfo selectByPrimaryKey(Integer jobInfoId);

    int updateByPrimaryKeySelective(JobInfo record);

    int updateByPrimaryKey(JobInfo record);

    //分页
    public List<JobInfo> getByPage(Map<String, Object> map);

    //获取总数
    public int getCount(Map<String, Object> map);
}