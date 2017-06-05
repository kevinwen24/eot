package com.eot.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.eot.common.Constants;
import com.eot.exception.ExistSchoolInfoException;
import com.eot.service.IStudentService;

@Controller
@RequestMapping(Constants.APP_URL_MANAGER)
public class StudentController {
	
     @Autowired
     private IStudentService studentService;
     
     @RequestMapping(value = "/batchimport", method = RequestMethod.POST)
     public ModelAndView batchimport(@RequestParam(value="filename") MultipartFile file,
             HttpServletRequest request,HttpServletResponse response) throws IOException{
         //log.info("AddController ..batchimport() start");
         //判断文件是否为空
    	 ModelAndView modelAndView = new ModelAndView("redirect:/page/manager/forward?action=show_add_student");
         if(file==null) return null;
         //获取文件名
         String name=file.getOriginalFilename();
         //进一步判断文件是否为空（即判断其大小是否为0或其名称是否为null）
         long size=file.getSize();
         if(name==null || ("").equals(name) && size==0) return null;
         
         //批量导入。参数：文件名，文件。
         boolean b;
         try {
        	 b = studentService.batchImport(name,file);
         } catch (ExistSchoolInfoException e) {
			 request.getSession().setAttribute("msg","导入失败! "+e.getMessage());  
			 return modelAndView;
			// e.printStackTrace();
         }
         
         String Msg ="批量导入学生成功！";
         request.getSession().setAttribute("msg",Msg);    
         return modelAndView;
     }
}
