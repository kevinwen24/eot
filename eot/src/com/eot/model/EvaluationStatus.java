package com.eot.model;

public class EvaluationStatus {

	private Integer studentNo;
	private Integer evaluationNo;

	public Integer getStudentNo() {
		return studentNo;
	}

	public void setStudentNo(Integer studentNo) {
		if(studentNo == null){
			studentNo = 0;
		}
		
		this.studentNo = studentNo;
	}

	public Integer getEvaluationNo() {
		return evaluationNo;
	}

	public void setEvaluationNo(Integer evaluationNo) {
		this.evaluationNo = evaluationNo;
	}

}
