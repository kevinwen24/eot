<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.eot.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="content">
	<div class="content_header">
		评教分类
	</div>	
	<div class="content_body">
		<ul>
			<li class="data_line">
				<ul class="data_line_container stu_header_ul">
					<li class="stu_index stu_header" style="margin-left:20px;">序号</li>
					<li class="stu_no stu_header">评教编号</li>
					<li class="stu_name stu_header">分类名称</li>
					<li class="stu_gender stu_header">评教状态</li>
					<li class="stu_class stu_header" style="width:100px;">操作</li>
				</ul>
			</li>
			<li class="data_line">
				<c:forEach var="categoryItem" items="${categoryItems }" varStatus="idxStatus">
					<ul class="data_line_container">
							<li class="stu_index" style="margin-left:20px;"><c:out value="${idxStatus.index + 1 }"/></li>
							<li class="stu_no">${categoryItem.categoryNo }</li>
							<li class="stu_name">${categoryItem.categoryName }</li>
							<li class="stu_gender">${categoryItem.categoryActive == 0 ? "可用" : "已删除" }</li>
							<li class="stu_class" style="width:100px;">
								<a href="" class="btn btn-primary">修改</a>
								<c:if test="${categoryItem.categoryActive == 0 }">
									<a href="" class="btn btn-primary">删除</a>
								</c:if>
							</li>
					</ul>
				</c:forEach>
			</li>
		</ul>
	</div>
</div>