package com.eot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	public ModelAndView allClassByMajorGrade(
			@RequestParam(value="") int deptNo
			) {
		ModelAndView modelAndView = new ModelAndView();
		
		List<SchoolInfo> SchoolInfos = SchoolInfoService.findAllTeacherByDeptNo(deptNo);
		modelAndView.addObject("categoryItems", SchoolInfos);
		return modelAndView;
	}
	
	@RequestMapping(value = "/all_class_major_grade", method = {RequestMethod.GET})
	public ModelAndView allTeacherByDpetNo(
			@RequestParam(value="") int majorNo,
			@RequestParam(value="") String grade
			) {
		ModelAndView modelAndView = new ModelAndView();
		
		List<SchoolInfo> SchoolInfos = SchoolInfoService.findAllClassByMajorNoAndGrade(majorNo, grade);
		modelAndView.addObject("categoryItems", SchoolInfos);
		return modelAndView;
	}
	
}
