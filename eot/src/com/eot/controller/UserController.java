package com.eot.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eot.common.Constants;
import com.eot.model.User;
import com.eot.service.IStudentService;

@Controller
@RequestMapping(Constants.APP_URL_Student_PREFIX)
public class UserController extends BaseController{
	
	@Autowired
	private IStudentService studentService;

	@RequestMapping("/modifypass")
	public ModelAndView modifyPassword(
										@RequestParam(value = "password", defaultValue = "0" ) String password,
										HttpSession session
										){
		ModelAndView modelAndView = new ModelAndView("redirect:/page/student/show");
		User user = (User)session.getAttribute("user");
		int studentNo = 13270132;
		if(studentNo != 0 && !"0".equals(password)  && password != "") {
			
			studentService.updatePasswordByUserNo(13270132, password);
			session.setAttribute("success_message", "重置密码成功！");
		} else {
			session.setAttribute("fail_message", "重置密码失败！");
		}
		return modelAndView;
	}
	
}
