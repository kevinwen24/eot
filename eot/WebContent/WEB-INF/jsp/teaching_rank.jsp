<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.eot.util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.eot.model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String managerPath = PathUtil.getFullPath("manager/");
	List<SchoolInfo> depts = (List<SchoolInfo>)request.getAttribute("depts");
	ReqUtil reqUtil = (ReqUtil)request.getAttribute("reqUtil");
%>
<div id="content">
	<div class="content_header" style="padding-left:40px;">
	<form class="form-inline rank_form" action="<%=managerPath %>teaching_rank_condition" method="post" >
		<div class="form-group">
		    <select class="form-control select_dept" name="deptNo">
				<option value="-1">选择教师学院</option>
					<%for(int i =0; i < depts.size();i++){ %>
						<option value="<%=depts.get(i).getDeptNo()%>"><%=depts.get(i).getDeptName() %></option>
					<% }%>
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
		<button type="button" class="btn btn-info rank">查询</button>
	</form>
	</div>
	<div class="content_body" style="overflow: scroll;height:450px;">
		<ul>
			<li class="data_line">
				<ul class="data_line_container stu_header_ul">
					<li class="stu_index stu_header" style="margin-left:50px;width:100px;">名次</li>
					<li class="stu_no stu_header" style="width:80px;">教师编号</li>
					<li class="stu_name stu_header" style="width:150px;">所属学院</li>
					<li class="stu_gender stu_header" style="width:200px;">课程名称</li>
					<li class="stu_class stu_header" style="width:80px;">时间</li>
					<li class="stu_class stu_header" style="width:100px;">学期</li>
					<li class="stu_major stu_header" style="width:100px;">评教平均分</li>
					<li class="stu_major stu_header" style="width:100px;">评教人数</li>
				</ul>
			</li>
			<li class="data_line">
				<c:forEach var="eval" items="${teachingRank }" varStatus="idxStatus">
					<ul class="data_line_container date_line_count_num" style="height:50px;line-height:50px;">
							<li class="stu_index" style="margin-left:50px;width:100px;">
							<c:out value="${idxStatus.index + 1}"/></li>
							<li class="stu_no" style="width:80px;">${eval.teacherName }</li>
							<li class="stu_name" style="width:150px;">${eval.deptName  }</li>
							<li class="stu_gender" style="width:200px;">${eval.courseName }</li>
							<li class="stu_class" style="width:80px;">
								${eval.year }
							</li>
							<li class="stu_class" style="width:100px;">
								${eval.term == 0 ? "春季学期":"秋季学期" }
							</li>
							<li class="stu_major" style="width:100px;">
								${eval.avg }
							</li>
							<li class="stu_major" style="width:100px;">${eval.studentNum  }</li>
					</ul>
				</c:forEach>
			</li>
		</ul>
	</div>
</div>	
<script type="text/javascript">
	$(function(){
		$(".btn-info").click(function(){
			var deptNo = $(".select_dept option:selected").val();			
			var year = $(".select_year option:selected").val();			
			var term = $(".select_term option:selected").val();			
			if(year > 0 && term >= 0 ){
				$(".rank_form").submit();
			}else{
				show_fail_message("年份或学期条件未选中! 请选择...");
			}
		});
		console.log(<%=reqUtil.getTerm()%>);
		 $(".select_dept option[value="+<%=reqUtil.getDeptNo()%>+"]").attr("selected","true");			
		 $(".select_year option[value="+<%=reqUtil.getYear()%>+"]").attr("selected","true");		
		 $(".select_term option[value="+<%=reqUtil.getTerm()%>+"]").attr("selected","true");
	})
</script>



