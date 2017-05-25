<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.eot.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String managerPath = PathUtil.getFullPath("manager/");
%>

<div id="content">
	<div class="content_header">
		<p style="margin-left:10px;width:200px;height:25px;margin-top:30px;">
			<button class="btn btn-primary" type="button">
			 &gt; 添加评教分类:  
			</button>
		</p>
	</div>	
	<div class="content_body">
	<form action="<%=managerPath %>add_category" method="post" class="save_category_form">
		<table style="margin-left:100px;margin-top:50px;">
			<tr>
				<td style="width:100px;font-weight: bold;">分类名称:</td>
				<td>
					<textarea rows="5" cols="60" class="form-control categoryName" draggable="false" name="categoryName"></textarea>
				</td>
			</tr>
			<tr style="margin-top:20px;height:100px;line-height:100px;">
				<td style="width:100px;"></td>
				<td>
					<input type="button" class="btn btn-primary save_category" value="保存添加"/>
				</td>
			</tr>
		</table>
		</form>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		$(".save_category").click(function(){
			if($(".categoryName").val() != ""){
				$(".save_category_form").submit();
			}
		});
	})
</script>
