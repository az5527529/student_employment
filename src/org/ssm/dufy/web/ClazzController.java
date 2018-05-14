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
import org.ssm.dufy.service.ClazzService;
import org.ssm.dufy.util.PageBean;
@Controller
public class ClazzController {

	@Autowired
	private ClazzService userService;
	
	
	// 学生注册审核管理
	@RequestMapping("clazzList.do")
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
		List<ClazzDmo> list = userService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "sign/clazzList";
	}
	
	
	@RequestMapping("addClazz.do")
	@ResponseBody
	public String addRoom(ClazzDmo dormitory,HttpServletRequest request) {
		String clazzname = request.getParameter("clazzname");
		String major = request.getParameter("major");
		String xueyuan = request.getParameter("xueyuan");
		
		dormitory.setXueyuan(xueyuan);
		dormitory.setClazzname(clazzname);
		dormitory.setMajor(major);
		
		int addStudent = userService.addStudent(dormitory);
		if(addStudent>0){
			return "1";
		}
		return "-1";
	}
	
	@RequestMapping("class/edit.do")
	@ResponseBody
	public String edit(HttpServletRequest request) {
		String id = request.getParameter("id");
		String type = request.getParameter("type");
		int addStudent = userService.edit(id,type);
		if(addStudent>0){
			return "1";
		}
		return "-1";
	}
	
	
}
