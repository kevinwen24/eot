<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.eot.util.*" %>
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
		<script type="text/javascript" src="<%=PropertyUtil.getStaticUrl() %>js/plugins/jquery-1.10.2.js" ></script>
		<script type="text/javascript" src="<%=PropertyUtil.getStaticUrl() %>js/plugins/bootstrap.js" ></script>
		<script type="text/javascript" src="<%=PropertyUtil.getStaticUrl() %>js/plugins/animation.js" ></script>
		<script type="text/javascript" src="<%=PropertyUtil.getStaticUrl() %>js/nav.js" ></script>
	</head>
	<body>
	
		<div class="container">
			<div class="navigation" >
				<div class="person_info">
					<img src="<%=PropertyUtil.getStaticUrl() %>images/2015113173643639.png" alt="兰州理工大学" width="200">
					<p class="">工号:000001</p>
					<p class="">管理员 <span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></p>
				</div>
				<div class="nav_container" >
					<ul class="menu">
						<li>
							<a class="header_nav" href="javascript:void(0)">授课管理  <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span></a>
							<ul class="second_container">
								<li class="second_nav"><i class="nav_icon_1"></i><a href="<%=PathUtil.getFullPath("manager/forward?action=teacher_class") %>">授课信息</a></li>
								<li class="second_nav"><i class="nav_icon_2"></i><a href="<%=PathUtil.getFullPath("manager/forward?action=add_teacher_class") %>">增加授课</a></li>
								<li class="second_nav"><i class="nav_icon_3"></i><a href="<%=PathUtil.getFullPath("manager/view_itejydnmdw")%>">批量增加授课</a></li>
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
						<li>
							<a class="header_nav" href="javascript:void(0)">评教分类  <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span></a>
							<ul class="second_container">
								<li class="second_nav"><i class="nav_icon_1"></i><a href="<%=PathUtil.getFullPath("manager/view_category")%>">查看分类</a></li>
								<li class="second_nav"><i class="nav_icon_2"></i><a href="<%=PathUtil.getFullPath("manager/view_itemhacg")%>">添加分类</a></li>
 							</ul>
						</li>
						<li>
							<a class="header_nav" href="javascript:void(0)">评教项  <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span></a>
							<ul class="second_container">
								<li class="second_nav"><i class="nav_icon_1"></i><a href="<%=PathUtil.getFullPath("manager/view_item")%>">查看评教项</a></li>
								<li class="second_nav"><i class="nav_icon_2"></i><a href="<%=PathUtil.getFullPath("manager/view_itemcmmuuu")%>">添加评教项</a></li>
							</ul>
						</li>
						<li>
							<a class="header_nav" href="javascript:void(0)">设置时间  <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span></a>
							<ul class="second_container">
								<li class="second_nav"><i class="nav_icon_1"></i><a href="<%=PathUtil.getFullPath("manager/view_itemdrdcm")%>">设置评教时间</a></li>
							</ul>
						</li>
						<li>
							<a class="header_nav" href="javascript:void(0)">统计图表  <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span></a>
							<ul class="second_container">
								<li class="second_nav"><i class="nav_icon_1"></i><a href="<%=PathUtil.getFullPath("manager/view_itemmrrryr")%>">排名</a></li>
								<li class="second_nav"><i class="nav_icon_2"></i><a href="<%=PathUtil.getFullPath("manager/view_itemnerm")%>">统计图</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<div class="content">
				<div class="header">
					<div class="logo">
					</div>
					<div class="user_info">
						  <div class="btn-group">
						    <a class="btn btn-info dropdown-toggle  my_info_btn" data-toggle="dropdown" href="#">
						       我的
						    <span class="caret"></span>
						    </a>
						   <ul class="dropdown-menu my_info_dropdown_me<br />nu" role="menu"  aria-labelledby="dLabel">
						    <li><a tabindex="-1" href="#">Action</a></li>
						    <li><a tabindex="-1" href="#">Another action</a></li>
						    <li><a tabindex="-1" href="#">我的信息</a></li>
						    <li class="divider"></li>
						    <li><a tabindex="-1" href="#">退出</a></li>
						  </ul>
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
						<jsp:include page="teacher_class.jsp"></jsp:include>
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
    