package com.eot.service.impl;

import java.util.List;

import com.eot.dao.ITeacherClassDao;
import com.eot.model.TeacherClass;
import com.eot.service.ITeacherClassService;
import com.eot.util.Pagination;

public class TeacherClassServiceImpl implements ITeacherClassService{
	
	private ITeacherClassDao iTeacherClassDao;
	public void setTeacherClassDao(ITeacherClassDao iTeacherClassDao) {
		this.iTeacherClassDao = iTeacherClassDao;
	}
	
	@Override
	public void addTeacherClass(TeacherClass teacherClass) {
		
	}

	@Override
	public List<TeacherClass> findAllTeacherClass(Pagination pagination) {
		int totalCount = iTeacherClassDao.getTotalCount(pagination);
		pagination.setTotalCount(totalCount);
		List<TeacherClass> teacherClasss = iTeacherClassDao.findAllTeacherClass(pagination);
		return teacherClasss;
	}

	@Override
	public TeacherClass getTeacherClass(Pagination pagination) {
		
		return null;
	}

	@Override
	public int updateTeacherClass(TeacherClass teacherClass) {
		
		return 0;
	}

	@Override
	public int deleteTeacherClass(int[] ids) {
		
		return 0;
	}
	
}
