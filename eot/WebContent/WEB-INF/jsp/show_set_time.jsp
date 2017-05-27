<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.eot.util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.eot.model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String managerPath = PathUtil.getFullPath("manager/");
%>
<script type="text/javascript" src="<%=PropertyUtil.getStaticUrl() %>js/plugins/jquery.datetimepicker.full.min.js" ></script>
<div id="content">
	<div class="content_header">
		<p style="margin-left:10px;width:500px;height:25px;margin-top:30px;">
			<button class="btn btn-primary" type="button" style="margin-right:10px;">
			 &gt; 设置评教时间:
			</button> 
			现在是: 
			<span style="font-weight:bold;"><%=DateUtil.getYear(new Date()) %>  <%=DateUtil.getTerm(new Date()) == 0 ? "春季":"秋季" %></span>
			学期 
		</p>
	</div>	
	<div class="content_body">
	<form action="<%=managerPath %>set_time" method="post" class="set_time_form">
		<table style="margin-left:100px;margin-top:50px;">
		<tr style="height:100px;line-height:100px;">
			<td style="width:100px;font-weight: bold;">评教开始时间</td>
			<td style="width:300px;">
				 <input type="text" id="start_datetimepicker" class="form-control">
			</td>
		</tr>
		<tr style="height:100px;line-height:100px;">
			<td style="width:100px;font-weight: bold;">评教结束时间</td>
			<td>
				<input type="text" id="end_datetimepicker" class="form-control">
			</td>
		</tr>
		<tr style="margin-top:20px;height:100px;line-height:100px;">
			<td style="width:100px;"></td>
			<td>
				<input type="button" class="btn btn-primary save_set" value="保存设置"/>
			</td>
		</tr>
		</table>
		</form>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		$(".save_set").click(function(){
			if($(".itemName").val() != ""){
				$(".set_time_form").submit();
			}
		});
	})
</script>
<script type="text/javascript">
	$('#start_datetimepicker').datetimepicker({
		formatTime:'H:i',
		formatDate:'d.m.Y',
		//defaultDate:'8.12.1986', // it's my birthday
		defaultDate:'+03.01.1970', // it's my birthday
		defaultTime:'10:00',
		timepickerScrollbar:false
	});	
	$('#end_datetimepicker').datetimepicker({
		formatTime:'H:i',
		formatDate:'d.m.Y',
		//defaultDate:'8.12.1986', // it's my birthday
		defaultDate:'+03.01.1970', // it's my birthday
		defaultTime:'10:00',
		timepickerScrollbar:false
	});	
</script>