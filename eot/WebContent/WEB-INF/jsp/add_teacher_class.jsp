<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.eot.util.*" %>

<div id="content" class="add_teacher_class_content">
	<form action="" method="post">
		<table>
			<tr>
				<td class="input_tip"><label>教师所属学院</label></td>
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
				<td class="input_tip"><label>教师姓名</label></td>
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
				<td class="input_tip"><label>教授课程</label></td>
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
				<td class="input_tip"><label>所选专业</label></td>
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
				<td class="input_tip"><label>教授专业</label></td>
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
				<td class="input_tip"><label>教授班级</label></td>
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
</script>

