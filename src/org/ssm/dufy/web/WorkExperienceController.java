package org.ssm.dufy.web;

import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.ssm.dufy.entity.WorkExperience;
import org.ssm.dufy.service.WorkExperienceService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by victor on 2018/5/15.
 */
@Controller
@RequestMapping("/workExperience")
public class WorkExperienceController {
    @Autowired
    private WorkExperienceService workExperienceService;
    @RequestMapping(value = "/deleteById.do", method = RequestMethod.POST)
    @ResponseBody
    public String deleteById(HttpServletRequest request,
                             HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        this.workExperienceService.deleteById(Integer.parseInt(id));
        return "1";
    }
    @RequestMapping("/addOrUpdate.do")
    @ResponseBody
    public String addOrUpdate(WorkExperience entity, HttpSession session) {
        if(entity.getWorkExperienceId() != null && entity.getWorkExperienceId() > 0){
            this.workExperienceService.update(entity);
        }else{
            this.workExperienceService.add(entity);
        }
        return JSONObject.fromObject(entity).toString();
    }
}
