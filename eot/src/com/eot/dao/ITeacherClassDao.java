package com.eot.dao;

import java.util.List;

import com.eot.model.TeacherClass;
import com.eot.util.Pagination;

public interface ITeacherClassDao {
	
	public void addTeacherClass(TeacherClass teacherClass);
	
	public int getTotalCount(Pagination pagination);
	
	public List<TeacherClass> findAllTeacherClass(Pagination pagination); 
	
	public TeacherClass getTeacherClass(Pagination pagination); 
	
	public int updateTeacherClass(TeacherClass teacherClass);
	
	public int deleteTeacherClass(int[] ids);
	
	public int addTeacherClass(int teacherNo, int courseNo, int classNo);
	
}
