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
	List<CategoryItem> categoryItems = (List<CategoryItem>)request.getAttribute("categoryItems");
%>

<div id="content">
	<div class="content_header">
		<p style="margin-left:10px;width:200px;height:25px;margin-top:30px;">
			<button class="btn btn-primary" type="button">
			 &gt; 添加评教项:  
			</button>
		</p>
	</div>	
	<div class="content_body">
	<form action="<%=managerPath %>add_item" method="post" class="save_item_form">
		<table style="margin-left:100px;margin-top:50px;">
		<tr style="height:100px;line-height:100px;">
			<td style="width:100px;font-weight: bold;">所属评教类别</td>
			<td>
				 <select class="form-control select_dept" name="categoryNo">
				 		<%for(int i =0; i < categoryItems.size();i++){ %>
							<option value="<%=categoryItems.get(i).getCategoryNo()%>"><%=categoryItems.get(i).getCategoryName() %></option>
						<% }%>
				</select>
			</td>
		</tr>
		<tr>
			<td style="width:100px;font-weight: bold;">分类名称:</td>
			<td>
				<textarea rows="5" cols="60" class="form-control itemName" draggable="false" name="itemName"></textarea>
			</td>
		</tr>
		<tr style="margin-top:20px;height:100px;line-height:100px;">
			<td style="width:100px;"></td>
			<td>
				<input type="button" class="btn btn-primary save_item" value="保存添加"/>
			</td>
		</tr>
		</table>
		</form>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		$(".save_item").click(function(){
			if($(".itemName").val() != ""){
				$(".save_item_form").submit();
			}
		});
	})
</script>
