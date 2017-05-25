package com.eot.dao.impl.mybatis;


import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.eot.dao.IEvaluationStatusDao;
import com.eot.model.EvaluationStatus;

public class EvaluationStatusDaoImpl extends SqlSessionDaoSupport implements IEvaluationStatusDao{

	private static final String CLASS_NAME = EvaluationStatus.class.getName();
	private static final String SQL_ID_ADD_EVALUATION_STATUS = ".addStudentEvaluationStatus";
	private static final String SQL_ID_GET_STUDENT_IS_EVALUATION = ".getStudentIsEvaluation";
	
	
	@Override
	public Integer getStudentIsEvaluationStatus(EvaluationStatus evaluationStatus) {
		Map<String, Object> params = new HashMap<>();
		params.put("studentNo", evaluationStatus.getStudentNo());
		params.put("evaluationNo", evaluationStatus.getEvaluationNo());
		
		return getSqlSession().selectOne(CLASS_NAME + SQL_ID_GET_STUDENT_IS_EVALUATION, params);
	}
	@Override
	public void addStudentEvaluationStatus(EvaluationStatus evaluationStatus) {
		Map<String, Object> params = new HashMap<>();
		params.put("studentNo", evaluationStatus.getStudentNo());
		params.put("evaluationNo", evaluationStatus.getEvaluationNo());
		
	    getSqlSession().selectOne(CLASS_NAME + SQL_ID_ADD_EVALUATION_STATUS, params);
	}
	
}
