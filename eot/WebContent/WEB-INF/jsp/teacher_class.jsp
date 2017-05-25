<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.eot.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String managerPath = PathUtil.getFullPath("manager/query");
%>

<div id="content">
	<div class="content_header">
		<div class="search_student_dept_container">
			<form class="form-inline">
			<input type="hidden" value="${pagination.currentPage }" id="currentPage"> 
			<div class="form-group">
			    <select class="form-control select_dept" >
						<option>学院</option>
						<option>jdbsfk</option>
						<option>软件工程</option>
						<option>jdbsfk</option>
				</select>
	  		</div>
			<div class="form-group">
			    <select class="form-control select_year" >
						<option>日期</option>
						<option>2013</option>
						<option>2014</option>
						<option>2015</option>
						<option>2016</option>
						<option>2017</option>
				</select>
	  		</div>		    
		    <div class="form-group">
		        <select class="form-control select_major" >
					<option>学期</option>
					<option>春季学期</option>
					<option>秋季学期</option>
			    </select>
		    </div>
	  		<button type="submit" class="btn btn-info">查询</button>
        </form>
		</div>
		
        <div class="search_student_no_container">
        	<input type="text" class="form-control search_student_no" placeholder="请输入老师职工号..." style="margin-left:100px;"/>
        	<a href="javascript:void(0)">
        		<span class="glyphicon glyphicon-search"></span>
        	</a>
        </div>
        
	</div>
	<div class="content_body">
		<ul>
			<li class="data_line">
				<ul class="data_line_container stu_header_ul">
					<li class="stu_index stu_header" style="margin-left:20px;">序号</li>
					<li class="stu_no stu_header">所属学院</li>
					<li class="stu_name stu_header">职工编号</li>
					<li class="stu_gender stu_header">姓名</li>
					<li class="stu_class stu_header" style="width:100px;">年份</li>
					<li class="stu_major stu_header" style="width:100px;">学期</li>
					<li class="stu_dept stu_header">课程名称</li>
					<li class="stu_visit_date stu_header" style="width:80px;">学生年级</li>
					<li class="stu_edit stu_header" style="width:180px;">学生班级</li>
				</ul>
			</li>
			<li class="data_line">
				<c:forEach var="teacherClass" items="${teacherClasss }" varStatus="idxStatus">
					<ul class="data_line_container">
							<li class="stu_index" style="margin-left:20px;"><c:out value="${idxStatus.index + 1 }"/></li>
							<li class="stu_no">${teacherClass.deptName }</li>
							<li class="stu_name">${teacherClass.teacherNo }</li>
							<li class="stu_gender">${teacherClass.teacherName }</li>
							<li class="stu_class" style="width:100px;">${teacherClass.year }</li>
							<li class="stu_major" style="width:100px;">${teacherClass.term == 0 ? "春季":"秋季" }</li>
							<li class="stu_dept">${teacherClass.courseName }</li>
							<li class="stu_visit_date" style="width:80px;">${teacherClass.grade }</li>
							<li class="stu_edit" style="width:180px;">${teacherClass.majorName } ${teacherClass.classIndex }班</li>
					</ul>
				</c:forEach>
			</li>
		</ul>
	</div>
	<div class="content_footer">   
		<nav aria-label="Page navigation">
		  <ul class="pagination">
		    <li>
		      <a href="#" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    <c:forEach var="pageIndex" items="${pageIndexs }">
		    	<li class="pageIndex">
		    			<c:choose>
		    				<c:when test="${pageIndex != -1}">
			    				<a href="">
			    					<c:out value="${pageIndex }"/>
			    				</a>
		    				</c:when>
		    				<c:when test="${pageIndex == -1}">
			    				<span>...</span>
		    				</c:when>
		    			</c:choose>
		    	</li>
		    </c:forEach>
		    <li>
		      <a href="#" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav>
	</div>
</div>	

<script type="text/javascript">
	$(function(){
		var currentPage = $("#currentPage").val();
		var pageIndexs = $(".pageIndex");
		for (var i = 0; i < pageIndexs.length; i++) {
			if ($(pageIndexs[i]).text().trim() == currentPage){
				$(pageIndexs[i]).addClass("active");
			}
		}
	});
		
</script>

