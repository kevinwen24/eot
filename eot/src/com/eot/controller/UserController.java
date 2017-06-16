package com.eot.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eot.common.Constants;
import com.eot.model.SchoolInfo;
import com.eot.model.Teacher;
import com.eot.model.TeacherClass;
import com.eot.model.User;
import com.eot.service.ISchoolInfoService;
import com.eot.service.IUserService;
import com.eot.util.GetterUtil;
import com.eot.util.Pagination;
import com.eot.util.PaginationUtil;

@Controller
@RequestMapping(Constants.APP_URL_USER_PREFIX)
public class UserController extends BaseController{
	
	@Autowired
	private IUserService userService;
	@Autowired
	public ISchoolInfoService SchoolInfoService;
	
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
				modelAndView = new ModelAndView("redirect:/page/teacher/teacher_page_rank");
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
	
	@RequestMapping("/logout")
	public String logout(
			HttpSession session
							){
		session.setAttribute("user", null);
		return "login";
	}
	
	@RequestMapping(value = "/manager/show_add_teacher", method = {RequestMethod.GET})
	public ModelAndView showTeacherClass(
										) {
		
		ModelAndView modelAndView = new ModelAndView();
		
		List<SchoolInfo> depts = SchoolInfoService.findAlldept();
		modelAndView.addObject("depts", depts);
		modelAndView.addObject("forwardPage", "show_add_teacher");
		modelAndView.setViewName("index");
		return modelAndView;
	}
	
	@RequestMapping(value = "/manager/save_teacher", method = {RequestMethod.POST})
	public ModelAndView saveTeacher(
										@RequestParam (value="deptNo", required=false,  defaultValue="0") Integer deptNo,
										@RequestParam (value="userName",  required=false, defaultValue="0") String userName,
										@RequestParam (value="teacherNo",  required=false, defaultValue="0") Integer teacherNo,
										@RequestParam (value="rank",  required=false, defaultValue="0") String rank,
										@RequestParam (value="gender",  required=false, defaultValue="0") String gender,
										@RequestParam (value="phone", required=false, defaultValue="0") String phone,
										HttpSession session
										) {
		ModelAndView modelAndView = new ModelAndView("redirect:/page/manager/show_add_teacher");
		User user = userService.getUserByUserId(teacherNo);
		if(user != null){
			session.setAttribute("fail_message", "教师已存在！");
			return modelAndView;
		}
		
		Teacher teacher = new Teacher();
		teacher.setUserId(teacherNo);
		teacher.setName(userName);
		teacher.setDeptNo(deptNo);
		teacher.setGender(gender);
		teacher.setPhone(phone);
		teacher.setRank(rank);
		try{
			userService.addTeacher(teacher);
			session.setAttribute("success_message", "添加教师成功！");
		}catch(Exception e){
			session.setAttribute("fail_message", "添加教师失败！");
		}

		return modelAndView;
	}
}
