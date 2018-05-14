package org.ssm.dufy.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.ssm.dufy.entity.PayDmo;
import org.ssm.dufy.entity.Sysuser;

public interface SysuserMapper {

    int insert(Sysuser record);
    
    int insertForgetPwd(Sysuser record);

//  验证后台登录
  public Sysuser adminLogin(Map<String, Object> po);
  
//获取条数
public int getCount(Map<String, Object> po); 
//分页
public List<Sysuser> getByPage(Map<String, Object> map);

	int update(@Param("uid")int id);
	
	int updateAll();
	
	//获取条数
	public int getCountToPwd(Map<String, Object> po); 
	//分页
	public List<Sysuser> getByPageTopwd(Map<String, Object> map);
	
	int update2(@Param("uid")int id);
	
	int updateAll2();
	
	Sysuser personInfo(@Param("uid")int id);

	Sysuser getClazzName(@Param("id")int id);
	
	Sysuser getRoom(@Param("id")int id);
	
	PayDmo getPayInfo(@Param("uid")int id);
	
	int addPayInfo(@Param("userid")int id);

	int dele(@Param("id")String id);

	int edit(Sysuser user);
}