<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.eot.util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.eot.model.*" %>

<% 
		List<Evaluation> evaluationClasss = (List<Evaluation>)request.getAttribute("evaluationClasss");
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
			<p class="count_info"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span> 共有<span class="count"><%=evaluationClasss.size() %></span>条评教信息</p>
			<ul class="evaluation_container">
				<li>
					<ul class="list list_header">
						<li class="index">序号</li>
						<li class="dept">教师所属学院</li>
						<li class="name">教师姓名</li>
						<li class="course">课程名称</li>
						<li class="operation">操作</li>
					</ul>
					<% 
						for(int i = 0 ; i < evaluationClasss.size(); i++){
					%>
						<ul class="list">
							<li class="index"><%=i + 1%></li>
							<li class="dept"><%=evaluationClasss.get(i).getDeptName() %></li>
							<li class="name"><%=evaluationClasss.get(i).getTeacherName() %></li>
							<li class="course"><%=evaluationClasss.get(i).getCourseName() %></li>
							<li class="operation"><a class="btn btn-primary" href="<%=PathUtil.getFullPath("student/item?evaluationNo=")%><%=evaluationClasss.get(i).getEvaluationNo()%>">进入评教</a></li>
						</ul>
					<%
						}
					%>
				</li>
			</ul>
		</div>
	</body>
	<script type="text/javascript">
		var evalSize = <%=evaluationClasss.size()%>
		if(evalSize <=0 ){
			$(".count_info").text("暂时没有可评教的信息");
			$(".evaluation_container").css("display","none");
		}
	</script>
</html>
