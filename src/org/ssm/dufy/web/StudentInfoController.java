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
import org.ssm.dufy.entity.Dormitory;
import org.ssm.dufy.entity.StudentInfo;
import org.ssm.dufy.service.StudentInfoServier;
import org.ssm.dufy.util.PageBean;
@Controller
public class StudentInfoController {

	@Autowired
	private StudentInfoServier userService;
	
	
	// 学生注册审核管理
	@RequestMapping("roomList.do")
	public String userList(@RequestParam(value = "page", required = false) String page, HttpSession session,
			ModelMap map,HttpServletRequest request) {
		if (page == null || page.equals("")) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		Map<String, Object> cmap = new HashMap<String, Object>();
		
		
		String uid = request.getParameter("id");
		if(uid!=null){
			pmap.put("id", uid);
			cmap.put("uid", uid);
		}else{
			pmap.put("id", null);
			cmap.put("id", null);
		}
		
		
		int total = userService.getCount(cmap);
		pageBean.setTotal(total);
		List<Dormitory> list = userService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "sign/roomList";
	}
	
	@RequestMapping("admin/add_user5.do")
	public String add_user5( ) {
		return "admin/add_user5";
	}
	
	@RequestMapping("addRoom.do")
	@ResponseBody
	public String addRoom(Dormitory dormitory,HttpServletRequest request) {
		String type = request.getParameter("type");
		String building = request.getParameter("building");
		String floor = request.getParameter("floor");
		String roomname = request.getParameter("roomname");
		String total = request.getParameter("total");
		
		dormitory.setBuilding(building);
		dormitory.setFloor(floor);
		dormitory.setRoomname(roomname);
		dormitory.setType(type);
		dormitory.setTotal(total);
		dormitory.setSurplus(total);
		
		String parameter = request.getParameter("cid");
		String parameter2 = request.getParameter("subType");
		if(parameter2.equals("1")){
			dormitory.setId(parameter);
			int addStudent = userService.edit(dormitory);
			if(addStudent>0){
				return "1";
			}
		}else{
			int addStudent = userService.addStudent(dormitory);
			if(addStudent>0){
				return "1";
			}
		}
		
		
		
		return "-1";
	}
	
	@RequestMapping("dele11.do")
	@ResponseBody
	public String dele(HttpServletRequest request) {
		String id = request.getParameter("id");
		int addStudent = userService.dele(id);
		if(addStudent>0){
			return "1";
		}
		return "-1";
	}
	
	// 学生注册审核管理
		@RequestMapping("getQiyeInfo.do")
		@ResponseBody
		public Dormitory getQiyeInfo(HttpServletRequest request) {
			Map<String, Object> pmap = new HashMap<String, Object>();
			Map<String, Object> cmap = new HashMap<String, Object>();
			String uid = request.getParameter("id");
			if(uid!=null){
				pmap.put("id", uid);
				cmap.put("id", uid);
			}else{
				pmap.put("id", null);
				cmap.put("id", null);
			}
			List<Dormitory> list = userService.getByPage(pmap);
			Dormitory dormitory = list.get(0);
			cmap.put("list", list);
			return dormitory;
		}
	
}
