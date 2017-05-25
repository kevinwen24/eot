package com.eot.dao;

import java.util.List;

import com.eot.model.*;

public interface IEvaluationDao {

	//student need which course evaluation
	public List<Evaluation> getStudentAllNeedEvaluatonClass(int classNo,String year, int term);
	
	public void updateScoreAndStuNum(int evaluationNo, int itemNo, float score);
	
	public List<Evaluation> getStudentNeedEvaluationItemByevaluationNo(int evaluationNo);
	
	public void addEvaluationItemToevaluationNo(int evaluationNo, int itemNo);
}
