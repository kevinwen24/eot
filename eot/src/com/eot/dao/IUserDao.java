package com.eot.dao;

import com.eot.model.User;

public interface IUserDao {
	
	public void updatePasswordByUserNo(int userNo, String password);
	
	public User getUserByUserId(int userId);
}
