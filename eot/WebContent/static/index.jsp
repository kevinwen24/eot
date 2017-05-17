<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.eot.util.*" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>评教系统</title>
		<link rel="stylesheet" href="css/common.css" />
		<link rel="stylesheet" href="css/constructure.css" />
		<link rel="stylesheet" href="css/index.css" />
		<link rel="stylesheet" href="css/bootstrap.css" />
		<script type="text/javascript" src="js/plugins/jquery-1.10.2.js" ></script>
		<script type="text/javascript" src="js/plugins/bootstrap.js" ></script>
		<script type="text/javascript" src="js/plugins/animation.js" ></script>
		<script type="text/javascript" src="js/nav.js" ></script>
	</head>
	<body>
		<div class="container">
			<div class="navigation">
				<div class="person_info">
					<img src="images/2015113173643639.png" alt="兰州理工大学" width="200">
					<p class="">工号:000001</p>
					<p class="">管理员 <span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></p>
				</div>
				<div class="nav_container">
					<ul class="menu">
						<li>
							<a class="header_nav" href="javascript:void(0)">学生管理  <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span></a>
							<ul class="second_container">
								<li class="second_nav"><i class="nav_icon_1"></i><a href="student_manager.html" target="student_iframe">学生管理</a></li>
								<li class="second_nav"><i class="nav_icon_2"></i><a href="#">增加学生</a></li>
								<li class="second_nav"><i class="nav_icon_3"></i><a href="#">批量增加学生</a></li>
							</ul>
						</li>
						<li>
							<a class="header_nav" href="javascript:void(0)">老师管理  <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span></a>
							<ul class="second_container">
								<li class="second_nav"><i class="nav_icon_1"></i><a href="student_manager.html">学生管理</a></li>
								<li class="second_nav"><i class="nav_icon_2"></i><a href="#">增加学生</a></li>
								<li class="second_nav"><i class="nav_icon_3"></i><a href="#">批量增加学生</a></li>
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
					
				<iframe class="J_iframe" name="student_iframe" width="100%" height="100%" src="/eot/WEB-INF/jsp/student_manager.jsp" frameborder="0" data-id="index_v1.html"></iframe> 
				</div>
			</div>
		</div>
	</body>
</html>
    