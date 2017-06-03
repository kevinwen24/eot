package com.eot.dao;

import java.util.List;

import com.eot.model.Student;
import com.eot.util.Pagination;

public interface IStudentDao {

	public int getStudentClassNo(int studentNo);
	
	public void addStudent(Student student);
	
	public int deleteStudent(int[] Ids[]);
	
	public int UpdateStudent(Student student);
	
	public Student getStudentByStudentNo(int studentNo);
	
	public List<Student> findAllStudent(Pagination pagination);	
	
	public void addBatchStudent(List<Student> students);
	
	public Integer getStudentClassNoBycondition(String grade, int classIndex, int majorNo);
	
	public Integer getStudentMajorNoByMajorName(String majorName);
	
	public Integer getStudentDeptNoByDeptName(String deptName);
	
}
