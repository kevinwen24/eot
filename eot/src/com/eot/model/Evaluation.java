package com.eot.model;

public class Evaluation {
	
	private Integer evaluationNo;
	private Integer teacherNo;
	private Integer courseNo;
	private Integer classNo;
	private String year;
	private Integer term;
	private Integer itemNo;
	// 评教人数
	private Integer studentNum;
	private float score;

	private Integer categoryNo;
	private String categoryName;

	private String itemName;
	private String teacherName;
	private String courseName;
	// 教师所属学院
	private String deptName;
	public Integer getEvaluationNo() {
		return evaluationNo;
	}
	public void setEvaluationNo(Integer evaluationNo) {
		this.evaluationNo = evaluationNo;
	}
	public Integer getTeacherNo() {
		return teacherNo;
	}
	public void setTeacherNo(Integer teacherNo) {
		this.teacherNo = teacherNo;
	}
	public Integer getCourseNo() {
		return courseNo;
	}
	public void setCourseNo(Integer courseNo) {
		this.courseNo = courseNo;
	}
	public Integer getClassNo() {
		return classNo;
	}
	public void setClassNo(Integer classNo) {
		this.classNo = classNo;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public Integer getTerm() {
		return term;
	}
	public void setTerm(Integer term) {
		this.term = term;
	}
	public Integer getItemNo() {
		return itemNo;
	}
	public void setItemNo(Integer itemNo) {
		this.itemNo = itemNo;
	}
	public Integer getStudentNum() {
		return studentNum;
	}
	public void setStudentNum(Integer studentNum) {
		this.studentNum = studentNum;
	}
	public float getScore() {
		return score;
	}
	public void setScore(float score) {
		this.score = score;
	}
	public Integer getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(Integer categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	
}
