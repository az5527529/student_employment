package org.ssm.dufy.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.ssm.dufy.dao.StudentResultMapper;
import org.ssm.dufy.entity.StudentInfo;
import org.ssm.dufy.service.StudentResultServier;
@Service
public class StudentInfoServierImpl implements StudentResultServier {
	@Resource
    private StudentResultMapper userdao;
	
	@Override
	public List<StudentInfo> getByPage(Map<String, Object> map) {
		return userdao.getByPage(map);
	}
	@Override
	public int getCount(Map<String, Object> po) {
		return userdao.getCount(po);
	}
	
	@Override
	public int addStudent(StudentInfo student) {
		return userdao.addStudent(student);
	}
	
}
