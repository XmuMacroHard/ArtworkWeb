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
    
    <title>Artist List</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body>
   <table border="1" cellpadding="1" width="800">
      <tr align="center" bgcolor="silver">
        <th>id</th>
         <th>真实姓名</th>
        <th>账号</th>
        <th>详细信息</th>
      </tr> 
      <s:iterator id="artist" value="#request.list">
      <tr align="center" bgcolor="silver">
        <td><s:property value="#artist.id"/></td>
        <td><s:property value="#artist.realName"/></td>
        <td><s:property value="#artist.email"/></td>
        <td><a href="getArtist.action?user.id=<s:property value="#artist.id"/>">详细信息</a></td>
      </tr>
      </s:iterator>
   </table> 
  </body>
</html>
