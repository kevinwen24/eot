<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.eot.util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.eot.model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String managerPath = PathUtil.getFullPath("manager/");
	String importMsg="";  
	if(request.getSession().getAttribute("msg") != null){  
	   importMsg=(String)request.getSession().getAttribute("msg");  
		%>
		<script type="text/javascript"> 
			show_fail_message_long("<%=importMsg %>");
		</script>
		<%
	}  
	request.getSession().setAttribute("msg", null);  
%>

<div id="content">
	<div class="content_header">
		<p style="margin-left:10px;width:200px;height:25px;margin-top:30px;">
			<button class="btn btn-primary" type="button">
			 &gt; 批量导入学生信息:  
			</button>
		</p>
	</div>	
	<div class="content_body">
	<form action="<%=managerPath %>batchimport" method="post" enctype="multipart/form-data" onsubmit="return check();">
         <div style="margin: 30px;">
	         <input id="excel_file" type="file" name="filename" accept="xlsx" size="80"/>
	         <input id="excel_button" type="submit" value="导入Excel" class="btn btn-success" style="margin-top:30px;"/>
         </div>
     </form>
	</div>
</div>
<script type="text/javascript"> 
function check() {  
      var excel_file = $("#excel_file").val();  
      if (excel_file == "" || excel_file.length == 0) {  
          show_fail_message("请选择文件路径！");  
          return false;  
      } else {  
         return true;  
      }  
 } 

</script>
