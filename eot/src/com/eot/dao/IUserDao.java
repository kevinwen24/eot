package com.eot.dao;

import java.util.List;

import com.eot.model.User;

public interface IUserDao {
	
	public void updatePasswordByUserNo(int userNo, String password);
	
	public User getUserByUserId(int userId);
	
	public void addBatchUser(List<User> users);
}
