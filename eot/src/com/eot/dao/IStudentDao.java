package com.eot.dao;

import java.util.List;

import com.eot.model.Student;
import com.eot.util.Pagination;

public interface IStudentDao {

	public void addStudent(Student student);
	
	public int deleteStudent(int[] Ids[]);
	
	public int UpdateStudent(Student student);
	
	public Student getStudentByStudentNo(int studentNo);
	
	public List<Student> findAllStudent(Pagination pagination);	
	
}
