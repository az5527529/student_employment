package org.ssm.dufy.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.ssm.dufy.entity.ClazzDmo;
import org.ssm.dufy.entity.Sysuser;
import org.ssm.dufy.service.BaoDaoService;
import org.ssm.dufy.util.PageBean;
@Controller
public class BaoDaoController {

	@Autowired
	private BaoDaoService userService;
	
	
	// 学生注册审核管理
	@RequestMapping("baoDaoList.do")
	public String userList(@RequestParam(value = "page", required = false) String page, HttpSession session,
			ModelMap map) {
		if (page == null || page.equals("")) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		Map<String, Object> cmap = new HashMap<String, Object>();
		
		int total = userService.getCount(cmap);
		pageBean.setTotal(total);
		List<Sysuser> list = userService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "sign/baoDaoList";
	}
	
	@RequestMapping("payMoney.do")
	@ResponseBody
	public String payMoney(Sysuser user,HttpServletRequest request) {
		String id = request.getParameter("id");
		String status = request.getParameter("status");
		
		user.setUid(Integer.valueOf(id));
		user.setStatus(status);
		
		int addStudent = userService.payMoney(user);
		if(addStudent>0){
			return "1";
		}
		return "-1";
	}
	
	@RequestMapping("getRoom.do")
	@ResponseBody
	public List<Sysuser> getRoom(Sysuser user,HttpServletRequest request) {
		return userService.getRoom();
	}
	
	@RequestMapping("getClazzName.do")
	@ResponseBody
	public List<Sysuser> getClazzName(Sysuser user,HttpServletRequest request) {
		return userService.getClazzName();
	}
	
	@RequestMapping("addRoomOrClazz.do")
	@ResponseBody
	public String addRoom(Sysuser user,HttpServletRequest request) {
		String id = request.getParameter("id");
		String status = request.getParameter("status");
		String clazzid = request.getParameter("clazzid");
		
		String type = request.getParameter("type");
		if(type.equals("1")){
			//分班
			user.setStatus(status);
			user.setUid(Integer.valueOf(id));
			user.setClazzName(clazzid);
			userService.updateClazz(user);
		}else{
			//分宿舍
			user.setStatus(status);
			user.setUid(Integer.valueOf(id));
			user.setRoomname(clazzid);
			
			userService.updateRoom(user);
			userService.updateRoomSurplus(user);
		}
		
		return "1";
	}
	
}
