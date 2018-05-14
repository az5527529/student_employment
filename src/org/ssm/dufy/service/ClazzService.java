package org.ssm.dufy.service;

import java.util.List;
import java.util.Map;

import org.ssm.dufy.entity.ClazzDmo;



public interface ClazzService {
//分页显示
public List<ClazzDmo> getByPage(Map<String, Object> map);
//获取信息的条数
public int getCount(Map<String, Object> po);

int addStudent(ClazzDmo student);
public int edit(String id, String type);

}
