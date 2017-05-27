package com.eot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eot.common.*;
import com.eot.model.SchoolInfo;
import com.eot.model.TeacherClass;
import com.eot.service.ISchoolInfoService;
import com.eot.service.ITeacherClassService;
import com.eot.util.Pagination;
import com.eot.util.PaginationUtil;
import com.eot.util.PropertyUtil;

@Controller
@RequestMapping(Constants.APP_URL_MANAGER)
public class TeacherClassController extends BaseController{

	@Autowired
	public ITeacherClassService iTeacherClassService;
	@Autowired
	public ISchoolInfoService SchoolInfoService;
	
	@RequestMapping(value = "/teacher_class", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView showTeacherClass(
										@RequestParam (value="deptNo", required=false,  defaultValue="0") Integer deptNo,
										@RequestParam (value="year",  required=false, defaultValue="0") Integer year,
										@RequestParam (value="term",  required=false, defaultValue="0") Integer term,
										@RequestParam (value="teacherNo", required=false, defaultValue="0") Integer teacherNo,
										@RequestParam (value="currentPage", required=false, defaultValue="0") Integer currentPage,
										@RequestParam (value="pageSize", required=false, defaultValue="0") Integer pageSize
										) {
		Pagination pagination = new Pagination(); 
		
		if(teacherNo != null && teacherNo > 0){
			pagination.setTeacherNo(teacherNo);
		}else{
			
			if(deptNo > 0 ){
				pagination.setDeptNo(deptNo);
			}
			
			if(year > 0){
				pagination.setYear(year + "");
			}
			
			if(term > 0){
				pagination.setTerm(term - 1);
			}
		}
		
		if(pageSize != null && pageSize > 0) {
			pagination.setPageSize(pageSize);
		}
		
		if(currentPage != null && currentPage > 0) {
			pagination.setPageSize(currentPage);
		}
		
		
		ModelAndView modelAndView = new ModelAndView();
		
		List<TeacherClass> teacherClasss = iTeacherClassService.findAllTeacherClass(pagination);
		modelAndView.addObject("pagination", pagination);
		modelAndView.addObject("pageIndexs", PaginationUtil.getPageIndex(pagination));
		modelAndView.addObject("teacherClasss", teacherClasss);
		modelAndView.addObject("forwardPage", "teacher_class");
		modelAndView.setViewName("index");
		return modelAndView;
	}
	
	@RequestMapping(value = "/forward", method = {RequestMethod.GET})
	public ModelAndView forwardPage(
			@RequestParam (value = "action", defaultValue = "") String action) {
		ModelAndView modelAndView = new ModelAndView();
		String page = PropertyUtil.getProperties("forwardPage");
		String[] forwardPages = page.split("\\,");
		boolean hasPage = false;
		
		for(int i = 0; i < forwardPages.length; i++){
			if(action.equals(forwardPages[i])) {
				hasPage = true;
				break;
			}
		}
		
		if (!hasPage) {
			ModelAndView modelAndView2 = new ModelAndView("404.html");
			return modelAndView2;
		}
		
		modelAndView.addObject("forwardPage", action);
		modelAndView.setViewName("index");
		return modelAndView;
	}
	
	@RequestMapping(value = "/show_addteacher_class", method = {RequestMethod.GET})
	public ModelAndView showAddTeacherClass() {
		ModelAndView modelAndView = new ModelAndView();
		List<SchoolInfo> depts = SchoolInfoService.findAlldept();
		List<SchoolInfo> majors = SchoolInfoService.findAllMajor();
		List<SchoolInfo> courses = SchoolInfoService.findAllCourse();
		modelAndView.addObject("depts", depts);
		modelAndView.addObject("majors", majors);
		modelAndView.addObject("courses", courses);
		modelAndView.addObject("forwardPage", "show_addteacher_class");
		modelAndView.setViewName("index");
		return modelAndView;
	}
}
