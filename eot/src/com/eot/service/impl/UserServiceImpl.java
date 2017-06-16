package com.eot.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.eot.dao.IUserDao;
import com.eot.model.Teacher;
import com.eot.model.User;
import com.eot.service.IUserService;

public class UserServiceImpl implements IUserService{

	private IUserDao iUserDao;
	public void setUserDao(IUserDao iUserDao){
		this.iUserDao = iUserDao;
	}
	
	@Override
	public void updatePasswordByUserNo(int userNo, String password) {
		// TODO Auto-generated method stub
		iUserDao.updatePasswordByUserNo(userNo, password);
	}

	@Override
	public User getUserByUserId(int userId) {
		// TODO Auto-generated method stub
		return iUserDao.getUserByUserId(userId);
	}

	@Override
	public void addStudent(List<User> users) {
		// TODO Auto-generated method stub
		iUserDao.addBatchUser(users);
	}

	@Override
	public void addTeacher(Teacher teacher) {
		// TODO Auto-generated method stub
		User user = new User();
		user.setUserId(teacher.getUserId());
		user.setName(teacher.getName());
		user.setGender(teacher.getGender());
		user.setRoleId(2);
		user.setPassword("1234");
		user.setPhone(teacher.getPhone());
		
		//execute insert
		iUserDao.addUser(user);
		iUserDao.addTeacher(teacher.getUserId(), teacher.getDeptNo(), teacher.getRank());
	}

}
