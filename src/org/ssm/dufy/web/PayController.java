package org.ssm.dufy.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.ssm.dufy.entity.PayDmo;
import org.ssm.dufy.service.PayService;
import org.ssm.dufy.util.PageBean;
@Controller
public class PayController {

	@Autowired
	private PayService userService;
	
	
	// 学生注册审核管理
	@RequestMapping("payList.do")
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
		List<PayDmo> list = userService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "sign/payList";
	}
	
	
	
}
