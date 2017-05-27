package com.eot.service;

import java.util.List;

import com.eot.model.SchoolInfo;

public interface ISchoolInfoService {
	
	public List<SchoolInfo> findAlldept();
	
	public List<SchoolInfo> findAllCourse();
	
	public List<SchoolInfo> findAllTeacherByDeptNo(int deptNo);
    
	public List<SchoolInfo> findAllMajor();
	
	public List<SchoolInfo> findAllClassByMajorNoAndGrade(int majorNo, String grade);
}
