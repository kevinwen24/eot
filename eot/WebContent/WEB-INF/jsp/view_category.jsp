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
			 &gt; 评教分类:  <span class="badge"></span>
			</button>
		</p>
	</div>	
	<div class="content_body">
		<ul >
			<li class="data_line">
				<ul class="data_line_container stu_header_ul">
					<li class="stu_index stu_header" style="margin-left:100px;width:200px;">序号</li>
					<li class="stu_no stu_header" style="width:100px;">评教编号</li>
					<li class="stu_name stu_header" style="width:300px;">分类名称</li>
					<li class="stu_gender stu_header" style="width:100px;">评教状态</li>
					<li class="stu_class stu_header" style="width:200px;">操作</li>
				</ul>
			</li>
			<li class="data_line">
				<c:forEach var="categoryItem" items="${categoryItems }" varStatus="idxStatus">
					<ul class="data_line_container date_line_count_num" style="height:50px;line-height:50px;">
							<li class="stu_index" style="margin-left:100px;width:200px;"><c:out value="${idxStatus.index + 1 }"/></li>
							<li class="stu_no" style="width:100px;">${categoryItem.categoryNo }</li>
							<li class="stu_name" style="width:300px;">${categoryItem.categoryName }</li>
							<li class="stu_gender" style="width:100px;">
								<c:if test="${categoryItem.categoryActive == 0 }">
									<span>可用</span>
								</c:if>
								<c:if test="${categoryItem.categoryActive != 0 }">
									<span style="color:red;">已删除</span>
								</c:if>
							</li>
							<li class="stu_class" style="width:200px;">
								<c:if test="${categoryItem.categoryActive == 0 }">
								<span class="glyphicon glyphicon-pencil edit_date" style="margin-right:30px;cursor:pointer;"></span>
									<span class="glyphicon glyphicon-trash delete_date" style="cursor:pointer;"></span>
								</c:if>
							</li>
					</ul>
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
			var categoryNo = $(this).parent().parent().find(".stu_no").text().trim();
			
			nameStr = $(name).text();
			$(name).html("<input type='input' class='form-control edit_name' value='"+nameStr+"' style='width:200px;height:30px;'>");
			$(name).css({"padding-left":"50px","padding-top":"10px"});
			$(this).parent().html("<a href='' class='btn btn-success btn-small' style='margin-right:10px;'>取消</a><button class='btn btn-primary btn-small saveModifyData' style='z-index:100'>保存</button>");
			$("button.saveModifyData").click(function(){
				if(nameStr != $(".edit_name").val()){
					window.location.href="<%=managerPath%>update_category?categoryNo= " + categoryNo + "&categoryName=" + $(".edit_name").val();
				}
			});
		});
		
		$(".delete_date").click(function(){
			 var categoryNo = $(this).parent().parent().find(".stu_no").text().trim();
			 var msg = "您真的确定要删除吗？\n\n请确认！"; 
			 if (confirm(msg)==true){ 
				window.location.href="<%=managerPath%>update_category?categoryNo=" + categoryNo;
			 }
		});
	});
</script>
