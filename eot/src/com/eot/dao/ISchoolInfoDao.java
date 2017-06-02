package com.eot.dao;

import java.util.List;

import com.eot.model.SchoolInfo;

public interface ISchoolInfoDao {

	public List<SchoolInfo> findAlldept();
	
	public List<SchoolInfo> findAllCourse();
	
	public List<SchoolInfo> findAllTeacherByDeptNo(int deptNo);
    
	public List<SchoolInfo> findAllMajor();
	
	public List<SchoolInfo> findAllClassByMajorNoAndGrade(int majorNo, String grade);
    
	public void addCourse(String courseName, Integer courseScore);
}
