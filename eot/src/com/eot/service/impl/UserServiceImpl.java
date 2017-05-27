package com.eot.service.impl;

import com.eot.dao.IUserDao;
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

}
