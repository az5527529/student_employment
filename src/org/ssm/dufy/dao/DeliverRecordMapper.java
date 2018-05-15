package org.ssm.dufy.dao;

import org.ssm.dufy.entity.DeliverRecord;

import java.util.List;
import java.util.Map;

public interface DeliverRecordMapper {
    int deleteByPrimaryKey(Integer deliverRecordId);

    int insert(DeliverRecord record);

    int insertSelective(DeliverRecord record);

    DeliverRecord selectByPrimaryKey(Integer deliverRecordId);

    int updateByPrimaryKeySelective(DeliverRecord record);

    int updateByPrimaryKey(DeliverRecord record);
    //分页
    public List<Map> getByPage(Map<String, Object> map);

    //获取总数
    public int getCount(Map<String, Object> map);

}