package com.eot.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.eot.dao.IStudentDao;
import com.eot.dao.IUserDao;
import com.eot.exception.ExistSchoolInfoException;
import com.eot.model.Student;
import com.eot.model.User;
import com.eot.service.IStudentService;
import com.eot.util.Pagination;
import com.eot.util.ReadExcel;

public class StudentServiceImpl implements IStudentService{

	private IStudentDao iStudentDao;
	private IUserDao iUserDao;
	
	public void setUserDao(IUserDao iUserDao){
		this.iUserDao = iUserDao;
	}
	public void setStudentDao(IStudentDao iStudentDao) {
		this.iStudentDao = iStudentDao;
	}
	
	@Override
	public void addStudent(Student student) {
		
	}

	@Override
	public int deleteStudent(int[][] Ids) {
		
		return 0;
	}

	@Override
	public int UpdateStudent(Student student) {
		
		return 0;
	}

	@Override
	public Student getStudentByStudentNo(int studentNo) {
		
		return null;
	}

	@Override
	public List<Student> findAllStudent(Pagination pagination) {
		
		return null;
	}

	@Override
	public boolean batchImport(String name, MultipartFile file) throws ExistSchoolInfoException{

		 boolean b = false;
	        //创建处理EXCEL
	        ReadExcel readExcel=new ReadExcel();
	        //解析excel，获取客户信息集合。
	        List<Student> studentList = readExcel.getExcelInfo(name ,file);

	        if(studentList != null){
	            b = true;
	        }
	        
	        List<User> users = new ArrayList<>();
	        User user = null;
	        
	        
	        //迭代添加客户信息（注：实际上这里也可以直接将customerList集合作为参数，在Mybatis的相应映射文件中使用foreach标签进行批量添加。）
	        for(int i = 0; i< studentList.size(); i++){
	        	Student student = studentList.get(i);
	        	Student stu = iStudentDao.getStudentByStudentNo(student.getStudentNo());
	        	
	        	if(stu != null){
	        		throw new ExistSchoolInfoException("学生已经存在 -> 学号： " + student.getStudentNo() + ", 行号 " + (i+2));
	        	}
	        	
	        	Integer deptNo = iStudentDao.getStudentDeptNoByDeptName(student.getDeptName());
	        	
	        	if (deptNo == null){
	        		throw new ExistSchoolInfoException("不存在该学院 -> " + student.getDeptName() + ", 行号 " + (i+2));
	        	}
	        	
	        	Integer majorNo = iStudentDao.getStudentMajorNoByMajorName(student.getMajorName());
	        	
	        	if (majorNo == null){
	        		throw new ExistSchoolInfoException("不存在该专业 -> " + student.getMajorName() + ", 行号 " + (i+2));
	        	}
	        	
	        	Integer classNo = iStudentDao.getStudentClassNoBycondition(student.getGrade(), student.getClassIndex(), majorNo);
	        	
	        	if (classNo == null){
	        		throw new ExistSchoolInfoException("不存在该年级 -> " + student.getGrade()
	        		+ ", 或不存在"+student.getMajorName() +" "
	        	    + student.getClassIndex()+ " 班, 行号 " + (i+2));
	        	}
	        	
	        	student.setDeptNo(deptNo);
	        	student.setMajorNo(majorNo);
	        	student.setClassNo(classNo);
	        	
	        	user = new User();
	        	user.setUserId(student.getStudentNo());
	        	user.setName(student.getName());
	        	user.setPhone(student.getPhone());
	        	user.setPassword("1234");
	        	user.setGender(student.getGender());
	        	user.setRoleId(3);
	        	users.add(user);
	        }
	        
	        iStudentDao.addBatchStudent(studentList);
	        iUserDao.addBatchUser(users);
	        return b;
	}

	@Override
	public void addStudent(List<Student> student) {
		// TODO Auto-generated method stub
		iStudentDao.addBatchStudent(student);
	}

}
