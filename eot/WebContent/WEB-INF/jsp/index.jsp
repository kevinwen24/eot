<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.eot.util.*" %>
<%@ page import="com.eot.model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>评教系统</title>
		<link rel="stylesheet" href="<%=PropertyUtil.getStaticUrl() %>css/common.css" />
		<link rel="stylesheet" href="<%=PropertyUtil.getStaticUrl() %>css/constructure.css" />
		<link rel="stylesheet" href="<%=PropertyUtil.getStaticUrl() %>css/index.css" />
		<link rel="stylesheet" href="<%=PropertyUtil.getStaticUrl() %>css/bootstrap.css" />
		<link rel="stylesheet" href="<%=PropertyUtil.getStaticUrl() %>css/content.css" />
		<link rel="stylesheet" href="<%=PropertyUtil.getStaticUrl() %>css/add_teacher_class.css" />
		<link rel="stylesheet" href="<%=PropertyUtil.getStaticUrl() %>css/plugins/jquery.datetimepicker.css" />
		<script type="text/javascript" src="<%=PropertyUtil.getStaticUrl() %>js/plugins/jquery-1.10.2.js" ></script>
		<script type="text/javascript" src="<%=PropertyUtil.getStaticUrl() %>js/plugins/bootstrap.js" ></script>
		<script type="text/javascript" src="<%=PropertyUtil.getStaticUrl() %>js/plugins/animation.js" ></script>
		<script type="text/javascript" src="<%=PropertyUtil.getStaticUrl() %>js/nav.js" ></script>
		<script type="text/javascript" src="<%=PropertyUtil.getStaticUrl() %>js/common.js" ></script>
	</head>
	
	<body>
	
	<!--flashMessage  -->
<c:if test="${success_message != null }">
	<div class="message_container" style="top:10px;">
		${success_message}
	</div>
</c:if>

<c:if test="${fail_message != null }">
	<div class="message_container fail_message_container" style="background:#D84C29">
		${fail_message }
	</div>
</c:if>

<div class="message_container fail_message_container" style="background:#D84C29;display:none;top:10px">
	<!--显示错误信息  -->		
</div>

<script type="text/javascript">
	$(function(){
		setTimeout(function(){
			$(".message_container").css("display","none");
		}, 2000);
	})
</script>

<% 
	session.setAttribute("success_message", null);
	session.setAttribute("fail_message", null);
	User user = (User)session.getAttribute("user");
%>
	
		<div class="container">
			<div class="navigation" >
				<div class="person_info">
					<img src="<%=PropertyUtil.getStaticUrl() %>images/2015113173643639.png" alt="兰州理工大学" width="200">
					<p class="">工号:<%=user.getUserId() %></p>
					<p class="">管理员 <span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></p>
				</div>
				<div class="nav_container" >
					<ul class="menu">
						<li>
							<a class="header_nav" href="javascript:void(0)">授课管理  <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span></a>
							<ul class="second_container">
								<li class="second_nav"><i class="nav_icon_1"></i><a href="<%=PathUtil.getFullPath("manager/teacher_class") %>">授课信息</a></li>
								<li class="second_nav"><i class="nav_icon_2"></i><a href="<%=PathUtil.getFullPath("manager/show_addteacher_class") %>">增加授课</a></li>
							</ul>
						</li>
						<li>
							<a class="header_nav" href="javascript:void(0)">评教分类  <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span></a>
							<ul class="second_container">
								<li class="second_nav"><i class="nav_icon_1"></i><a href="<%=PathUtil.getFullPath("manager/view_category")%>">查看分类</a></li>
								<li class="second_nav"><i class="nav_icon_2"></i><a href="<%=PathUtil.getFullPath("manager/forward?action=add_category")%>">添加分类</a></li>
 							</ul>
						</li>
						<li>
							<a class="header_nav" href="javascript:void(0)">评教项  <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span></a>
							<ul class="second_container">
								<li class="second_nav"><i class="nav_icon_1"></i><a href="<%=PathUtil.getFullPath("manager/view_item")%>">查看评教项</a></li>
								<li class="second_nav"><i class="nav_icon_2"></i><a href="<%=PathUtil.getFullPath("manager/show_add_item")%>">添加评教项</a></li>
							</ul>
						</li>
						<li>
							<a class="header_nav" href="javascript:void(0)">设置时间  <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span></a>
							<ul class="second_container">
								<li class="second_nav"><i class="nav_icon_1"></i><a href="<%=PathUtil.getFullPath("manager/show_set_time")%>">设置评教时间</a></li>
							</ul>
						</li>
						<li>
							<a class="header_nav" href="javascript:void(0)">统计图表  <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span></a>
							<ul class="second_container">
								<li class="second_nav"><i class="nav_icon_1"></i><a href="<%=PathUtil.getFullPath("manager/view_itemmrrryr")%>">排名</a></li>
								<li class="second_nav"><i class="nav_icon_2"></i><a href="<%=PathUtil.getFullPath("manager/view_itemnerm")%>">统计图</a></li>
							</ul>
						</li>
						<li>
							<a class="header_nav" href="javascript:void(0)">学生管理  <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span></a>
							<ul class="second_container">
								<li class="second_nav"><i class="nav_icon_1"></i><a href="<%=PathUtil.getFullPath("manager/view_ityteemx")%>" target="student_iframe">学生管理</a></li>
								<li class="second_nav"><i class="nav_icon_2"></i><a href="<%=PathUtil.getFullPath("manager/view_itemyitixsax")%>">增加学生</a></li>
								<li class="second_nav"><i class="nav_icon_3"></i><a href="<%=PathUtil.getFullPath("manager/view_itemxitisa")%>">批量增加学生</a></li>
							</ul>
						</li>
						<li>
							<a class="header_nav" href="javascript:void(0)">老师管理  <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span></a>
							<ul class="second_container">
								<li class="second_nav"><i class="nav_icon_1"></i><a href="<%=PathUtil.getFullPath("manager/view_itemiytin")%>">学生管理</a></li>
								<li class="second_nav"><i class="nav_icon_2"></i><a href="<%=PathUtil.getFullPath("manager/view_itemfjt")%>">增加学生</a></li>
								<li class="second_nav"><i class="nav_icon_3"></i><a href="<%=PathUtil.getFullPath("manager/view_itemtuas")%>">批量增加学生</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<div class="content">
				<div class="header">
					 <div class="info">
				 		<span>欢迎管理员:</span>
						<span class="admin"><%=user.getName() %></span>
						<div class="system_btn">
							<a href="<%=PathUtil.getFullPath("logout")%>">注销</a>
						</div>
					</div>
				</div>
				<div class="frame_main">
				<input type="hidden" value="${forwardPage }" id="forwardPage"> 
				<c:choose>
					<c:when test="${forwardPage != null}">
						<jsp:include page="${forwardPage }.jsp"></jsp:include>
					</c:when>
					<c:otherwise>
						<jsp:include page="view_category.jsp"></jsp:include>
					</c:otherwise>
				</c:choose>
					<!-- <iframe class="J_iframe" name="student_iframe" width="100%" height="100%" src="/eot/WEB-INF/jsp/student_manager.jsp" frameborder="0" data-id="index_v1.html"></iframe> -->
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript">
		$(function(){
			var currentPage = $("#forwardPage").val();
			console.log("currentPage="+currentPage);
			var nav_lis = $(".second_nav");
			for (var i = 0; i < nav_lis.length; i++) {
				var currentHref	= $(nav_lis[i]).find("a").attr("href");
				//console.log(currentHref);
				if(currentHref.indexOf("action") < 0){
					if(currentHref.substring(18) == currentPage) {
						console.info("currentHref=" + currentHref);
						$(nav_lis[i]).parent().prev().find("span").attr("class","glyphicon glyphicon-chevron-down");
						$(nav_lis[i]).css("background","#293846");
						$(nav_lis[i]).find("a").css("color","#fff");
						$(nav_lis[i]).parent("ul").slideDown();
						break;
					}
				}
					
				if(currentHref.split("=")[1] == currentPage) {
					console.log($(nav_lis[i]).find("a").attr("href"));
					console.log(currentPage);
					$(nav_lis[i]).parent().prev().find("span").attr("class","glyphicon glyphicon-chevron-down");
					$(nav_lis[i]).css("background","#293846");
					$(nav_lis[i]).find("a").css("color","#fff");
					$(nav_lis[i]).parent("ul").slideDown();
					break;
				}
			}
		});
	</script>
</html>
    