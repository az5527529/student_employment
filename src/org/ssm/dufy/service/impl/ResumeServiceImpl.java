package org.ssm.dufy.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.ssm.dufy.dao.ResumeInfoMapper;
import org.ssm.dufy.entity.ResumeInfo;
import org.ssm.dufy.service.ResumeInfoService;

import java.util.List;
import java.util.Map;

/**
 * Created by victor on 2018/5/15.
 */
@Service("resumeService")
public class ResumeServiceImpl implements ResumeInfoService {
    @Autowired
    private ResumeInfoMapper resumeInfoDao;
    @Override
    public int add(ResumeInfo entity) {
        return resumeInfoDao.insertSelective(entity);
    }

    @Override
    public int update(ResumeInfo entity) {
        return resumeInfoDao.updateByPrimaryKeySelective(entity);
    }

    @Override
    public int deleteById(int id) {
        return resumeInfoDao.deleteByPrimaryKey(id);
    }

    @Override
    public List<ResumeInfo> getByPage(Map<String, Object> map) {
        return resumeInfoDao.getByPage(map);
    }

    @Override
    public int getCount(Map<String, Object> map) {
        return resumeInfoDao.getCount(map);
    }

    @Override
    public ResumeInfo getById(int id) {
        return this.resumeInfoDao.selectByPrimaryKey(id);
    }

    @Override
    public List<ResumeInfo> getByUserId(Integer userId) {
        return this.resumeInfoDao.getByUserId(userId);
    }
}
