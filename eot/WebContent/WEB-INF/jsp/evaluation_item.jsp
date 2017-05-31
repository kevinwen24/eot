<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.eot.util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.eot.model.*" %>
<% 
	List<Map<String, List<Evaluation>>> lists = (List<Map<String, List<Evaluation>>>)request.getAttribute("lists");
	int itemNum = 0;
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>评教系统</title>
		<link rel="stylesheet" href="<%=PropertyUtil.getStaticUrl() %>css/bootstrap.css" />
		<link rel="stylesheet" href="<%=PropertyUtil.getStaticUrl() %>css/common.css" />
		<link rel="stylesheet" href="<%=PropertyUtil.getStaticUrl() %>css/content.css" />
		<link rel="stylesheet" href="<%=PropertyUtil.getStaticUrl() %>css/student_evaluation.css" />
		<script type="text/javascript" src="<%=PropertyUtil.getStaticUrl() %>js/plugins/jquery-1.10.2.js" ></script>
		<script type="text/javascript" src="<%=PropertyUtil.getStaticUrl() %>js/plugins/bootstrap.js" ></script>
		<style type="text/css">
			body {
				overflow: auto;
			}
			input:focus{
				outline: none;
			}
			label.focus input{
				outline: none;
			}
			*{
				outline: none;
			}
		</style>
	</head>
	<body>
		<div class="header">
			<jsp:include page="student_header.jsp"></jsp:include>			
		</div>
		<div class="item_content">
			<form action="<%=PathUtil.getFullPath("student/save") %>" method="post" id="form">
				<input type="hidden" value="${evaluationNo }" name="evaluationNo"/>
				<p class="evaluation_information">
					评教须知：
					评教分为5个等级，A、B、C、D、E，每位参评同学都应本着客观、公正的态度，须由本人对自己的任课教师的教学情况做出评价，不得由他人代评。
				</p>
				<%
					for(Map<String, List<Evaluation>> limap : lists){
						for(Map.Entry<String, List<Evaluation>> m : limap.entrySet()){
				%>
					<p style="margin-left:100px;width:200px;height:25px;margin-top:30px;">
						<button class="btn btn-primary" type="button">
						 <%=m.getKey() %>:  <span class="badge"><%=m.getValue().size() %></span>
						</button>
					</p>
					<ul class="item_container">
						<li>
							<ul class="item_header item">
								<li class="item_index">序号</li>
								<li class="item_name">评论项</li>
								<li class="item_score">等级分</li>
							</ul>
							<%
								List<Evaluation> evaluatios = m.getValue();
								itemNum = evaluatios.size();
								for(int i = 0; i < evaluatios.size(); i++) {
							%>
							<ul class="item">
								<li class="item_index"><%=i + 1 %></li>
								<li class="item_name">
									<%=evaluatios.get(i).getItemName() %>
								</li>
								<li class="item_score" id="<%=evaluatios.get(i).getItemNo() %>">
									<span><label for="optionA<%=evaluatios.get(i).getItemNo() %>">A</label><input type="radio" name="item<%=evaluatios.get(i).getItemNo() %>" id="optionA<%=evaluatios.get(i).getItemNo() %>" value="A"></span> 
									<span><label for="optionB<%=evaluatios.get(i).getItemNo() %>">B</label><input type="radio" name="item<%=evaluatios.get(i).getItemNo() %>" id="optionB<%=evaluatios.get(i).getItemNo() %>" value="B"></span> 
									<span><label for="optionC<%=evaluatios.get(i).getItemNo() %>">C</label><input type="radio" name="item<%=evaluatios.get(i).getItemNo() %>" id="optionC<%=evaluatios.get(i).getItemNo() %>" value="C"></span> 
									<span><label for="optionD<%=evaluatios.get(i).getItemNo() %>">D</label><input type="radio" name="item<%=evaluatios.get(i).getItemNo() %>" id="optionD<%=evaluatios.get(i).getItemNo() %>" value="D"></span>  
									<span><label for="optionE<%=evaluatios.get(i).getItemNo() %>">E</label><input type="radio" name="item<%=evaluatios.get(i).getItemNo() %>" id="optionE<%=evaluatios.get(i).getItemNo() %>" value="E"></span>  
								</li>
							</ul>
							<%
								}
							%>
						</li>
					</ul>
				<%
						}
					}
				%>
				<% if (itemNum > 0) {%>
					<input type="button" class="btn btn-primary submit" value="提交" style="margin-right:90px;float:right;margin-top:30px;width:80px;">
				<% }%>
				</form>
		</div>
	</body>
	<script type="text/javascript">
		$(function(){
			$("input.submit").click(function(){
				$("#form").submit();
			})
		})
	</script>
</html>
