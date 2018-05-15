package org.ssm.dufy.service;

import org.ssm.dufy.entity.SkillInfo;

import java.util.List;

/**
 * Created by victor on 2018/5/15.
 */
public interface SkillInfoService {
    //添加技能
    public int add(SkillInfo entity);

    //更新技能
    public int update(SkillInfo entity);

    //删除技能
    public int deleteById(int id);

    //通过简历id获取所有的技能
    public List<SkillInfo> getByResumeId(int resumeId);

    public int deleteByResumeId(int id);
}
