package com.eot.service.impl;

import java.util.List;

import com.eot.dao.ISchoolInfoDao;
import com.eot.model.SchoolInfo;
import com.eot.service.ISchoolInfoService;

public class SchoolInfoServiceImpl implements ISchoolInfoService{

	private ISchoolInfoDao iSchoolInfoDao;
	public void setSchoolInfoDao( ISchoolInfoDao iSchoolInfoDao){
		 this.iSchoolInfoDao = iSchoolInfoDao;
	}
	
	@Override
	public List<SchoolInfo> findAlldept() {
		// TODO Auto-generated method stub
		return iSchoolInfoDao.findAlldept();
	}
	
	@Override
	public List<SchoolInfo> findAllCourse() {
		return iSchoolInfoDao.findAllCourse();
	}
	
	@Override
	public List<SchoolInfo> findAllTeacherByDeptNo(int deptNo) {
		// TODO Auto-generated method stub
		return iSchoolInfoDao.findAllTeacherByDeptNo(deptNo);
	}

	@Override
	public List<SchoolInfo> findAllMajor() {
		// TODO Auto-generated method stub
		return iSchoolInfoDao.findAllMajor();
	}

	@Override
	public List<SchoolInfo> findAllClassByMajorNoAndGrade(int majorNo, String grade) {
		// TODO Auto-generated method stub
		return iSchoolInfoDao.findAllClassByMajorNoAndGrade(majorNo, grade);
	}

	@Override
	public void addCourse(String courseName, Integer courseScore) {
		// TODO Auto-generated method stub
		iSchoolInfoDao.addCourse(courseName, courseScore);
	}

}
