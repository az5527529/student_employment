package org.ssm.dufy.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.ssm.dufy.entity.Dormitory;
import org.ssm.dufy.entity.StudentInfo;

import com.alibaba.fastjson.JSONObject;

public interface StudentInfoMapper {

//获取条数
public int getCount(Map<String, Object> po); 
//分页
public List<Dormitory> getByPage(Map<String, Object> map);

int addStudent(Dormitory student);
public int dele(@Param("id")String id);

int edit(Dormitory student);

}