<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'richeditor_test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<!-- include libraries(jQuery, bootstrap, fontawesome) -->
	
	<!-- include libraries(jQuery, bootstrap, fontawesome) -->
	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.3.min.js"></script> 
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
	<script type="text/javascript" src="//netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" />

	<!-- include summernote css/js-->
	<link href="css/summernote.css" rel="stylesheet">
	<script src="js/summernote.min.js"></script>
	<script src="js/summernote_test.js"></script>
  </head>
  
  <body>
    <div id="summernote"></div>
    <input type="submit" id="submit"/>
  </body>
</html>
