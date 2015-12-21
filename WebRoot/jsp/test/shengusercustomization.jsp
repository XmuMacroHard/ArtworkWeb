<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'shengusercustomization.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    用户上传定制<br>
    <form action="CustomizationSubmitAction" method="POST" enctype="multipart/form-data">
   	 选择的艺术家:<s:property value="#artist.id"/>（这里再用id查找名字会好一点，晚上学习）<br>
    	定制标题<s:textfield name="commodity.name"/><br>
    introduction<s:textarea name="commodity.introduction"/><br>
              类别<s:radio list="#{'calligraphy':'书法','painting':'绘画','sculpture':'雕刻','handicraft':'手工品'}" name="commodity.type" value="'calligraphy'"/><br>
   	  定制价格<s:textfield name="commodity.price"/><br>
   	<br><button type="submit">提交</button>
   </form>
  </body>
</html>
