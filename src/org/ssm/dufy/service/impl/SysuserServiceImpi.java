package org.ssm.dufy.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.ssm.dufy.dao.SysuserMapper;
import org.ssm.dufy.entity.Sysuser;
import org.ssm.dufy.service.SysuserServier;
@Service
public class SysuserServiceImpi implements SysuserServier {
	@Resource
    private SysuserMapper userdao;
	@Override
	public Sysuser adminLogin(Map<String, Object> po) {
		return userdao.adminLogin(po);
	}
	@Override
	public int add(Sysuser po) {
		return userdao.insert(po);
	}
	
	@Override
	public List<Sysuser> getByPage(Map<String, Object> map) {
		return userdao.getByPage(map);
	}
	@Override
	public int getCount(Map<String, Object> po) {
		return userdao.getCount(po);
	}
	@Override
	public void update(int id,int isor) {
		if(isor==1){
			//全部通过
			userdao.updateAll();
		}else{
			userdao.update(id);
		}
	}
	@Override
	public int insertForgetPwd(Sysuser record) {
		return userdao.insertForgetPwd(record);
	}
	@Override
	public int getCountToPwd(Map<String, Object> po) {
		return userdao.getCountToPwd(po);
	}
	@Override
	public List<Sysuser> getByPageTopwd(Map<String, Object> map) {
		return userdao.getByPageTopwd(map);
	}

	@Override
	public void update2(int id,int isor) {
		if(isor==1){
			//全部通过
			userdao.updateAll2();
		}else{
			userdao.update2(id);
		}
	}
	@Override
	public Sysuser personInfo(int id) {
		return userdao.personInfo(id);
	}
	@Override
	public Sysuser getClazzName(int id) {
		return userdao.getClazzName(id);
	}

	@Override
	public int dele(String id) {
		return userdao.dele(id);
	}
	@Override
	public int editUser(Sysuser user) {
		// TODO Auto-generated method stub
		return userdao.edit(user);
	}
	
}
