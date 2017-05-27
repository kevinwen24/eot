package com.eot.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eot.common.Constants;
import com.eot.model.User;
import com.eot.service.IUserService;
import com.eot.util.GetterUtil;
import com.sun.javafx.image.impl.ByteIndexed.Getter;

@Controller
@RequestMapping(Constants.APP_URL_USER_PREFIX)
public class UserController extends BaseController{
	
	@Autowired
	private IUserService userService;

	@RequestMapping("/student/modifypass")
	public ModelAndView modifyPassword(
										@RequestParam(value = "password", defaultValue = "0" ) String password,
										HttpSession session
										){
		ModelAndView modelAndView = new ModelAndView("redirect:/page/student/show");
		User user = (User)session.getAttribute("user");
		int studentNo = user.getUserId();
		if(studentNo != 0 && !"0".equals(password)  && password != "") {
			
			userService.updatePasswordByUserNo(13270132, password);
			session.setAttribute("success_message", "重置密码成功！");
		} else {
			session.setAttribute("fail_message", "重置密码失败！");
		}
		return modelAndView;
	}
	
	@RequestMapping("/login")
	public String modifyPassword(){
		return "login";
	}
	
	@RequestMapping("/save_login")
	public ModelAndView saveLogin(
			HttpServletRequest request,
			HttpSession session
							){
		ModelAndView modelAndView = null;
		String password = request.getParameter("password");
		String userId = request.getParameter("userId");
		String roleId = request.getParameter("role");
		
		if(!GetterUtil.isNum(userId) || !GetterUtil.isNum(roleId)){
			modelAndView = new ModelAndView();
			modelAndView.addObject("msg","账号输入不合法,必须是数字类型！");
			modelAndView.setViewName("login");
			return modelAndView;
		}
		
		User user = userService.getUserByUserId(Integer.parseInt(userId));
		int role = Integer.parseInt(roleId);
		
		if(user == null || (user != null && !user.getPassword().equals(password))){
			modelAndView = new ModelAndView();
			modelAndView.addObject("msg","用户名或密码错误！");
			modelAndView.setViewName("login");
			return modelAndView;
		}
		
		if(user.getPassword().equals(password) && user.getRoleId() == role){
			session.setAttribute("user", user);
			if(role == 1){
				modelAndView = new ModelAndView("redirect:/page/manager/teacher_class");
			}else if(role == 2){

			}else if(role == 3){
				modelAndView = new ModelAndView("redirect:/page/student/show");
			}
		}
		
		if(user.getPassword().equals(password) && user.getRoleId() != role){
			modelAndView = new ModelAndView();
			modelAndView.addObject("msg","身份不匹配！");
			modelAndView.setViewName("login");
			return modelAndView;
		}
		return modelAndView;
	}
	
}
