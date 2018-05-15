package org.ssm.dufy.web;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.ssm.dufy.entity.ResumeInfo;
import org.ssm.dufy.entity.SkillInfo;
import org.ssm.dufy.entity.Sysuser;
import org.ssm.dufy.entity.WorkExperience;
import org.ssm.dufy.service.ResumeInfoService;
import org.ssm.dufy.service.SkillInfoService;
import org.ssm.dufy.service.WorkExperienceService;
import org.ssm.dufy.util.WebUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by victor on 2018/5/15.
 */
@Controller
@RequestMapping("resumeInfo")
public class ResumeInfoController {
    @Autowired
    private ResumeInfoService resumeInfoService;
    @Autowired
    private WorkExperienceService workExperienceService;
    @Autowired
    private SkillInfoService skillInfoService;
    @RequestMapping(value = "/deleteById.do", method = RequestMethod.POST)
    @ResponseBody
    public String deleteById(HttpServletRequest request,
                             HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        //删除简历
        this.resumeInfoService.deleteById(Integer.parseInt(id));
        //删除工作经验
        this.workExperienceService.deleteByResumeId(Integer.parseInt(id));
        //删除个人技能
        this.skillInfoService.deleteByResumeId(Integer.parseInt(id));
        return "1";
    }
    @RequestMapping("addOrUpdate.do")
    @ResponseBody
    public String addOrUpdate(ResumeInfo entity, HttpSession session) {
        if(entity.getResumeInfoId() != null && entity.getResumeInfoId() > 0){
            this.resumeInfoService.update(entity);
        }else{
            Sysuser user = (Sysuser) session.getAttribute("auser");
            entity.setUserId(user.getUid());
            this.resumeInfoService.add(entity);
        }

        return JSONObject.fromObject(entity).toString();
    }

    @RequestMapping(value = "/getByPage.do", method = RequestMethod.POST)
    public void getByPage(HttpServletRequest request,
                          HttpServletResponse response) throws IOException {
        Sysuser user = (Sysuser) request.getSession().getAttribute("auser");
        Map<String,Object> paramMap = new HashMap<String,Object>();

        String resumeName = request.getParameter("resumeName");
        String limit = request.getParameter("limit");//页面大小
        String offset = request.getParameter("offset");//页码

        paramMap.put("resumeName",resumeName);
        paramMap.put("pageSize",Integer.parseInt(limit));
        paramMap.put("pageNo",Integer.parseInt(offset));
        paramMap.put("userId",user.getUid());
        JSONObject o = new JSONObject();
        List<ResumeInfo> list = this.resumeInfoService.getByPage(paramMap);
        o.put("total", resumeInfoService.getCount(paramMap));
        o.put("rows", list);
        WebUtil.outputPage(request, response, o.toString());
    }

    @RequestMapping("/editResume.do")
    public String editResume(Integer id, HttpSession session,
                           ModelMap map, HttpServletRequest request) {
        //获取简历
        ResumeInfo resumeInfo = this.resumeInfoService.getById(id);
        //获取工作经验
        List<WorkExperience> workList = this.workExperienceService.getByResumeId(id);
        //获取个人技能
        List<SkillInfo> skillList = this.skillInfoService.getByResumeId(id);

        map.put("resumeInfo",JSONObject.fromObject(resumeInfo).toString());
        map.put("workList",workList == null ? "" : JSONArray.fromObject(workList).toString());
        map.put("skillList",skillList == null ? "" : JSONArray.fromObject(skillList).toString());
        map.put("isDetail",request.getParameter("isDetail") == null || "".equals(request.getParameter("isDetail").trim()) ? false : true);
        map.put("id",id);
        return "sign/editResume";
    }

    @RequestMapping(value = "/getByUserId.do", method = RequestMethod.POST)
    public void getByUserId(HttpServletRequest request,
                          HttpServletResponse response) throws IOException {
        Sysuser user = (Sysuser) request.getSession().getAttribute("auser");

        JSONObject o = new JSONObject();
        List<ResumeInfo> list = this.resumeInfoService.getByUserId(user.getUid());
        WebUtil.outputPage(request, response, JSONArray.fromObject(list).toString());
    }
}
