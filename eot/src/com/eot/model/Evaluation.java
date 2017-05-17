package com.eot.model;

import java.util.Date;

public class Evaluation {
	private int teacherNo;
	private int CourseNo;
	private int classNo;
	private Date year;
	private int term;
	private int categoryNo;
	private int termNo;
	private int score;
	
	public Evaluation() {
		super();
	}
	
	public Evaluation(int teacherNo, int courseNo, int classNo, Date year, int term, int categoryNo, int termNo,
			int score) {
		super();
		this.teacherNo = teacherNo;
		CourseNo = courseNo;
		this.classNo = classNo;
		this.year = year;
		this.term = term;
		this.categoryNo = categoryNo;
		this.termNo = termNo;
		this.score = score;
	}
	
	public int getTeacherNo() {
		return teacherNo;
	}

	public void setTeacherNo(int teacherNo) {
		this.teacherNo = teacherNo;
	}

	public int getCourseNo() {
		return CourseNo;
	}

	public void setCourseNo(int courseNo) {
		CourseNo = courseNo;
	}

	public int getClassNo() {
		return classNo;
	}

	public void setClassNo(int classNo) {
		this.classNo = classNo;
	}

	public Date getYear() {
		return year;
	}

	public void setYear(Date year) {
		this.year = year;
	}

	public int getTerm() {
		return term;
	}

	public void setTerm(int term) {
		this.term = term;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public int getTermNo() {
		return termNo;
	}

	public void setTermNo(int termNo) {
		this.termNo = termNo;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	@Override
	public String toString() {
		return "Evaluation [teacherNo=" + teacherNo + ", CourseNo=" + CourseNo + ", classNo=" + classNo + ", year="
				+ year + ", term=" + term + ", categoryNo=" + categoryNo + ", termNo=" + termNo + ", score=" + score
				+ "]";
	}
}
