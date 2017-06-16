<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.eot.util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.eot.model.*" %>

<% 
	String teacherPath = PathUtil.getFullPath("teacher/");
	ReqUtil reqUtil = (ReqUtil)request.getAttribute("reqUtil");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>评教系统</title>
		<link rel="stylesheet" href="<%=PropertyUtil.getStaticUrl() %>css/bootstrap.css" />
		<link rel="stylesheet" href="<%=PropertyUtil.getStaticUrl() %>css/common.css" />
		<link rel="stylesheet" href="<%=PropertyUtil.getStaticUrl() %>css/content.css" />
		<link rel="stylesheet" href="<%=PropertyUtil.getStaticUrl() %>css/student_evaluation.css" />
		<script type="text/javascript" src="<%=PropertyUtil.getStaticUrl() %>js/plugins/jquery-1.10.2.js" ></script>
		<script type="text/javascript" src="<%=PropertyUtil.getStaticUrl() %>js/plugins/bootstrap.js" ></script>
		<script type="text/javascript" src="<%=PropertyUtil.getStaticUrl() %>js/plugins/animation.js" ></script>
		<script type="text/javascript" src="<%=PropertyUtil.getStaticUrl() %>js/nav.js" ></script>
	</head>
	<body>
		<div class="header">
			<jsp:include page="student_header.jsp"></jsp:include>
		</div>
		<div class="content">
			<form class="form-inline rank_form" action="<%=teacherPath %>teacher_page_rank" method="post" >
				<div class="form-group" style="margin-left:200px;margin-top:30px;">
			 		<select class="form-control select_year" name="year">
							<option value="-1">日期</option>
							<option value="2013">2013</option>
							<option value="2014">2014</option>
							<option value="2015">2015</option>
							<option value="2016">2016</option>
							<option value="2017">2017</option>
					</select>
				</div>
				<div class="form-group"  style="margin-top:30px;">
					 <select class="form-control select_term" name="term">
						<option value="-1">学期</option>
						<option value="1">春季学期</option>
						<option value="2">秋季学期</option>
				    </select>
				</div>
				<button type="button" class="btn btn-info rank" style="margin-top:30px;">查询</button>
			</form>
			<p class="count_info" style="height:10px">
			</p>
			<ul class="evaluation_container" >
				<li>
					<ul class="list list_header">
						<li class="index" style="width:150px;">年份</li>
						<li class="dept">学期</li>
						<li class="course">课程名称</li>
						<li class="name">评教平均分</li>
						<li class="operation">学校排名</li>
					</ul>
					<c:forEach var="eval" items="${teachingRank }" varStatus="idxStatus">
						<ul class="list">
							<li class="index" style="width:150px;">${eval.year }</li>
							<li class="dept">${eval.term == 0 ? "春季学期":"秋季学期" }</li>
							<li class="course">${eval.courseName }</li>
							<li class="name">${eval.avg }</li>
							<li class="operation">${eval.rank }</li>
						</ul>
				    </c:forEach>
				</li>
			</ul>
		</div>
	</body>
	<script type="text/javascript">
		$(".btn-info").click(function(){
			var year = $(".select_year option:selected").val();			
			var term = $(".select_term option:selected").val();			
			if(year > 0 && term >= 0 ){
				$(".rank_form").submit();
			}else{
				show_fail_message("年份或学期条件未选中! 请选择...");
			}
		});
		
		 $(".select_year option[value="+<%=reqUtil.getYear()%>+"]").attr("selected","true");		
		 $(".select_term option[value="+<%=reqUtil.getTerm()+1%>+"]").attr("selected","true");
	</script>
	
	
</html>
