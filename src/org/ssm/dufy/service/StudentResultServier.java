package org.ssm.dufy.service;

import java.util.List;
import java.util.Map;

import org.ssm.dufy.entity.StudentInfo;

import com.alibaba.fastjson.JSONObject;



public interface StudentResultServier {
//分页显示
public List<StudentInfo> getByPage(Map<String, Object> map);
//获取信息的条数
public int getCount(Map<String, Object> po);

int addStudent(StudentInfo student);

}
