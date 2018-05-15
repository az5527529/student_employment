package org.ssm.dufy.service;

import org.ssm.dufy.entity.JobInfo;

import java.util.List;
import java.util.Map;

/**
 * Created by victor on 2018/5/14.
 */
public interface JobInfoService {
    //添加职位信息
    public int add(JobInfo entity);

    //更新信息
    public int update(JobInfo entity);

    //删除职位
    public int deleteById(int id);

    //分页查询
    public List<JobInfo> getByPage(Map<String, Object> map);

    //获取总数
    public int getCount(Map<String, Object> map);
}
