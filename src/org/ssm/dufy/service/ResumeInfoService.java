package org.ssm.dufy.service;

import org.ssm.dufy.entity.ResumeInfo;

import java.util.List;
import java.util.Map;

/**
 * Created by victor on 2018/5/15.
 */
public interface ResumeInfoService {
    //添加简历基础信息
    public int add(ResumeInfo entity);

    //更新信息
    public int update(ResumeInfo entity);

    //删除简历基础信息
    public int deleteById(int id);

    //分页查询
    public List<ResumeInfo> getByPage(Map<String, Object> map);

    //获取总数
    public int getCount(Map<String, Object> map);

    public ResumeInfo getById(int id);

    List<ResumeInfo> getByUserId(Integer userId);
}
