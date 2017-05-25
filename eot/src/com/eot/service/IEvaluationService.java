package com.eot.service;

import java.util.List;

import com.eot.model.Evaluation;

public interface IEvaluationService {
	
	public List<Evaluation> getStudentAllNeedEvaluatonClass(int studentNo);
	
	public void updateScoreAndStuNum(List<Evaluation> evaluations, int studentNo);

	public List<Evaluation> getStudentNeedEvaluationItemByevaluationNo(int evaluationNo);

	public void addEvaluationItemToevaluationNo(int evaluationNo, int itemNo);
}
