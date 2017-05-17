package com.eot.service;

import java.util.List;

import com.eot.model.TeacherClass;
import com.eot.util.Pagination;

public interface ITeacherClassService {
	
public void addTeacherClass(TeacherClass teacherClass);
	
	public List<TeacherClass> findAllTeacherClass(Pagination pagination); 
	
	public TeacherClass getTeacherClass(Pagination pagination); 
	
	public int updateTeacherClass(TeacherClass teacherClass);
	
	public int deleteTeacherClass(int[] ids);
}
