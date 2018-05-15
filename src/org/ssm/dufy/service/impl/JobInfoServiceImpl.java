package org.ssm.dufy.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.ssm.dufy.dao.JobInfoMapper;
import org.ssm.dufy.entity.JobInfo;
import org.ssm.dufy.service.JobInfoService;

import java.util.List;
import java.util.Map;

/**
 * Created by victor on 2018/5/14.
 */
@Service("jobInfoService")
public class JobInfoServiceImpl implements JobInfoService {
    @Autowired
    private JobInfoMapper jobInfoDao;
    @Override
    public int add(JobInfo entity) {
        return jobInfoDao.insertSelective(entity);
    }

    @Override
    public int update(JobInfo entity) {
        return jobInfoDao.updateByPrimaryKeySelective(entity);
    }

    @Override
    public int deleteById(int id) {
        return jobInfoDao.deleteByPrimaryKey(id);
    }

    @Override
    public List<JobInfo> getByPage(Map<String, Object> map) {
        return this.jobInfoDao.getByPage(map);
    }

    @Override
    public int getCount(Map<String, Object> map) {
        return this.jobInfoDao.getCount(map);
    }
}
