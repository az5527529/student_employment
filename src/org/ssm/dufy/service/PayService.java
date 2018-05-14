package org.ssm.dufy.service;

import java.util.List;
import java.util.Map;

import org.ssm.dufy.entity.PayDmo;



public interface PayService {
//分页显示
public List<PayDmo> getByPage(Map<String, Object> map);
//获取信息的条数
public int getCount(Map<String, Object> po);


}
