package com.eot.dao;

import com.eot.model.*;

public interface IEvaluationStatusDao {
	
	public Integer getStudentIsEvaluationStatus(EvaluationStatus evaluationStatus);
	
	public void addStudentEvaluationStatus(EvaluationStatus evaluationStatus);
	
}
