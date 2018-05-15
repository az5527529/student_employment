package org.ssm.dufy.service;

import org.ssm.dufy.entity.DeliverRecord;

import java.util.List;
import java.util.Map;

/**
 * Created by victor on 2018/5/16.
 */
public interface DeliverRecordService {
    //添加投递信息
    public int add(DeliverRecord entity);

    //更新信息
    public int update(DeliverRecord entity);

    //删除投递
    public int deleteById(int id);

    //分页查询
    public List<Map> getByPage(Map<String, Object> map);

    //获取总数
    public int getCount(Map<String, Object> map);
}
