package org.ssm.dufy.dao;

import java.util.List;
import java.util.Map;

import org.ssm.dufy.entity.StudentInfo;

public interface StudentResultMapper {

//获取条数
public int getCount(Map<String, Object> po); 
//分页
public List<StudentInfo> getByPage(Map<String, Object> map);

int addStudent(StudentInfo student);

}