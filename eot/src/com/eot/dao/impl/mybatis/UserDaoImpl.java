package com.eot.dao.impl.mybatis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.eot.dao.IUserDao;
import com.eot.model.User;

public class UserDaoImpl extends SqlSessionDaoSupport implements IUserDao{

	private static String CLASS_NAME = User.class.getName();
	private static String SQL_ID_UPDATE_USER_PASSWORD = ".updatePasswordByUserNo";
	private static String SQL_ID_getUserByUserId = ".getUserByUserId";
	private static String SQL_ID_addBatchUser = ".addBatchUser";
	private static String SQL_ID_addTeacher = ".addTeacher";
	private static String SQL_ID_addUser = ".addUser";
	
	@Override
	public void updatePasswordByUserNo(int userNo, String password) {
		Map<String, Object> params = new HashMap<>();
		params.put("userNo", userNo);
		params.put("password", password);
		getSqlSession().update(CLASS_NAME + SQL_ID_UPDATE_USER_PASSWORD, params);
	}

	@Override
	public User getUserByUserId(int userId) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne(CLASS_NAME + SQL_ID_getUserByUserId, userId);
	}

	@Override
	public void addBatchUser(List<User> users) {
		// TODO Auto-generated method stub
		getSqlSession().insert(CLASS_NAME + SQL_ID_addBatchUser, users);
	}

	@Override
	public void addTeacher(int teacherNo, int deptNo, String rank) {
		Map<String, Object> params = new HashMap<>();
		params.put("teacherNo", teacherNo);
		params.put("deptNo", deptNo);
		params.put("rank", rank);
		getSqlSession().insert(CLASS_NAME + SQL_ID_addTeacher, params);
	}

	@Override
	public void addUser(User user) {
		// TODO Auto-generated method stub
		getSqlSession().insert(CLASS_NAME + SQL_ID_addUser, user);
	}

}
