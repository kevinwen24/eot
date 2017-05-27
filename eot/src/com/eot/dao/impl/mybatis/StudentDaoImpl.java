package com.eot.dao.impl.mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.eot.dao.IStudentDao;
import com.eot.model.Student;
import com.eot.util.Pagination;

public class StudentDaoImpl extends SqlSessionDaoSupport implements IStudentDao{

	private static String CLASS_NAME = Student.class.getName();
	private static String SQL_ID_GET_STUDENT_CLASSNO = ".getStudentClassNo";
	
	@Override
	public int getStudentClassNo(int studentNo) {
		return getSqlSession().selectOne(CLASS_NAME + SQL_ID_GET_STUDENT_CLASSNO, studentNo);
	}

	@Override
	public void addStudent(Student student) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int deleteStudent(int[][] Ids) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int UpdateStudent(Student student) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Student getStudentByStudentNo(int studentNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Student> findAllStudent(Pagination pagination) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
