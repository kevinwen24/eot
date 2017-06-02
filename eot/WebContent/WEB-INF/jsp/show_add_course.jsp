<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.eot.util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.eot.model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String managerPath = PathUtil.getFullPath("manager/");
%>


<div id="content">
	<div class="content_header">
		<p style="margin-left:10px;width:200px;height:25px;margin-top:30px;">
			<button class="btn btn-primary" type="button">
			 &gt; 添加课程:  
			</button>
		</p>
	</div>	
	<div class="content_body">
	<form action="<%=managerPath %>add_course" method="post" class="save_course_form">
		<table style="margin-left:100px;margin-top:50px;">
		<tr style="height:100px;line-height:100px;">
			<td style="width:100px;font-weight: bold;">课程名称</td>
			<td style="width:300px;">
				<input type="text" class="form-control course_name" name="courseName">
			</td>
		</tr>
		<tr>
			<td style="width:100px;font-weight: bold;">课程学分:</td>
			<td>
				<input type="text" class="form-control course_score" name="courseScore">
			</td>
		</tr>
		<tr style="margin-top:20px;height:100px;line-height:100px;">
			<td style="width:100px;"></td>
			<td>
				<input type="button" class="btn btn-primary save_course" value="保存添加"/>
			</td>
		</tr>
		</table>
		</form>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		$(".save_course").click(function(){
			if($(".course_name").val() != "" && $(".course_score").val() != ""  && !isNaN($(".course_score").val())){
				$(".save_course_form").submit();
			}else {
				show_fail_message("输入有误，重新输入！");
			}
		});
	})
</script>
