package org.ssm.dufy.dao;

import java.util.List;
import java.util.Map;

import org.ssm.dufy.entity.Sysuser;

public interface BaoDaoMapper {

//获取条数
public int getCount(Map<String, Object> po); 
//分页
public List<Sysuser> getByPage(Map<String, Object> map);

int payMoney(Sysuser user);

List<Sysuser> getRoom();

List<Sysuser> getClazzName();

int updateClazz(Sysuser user);
int updateRoom(Sysuser user);
int updateRoomSurplus(Sysuser user);


}