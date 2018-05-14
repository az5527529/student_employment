package org.ssm.dufy.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.ssm.dufy.dao.ClazzMapper;
import org.ssm.dufy.entity.ClazzDmo;
import org.ssm.dufy.service.ClazzService;

@Service
public class ClazzServiceImpl implements ClazzService{
	
	@Autowired
	ClazzMapper clazDao;

	@Override
	public List<ClazzDmo> getByPage(Map<String, Object> map) {
		return clazDao.getByPage(map);
	}

	@Override
	public int getCount(Map<String, Object> po) {
		return clazDao.getCount(po);
	}

	@Override
	public int addStudent(ClazzDmo student) {
		return clazDao.addStudent(student);
	}

	@Override
	public int edit(String id, String type) {
		return clazDao.edit(id, type);
	}
 
}
