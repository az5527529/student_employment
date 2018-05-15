package org.ssm.dufy.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.ssm.dufy.dao.DeliverRecordMapper;
import org.ssm.dufy.entity.DeliverRecord;
import org.ssm.dufy.service.DeliverRecordService;

import java.util.List;
import java.util.Map;

/**
 * Created by victor on 2018/5/16.
 */
@Service("deliverRecordService")
public class DeliverRecordServiceImpl implements DeliverRecordService {
    @Autowired
    private DeliverRecordMapper deliverRecordDao;
    @Override
    public int add(DeliverRecord entity) {
        return this.deliverRecordDao.insertSelective(entity);
    }

    @Override
    public int update(DeliverRecord entity) {
        return this.deliverRecordDao.updateByPrimaryKeySelective(entity);
    }

    @Override
    public int deleteById(int id) {
        return this.deliverRecordDao.deleteByPrimaryKey(id);
    }

    @Override
    public List<Map> getByPage(Map<String, Object> map) {
        return this.deliverRecordDao.getByPage(map);
    }

    @Override
    public int getCount(Map<String, Object> map) {
        return this.deliverRecordDao.getCount(map);
    }
}
