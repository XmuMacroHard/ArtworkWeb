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
    
    <title>My JSP 'shengsubmitArtist.jsp' starting page</title>
    
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
  <form action="submitArtist" method="POST" enctype="multipart/form-data">
    realName<s:textfield name="artist.realName"/><br>
    introduction<s:textfield name="artist.introduction"/><br>
              类别<s:checkbox name="artist.identification" label="书法" fieldValue="calligraphy"/>
    <s:checkbox name="artist.identification" label="绘画" fieldValue="painting"/>
    <s:checkbox name="artist.identification" label="雕刻" fieldValue="sculpture"/>
     <s:checkbox name="artist.identification" label="手工品" fieldValue="handicraft"/><br>
   	<s:file name="pic" label="头像"/><br>
    <s:file name="pic" label="资料"/>(打包成压缩文件上传)<br>
   	<br><button type="submit">提交</button>
   </form>
  </body>
</html>
