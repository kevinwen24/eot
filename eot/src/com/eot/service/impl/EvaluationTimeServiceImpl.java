package com.eot.service.impl;

import com.eot.dao.IEvaluationTimeDao;
import com.eot.model.EvaluationTime;
import com.eot.service.IEvaluationTimeService;

public class EvaluationTimeServiceImpl implements IEvaluationTimeService{

	private IEvaluationTimeDao iEvaluationTimeDao;
	public void setEvaluationTimeDao(IEvaluationTimeDao iEvaluationTimeDao){
		this.iEvaluationTimeDao = iEvaluationTimeDao;
	}
	
	@Override
	public void addThisYearEvaluationTime(EvaluationTime evaluationTime) {
		// TODO Auto-generated method stub
		iEvaluationTimeDao.addThisYearEvaluationTime(evaluationTime);
	}

	@Override
	public EvaluationTime getThisYearStartEndDate(String year, int term) {
		// TODO Auto-generated method stub
		return iEvaluationTimeDao.getThisYearStartEndDate(year, term);
	}

	@Override
	public void updaterStartEndDate(EvaluationTime evaluationTime) {
		// TODO Auto-generated method stub
		iEvaluationTimeDao.updaterStartEndDate(evaluationTime);
	}

}
