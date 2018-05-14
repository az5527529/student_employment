package org.ssm.dufy.dao;

import java.util.List;
import java.util.Map;

import org.ssm.dufy.entity.PayDmo;

public interface PayMapper {

//获取条数
public int getCount(Map<String, Object> po); 
//分页
public List<PayDmo> getByPage(Map<String, Object> map);


}