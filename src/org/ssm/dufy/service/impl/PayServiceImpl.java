package org.ssm.dufy.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.ssm.dufy.dao.PayMapper;
import org.ssm.dufy.entity.PayDmo;
import org.ssm.dufy.service.PayService;

@Service
public class PayServiceImpl implements PayService{
	
	@Autowired
	PayMapper clazDao;

	@Override
	public List<PayDmo> getByPage(Map<String, Object> map) {
		return clazDao.getByPage(map);
	}

	@Override
	public int getCount(Map<String, Object> po) {
		return clazDao.getCount(po);
	}
 
}
