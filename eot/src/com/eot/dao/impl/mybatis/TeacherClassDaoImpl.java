package com.eot.dao.impl.mybatis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.eot.dao.ITeacherClassDao;
import com.eot.model.TeacherClass;
import com.eot.util.Pagination;

public class TeacherClassDaoImpl extends SqlSessionDaoSupport implements ITeacherClassDao{

	private static final String CLASS_NAME = TeacherClass.class.getName();
	private static final String SQL_ID_GET_TOTAL_COUNT = ".getTotalCount";
	private static final String SQL_ID_FIND_All_TEACHERCLASS = ".findAllTeacherClass";
	private static final String SQL_ID_GET_TEACHERCLASS_BY_TEACHERNO = ".getTeacherClassByTeacherNo";
	
	@Override
	public void addTeacherClass(TeacherClass teacherClass) {
		
		
	}

	@Override
	public int getTotalCount(Pagination pagination) {
		Map<String, Object> params = new HashMap<>();
		params.put("teacherNo", pagination.getTeacherNo());
		params.put("term", pagination.getTerm());
		params.put("year", pagination.getYear());
		params.put("dept", pagination.getDeptNo());
		return getSqlSession().selectOne(CLASS_NAME + SQL_ID_GET_TOTAL_COUNT,params);
	}

	
	@Override
	public List<TeacherClass> findAllTeacherClass(Pagination pagination) {
		Map<String, Object> params = new HashMap<>();
		params.put("teacherNo", pagination.getTeacherNo());
		params.put("offset", pagination.getOffset());
		params.put("pageSize", pagination.getPageSize());
		params.put("term", pagination.getTerm());
		params.put("year", pagination.getYear());
		params.put("dept", pagination.getDeptNo());
		return getSqlSession().selectList(CLASS_NAME + SQL_ID_FIND_All_TEACHERCLASS,params);
	}

	@Override
	public TeacherClass getTeacherClass(Pagination pagination) {
		
		return getSqlSession().selectOne(CLASS_NAME + SQL_ID_GET_TEACHERCLASS_BY_TEACHERNO, pagination.getTeacherNo());
	}

	@Override
	public int updateTeacherClass(TeacherClass teacherClass) {
		
		return 0;
	}

	@Override
	public int deleteTeacherClass(int[] ids) {
		
		return 0;
	}

}
