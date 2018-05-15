package org.ssm.dufy.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by victor on 2018/5/14.
 */
public class WebUtil {
    /**
     * controller想view层返回信息的方法
     * @param request
     * @param response
     * @param s
     * @throws IOException
     */
    public static void outputPage(HttpServletRequest request, HttpServletResponse response, String s) throws IOException{
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter printwriter = response.getWriter();
        printwriter.print(s);
        printwriter.close();
    }
}
