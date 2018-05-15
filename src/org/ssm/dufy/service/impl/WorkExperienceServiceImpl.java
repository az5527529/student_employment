package org.ssm.dufy.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.ssm.dufy.dao.WorkExperienceMapper;
import org.ssm.dufy.entity.WorkExperience;
import org.ssm.dufy.service.WorkExperienceService;

import java.util.List;

/**
 * Created by victor on 2018/5/15.
 */
@Service("workExperienceService")
public class WorkExperienceServiceImpl implements WorkExperienceService {
    @Autowired
    private WorkExperienceMapper workExperienceDao;
    @Override
    public int add(WorkExperience entity) {
        return this.workExperienceDao.insertSelective(entity);
    }

    @Override
    public int update(WorkExperience entity) {
        return this.workExperienceDao.updateByPrimaryKeySelective(entity);
    }

    @Override
    public int deleteById(int id) {
        return this.workExperienceDao.deleteByPrimaryKey(id);
    }

    @Override
    public List<WorkExperience> getByResumeId(int resumeId) {
        return this.workExperienceDao.getByResumeId(resumeId);
    }

    @Override
    public int deleteByResumeId(int id) {
        return this.workExperienceDao.deleteByResumeId(id);
    }
}
