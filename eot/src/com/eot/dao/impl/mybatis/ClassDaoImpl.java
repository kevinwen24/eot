package com.eot.dao.impl.mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.eot.dao.IClassDao;
import com.eot.model.ClassInfo;

public class ClassDaoImpl extends SqlSessionDaoSupport implements IClassDao{

	private static final String CLASS_NAME = ClassInfo.class.getName();
	private static final String SQL_ID_GET_CLASS_BY_CLASS_NO = ".getClassInfoByclassNo";
	
	@Override
	public List<ClassInfo> getClassByMajorNo(int majorNo) {
	
		return null;
	}

	@Override
	public ClassInfo getClassByClassNo(int classNo) {
		
		return getSqlSession().selectOne(CLASS_NAME + SQL_ID_GET_CLASS_BY_CLASS_NO, classNo);
	}

	@Override
	public void addClass(ClassInfo classInfo) {
	
		
	}

}
