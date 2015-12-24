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
    
    <title>My JSP 'shengaffirmorder.jsp' starting page</title>
    
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
  <form action="SubmitsaleOrder" method="POST" enctype="multipart/form-data">
      地址(其实传个地址过来就可以 了，用s:radio选择，name=order.shippingAddress试试)<br>
   这里也要把用户id和商品id传过去吧,商品id用list吧，我后台用list(commodityid)接收的<br>
    。。。好像这部分都是传值。。。。
   	<br><button type="submit">提交</button>
   	</form>   
    
  </body>
</html>
