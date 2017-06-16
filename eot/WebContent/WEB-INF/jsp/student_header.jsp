<%@ page import="com.eot.util.*" %>
<%@ page import="com.eot.model.*" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	User user = (User)session.getAttribute("user");
%>

<div class="header_container">
	<img src="<%=PropertyUtil.getStaticUrl() %>images/2015113173643639.png" alt="兰州理工大学" width="200" height="70">
	<div class="info">
		<div class="user_info">
			<span>学号:</span>
			<span><%=user.getUserId() %></span>
			<span style="margin-left: 30px;">姓名:</span>
			<span><%=user.getName() %></span>
			<span class="glyphicon glyphicon-pencil" style="margin-left: 18px;cursor: pointer;"
				data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo"></span>
		</div>
		<div class="system_btn">
			<span class="exit_system" ><a href="<%=PathUtil.getFullPath("logout")%>">注销</a></span>		
		</div>
	</div>
</div>

<!-- Button to trigger modal -->

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">修改个人信息</h4><span class="tip_modify_pass" style="color:red"></span>
      </div>
      <div class="modal-body">
        <form action="<%=PathUtil.getFullPath("student/modifypass") %>" method="post" id="modify_pass_form">
          <div class="form-group" style="maring:40px 0px;">
            <label for="recipient-name" class="control-label">请输入密码:</label>
            <input type="password" class="form-control mypass" id="recipient-name" name="password" />
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label" >再次确认密码:</label>
           	<input type="password" class="form-control myrepeatPass" id="recipient-name"/>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <input type="button" class="btn btn-primary modify_pass_submit" value="保存修改">
      </div>
    </div>
  </div>
</div>

<!--flashMessage  -->
<c:if test="${success_message != null }">
	<div class="message_container" >
		${success_message}
	</div>
</c:if>

<c:if test="${fail_message != null }">
	<div class="message_container" style="background:#D84C29">
		${fail_message }
	</div>
</c:if>

<script type="text/javascript">
	$(function(){
		$(".glyphicon-pencil").click(function(){
			$(".modify_pass_submit").click(function(){
				var repeatPass = $(".myrepeatPass").val();
				var pass = $(".mypass").val();
				
				if(repeatPass != pass){
					$(".tip_modify_pass").text("确认两次输入是否一致!");
					return;
				}
				
				if(repeatPass == "" || pass == "" ){
					$(".tip_modify_pass").text("输入密码不能为空!");
					return;
				}
				
				if(repeatPass != "" && pass != "" && repeatPass == pass){
					$("#modify_pass_form").submit();
				}
				
			});
		});
		
		setTimeout(function(){
			$(".message_container").css("display","none");
		}, 2000);
	})
</script>

<% 
	session.setAttribute("success_message", null);
	session.setAttribute("fail_message", null);
%>