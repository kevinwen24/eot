<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.eot.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String managerPath = PathUtil.getFullPath("manager/");
%>

<div id="content">
	<div class="content_header">
		<div class="search_student_dept_container">
		<form class="form-inline school_form" action="<%=managerPath %>teacher_class" method="post" >
			<input type="hidden" value="${pagination.currentPage }" id="currentPage" name="currentPage">
			<input type="hidden" value="${pagination.pageSize }" id="pageSize" name="pageSize"> 
			<input type="hidden" value="${pagination.term }" id="term"> 
			<input type="hidden" value="${pagination.year }" id="year"> 
			<div class="form-group">
			    <select class="form-control select_dept" name="deptNo">
						<option value="-1">教师所属学院</option>
						<option value="12">jdbsfk</option>
						<option value="23">软件工程</option>
						<option value="202">jdbsfk</option>
				</select>
	  		</div>
			<div class="form-group">
			    <select class="form-control select_year" name="year">
						<option value="-1">日期</option>
						<option value="2013">2013</option>
						<option value="2014">2014</option>
						<option value="2015">2015</option>
						<option value="2016">2016</option>
						<option value="2017">2017</option>
				</select>
	  		</div>		    
		    <div class="form-group">
		        <select class="form-control select_term" name="term">
					<option value="-1">学期</option>
					<option value="1">春季学期</option>
					<option value="2">秋季学期</option>
			    </select>
		    </div>
	  		<button type="submit" class="btn btn-info">查询</button>
		</form>
		</div>
		<div class="search_student_no_container">
		<form class="teacher_class_form" action="<%=managerPath %>teacher_class" method="post" style="width:400px;60px;">
        	<input type="text" class="form-control search_student_no" value="${pagination.teacherNo }" name="teacherNo" placeholder="请输入老师职工号..." style="margin-left:100px;"/>
        	<a href="javascript:void(0)">
        		<span class="glyphicon glyphicon-search search_by_teacher_sub" ></span>
        	</a>
        </form>
        </div>
	</div>
	 
	<div class="content_body">
		<ul>
			<li class="data_line">
				<ul class="data_line_container stu_header_ul">
					<li class="stu_index stu_header" style="margin-left:20px;">序号</li>
					<li class="stu_no stu_header">所属学院</li>
					<li class="stu_name stu_header">职工编号</li>
					<li class="stu_gender stu_header">姓名</li>
					<li class="stu_class stu_header" style="width:100px;">年份</li>
					<li class="stu_major stu_header" style="width:100px;">学期</li>
					<li class="stu_dept stu_header">课程名称</li>
					<li class="stu_visit_date stu_header" style="width:80px;">学生年级</li>
					<li class="stu_edit stu_header" style="width:180px;">学生班级</li>
				</ul>
			</li>
			<li class="data_line">
				<c:forEach var="teacherClass" items="${teacherClasss }" varStatus="idxStatus">
					<ul class="data_line_container">
							<li class="stu_index" style="margin-left:20px;"><c:out value="${idxStatus.index + 1 }"/></li>
							<li class="stu_no">${teacherClass.deptName }</li>
							<li class="stu_name">${teacherClass.teacherNo }</li>
							<li class="stu_gender">${teacherClass.teacherName }</li>
							<li class="stu_class" style="width:100px;">${teacherClass.year }</li>
							<li class="stu_major" style="width:100px;">${teacherClass.term == 0 ? "春季":"秋季" }</li>
							<li class="stu_dept">${teacherClass.courseName }</li>
							<li class="stu_visit_date" style="width:80px;">${teacherClass.grade }</li>
							<li class="stu_edit" style="width:180px;">${teacherClass.majorName } ${teacherClass.classIndex }班</li>
					</ul>
				</c:forEach>
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
		    <c:forEach var="pageIndex" items="${pageIndexs }">
		    	<li class="pageIndex">
		    			<c:choose>
		    				<c:when test="${pageIndex != -1}">
			    				<a href="javascript:void(0)" >
			    					<c:out value="${pageIndex }"/>
			    				</a>
		    				</c:when>
		    				<c:when test="${pageIndex == -1}">
			    				<span>...</span>
		    				</c:when>
		    			</c:choose>
		    	</li>
		    </c:forEach>
		    <li>
		      <a href="#" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav>
	</div>
</div>	

<script type="text/javascript">
	$(function(){
		var currentPage = $("#currentPage").val();
		var pageIndexs = $(".pageIndex");
		for (var i = 0; i < pageIndexs.length; i++) {
			if ($(pageIndexs[i]).text().trim() == currentPage){
				$(pageIndexs[i]).addClass("active");
			}
		}
		
		$(".search_by_teacher_sub").click(function(){
			if($(".search_student_no").val() == "" || isNaN($(".search_student_no").val())){
				show_fail_message("输入不合法!");
			} else {
				$(".teacher_class_form").submit();
			}
		});
		
		if($("#term").val() >= 0){
		   var childs = $(".select_term").children();
			
			for(var i = 0;i <childs.length; i++ ){
				if($(childs[i]).attr("value") == $("#term").val().trim() - 0 + 1){
					$(childs[i]).attr("selected","true");
					break;
				}
			}
		}
		
		if($("#year").val() >= 0){
			   var childs = $(".select_year").children();
				
				for(var i = 0;i <childs.length; i++ ){
					if($(childs[i]).attr("value") == $("#year").val().trim()){
						$(childs[i]).attr("selected","true");
						break;
					}
				}
		}
		
		var paglis = $("ul.pagination").children("li.pageIndex");
		for(var i = 0;i < paglis.length; i++ ){
			$(paglis[i]).find("a").click(function(){
				console.log($(paglis[i]).text().trim());
				console.log($(paglis[i]).text().trim());
				if($(paglis[i]).text().trim() > 0){
					$("#currentPage").val($(paglis[i]).text().trim());
					$(".school_form").submit();
				}
			});
		}
	});
</script>

