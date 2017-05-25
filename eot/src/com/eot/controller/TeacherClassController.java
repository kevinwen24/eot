package com.eot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eot.common.*;
import com.eot.model.TeacherClass;
import com.eot.service.ITeacherClassService;
import com.eot.util.Pagination;
import com.eot.util.PaginationUtil;
import com.eot.util.PropertyUtil;

@Controller
@RequestMapping(Constants.APP_URL_MANAGER)
public class TeacherClassController extends BaseController{

	@Autowired
	public ITeacherClassService iTeacherClassService;
	
	@RequestMapping(value = "/query", method = {RequestMethod.GET})
	public ModelAndView showTeacherClass() {
		Pagination pagination = new Pagination();
		ModelAndView modelAndView = new ModelAndView();
		
		List<TeacherClass> teacherClasss = iTeacherClassService.findAllTeacherClass(pagination);
		modelAndView.addObject("pagination", pagination);
		modelAndView.addObject("pageIndexs", PaginationUtil.getPageIndex(pagination));
		modelAndView.addObject("teacherClasss", teacherClasss);
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
}
