<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.eot.util.*" %>
<% String path= request.getContextPath();
   String basePath = request.getScheme()+"://" + request.getServerName() + ":" + request.getServerPort()+path+"/";
%>
<%
    String visibility = "hidden";
    String msg = null;
    if(request.getAttribute("msg") != null) {
        msg = (String)request.getAttribute("msg");
        if( msg!=null && !msg.equals("")){
            visibility = "visible";
        }
    }
%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <base href="<%=basePath %>">
    <title>Login</title>
    <link rel="stylesheet" href="<%=PropertyUtil.getStaticUrl() %>css/login.css" style="text/css">
    <script type="text/javascript" src="<%=PropertyUtil.getStaticUrl() %>js/plugins/jquery-1.10.2.js" ></script>
    <script type="text/javascript" src="<%=PropertyUtil.getStaticUrl() %>js/common.js"></script>
    <script type="text/javascript" src="<%=PropertyUtil.getStaticUrl() %>js/login.js"></script>
  </head>
  <body>
    <div class="container">
      <div class="logo">
        <img src="<%=PropertyUtil.getStaticUrl() %>images/lut.png" alt="兰州理工大学" width="400">
      </div>
        <div class="form_div">
          <div class="welcome">Welcome to login!</div>
          <div class="form_container">
            <div class="empty"></div>
             <p id="tip_message" style="visibility:<%=visibility %>">
                <%=msg %>
             </p>
                 <form action="<%=PathUtil.getFullPath("save_login")%>" method="post" id="loginForm" name="loginForm">
                    <div class="input_line  input_line_userName">
                       <input type="text" name="userId" class="input_userName" placeholder="请输入账号"/>
                       <span id="error_userName"></span>
                       <img src="static/images/ICN_Usename_20x20.png"/>
                    </div>
                    <div class="input_line">
                      <input type="password" name="password" class="input_password form-control" placeholder="请输入密码"/><span id="error_password"></span><br/>
                    </div>
                    <div class="input_line input_checkbox_line" >
                      	<span style="margin-right:10px">账号类型:</span>
                    	<label for="student">学生</label>
                    	<input type="radio" name="role" value="3" id="student"/>
                        <label for="teacher">老师</label>
                    	<input type="radio" name="role" value="2" id="teacher"/>
                    	<label for="admin">管理员</label>
                    	<input type="radio" name="role" value="1"  id="admin" />
                    </div>  
                    <div>
                      <input type="button" value="登录" class="input_submit" onclick="login()"/>
                    </div>  
                      
                 </form>
            </div>
        </div>
    </div>
    <div class="footer">
        Copyright &copy; 2017 兰州理工大学
    </div>
  </body>
  <script type="text/javascript">
  setTimeout(function(){
		$(".tip_message").css("visibility","hidden")}, 2000);
  </script>
</html>