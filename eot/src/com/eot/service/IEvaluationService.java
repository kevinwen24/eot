package com.eot.service;

import java.util.List;
import java.util.Set;

import com.eot.model.Evaluation;

public interface IEvaluationService {
	
	public List<Evaluation> getStudentAllNeedEvaluatonClass(int studentNo);
	
	public void updateScoreAndStuNum(List<Evaluation> evaluations, int studentNo);

	public List<Evaluation> getStudentNeedEvaluationItemByevaluationNo(int evaluationNo);

	//批量增加
	public void addEvaluationItemToevaluationNo(List<Evaluation> lists);
	
	//rank teaching
	
	public Set<Evaluation> teachingRank();
}
