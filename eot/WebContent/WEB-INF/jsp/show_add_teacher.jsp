<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.eot.util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.eot.model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String managerPath = PathUtil.getFullPath("manager/");
%>

<%
	List<SchoolInfo> depts = (List<SchoolInfo>)request.getAttribute("depts");
%>

<div id="content">
	<div class="content_header">
		<p style="margin-left:10px;width:200px;height:25px;margin-top:30px;">
			<button class="btn btn-primary" type="button">
			 &gt; 添加教师:  
			</button>
		</p>
	</div>	
	<div class="content_body">
	<form action="<%=managerPath %>save_teacher" method="post" class="save_teacher_form">
		<table style="margin-left:100px;margin-top:50px;">
		<tr style="height:50px;line-height:50px;">
			<td style="width:100px;font-weight: bold;">所属学院</td>
			<td style="width:320px;">
				 <select class="form-control teach_dept_select" name="deptNo">
							<option value="-1">选择教师学院</option>
							<%for(int i =0; i < depts.size();i++){ %>
								<option value="<%=depts.get(i).getDeptNo()%>"><%=depts.get(i).getDeptName() %></option>
							<% }%>
				</select>
			</td>
		</tr>
		<tr style="height:50px;line-height:50px;">
			<td style="width:100px;font-weight: bold;">职工号</td>
			<td>
				<input type="text" class="form-control teacherNo" name="teacherNo"> 
			</td>
		</tr>
		<tr style="height:50px;line-height:50px;">
			<td style="width:100px;font-weight: bold;">姓名</td>
			<td>
				<input type="text" class="form-control userName" name="userName"> 
			</td>
		</tr>
		<tr style="height:50px;line-height:50px;">
			<td style="width:100px;font-weight: bold;">性别</td>
			<td>
				<label for="male">男</label>
				<input type="radio" id="male" value="男" name="gender"> 
				<label for="female" style="margin-left:10px">女</label>
				<input type="radio" id="female" value="女" name="gender"> 
			</td>
		</tr>
		<tr style="height:50px;line-height:50px;">
			<td style="width:100px;font-weight: bold;">职称</td>
			<td>
				<input type="text" class="form-control rank" name="rank"> 
			</td>
		</tr>
		<tr>
			<td style="width:100px;font-weight: bold;">手机号</td>
			<td>
				<input type="text" class="form-control phone" name="phone"> 
			</td>
		</tr>
		<tr style="margin-top:20px;height:100px;line-height:100px;">
			<td style="width:100px;"></td>
			<td>
				<input type="button" class="btn btn-primary save_teacher" value="保存添加"/>
			</td>
		</tr>
		</table>
		</form>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		$(".save_teacher").click(function(){
			var deptNo = $(".teach_dept_select option:selected").val();			
			var gender = $("input[name='gender']:checked").val();	
			if($(".userName").val() != "" && deptNo > 0 && gender != "undefined" && $(".phone").val()!="" && $(".teacherNo").val() != "" && $(".rank").val() != ""){
				if(isNaN($(".phone").val()) || $(".phone").val().length!=11){
					show_fail_message("请输入相应合法手机号！");
					return;
				}
				
				if(isNaN($(".teacherNo").val())){
					show_fail_message("请输入相应合法教师职工号！");
					return;
				}
				$(".save_teacher_form").submit();
			}else{
				show_fail_message("请输入相应数据！");
			}
		});
	})
</script>
