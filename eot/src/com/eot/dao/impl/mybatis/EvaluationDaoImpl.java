package com.eot.dao.impl.mybatis;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.eot.dao.IEvaluationDao;
import com.eot.model.Evaluation;

public class EvaluationDaoImpl extends SqlSessionDaoSupport implements IEvaluationDao{

	private static final String CLASS_NAME = Evaluation.class.getName();
	private static final String SQL_ID_UPDATE_SCORE_AND_STUNUM = ".updateScoreAndStuNum";
	private static final String SQL_ID_GET_STU_NEED_EVALUATION_ITEM = ".getStudentNeedEvaluationItemByevaluationNo";
	private static final String SQL_ID_ADD_EVALUATION_ITEM_TO_EVALUATIONNO = ".addEvaluationItemToevaluationNo";
	private static final String SQL_ID_GET_STUDENT_ALL_NEED_EVALUCATION = ".getStudentAllNeedEvaluatonClass";
	
	@Override
	public void updateScoreAndStuNum(int evaluationNo, int itemNo, float score) {
		Map<String, Object> params = new HashMap<>();
		params.put("evaluationNo", evaluationNo);
		params.put("itemNo", itemNo);
		params.put("score", score);
		getSqlSession().update(CLASS_NAME + SQL_ID_UPDATE_SCORE_AND_STUNUM, params);
	}

	@Override
	public List<Evaluation> getStudentNeedEvaluationItemByevaluationNo(int evaluationNo) {
		return getSqlSession().selectList(CLASS_NAME + SQL_ID_GET_STU_NEED_EVALUATION_ITEM, evaluationNo);
	}

	@Override
	public void addEvaluationItemToevaluationNo(List<Evaluation> lists) {
		getSqlSession().insert(CLASS_NAME + SQL_ID_ADD_EVALUATION_ITEM_TO_EVALUATIONNO, lists);
	}

	@Override
	public List<Evaluation> getStudentAllNeedEvaluatonClass(int classNo, String year, int term) {
		Map<String, Object> params = new HashMap<>();
		params.put("classNo", classNo);
		params.put("term", term);
		params.put("year", year);
		
		return getSqlSession().selectList(CLASS_NAME + SQL_ID_GET_STUDENT_ALL_NEED_EVALUCATION, params);
	}
	
}
