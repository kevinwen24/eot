package com.eot.service;

import com.eot.model.User;

public interface IUserService {
	
	public void updatePasswordByUserNo(int userNo, String password);
	
	public User getUserByUserId(int userId);
}
