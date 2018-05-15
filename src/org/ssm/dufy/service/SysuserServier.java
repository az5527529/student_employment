package org.ssm.dufy.service;

import java.util.List;
import java.util.Map;

import org.ssm.dufy.entity.Sysuser;


public interface SysuserServier {
    //  验证后台登录
    public Sysuser adminLogin(Map<String, Object> po);

    //  添加用户
    public int add(Sysuser po);

    //分页显示
    public List<Sysuser> getByPage(Map<String, Object> map);

    //获取信息的条数
    public int getCount(Map<String, Object> po);

    public void update(int id, int isor);

    int insertForgetPwd(Sysuser record);

    //获取条数
    public int getCountToPwd(Map<String, Object> po);

    //分页
    public List<Sysuser> getByPageTopwd(Map<String, Object> map);

    public void update2(int id, int isor);

    Sysuser personInfo(int id);

    Sysuser getClazzName(int id);



    public int dele(String id);

    public int editUser(Sysuser user);
}
