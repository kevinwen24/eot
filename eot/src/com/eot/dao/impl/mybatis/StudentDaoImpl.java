package com.eot.dao.impl.mybatis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.eot.dao.IStudentDao;
import com.eot.model.Student;
import com.eot.util.Pagination;

public class StudentDaoImpl extends SqlSessionDaoSupport implements IStudentDao{

	private static String CLASS_NAME = Student.class.getName();
	private static String SQL_ID_GET_STUDENT_CLASSNO = ".getStudentClassNo";
	private static String SQL_ID_addBatchStudent = ".addBatchStudent";
	private static String SQL_ID_getStudentClassNoBycondition = ".getStudentClassNoBycondition";
	private static String SQL_ID_getStudentMajorNoByMajorName = ".getStudentMajorNoByMajorName";
	private static String SQL_ID_getStudentDeptNoByDeptName = ".getStudentDeptNoByDeptName";
	private static String SQL_ID_getStudentByStudentNo = ".getStudentByStudentNo";
	
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
		return getSqlSession().selectOne(CLASS_NAME + SQL_ID_getStudentByStudentNo, studentNo);
	}

	@Override
	public List<Student> findAllStudent(Pagination pagination) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addBatchStudent(List<Student> students) {
		// TODO Auto-generated method stub
		getSqlSession().insert(CLASS_NAME + SQL_ID_addBatchStudent, students);
	}

	@Override
	public Integer getStudentClassNoBycondition(String grade, int classIndex, int majorNo) {
		// TODO Auto-generated method stub
		Map<String, Object> params = new HashMap<>();
		params.put("grade", grade);
		params.put("classIndex", classIndex);
		params.put("majorNo", majorNo);
		return getSqlSession().selectOne(CLASS_NAME + SQL_ID_getStudentClassNoBycondition, params);
	}

	@Override
	public Integer getStudentMajorNoByMajorName(String majorName) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne(CLASS_NAME + SQL_ID_getStudentMajorNoByMajorName, majorName);
	}

	@Override
	public Integer getStudentDeptNoByDeptName(String deptName) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne(CLASS_NAME + SQL_ID_getStudentDeptNoByDeptName, deptName);
	}
}
