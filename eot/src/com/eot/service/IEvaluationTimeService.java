package com.eot.service;

import com.eot.model.EvaluationTime;

public interface IEvaluationTimeService {

	public void addThisYearEvaluationTime(EvaluationTime evaluationTime);

	public EvaluationTime getThisYearStartEndDate(String year,int term);

	public void  updaterStartEndDate(EvaluationTime evaluationTime);
}
