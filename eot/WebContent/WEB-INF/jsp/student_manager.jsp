<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.eot.util.*" %>

<div id="content">
	<div class="content_header">
		<div class="search_student_dept_container">
			<form class="form-inline">
				<div class="form-group">
			    <select class="form-control select_year" >
						<option>年级</option>
						<option>2013</option>
						<option>2014</option>
						<option>2015</option>
						<option>2016</option>
						<option>2017</option>
				</select>
	  		</div>
		    <div class="form-group">
			    <select class="form-control select_dept" >
						<option>学院</option>
						<option>jdbsfk</option>
						<option>软件工程</option>
						<option>jdbsfk</option>
				</select>
	  		</div>
		    <div class="form-group">
		        <select class="form-control select_major" >
					<option>专业</option>
					<option>jdbsfk</option>
			    </select>
		    </div>
		    <div class="form-group">
			    <select class="form-control select_class" >
						<option>班级</option>
						<option>jdbsfk</option>
				</select>
		    </div>
	  		<button type="submit" class="btn btn-info">查询</button>
        </form>
		</div>
		
        <div class="search_student_no_container">
        	<input type="text" class="form-control search_student_no" placeholder="请输入学号..."/>
        	<a href="javascript:void(0)">
        		<span class="glyphicon glyphicon-search"></span>
        	</a>
        </div>
        
	</div>
	<div class="content_body">
		<ul>
			<li class="data_line">
				<ul class="data_line_container stu_header_ul">
					<li class="stu_index stu_header">序号</li>
					<li class="stu_no stu_header">学号</li>
					<li class="stu_name stu_header">姓名</li>
					<li class="stu_gender stu_header">性别</li>
					<li class="stu_class stu_header">班级</li>
					<li class="stu_major stu_header">专业</li>
					<li class="stu_dept stu_header">学院</li>
					<li class="stu_visit_date stu_header">入学时间</li>
					<li class="stu_edit stu_header">编辑</li>
				</ul>
			</li>
			<li class="data_line">
				<ul class="data_line_container">
					<li class="stu_index">1</li>
					<li class="stu_no"><a href="">123rg4</a></li>
					<li class="stu_name">姓名</li>
					<li class="stu_gender">性别</li>
					<li class="stu_class">班级</li>
					<li class="stu_major">专业</li>
					<li class="stu_dept">学院</li>
					<li class="stu_visit_date">入学时间</li>
					<li class="stu_edit">编辑</li>
				</ul>
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
		    <li class="active"><a href="#">1</a></li>
		    <li><a href="javascript:void(0)">2</a></li>
		    <li><a href="#">3</a></li>
		    <li><a href="#">4</a></li>
		    <li><a href="#">5</a></li>
		    <li>
		      <a href="#" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav>
	</div>
</div>	


