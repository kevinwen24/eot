package com.eot.dao;

import java.util.List;

import com.eot.model.ClassInfo;

public interface IClassDao {
	
	public List<ClassInfo> getClassByMajorNo(int majorNo);
	
	public ClassInfo getClassByClassNo(int classNo);
	
	public void addClass(ClassInfo classInfo);
}
