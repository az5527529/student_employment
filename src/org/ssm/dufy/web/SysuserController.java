package org.ssm.dufy.web;

import java.sql.Timestamp;
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
import org.ssm.dufy.entity.Sysuser;
import org.ssm.dufy.service.SysuserServier;
import org.ssm.dufy.util.PageBean;

@Controller
public class SysuserController {

    @Autowired
    private SysuserServier userService;

    @RequestMapping("login.do")
    @ResponseBody
    public String checkLogin(HttpSession session, HttpServletRequest request) {
        Map<String, Object> u = new HashMap<String, Object>();
        Sysuser user = new Sysuser();
        u.put("uname", request.getParameter("uname"));
        u.put("utype", request.getParameter("utype"));
        u.put("pwd", request.getParameter("pwd"));

        user = userService.adminLogin(u);
        if (user != null) {
            session.setAttribute("auser", user);
            System.out.println("auser=" + user);
            return "1";
        } else {
            return "-1";
        }
    }

    // 管理员注册
    @RequestMapping("admin/addUser2.do")
    @ResponseBody
    public String addUser2(Sysuser user, HttpSession session) {
        user.setIsdel("1");
        Timestamp time = new Timestamp(System.currentTimeMillis());
        user.setPubtime(time.toString());
        userService.add(user);
        return "1";
    }

    @RequestMapping("index.do")
    public String tobbs() {
        return "sign/index";
    }

    @RequestMapping("toLogin.do")
    public String toLogin() {
        return "login";
    }

    @RequestMapping("infoManage.do")
    public String userList(@RequestParam(value = "page", required = false) String page, HttpSession session,
                           ModelMap map, HttpServletRequest request) {
        if (page == null || page.equals("")) {
            page = "1";
        }
        PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
        Map<String, Object> pmap = new HashMap<String, Object>();
        pmap.put("pageno", pageBean.getStart());
        pmap.put("pageSize", pageBean.getPageSize());
        Map<String, Object> cmap = new HashMap<String, Object>();
        pmap.put("utype", request.getParameter("type"));
        cmap.put("utype", request.getParameter("type"));
        pmap.put("isdel", "1");
        cmap.put("isdel", "1");

        String uid = request.getParameter("uid");
        if (uid != null) {
            pmap.put("uid", uid);
            cmap.put("uid", uid);
        } else {
            pmap.put("uid", null);
            cmap.put("uid", null);
        }

        int total = userService.getCount(cmap);
        pageBean.setTotal(total);
        List<Sysuser> list = userService.getByPage(pmap);
        map.put("page", pageBean);
        map.put("list", list);
        return "sign/grids";
    }


    @RequestMapping("admin/deleForStudent.do")
    @ResponseBody
    public String dele(HttpServletRequest request) {
        String id = request.getParameter("id");
        int addStudent = userService.dele(id);
        if (addStudent > 0) {
            return "1";
        }
        return "-1";
    }

    // 管理员注册
    @RequestMapping("editUser.do")
    @ResponseBody
    public String editUser(Sysuser user, HttpSession session, HttpServletRequest request) {
        user.setAge(request.getParameter("age"));
        user.setPwd(request.getParameter("txtPwd"));
        user.setMajor(request.getParameter("major"));
        user.setUid(Integer.valueOf(request.getParameter("id")));
        userService.editUser(user);
        return "1";
    }

    @RequestMapping("qiyeInfo.do")
    public String qiyeInfo(@RequestParam(value = "page", required = false) String page, HttpSession session,
                           ModelMap map, HttpServletRequest request) {
        if (page == null || page.equals("")) {
            page = "1";
        }
        PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
        Map<String, Object> pmap = new HashMap<String, Object>();
        pmap.put("pageno", pageBean.getStart());
        pmap.put("pageSize", pageBean.getPageSize());
        Map<String, Object> cmap = new HashMap<String, Object>();
        pmap.put("utype", request.getParameter("type"));
        cmap.put("utype", request.getParameter("type"));
        pmap.put("isdel", "1");
        cmap.put("isdel", "1");

        String uid = request.getParameter("uid");
        if (uid != null) {
            pmap.put("uid", uid);
            cmap.put("uid", uid);
        } else {
            pmap.put("uid", null);
            cmap.put("uid", null);
        }

        int total = userService.getCount(cmap);
        pageBean.setTotal(total);
        List<Sysuser> list = userService.getByPage(pmap);
        map.put("page", pageBean);
        map.put("list", list);
        return "sign/qiyeInfo";
    }

    @RequestMapping("logout.do")
    public String logout(HttpSession session, HttpServletRequest request) {
        session.removeAttribute("auser");
        return "login";
    }
}
