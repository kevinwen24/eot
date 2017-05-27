<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.eot.util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.eot.model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String managerPath = PathUtil.getFullPath("manager/");
	List<SchoolInfo> depts = (List<SchoolInfo>)request.getAttribute("depts");
	List<SchoolInfo> majors = (List<SchoolInfo>)request.getAttribute("majors");
	List<SchoolInfo> courses = (List<SchoolInfo>)request.getAttribute("courses");
%>
<div id="content" class="add_teacher_class_content">
	<form action="" method="post">
		<table>
			<tr>
				<td class="input_tip"><label>教师所属学院</label></td>
				<td class="input_content">
					 <select class="form-control teach_dept_select" >
							<option value="-1">选择教师学院</option>
							<%for(int i =0; i < depts.size();i++){ %>
								<option value="<%=depts.get(i).getDeptNo()%>"><%=depts.get(i).getDeptName() %></option>
							<% }%>
					</select>
				</td>
			</tr>
			<tr>
				<td class="input_tip"><label>教师姓名</label></td>
				<td class="input_content">
					 <select class="form-control " >
					 <option value="-1">选择教师姓名</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="input_tip"><label>教授课程</label></td>
				<td class="input_content">
					 <select class="form-control " >
							<option value="-1">选择课程</option>
							<%for(int i =0; i < courses.size();i++){ %>
								<option value="<%=courses.get(i).getCourseNo()%>"><%=courses.get(i).getCourseName() %></option>
							<% }%>
					</select>
				</td>
			</tr>
			<tr>
				<td class="input_tip"><label>学生专业</label></td>
				<td class="input_content">
					 <select class="form-control stu_major_select" >
					 <option value="-1">选择学生专业</option>
							<%for(int i =0; i < majors.size();i++){ %>
								<option value="<%=majors.get(i).getMajorNo()%>"><%=majors.get(i).getMajorName() %></option>
							<% }%>
					</select>
				</td>
			</tr>
			<tr>
				<td class="input_tip"><label>学生年级</label></td>
				<td class="input_content">
				 <select class="form-control " >
						<option>年级</option>
						<option>2013</option>
						<option>2014</option>
						<option>2015</option>
						<option>2016</option>
						<option>2017</option>
				</select>
				</td>
			</tr>
			<tr>
				<td class="input_tip"><label>学生班级</label></td>
				<td class="input_content">
				 <select class="form-control " multiple="multiple" class="all_select" style="width:300px;float: left;height: 150px;">
						<option class="all_select_option" value="2013">2013</option>
						<option class="all_select_option" value="2014">2014</option>
						<option class="all_select_option" value="2015">2015</option>
						<option class="all_select_option" value="2016">2016</option>
						<option class="all_select_option" value="2017">2017</option>
				</select>
				<div class="controll_class" style="">
					<span class="add_class">&gt;</span>
					<span class="remove_class">&lt;</span>
					<span class="add_all_class" style="margin-top:20px;background: #1C84C6;">&gt;&gt;</span>
					<span class="remove_all_class" style="background: #1C84C6;">&lt;&lt;</span>
				</div>
			    <select class="form-control " multiple="multiple" class="commit_select" style="width:300px;float: left;	height: 150px;">
						<option>年级</option>
						<option>2013</option>
						<option>2014</option>
						<option>2015</option>
						<option>2016</option>
						<option>2017</option>
				</select>
				</td>
			</tr>
		</table>
		<hr width="99.5%" style="border:1px solid #ccc;margin-left:"/>
		 <input type="button" class="btn btn-success" value="保存添加" style="float: right; margin-right: 100px;"> 
	</form>
</div>	

<script type="text/javascript">
	$(function(){
		var allSelectOption = $(".all_select_option");
		var	commitSelct = $(".commit_select");
		var addClass = $(".add_class");
		var removeClass = $(".remove_class");
		var addAllClass = $(".add_all_class");
		var removeAllClass = $(".remove_all_class");
		
		addClass.click(function(){
			console.log("add");
			
			var text = $(".all_select option:selected").val();
			var value = $(".all_select option:selected").attr("value");
			console.log("text"+text);
			console.log("value"+value);
			if (text != undefined && value != undefined) {
				console.log("can add");
			}
			/* for(var i = 0; i < allSelectOption.length; i++){
				 
				if($(allSelectOption[i]).attr("selected")) {
					console.log(1);
				}
			} */
		});
		
		removeClass.click(function(){
			
		});	
		
		addAllClass.click(function(){
			
		});
		
		removeAllClass.click(function(){
			
		});
	});
	var deptNo = $(".teach_dept_select").val();
	$(function(){
		$(".teach_dept_select").change(function(){
			if(deptNo > 1){
				$.ajax({
		             type: "GET",
		             url: "<%=managerPath%>all_teacher_deptNo"?deptNo,
		             dataType: "json",
		             contentType:"application/json",
		             success: function(data){
		            	 alert(data);
	                         $('.teach_dept_select').empty(); 
	                         //清空resText里面的所有内容
	                         var html = ''; 
	                         $.each(data, function(commentIndex, comment){
	                               html += '<div class="comment"><h6>' + comment['username']
	                                         + ':</h6><p class="para"' + comment['content']
	                                         + '</p></div>';
	                         });
	                         $('.teach_dept_select').html('<option value="-1">选择教师姓名</option>' + html);
	                      }
				}
			}
		}		  
	})
</script>

