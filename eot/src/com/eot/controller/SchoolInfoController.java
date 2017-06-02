package com.eot.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.eot.common.Constants;
import com.eot.model.SchoolInfo;
import com.eot.service.ISchoolInfoService;


@Controller
@RequestMapping(Constants.APP_URL_MANAGER)
public class SchoolInfoController {

	@Autowired
	public ISchoolInfoService SchoolInfoService;
	
	@RequestMapping(value = "/all_teacher_deptNo", method = {RequestMethod.GET})
	@ResponseBody
	public List<SchoolInfo> allTeacherByDpetNo(
			@RequestParam(value="") int deptNo
			) {
		
		List<SchoolInfo> SchoolInfos = SchoolInfoService.findAllTeacherByDeptNo(deptNo);
		return SchoolInfos;
	}
	
	@RequestMapping(value = "/all_class_major_grade", method = {RequestMethod.GET})
	@ResponseBody
	public List<SchoolInfo> allClassByMajorGrade(
			@RequestParam(value="majorNo") int majorNo,
			@RequestParam(value="grade") String grade
			) {
		
		List<SchoolInfo> SchoolInfos = SchoolInfoService.findAllClassByMajorNoAndGrade(majorNo, grade);
		return SchoolInfos;
	}
	
	
	@RequestMapping(value = "/add_course", method = {RequestMethod.POST})
	public ModelAndView allTeacherByDpetNo(
			@RequestParam(value="courseName") String courseName,
			@RequestParam(value="courseScore") Integer courseScore,
			HttpSession session
			) {
		ModelAndView modelAndView = new ModelAndView("redirect:/page/manager/forward?action=show_add_course");
		if(courseName == ""){
			session.setAttribute("fail_message", "输入不合法!");
		}else{
			try{
				SchoolInfoService.addCourse(courseName, courseScore);
				session.setAttribute("success_message", "成功添加一条课程记录!");
			}catch (Exception e) {
				e.printStackTrace();
				session.setAttribute("fail_message", " 添加课程记录失败!");
			}
		}
		
		return modelAndView;
	}
}
