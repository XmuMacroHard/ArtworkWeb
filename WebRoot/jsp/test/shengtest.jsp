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
    
    <title>My JSP 'shengtest.jsp' starting page</title>
    
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
    This is my JSP page. <br>
        <a href="showInfor.action">咨询列表</a><br>
    <a href="showArtist.action">艺术家列表</a><br>
    <a href="findArtist.action?user.id=3">艺术家1</a><br>
     <a href="getArtistBySort.action?artist.identification=4">艺术家列表(类别包含4)</a><br>
      <a href="getArtistByName.action?artist.realName=1">艺术家列表(名字包含1)</a><br>
      <a href="jsp/test/shengsubmitArtist.jsp">艺术家认证</a><br>
      <a href="jsp/test/shengsubmitArtist.jsp">我要定制</a>
  </body>
</html>
