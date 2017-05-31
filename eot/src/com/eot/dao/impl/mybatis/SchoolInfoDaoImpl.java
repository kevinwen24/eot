package com.eot.dao.impl.mybatis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.eot.dao.ISchoolInfoDao;
import com.eot.model.SchoolInfo;

public class SchoolInfoDaoImpl extends SqlSessionDaoSupport implements ISchoolInfoDao{

	private static final String CLASS_NAME = SchoolInfo.class.getName();
	private static final String SQL_ID_findAlldept = ".findAlldept";
	private static final String SQL_ID_findAllCourse = ".findAllCourse";
	private static final String SQL_ID_findAllTeacherByDeptNo = ".findAllTeacherByDeptNo";
	private static final String SQL_ID_findAllMajor = ".findAllMajor";
	private static final String SQL_ID_findAllClassByMajorNoAndGrade = ".findAllClassByMajorNoAndGrade";
	
	@Override
	public List<SchoolInfo> findAlldept() {
		// TODO Auto-generated method stub
		return getSqlSession().selectList(CLASS_NAME + SQL_ID_findAlldept);
	}
	
	@Override
	public List<SchoolInfo> findAllCourse() {
		// TODO Auto-generated method stub
		return getSqlSession().selectList(CLASS_NAME + SQL_ID_findAllCourse);
	}
	@Override
	public List<SchoolInfo> findAllTeacherByDeptNo(int deptNo) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList(CLASS_NAME + SQL_ID_findAllTeacherByDeptNo, deptNo);
	}

	@Override
	public List<SchoolInfo> findAllMajor() {
		// TODO Auto-generated method stub
		return getSqlSession().selectList(CLASS_NAME + SQL_ID_findAllMajor);
	}

	@Override
	public List<SchoolInfo> findAllClassByMajorNoAndGrade(int majorNo, String grade) {
		// TODO Auto-generated method stub
		Map<String, Object> params = new HashMap<>();
		params.put("grade", grade);
		params.put("majorNo", majorNo);
		return getSqlSession().selectList(CLASS_NAME + SQL_ID_findAllClassByMajorNoAndGrade, params);
	}

}
