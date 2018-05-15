package org.ssm.dufy.service;

import org.ssm.dufy.entity.WorkExperience;

import java.util.List;

/**
 * Created by victor on 2018/5/15.
 */
public interface WorkExperienceService {
    //添加工作经验
    public int add(WorkExperience entity);

    //更新工作经验
    public int update(WorkExperience entity);

    //删除工作经验
    public int deleteById(int id);

    //通过简历id获取所有的工作经验
    public List<WorkExperience> getByResumeId(int resumeId);

    public int deleteByResumeId(int id);
}
