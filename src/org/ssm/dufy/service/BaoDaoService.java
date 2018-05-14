package org.ssm.dufy.service;

import java.util.List;
import java.util.Map;

import org.ssm.dufy.entity.Sysuser;



public interface BaoDaoService {
//分页显示
public List<Sysuser> getByPage(Map<String, Object> map);
//获取信息的条数
public int getCount(Map<String, Object> po);

int payMoney(Sysuser user);

List<Sysuser> getRoom();

List<Sysuser> getClazzName();
int updateClazz(Sysuser user);
int updateRoom(Sysuser user);
int updateRoomSurplus(Sysuser user);

}
