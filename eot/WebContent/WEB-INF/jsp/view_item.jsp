<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.eot.util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.eot.model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String managerPath = PathUtil.getFullPath("manager/");
	List<CategoryItem> categoryItems = (List<CategoryItem>)request.getAttribute("categoryItems");
%>
<div class="deal_option" style="display:none">
 <select class="form-control select_dept" >
 		<%for(int i =0; i < categoryItems.size();i++){ %>
			<option value="<%=categoryItems.get(i).getCategoryNo()%>"><%=categoryItems.get(i).getCategoryName() %></option>
		<% }%>
</select>
</div>
<div id="content">
	<div class="content_header">
		<p style="margin-left:10px;width:200px;height:25px;margin-top:30px;">
			<button class="btn btn-primary" type="button">
			 &gt; 评教项:  <span class="badge"></span>
			</button>
		</p>
	</div>
	<div class="content_body" style="overflow: scroll;height:450px;">
		<ul>
			<li class="data_line">
				<ul class="data_line_container stu_header_ul">
					<li class="stu_index stu_header" style="margin-left:50px;width:50px;">序号</li>
					<li class="stu_no stu_header" style="width:80px;">评教编号</li>
					<li class="stu_name stu_header" style="width:100px;">评教所属分类</li>
					<li class="stu_gender stu_header" style="width:400px;text-align: left;">评教项名称</li>
					<li class="stu_class stu_header" style="width:100px;">评教项状态</li>
					<li class="stu_major stu_header" style="width:200px;">操作</li>
				</ul>
			</li>
			<li class="data_line">
				<c:forEach var="item" items="${items }" varStatus="idxStatus">
					<form action="<%=managerPath%>update_item" method="post" >
					<input type="hidden" value="${item.itemNo }" name="itemNo"/>
					<ul class="data_line_container date_line_count_num" style="height:50px;line-height:50px;">
							<li class="stu_index" style="margin-left:50px;width:50px;"><c:out value="${idxStatus.index + 1 }"/></li>
							<li class="stu_no" style="width:80px;">${item.itemNo }</li>
							<li class="stu_name" style="width:100px;">${item.categoryName }</li>
							<li class="stu_gender" style="width:400px;text-align: left;">${item.itemName }</li>
							<li class="stu_class" style="width:100px;">
								<c:if test="${item.itemActive == 0 }">
									<span>可用</span>
								</c:if>
								<c:if test="${item.itemActive != 0 }">
									<span style="color:red;">已删除</span>
								</c:if>
							</li>
							<li class="stu_major" style="width:200px;">
								<span class="glyphicon glyphicon-pencil edit_date" style="margin-right:30px;cursor:pointer;"></span>
								<c:if test="${item.itemActive == 0 }">
									<span class="glyphicon glyphicon-trash delete_date" style="cursor:pointer;"></span>
								</c:if>
							</li>
					</ul>
					</form>
				</c:forEach>
			</li>
		</ul>
	</div>
</div>	

<script type="text/javascript">
	$(function(){
		$(".badge").text($(".date_line_count_num").length);
		
		var nameStr = "";
		
		$(".edit_date").click(function(){
			var name = $(this).parent().prev().prev();
			var categoryName = $(this).parent().parent().find(".stu_name");
			var itemNo = $(this).parent().parent().find(".stu_no").text().trim();
			
			nameStr = $(name).text();
			console.log(nameStr);
			$(name).html("<input type='input' name='itemName' class='form-control edit_name' value='"+nameStr+"' style='width:380px;height:30px;'>");
			$(name).css({"padding-left":"10px","padding-top":"8px","height":"40px"});
			$(categoryName).html("<select name='categoryNo' class='form-control select_dept'><option value='-1'>评教分类</option><%for(int i =0; i < categoryItems.size();i++){ %><option value='<%=categoryItems.get(i).getCategoryNo()%>'><%=categoryItems.get(i).getCategoryName() %></option><% }%></select>");
			$(categoryName).css({"padding-left":"10px","padding-top":"6px"});
			$(this).parent().html("<a href='' class='btn btn-success btn-small' style='margin-right:10px;'>取消</a><button type='button' class='btn btn-primary btn-small saveModifyData' style='z-index:100'>保存</button>");
			$("button.saveModifyData").click(function(){
				if( $(name).prev().find(".select_dept").val() > 0 || nameStr != $(name).find("input").val()){
					var itemform = $(this).parent().parent().parent("form");
					$(itemform).submit();
				} else {
					show_fail_message("输入需要修改数据！");
				}
			});
		});
		
		$(".delete_date").click(function(){
			 var itemNo = $(this).parent().parent().find(".stu_no").text().trim();
			 var msg = "您真的确定要删除吗？\n\n请确认！"; 
			 if (confirm(msg)==true){ 
				window.location.href="<%=managerPath%>update_item?itemNo=" + itemNo;
			 }
		});
	});
</script>

