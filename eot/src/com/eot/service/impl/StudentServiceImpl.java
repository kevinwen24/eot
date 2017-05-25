package com.eot.service.impl;

import java.util.List;

import com.eot.dao.IStudentDao;
import com.eot.model.Student;
import com.eot.service.IStudentService;
import com.eot.util.Pagination;

public class StudentServiceImpl implements IStudentService{

	private IStudentDao iStudentDao;
	public void setStudentDao(IStudentDao iStudentDao) {
		this.iStudentDao = iStudentDao;
	}
	
	@Override
	public void updatePasswordByUserNo(int studentNo, String password) {
		iStudentDao.updatePasswordByUserNo(studentNo, password);		
	}
	
	@Override
	public void addStudent(Student student) {
		
	}

	@Override
	public int deleteStudent(int[][] Ids) {
		
		return 0;
	}

	@Override
	public int UpdateStudent(Student student) {
		
		return 0;
	}

	@Override
	public Student getStudentByStudentNo(int studentNo) {
		
		return null;
	}

	@Override
	public List<Student> findAllStudent(Pagination pagination) {
		
		return null;
	}

}
