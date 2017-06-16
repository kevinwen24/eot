package com.eot.service;

import java.util.List;

import com.eot.model.Teacher;
import com.eot.model.User;

public interface IUserService {
	
	public void updatePasswordByUserNo(int userNo, String password);
	
	public User getUserByUserId(int userId);
	
	public void addStudent(List<User> users);
	
	public void addTeacher(Teacher teacher);
}
