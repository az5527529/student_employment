package org.ssm.dufy.web;

import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.ssm.dufy.entity.JobInfo;
import org.ssm.dufy.entity.Sysuser;
import org.ssm.dufy.service.JobInfoService;
import org.ssm.dufy.util.WebUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by victor on 2018/5/14.
 */
@Controller
@RequestMapping("/jobInfo")
public class JobInfoController {
    @Autowired
    private JobInfoService jobInfoService;
    @RequestMapping(value = "/deleteById.do", method = RequestMethod.POST)
    @ResponseBody
    public String deleteById(HttpServletRequest request,
                           HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        this.jobInfoService.deleteById(Integer.parseInt(id));
        return "1";
    }
    @RequestMapping("addOrUpdate.do")
    @ResponseBody
    public String addOrUpdate(JobInfo entity, HttpSession session) {
        if(entity.getJobInfoId() != null && entity.getJobInfoId() > 0){
            this.jobInfoService.update(entity);
        }else{
            Sysuser user = (Sysuser) session.getAttribute("auser");
            entity.setUserId(user.getUid());
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            //发布时间
            entity.setCreatedTime(sdf.format(new Date()));
            this.jobInfoService.add(entity);
        }

        return "1";
    }

    @RequestMapping(value = "/getByPage.do", method = RequestMethod.POST)
    public void getByPage(HttpServletRequest request,
                           HttpServletResponse response) throws IOException {
        Sysuser user = (Sysuser) request.getSession().getAttribute("auser");
        Map<String,Object> paramMap = new HashMap<String,Object>();

        String jobName = request.getParameter("jobName");
        String status = request.getParameter("status");
        String limit = request.getParameter("limit");//页面大小
        String offset = request.getParameter("offset");//页码

        paramMap.put("jobName",jobName);
        paramMap.put("status",status);
        paramMap.put("pageSize",Integer.parseInt(limit));
        paramMap.put("pageNo",Integer.parseInt(offset));
        //如果是企业登录，则只能查自己的职位
        if("3".equals(user == null ? "" : user.getUtype())){
            paramMap.put("userId",user.getUid());
        }
        JSONObject o = new JSONObject();
        List<JobInfo> list = this.jobInfoService.getByPage(paramMap);
        o.put("total", jobInfoService.getCount(paramMap));
        o.put("rows", list);
        WebUtil.outputPage(request, response, o.toString());
    }
}
