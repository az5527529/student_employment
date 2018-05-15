package org.ssm.dufy.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.ssm.dufy.dao.SkillInfoMapper;
import org.ssm.dufy.entity.SkillInfo;
import org.ssm.dufy.service.SkillInfoService;

import java.util.List;

/**
 * Created by victor on 2018/5/15.
 */
@Service("skillInfoService")
public class SkillInfoServiceImpl implements SkillInfoService {
    @Autowired
    private SkillInfoMapper skillInfoDao;
    @Override
    public int add(SkillInfo entity) {
        return skillInfoDao.insertSelective(entity);
    }

    @Override
    public int update(SkillInfo entity) {
        return this.skillInfoDao.updateByPrimaryKeySelective(entity);
    }

    @Override
    public int deleteById(int id) {
        return this.skillInfoDao.deleteByPrimaryKey(id);
    }

    @Override
    public List<SkillInfo> getByResumeId(int resumeId) {
        return this.skillInfoDao.getByResumeId(resumeId);
    }

    @Override
    public int deleteByResumeId(int id) {
        return this.skillInfoDao.deleteByResumeId(id);
    }
}
