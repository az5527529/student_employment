package org.ssm.dufy.web;

import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.ssm.dufy.entity.StudentInfo;
import org.ssm.dufy.service.StudentInfoServier;
import org.ssm.dufy.service.StudentResultServier;
import org.ssm.dufy.util.PageBean;

import com.alibaba.fastjson.JSONObject;
@Controller
public class StudentResultController {

	@Autowired
	private StudentResultServier userService;
	
	
	// 学生注册审核管理
	@RequestMapping("admin/studentInfoListResult.do")
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
		List<StudentInfo> list = userService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "admin/studentResult";
	}
	
	@RequestMapping("admin/add_user6.do")
	public String add_user6( ) {
		return "admin/add_user6";
	}
	
	@RequestMapping("admin/addUser6.do")
	public String addUser6(StudentInfo user, HttpSession session) {
		userService.addStudent(user);
		return "admin/success";
	}
	
	@RequestMapping(value = "admin/exportExcelResult.do",  method = {RequestMethod.POST})  
	 public void exportExcel( HttpServletRequest request, HttpServletResponse response){  
		String[] titles={"姓名","专业","科目","成绩","学分"};
	    BufferedOutputStream bos = null;
		try
		{
			String execlName="学生成绩信息";
			HSSFWorkbook workbook = exportExcelDetail(titles,response,execlName);
	        
	        ServletOutputStream out = response.getOutputStream();
	        workbook.write(out);
	        bos = new BufferedOutputStream(out);
		}
		catch ( IOException e)
		{
			
		}finally {
           if (bos != null)
				try {
					bos.close();
				} catch (IOException e) {
					
				}
       }
	}  
	
	private static HSSFWorkbook exportExcelDetail(String[] titles,HttpServletResponse response,String execlName) throws IOException
	{
		// 设置response参数，可以打开下载页面
       response.reset();
       response.setContentType("application/vnd.ms-excel;charset=utf-8");
       response.setHeader("Content-Disposition", "attachment;filename="+ new String(( execlName+".xls").getBytes(), "iso-8859-1"));

		HSSFWorkbook workbook = null;
		HSSFFont boldFont = null;
		// 创建工作簿实例
		workbook = new HSSFWorkbook();
		// 创建工作表实例
		HSSFSheet sheet = workbook.createSheet("学生成绩信息");
//		sheet.protectSheet("edit");
		// 设置列宽
		for (int i = 0; i < titles.length; i++) {
			sheet.setColumnWidth(i, 3000);
		}
			HSSFRow row = sheet.createRow((short) 0);// 建立新行
			//创建第一行标题
			for (int i = 0; i < titles.length; i++) {
				createCellForTitle(row, i,titles[i],workbook);
			}
			
			boldFont = workbook.createFont();
			boldFont.setFontName("宋体");
			boldFont.setFontHeightInPoints((short) 11);//设置字体大小   
			boldFont.setFontHeight((short) 200);
		return workbook;
	}
   
	/**
	 * 创建Excel单元格--title
	 * 
	 * @param row
	 * @param column
	 * @param style
	 * @param cellType
	 * @param value
	 */
	private static void createCellForTitle(HSSFRow row, int column,Object value,HSSFWorkbook wb)
	{
		HSSFFont boldFont = wb.createFont();
		boldFont.setFontName("宋体");
		boldFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);//粗体显示 
		boldFont.setFontHeightInPoints((short) 12);//设置字体大小  
		
		HSSFCellStyle style = wb.createCellStyle();
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 居中    
		style.setFont(boldFont);
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN); //下边框    
		style.setBorderLeft(HSSFCellStyle.BORDER_THIN);//左边框    
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);//上边框    
		style.setBorderRight(HSSFCellStyle.BORDER_THIN);//右边框
		style.setFillForegroundColor(IndexedColors.BLUE.getIndex());//蓝色
		style.setFillPattern(CellStyle.SOLID_FOREGROUND);
		
		HSSFCell cell = row.createCell(column);
		cell.setCellStyle(style);
		cell.setCellValue(value == null ? "" : value.toString());
	}
	
	@RequestMapping("admin/touploadExeclResult.do")
	public String tobbs( ) {
		return "admin/uploadExeclResult";
	}
	
	@RequestMapping("admin/uploadExeclResult.do")
	public String uploadExecl(HttpServletRequest request) {
		MultipartResolver resolver = new CommonsMultipartResolver(request.getSession().getServletContext());
		MultipartHttpServletRequest multipartRequest = resolver.resolveMultipart(request);
		MultipartFile file = multipartRequest.getFile("imgFile");
		try {
			InputStream is =file.getInputStream();
			Workbook hssfWorkbook = null;
	        if (file.getOriginalFilename().endsWith("xlsx")){
	           hssfWorkbook = new XSSFWorkbook(is);//Excel 2007
	        }else if (file.getOriginalFilename().endsWith("xls")){
	            hssfWorkbook = new HSSFWorkbook(is);//Excel 2003
	        }
	        
	        List<JSONObject> jsonList = new ArrayList<>();
	        JSONObject json = null;
	        DecimalFormat df = new DecimalFormat("0");
	        // 循环工作表Sheet
	        for (int numSheet = 0; numSheet <hssfWorkbook.getNumberOfSheets(); numSheet++) {
	            Sheet hssfSheet = hssfWorkbook.getSheetAt(numSheet);
	            if (hssfSheet == null) {
	                continue;
	            }
	            // 循环行Row
	            for (int rowNum = 1; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {
	                Row hssfRow = hssfSheet.getRow(rowNum);
	                if (hssfRow != null) {
	                	json = new JSONObject();
	                    Cell uname = hssfRow.getCell(0);
	                    Cell major = hssfRow.getCell(1);
	                    Cell subject = hssfRow.getCell(2);
	                    Cell score = hssfRow.getCell(3);
	                    Cell xuefen = hssfRow.getCell(4);
	                    json.put("uname", uname);
	                    json.put("subject", subject);
	                    json.put("score", score);
	                    json.put("major", major);
	                    json.put("xuefen", xuefen);
	                    
	                    jsonList.add(json);
	                }
	            }
	        }
	        
	        StudentInfo user =null;
	        for (int i = 0; i < jsonList.size(); i++) {
	        	user = new StudentInfo();
	        	user.setUname(jsonList.get(i).getString("uname"));
	        	user.setSubject(jsonList.get(i).getString("subject"));
	        	user.setScore(jsonList.get(i).getString("score"));
	        	user.setXuefen(jsonList.get(i).getString("xuefen").replace(",", ""));
	        	user.setMajor(jsonList.get(i).getString("major"));
	        	
	        	userService.addStudent(user);
			}
	        return "admin/success";
		} catch (IOException e) {
			e.printStackTrace();
			return "admin/error_common";
		}
	}
	
}
