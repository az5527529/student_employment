package org.ssm.dufy.web;

import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.ssm.dufy.entity.DeliverRecord;
import org.ssm.dufy.entity.JobInfo;
import org.ssm.dufy.entity.Sysuser;
import org.ssm.dufy.service.DeliverRecordService;
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
 * Created by victor on 2018/5/16.
 */
@Controller
@RequestMapping("/deliverRecord")
public class DeliverRecordController {
    @Autowired
    private DeliverRecordService deliverRecordService;
    @RequestMapping(value = "/deleteById.do", method = RequestMethod.POST)
    @ResponseBody
    public String deleteById(HttpServletRequest request,
                             HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        this.deliverRecordService.deleteById(Integer.parseInt(id));
        return "1";
    }
    @RequestMapping("addOrUpdate.do")
    @ResponseBody
    public String addOrUpdate(DeliverRecord entity, HttpSession session) {
        if(entity.getDeliverRecordId() != null && entity.getDeliverRecordId() > 0){
            this.deliverRecordService.update(entity);
        }else{
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            //发布时间
            entity.setDeliverTime(sdf.format(new Date()));
            this.deliverRecordService.add(entity);
        }

        return "1";
    }

    @RequestMapping(value = "/getByPage.do", method = RequestMethod.POST)
    public void getByPage(HttpServletRequest request,
                          HttpServletResponse response) throws IOException {
        Map<String,Object> paramMap = new HashMap<String,Object>();

        String jobInfoId = request.getParameter("jobInfoId");
        String userId = request.getParameter("userId");
        String limit = request.getParameter("limit");//页面大小
        String offset = request.getParameter("offset");//页码

        paramMap.put("jobInfoId",jobInfoId);
        paramMap.put("userId",userId);
        paramMap.put("pageSize",Integer.parseInt(limit));
        paramMap.put("pageNo",Integer.parseInt(offset));

        JSONObject o = new JSONObject();
        List<Map> list = this.deliverRecordService.getByPage(paramMap);
        o.put("total", deliverRecordService.getCount(paramMap));
        o.put("rows", list);
        WebUtil.outputPage(request, response, o.toString());
    }
}
