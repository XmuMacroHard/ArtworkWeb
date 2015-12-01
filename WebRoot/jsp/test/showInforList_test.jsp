<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'cztest.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
    <%
  	long i = 1;
  	session.setAttribute("userid", i);
   %>
  	<s:form action="showInforList">
  		<s:submit/>
  	</s:form>
  	<table style="border: 1px solid black;">
  	<tr>
  		<td>title</td>
  		<td>start time</td>
  		<td>end time</td>
  		<td>location</td>
  		<td>status</td>
  	</tr>
  	<s:iterator value="#request.informationList" id = "information">
  		<tr>
  			<td><s:property value="#information.title"/></td>
  			<td><s:property value="#information.startTime"/></td>
  			<td><s:property value="#information.endTime"/></td>
  			<td><s:property value="#information.location"/></td>
  			<td><s:property value="#information.status"/></td>
  		</tr>
  	</s:iterator>
  	</table>
  <body>
	
	
  </body>
</html>
