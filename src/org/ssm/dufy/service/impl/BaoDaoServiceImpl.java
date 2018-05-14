package org.ssm.dufy.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.ssm.dufy.dao.BaoDaoMapper;
import org.ssm.dufy.entity.Sysuser;
import org.ssm.dufy.service.BaoDaoService;

@Service
public class BaoDaoServiceImpl implements BaoDaoService{
	
	@Autowired
	BaoDaoMapper clazDao;

	@Override
	public List<Sysuser> getByPage(Map<String, Object> map) {
		return clazDao.getByPage(map);
	}

	@Override
	public int getCount(Map<String, Object> po) {
		return clazDao.getCount(po);
	}

	@Override
	public int payMoney(Sysuser user) {
		return clazDao.payMoney(user);
	}

	@Override
	public List<Sysuser> getRoom() {
		return clazDao.getRoom();
	}

	@Override
	public List<Sysuser> getClazzName() {
		return clazDao.getClazzName();
	}

	@Override
	public int updateClazz(Sysuser user) {
		return clazDao.updateClazz(user);
	}

	@Override
	public int updateRoom(Sysuser user) {
		return clazDao.updateRoom(user);
	}

	@Override
	public int updateRoomSurplus(Sysuser user) {
		return clazDao.updateRoomSurplus(user);
	}
 
}
