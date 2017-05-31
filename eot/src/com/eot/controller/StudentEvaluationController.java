package com.eot.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eot.common.Constants;
import com.eot.model.Evaluation;
import com.eot.model.EvaluationTime;
import com.eot.model.User;
import com.eot.service.IEvaluationService;
import com.eot.service.IEvaluationTimeService;
import com.eot.util.DateUtil;
import com.eot.util.ScoreUtil;

@Controller
@RequestMapping(Constants.APP_URL_Student_PREFIX)
public class StudentEvaluationController extends BaseController{

	@Autowired
	private IEvaluationService evaluationService;
	@Autowired
	public IEvaluationTimeService evaluationTimeService;
	
	@RequestMapping("/show")
	public ModelAndView showNeedEvaluation() {
		ModelAndView modelAndView = new ModelAndView();
		Date currentDate = new Date();
		EvaluationTime evaluationTimeJudge = evaluationTimeService.getThisYearStartEndDate(DateUtil.getYear(currentDate), DateUtil.getTerm(currentDate));
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		modelAndView.addObject("evaluationTime", evaluationTimeJudge);
		
		if(evaluationTimeJudge!=null){
			try {
				Date startDate =simpleDateFormat.parse(evaluationTimeJudge.getStartDate()) ;
				Date endDate = simpleDateFormat.parse(evaluationTimeJudge.getEndDate());
				
				if(currentDate.getTime() < startDate.getTime()){
					modelAndView.addObject("timeMsg", "评教时间没有开始!");
					modelAndView.setViewName("student_evaluation");
					
				} else if(currentDate.getTime() > endDate.getTime()){
					modelAndView.addObject("timeMsg", "评教时间已经结束!");
					modelAndView.setViewName("student_evaluation");
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		
		List<Evaluation> evaluationClasss = evaluationService.getStudentAllNeedEvaluatonClass(13270132);
		modelAndView.addObject("evaluationClasss", evaluationClasss);
		modelAndView.setViewName("student_evaluation");
		return modelAndView;
	}
	
	@RequestMapping(value = "/item", method = {RequestMethod.GET})
	public ModelAndView showEvaluationItem(
										   @RequestParam(value = "evaluationNo", defaultValue = "0") String evaluationNo
										   ){
		ModelAndView modelAndView = new ModelAndView();
		if (evaluationNo.equals("0")) {
			return null;
		}
		int evalNo = Integer.parseInt(evaluationNo);
		List<Evaluation> evaluations = evaluationService.getStudentNeedEvaluationItemByevaluationNo(evalNo);
		
		List<Map<String, List<Evaluation>>> lists = new ArrayList<>();
		Map<String, List<Evaluation>> maps = null;
		List<Evaluation> evals = null;
		String categoryName = "";
		
		//封装数据 eg:   "教学方法":List<Evalutaion>
		for(Evaluation evaluation : evaluations) {
			categoryName = evaluation.getCategoryName();
			
			boolean hasMap = false;
			for(Map<String, List<Evaluation>> limap : lists){
				if (limap.containsKey(categoryName)){
					maps = limap;
					evals = maps.get(categoryName);
					evals.add(evaluation);
					hasMap = true;
					break;
				}
			}
			
			if(!hasMap){
				maps = new HashMap<>();
				evals = new ArrayList<>();
				evals.add(evaluation);
				maps.put(categoryName, evals);
				lists.add(maps);
			}
		}
		
		for(Map<String, List<Evaluation>> limap : lists){
			for(Map.Entry<String, List<Evaluation>> m : limap.entrySet()){
				System.out.println(m.getKey() +  Arrays.toString(m.getValue().toArray()));
			}
		}
		modelAndView.addObject("lists", lists);
		modelAndView.addObject("evaluationNo", evalNo);
		modelAndView.setViewName("evaluation_item");
		return modelAndView;
	}
	
	@RequestMapping(value = "/save", method = {RequestMethod.POST})
	public ModelAndView saveEvaluationItem(
										   HttpServletRequest request,
										   HttpSession session
											){
		
		Evaluation evaluation = null;
		List<Evaluation> lists = new ArrayList<>();
		
		Enumeration<String> parameterNames = request.getParameterNames();
		String evalNo = request.getParameter("evaluationNo");
		int evaluationNo = Integer.parseInt(evalNo);
		
		while(parameterNames.hasMoreElements()){
			evaluation = new Evaluation();
			
			String name = parameterNames.nextElement();
			if(!name.startsWith("item")){
				continue;
			}
			
			float score = ScoreUtil.getScore(request.getParameter(name));
			
			evaluation.setEvaluationNo(evaluationNo);
			evaluation.setScore(score);
			evaluation.setItemNo(Integer.parseInt(name.substring(4)));
			lists.add(evaluation);
		}
		User user = (User)session.getAttribute("user");
		evaluationService.updateScoreAndStuNum(lists, user.getUserId());
		ModelAndView modelAndView = new ModelAndView("redirect:/page/student/show");
		return modelAndView;
	}
}
