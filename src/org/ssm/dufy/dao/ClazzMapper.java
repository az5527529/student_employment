package org.ssm.dufy.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.ssm.dufy.entity.ClazzDmo;

public interface ClazzMapper {

//获取条数
public int getCount(Map<String, Object> po); 
//分页
public List<ClazzDmo> getByPage(Map<String, Object> map);

int addStudent(ClazzDmo student);

public int edit(@Param("id")String id, @Param("type")String type);

}