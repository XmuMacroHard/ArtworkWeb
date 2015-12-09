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
    
    <title>My JSP 'InfoList.jsp' starting page</title>
    
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
	 <table border="1" cellpadding="1" width="800">
      <tr align="center" bgcolor="silver">
        <th>标题</th>
         <th>开始时间</th>
        <th>结束时间</th>
        <th>位置</th>
        <th>费用</th>
        <th>详细信息</th>
      </tr>
      <s:iterator id="information" value="#request.list">
      <tr align="center" bgcolor="silver">
        <td><s:property value="#information.title"/></td>
        <td><s:date name="#information.startTime"/></td>
        <td><s:date name="#information.endTime"/></td>
        <td><s:property value="#information.location"/></td>
        <td><s:property value="#information.expense"/></td>
        <td><a href="getInfor.action?information.id=<s:property value="#information.id"/>">详细信息</a></td>
      </tr>
      </s:iterator>
   </table> 
  </body>
</html>
