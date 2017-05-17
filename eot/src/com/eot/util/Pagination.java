package com.eot.util;

public class Pagination {
	
	private int pageSize;
	private int pageCount;
	private int currentPage = 1;
	private int totalCount;
	
	private Integer deptNo;
	
	//student query codition
	private int majorNo;
	private String year;
	private int classNo;
	
	//teacher query codition
	private String Classdate;
	private Integer term;
	private Integer teacherNo;
	
	private int offset;
	
	public int getPageSize() {
		String  pageSizeTemp= PropertyUtil.getProperties("pagination.pageSize");
		
		if (pageSizeTemp.matches("[0-9]*")) {
			return pageSize = Integer.parseInt(pageSizeTemp);
		}
		
		return pageSize = 1;

	}
	
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	public int getPageCount() {
		if(totalCount < 1) {
            pageCount = 0;
            return pageCount;
        }
		pageCount = (totalCount - 1) / pageSize + 1;
		return  pageCount;
	}
	
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}
	
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public Integer getDeptNo() {
		return deptNo;
	}

	public void setDeptNo(Integer deptNo) {
		this.deptNo = deptNo;
	}

	public int getMajorNo() {
		return majorNo;
	}

	public void setMajorNo(int majorNo) {
		this.majorNo = majorNo;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public int getClassNo() {
		return classNo;
	}

	public void setClassNo(int classNo) {
		this.classNo = classNo;
	}

	public int getOffset() {
		offset = (getCurrentPage() - 1 ) * getPageSize();
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public String getClassdate() {
		return Classdate;
	}

	public void setClassdate(String classdate) {
		Classdate = classdate;
	}

	public Integer getTerm() {
		return term;
	}

	public void setTerm(int term) {
		this.term = term;
	}

	public Integer getTeacherNo() {
		return teacherNo;
	}

	public void setTeacherNo(int teacherNo) {
		this.teacherNo = teacherNo;
	}

}
