package com.eot.dao.impl.mybatis;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.eot.dao.IEvaluationTimeDao;
import com.eot.model.EvaluationTime;

public class EvaluationTimeDaoImpl extends SqlSessionDaoSupport implements IEvaluationTimeDao{
	
	private static final String CLASS_NAME = EvaluationTime.class.getName();
	private static final String SQL_ID_ADD_THIS_YEAR_EVALUATION_TIME = ".addThisYearEvaluationTime";
	private static final String SQL_ID_GET_THIS_YEAR_START_END_DATE = ".getThisYearStartEndDate";
	private static final String SQL_ID_UPDATE_THIS_YEAR_START_END_DATE = ".updaterStartEndDate";
	
	
	@Override
	public void addThisYearEvaluationTime(EvaluationTime evaluationTime) {
		getSqlSession().insert(CLASS_NAME + SQL_ID_ADD_THIS_YEAR_EVALUATION_TIME, evaluationTime);
		
	}

	@Override
	public EvaluationTime getThisYearStartEndDate(String year, int term) {
		Map<String, Object> params = new HashMap<>();
		params.put("year", year);
		params.put("term", term);
		return getSqlSession().selectOne(CLASS_NAME + SQL_ID_GET_THIS_YEAR_START_END_DATE, params);
	}

	@Override
	public void updaterStartEndDate(EvaluationTime evaluationTime) {
		getSqlSession().update(CLASS_NAME + SQL_ID_UPDATE_THIS_YEAR_START_END_DATE, evaluationTime);
		
	}

}
