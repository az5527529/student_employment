package org.ssm.dufy.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.ssm.dufy.dao.StudentInfoMapper;
import org.ssm.dufy.entity.Dormitory;
import org.ssm.dufy.entity.StudentInfo;
import org.ssm.dufy.service.StudentInfoServier;

import com.alibaba.fastjson.JSONObject;
@Service
public class StudentResultServierImpl implements StudentInfoServier {
	@Resource
    private StudentInfoMapper userdao;
	
	@Override
	public List<Dormitory> getByPage(Map<String, Object> map) {
		return userdao.getByPage(map);
	}
	@Override
	public int getCount(Map<String, Object> po) {
		return userdao.getCount(po);
	}
	@Override
	public int addStudent(Dormitory student) {
		return userdao.addStudent(student);
	}
	@Override
	public int dele(String id) {
		return userdao.dele(id);
	}
	@Override
	public int edit(Dormitory student) {
		return userdao.edit(student);
	}
	
}
