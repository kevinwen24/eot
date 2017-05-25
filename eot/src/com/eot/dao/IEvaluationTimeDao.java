package com.eot.dao;

import com.eot.model.EvaluationTime;

public interface IEvaluationTimeDao {
	
	public void addThisYearEvaluationTime(EvaluationTime evaluationTime);

	public EvaluationTime getThisYearStartEndDate(String year,int term);

	public void  updaterStartEndDate(EvaluationTime evaluationTime);
}
