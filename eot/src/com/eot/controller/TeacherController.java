package com.eot.controller;

import java.util.Date;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eot.common.Constants;
import com.eot.model.Evaluation;
import com.eot.model.User;
import com.eot.service.IEvaluationService;
import com.eot.util.DateUtil;
import com.eot.util.ReqUtil;

@Controller
@RequestMapping(Constants.APP_URL_TEACHER_PREFIX)
public class TeacherController {
	
	@Autowired
	public IEvaluationService evaluationService;
	
	@RequestMapping(value = "/teacher_page_rank", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView TeacherPageRank(
											@RequestParam (value="year",  required=false, defaultValue="0") Integer year,
											@RequestParam (value="term",  required=false, defaultValue="0") Integer term,
											HttpSession session
			) {
		ModelAndView modelAndView = new ModelAndView();
		
		User user = (User)session.getAttribute("user");
		String currYear = DateUtil.getYear(new Date());
		int currTerm = DateUtil.getTerm(new Date());
		
		Set<Evaluation> teachingRank = evaluationService.teachingRank();
		Set<Evaluation> teachingRankCondition = new TreeSet<>(new CustomComparator());
		ReqUtil reqUtil= new ReqUtil();
		reqUtil.setTerm(currTerm);
		reqUtil.setYear(currYear);
		if(term != 0 && year!=0){
			reqUtil.setTerm(term-1);
			reqUtil.setYear(year+"");
		}
		
		int rank = 0;
		for(Evaluation eval : teachingRank){
			rank += 1;
			if(user.getUserId() == eval.getTeacherNo() && reqUtil.getYear().equals(eval.getYear()) && reqUtil.getTerm() == eval.getTerm()){
				eval.setRank(rank);
				teachingRankCondition.add(eval);
			}
		}
		
		modelAndView.addObject("teachingRank", teachingRankCondition);
		modelAndView.addObject("reqUtil", reqUtil);
		modelAndView.setViewName("teacher_page_rank");
		return modelAndView;
	}
}
