
 package com.eot.controller;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.eot.common.*;
import com.eot.model.CategoryItem;
import com.eot.model.Evaluation;
import com.eot.model.SchoolInfo;
import com.eot.model.TeacherClass;
import com.eot.model.User;
import com.eot.service.ICategoryItemService;
import com.eot.service.IEvaluationService;
import com.eot.service.ISchoolInfoService;
import com.eot.service.ITeacherClassService;
import com.eot.util.DateUtil;
import com.eot.util.Pagination;
import com.eot.util.PaginationUtil;
import com.eot.util.PropertyUtil;
import com.eot.util.ReqUtil;

import net.sf.json.JSONObject;

@Controller
@RequestMapping(Constants.APP_URL_MANAGER)
public class TeacherClassController extends BaseController{

	@Autowired
	public ITeacherClassService iTeacherClassService;
	@Autowired
	public ISchoolInfoService SchoolInfoService;
	@Autowired
	public IEvaluationService evaluationService;
	@Autowired
	public ICategoryItemService categoryItemService;
	
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
			pagination.setCurrentPage(currentPage);
		}
		
		
		ModelAndView modelAndView = new ModelAndView();
		
		List<TeacherClass> teacherClasss = iTeacherClassService.findAllTeacherClass(pagination);
		List<SchoolInfo> depts = SchoolInfoService.findAlldept();
		modelAndView.addObject("depts", depts);
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
	
	
	@RequestMapping(value = "/add_teacher_class", method = {RequestMethod.POST})
	@ResponseBody
	public String addTeacherClass(
									@RequestBody
									String params
										) {
		
		JSONObject jsonData = JSONObject.fromObject(params);
		Integer teacherNo = jsonData.getInt("teacherNo");
		Integer courseNo  = jsonData.getInt("courseNo");
		String classNos = jsonData.getString("classNos");
		String[] classNoArray = classNos.split(",");
		List<Evaluation> addEvaluationMapping = new ArrayList<>();
		Evaluation evaluation = null;
		for(int i = 0; i < classNoArray.length;i++){
			int evaluationNo = iTeacherClassService.addTeacherClass(teacherNo, courseNo, Integer.parseInt(classNoArray[i]));
			List<CategoryItem> items = categoryItemService.findAllItemIsActive();
			
			for(CategoryItem item : items ){
				evaluation = new Evaluation();
				evaluation.setEvaluationNo(evaluationNo);
				evaluation.setItemNo(item.getItemNo());
				addEvaluationMapping.add(evaluation);
				System.out.println(evaluationNo+","+item.getItemNo());
			}
		}
		evaluationService.addEvaluationItemToevaluationNo(addEvaluationMapping);
		return "1";
	}
	
	@RequestMapping(value = "/teaching_rank", method = {RequestMethod.GET})
	public ModelAndView rankTeacherTeaching() {
		ModelAndView modelAndView = new ModelAndView();
		Set<Evaluation> teachingRank = evaluationService.teachingRank();
		Set<Evaluation> teachingRankCondition = new TreeSet<>(new CustomComparator());
		String year = DateUtil.getYear(new Date());
		int term = DateUtil.getTerm(new Date());
		for(Evaluation eval : teachingRank){
			if(year.equals(eval.getYear()) &&  term== eval.getTerm()){
				teachingRankCondition.add(eval);
			}
		}
		ReqUtil reqUtil= new ReqUtil();
		reqUtil.setTerm(term+1);
		reqUtil.setYear(year+"");
		modelAndView.addObject("teachingRank", teachingRankCondition);
		modelAndView.addObject("forwardPage", "teaching_rank");
		modelAndView.addObject("reqUtil", reqUtil);
		List<SchoolInfo> depts = SchoolInfoService.findAlldept();
		modelAndView.addObject("depts", depts);
		modelAndView.setViewName("index");
		return modelAndView;
	}
	
	@RequestMapping(value = "/teaching_rank_condition", method = {RequestMethod.POST})
	public ModelAndView rankTeacherTeachingCondition(
											@RequestParam (value="deptNo", required=false,  defaultValue="0") Integer deptNo,
											@RequestParam (value="year",  required=false, defaultValue="0") Integer year,
											@RequestParam (value="term",  required=false, defaultValue="0") Integer term
			) {
		ModelAndView modelAndView = new ModelAndView();
		Set<Evaluation> teachingRank = evaluationService.teachingRank();
		Set<Evaluation> teachingRankCondition = new TreeSet<>(new CustomComparator());
		
		for(Evaluation eval : teachingRank){
			if(deptNo == -1){
				if((year+"").equals(eval.getYear()) && (term-1) == eval.getTerm()){
					teachingRankCondition.add(eval);
				}
			}else if(deptNo == eval.getDeptNo() && (year+"").equals(eval.getYear()) && (term-1) == eval.getTerm()){
				teachingRankCondition.add(eval);
			}
		}
		ReqUtil reqUtil= new ReqUtil();
		reqUtil.setDeptNo(deptNo);
		reqUtil.setTerm(term);
		reqUtil.setYear(year+"");
		modelAndView.addObject("teachingRank", teachingRankCondition);
		modelAndView.addObject("forwardPage", "teaching_rank");
		modelAndView.addObject("reqUtil", reqUtil);
		List<SchoolInfo> depts = SchoolInfoService.findAlldept();
		modelAndView.addObject("depts", depts);
		modelAndView.setViewName("index");
		return modelAndView;
	}
	
}

class CustomComparator implements Comparator<Evaluation>{

	@Override
	public int compare(Evaluation arg0, Evaluation arg1) {

		if(arg0.getAvg() > arg1.getAvg()){
			return -1;
		}else if(arg0.getAvg() < arg1.getAvg()){
			return 1;
		} else if(arg0.getEvaluationNo() < arg1.getEvaluationNo()){
			
			return 1;
		} 
		return 1;
	}
	
}
