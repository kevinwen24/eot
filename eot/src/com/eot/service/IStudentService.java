package com.eot.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.eot.exception.ExistSchoolInfoException;
import com.eot.model.Student;
import com.eot.util.Pagination;

public interface IStudentService {
	
	public void addStudent(Student student);
	
	public int deleteStudent(int[] Ids[]);
	
	public int UpdateStudent(Student student);
	
	public Student getStudentByStudentNo(int studentNo);
	
	public List<Student> findAllStudent(Pagination pagination);	
	
	public boolean batchImport(String name,MultipartFile file) throws ExistSchoolInfoException;
	
	public void addStudent(List<Student> student);
}
