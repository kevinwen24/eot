package com.eot.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eot.common.Constants;
import com.eot.model.EvaluationTime;
import com.eot.service.IEvaluationTimeService;
import com.eot.util.DateUtil;

@Controller
@RequestMapping(Constants.APP_URL_MANAGER)
public class EvaluationTimeController {
	
	@Autowired
	public IEvaluationTimeService evaluationTimeService;
	
	@RequestMapping(value = "/show_set_time", method = {RequestMethod.GET})
	public ModelAndView showSetTime(
			) {
		ModelAndView modelAndView = new ModelAndView();
		Date date = new Date();
		EvaluationTime evaluationTime = evaluationTimeService.getThisYearStartEndDate(DateUtil.getYear(date), DateUtil.getTerm(date));
		modelAndView.addObject("categoryItems", evaluationTime);
		modelAndView.addObject("forwardPage", "show_set_time");
		modelAndView.setViewName("index");
		return modelAndView;
	}
	
	@RequestMapping(value = "/set_time", method = {RequestMethod.POST})
	public ModelAndView setTime(
			@RequestParam (value="startDate") Date startDate,
			@RequestParam (value="endDate") Date endDate,
			HttpSession session
			) {
		ModelAndView modelAndView = new ModelAndView("redirect:/page/manager/show_set_time");
		Date date = new Date();
		EvaluationTime evaluationTime = new EvaluationTime();
		evaluationTime.setYear(DateUtil.getYear(date));
		evaluationTime.setTerm(DateUtil.getTerm(date));
		try{
			evaluationTimeService.addThisYearEvaluationTime(evaluationTime);
			session.setAttribute("fail_message", "设置时间成功!");
		}catch(Exception e){
			session.setAttribute("fail_message", "设置时间成功失败!");
			e.printStackTrace();
		}
		
		return modelAndView;
	}
	
}
