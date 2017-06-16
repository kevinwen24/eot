package com.eot.service.impl;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import com.eot.dao.IEvaluationDao;
import com.eot.dao.IEvaluationStatusDao;
import com.eot.dao.IStudentDao;
import com.eot.model.Evaluation;
import com.eot.model.EvaluationStatus;
import com.eot.service.IEvaluationService;
import com.eot.util.DateUtil;

public class EvaluationServiceImpl implements IEvaluationService{

	private IEvaluationDao iEvaluationDao;
	private IStudentDao iStudentDao;
	private IEvaluationStatusDao iEvaluationStatusDao;
	
	public void setEvaluationDao(IEvaluationDao iEvaluationDao) {
		this.iEvaluationDao = iEvaluationDao;
	}
	
	public void setStudentDao(IStudentDao iStudentDao) {
		this.iStudentDao = iStudentDao;
	}
	
	public void setEvaluationStatusDao(IEvaluationStatusDao iEvaluationStatusDao) {
		this.iEvaluationStatusDao = iEvaluationStatusDao;
	}
	
	@Override
	public List<Evaluation> getStudentAllNeedEvaluatonClass(int studentNo) {
		int classNo = iStudentDao.getStudentClassNo(studentNo);
		
		//只显示该年的所需评教信息，故取当前时间
		Date date = new Date();
		String year = DateUtil.getYear(date);
		int term = DateUtil.getTerm(date);
		List<Evaluation> evaluations = new ArrayList<>();
		evaluations = iEvaluationDao.getStudentAllNeedEvaluatonClass(classNo, year, term);
		
		//查询该学生是否已经对该老师的课程评论,若评教过则移除
		EvaluationStatus evaluationStatus;
		for (int i = 0; i < evaluations.size(); i++) {
			evaluationStatus = new EvaluationStatus();
			evaluationStatus.setStudentNo(studentNo);
			evaluationStatus.setEvaluationNo(evaluations.get(i).getEvaluationNo());	
			
			if(iEvaluationStatusDao.getStudentIsEvaluationStatus(evaluationStatus) != null){
				if (iEvaluationStatusDao.getStudentIsEvaluationStatus(evaluationStatus) == studentNo) {
					evaluations.remove(i--);
				}
			}
		}
		
		return evaluations;
	}

	@Override
	public void updateScoreAndStuNum(List<Evaluation> evaluations, int studentNo) {
		int evaluationNo = 0;
		for(Evaluation evaluation : evaluations) {
			iEvaluationDao.updateScoreAndStuNum(evaluation.getEvaluationNo(), evaluation.getItemNo(), evaluation.getScore());
			evaluationNo = evaluation.getEvaluationNo();
		}
		
		EvaluationStatus evaluationStatus = new EvaluationStatus();
		evaluationStatus.setStudentNo(studentNo);
		evaluationStatus.setEvaluationNo(evaluationNo);
		iEvaluationStatusDao.addStudentEvaluationStatus(evaluationStatus);
	}

	@Override
	public List<Evaluation> getStudentNeedEvaluationItemByevaluationNo(int evaluationNo) {
		// TODO Auto-generated method stub
		return iEvaluationDao.getStudentNeedEvaluationItemByevaluationNo(evaluationNo);
	}

	@Override
	public void addEvaluationItemToevaluationNo(List<Evaluation> lists) {
		// TODO Auto-generated method stub
		iEvaluationDao.addEvaluationItemToevaluationNo(lists);
	}

	@Override
	public Set<Evaluation> teachingRank() {
		 List<Evaluation> allTeacherTeaching = iEvaluationDao.allTeacherTeaching();
		 List<Evaluation> allEvaluationNoAvg = iEvaluationDao.allEvaluationNoAvg();
		 
		 for(Evaluation evaluation : allTeacherTeaching){
			 List<Evaluation> findEvaluationNoGroupByCondition = iEvaluationDao.findEvaluationNoGroupByCondition(evaluation.getTeacherNo(),
					 evaluation.getCourseNo(), evaluation.getYear(), evaluation.getTerm());
			 float avg = 0;
			 int studentNum = 0;
			 for(Evaluation eva : findEvaluationNoGroupByCondition){
				 
				 for(Evaluation eval : allEvaluationNoAvg){
					 if(eval.getEvaluationNo() == eva.getEvaluationNo()){
						 avg += eval.getAvg();
						 studentNum += eval.getStudentNum();
					 }
				 }
				 
			 }
			 DecimalFormat decimalFormat = new DecimalFormat("#.00");
			 evaluation.setAvg(Float.parseFloat(decimalFormat.format(avg)));
			 evaluation.setStudentNum(studentNum);
		 }
		 
	 	Set<Evaluation> evaluations = new TreeSet<>(new CustomComparator());
		for(Evaluation eval : allTeacherTeaching){
			evaluations.add(eval);
		}
		
		return evaluations;
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